# Command line processing

The Bash Parser
https://mywiki.wooledge.org/BashParser

How Bash reads and processes the input and parses it into executable code.

## Step 1: Read data to execute

Bash always reads your script or commands on the bash command prompt line by line. If your line ends with a backslash character, bash reads another line before processing the command and appends that other line to the current, with a literal newline inbetween. (I will from here on refer to the chunk of data Bash read in as the *line* of data; even though it is technically possible that this line contains one or more newlines).

```bash
# Step Input:
echo "What's your name?"
read name; echo "$name"

# Step Output:
echo "What's your name?"
# and
read name; echo "$name"
```

## Step 2: Process quotes

Once Bash has read in your line of data, it looks through it in search of quotes. The first quote it finds triggers a quoted state for all characters that follow up until the next quote of the same type. 

If the quoted state was triggered by a double quote, all characters except for `$`, `"`, TICK and `\` lose any special meaning they might have. That includes single quotes, spaces and newlines, etc.

If the quoted state was triggered by a single quote, all characters except for SQUOTE lose their special meaning, including `$` and `\`. Therefore, the following command will produce literal output:

```bash
echo 'Back\Slash $dollar "Quote"'
#: Back\Slash $dollar "Quote"
```

The fact that BACKSLASH loses its ability to escape the meaning of the next character means that this won't work:

    $ echo 'Don\'t do this'
    >

Bash will expect more input because, unlike what we thought we did, the second quote - the one we tried to escape with the backslash - actually *closed the quoted state*, meaning the "t do this" part was not quoted. The last quote on the line then *opened the quoted state* again, so bash asked for more input, expecting us to close it; bash tries to finish step 1: it reads data until it finds an unescaped newline, but the *opened single quote state* is escaping the newline.

Now that bash knows which of the characters in the line of data are escaped (stripped of their ability to mean anything special to Bash) and which are not, Bash removes the quotes that were used to determine this from the data and proceeds to the next step.

```bash
# Step Input:
echo "What's your name?"
# Step Output:
echo 𝚆𝚑𝚊𝚝'𝚜 𝚢𝚘𝚞𝚛 𝚗𝚊𝚖𝚎?
```

Note: Every character originally between the double quotes has been marked as escaped. I will mark escaped characters in these examples by printing them in monospaced font.

## Step 3: Split the read data into commands

Our line is now split up into separate commands using `;` as command separator.

Remember from the previous step that any `;` characters that were quoted or escaped do not have their special meaning anymore and will not be used for command splitting. They will just appear in the resulting command line literally:

    $ echo "What a lovely day; and sunny, too!"
      What a lovely day; and sunny, too!

```bash
# Step Input:
read name; echo $name

# Step Output:
read name
# and
echo $name
```

The following steps are executed for each command that resulted from splitting up the line of data:

## Step 4: Parse special operators

Look through the command to see whether there are any special operators such as `{…}`, `<(…)`, `< …`, `<<<`, `|`, etc.

These are all processed in a specific order. 

Redirection operators are removed from the command line, other operators are replaced by their resulting expression; e.g. `{a..c}` is replaced by "a b c".

```bash
# Step Input:
diff <(foo) <(bar)
# Step Output:
diff /dev/fd/63 /dev/fd/62
```

Note: The `<(…)` operator starts a background process to execute the command `foo`, and another one for `bar`, too, and sends the output to a file. It then replaces itself with the pathname of that file.

## Step 5: Perform Expansions

Bash has many operators that involve expansion. The simplest of these is `$par`. The dollar sign followed by the name of a parameter, which optionally might be surrounded by braces, is called *Parameter Expansion*.

What Bash does here is basically just replace the Parameter Expansion operator with the contents of that parameter. As such, the command `echo $USER` will in this step be converted to e.g. `echo docs`. Other expansions include *Pathname Expansion*, e.g. `echo *.txt`, *Command Substitution*, e.g. `rm "$(which nano)"`, and others.

```bash
# Step Input:
echo "$PWD      has these files that match *.txt :" *.txt
#      ↓↓↓                                          ↓↓↓↓↓
echo /home/docs has these files that match *.txt :  bar.txt foo.txt
# Step Output
```

## Step 6: Split the command into a command name and arguments

The name of the command Bash has to execute is always the *first word* on the line. The rest of the command data is split into words which make the arguments. This process is called *Word Splitting*. 

Bash basically cuts the command line into pieces wherever it sees whitespace. This whitespace is completely removed and the pieces are called *words*. 

Whitespace in this context means: SPACEs, TABs or NEWLINEs that are not escaped. Escaped spaces, such as spaces inside quotes, lose their special meaning of whitespace and are not used for splitting up the command line. They appear literally in the resulting arguments.

As such, if the name of the command that you want to execute or one of the arguments you want to pass contains spaces that you don't want bash to use for cutting the command line into words, you can use quotes or the backslash character:

```bash
My Command args
# This will execute the command named 'My' because it is the first word

"My Command" args
# This will execute the command named 'My Command' because the space
# inside the quotes has lost its special meaning allowing it to split words.


# Step Input:
echo "/home/docs has these files that match *.txt :" bar.txt foo.txt
```
Step Output:
- command name: 'echo'
- arg1: '/home/docs has these files that match *.txt :'
- arg2: 'bar.txt'
- arg3: 'foo.txt'

## Step 7: Execute the command

Now that the command has been parsed into a command name and a set of arguments, Bash executes the command and sets the command's arguments to the list of words it has generated in the previous step.

If the command type is a function or builtin, the command is executed by the same Bash process that just went through all these steps.

Otherwise, Bash will first fork off (create a new bash process), initialize the new bash processes with the settings that were parsed out of this command (redirections, arguments, etc.) and execute the command in the forked off bash process (child process). The parent (the Bash that did these steps) waits for the child to complete the command.

After these steps, the next command, or next line is processed. Once EOF is reached (end of the script or the interactive bash session is closed) bash stops and returns the exit code of the last command it has executed.

## Issues

>What about aliases?
