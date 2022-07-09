

discard stdout:			Append stdout to file
command > /dev/null		command >> file
discard stderr:			Append stderr to file
command 2> /dev/null		command 2>> file
discard both:			Append both to file
command &> /dev/null		command &>> file

send to stderr (in script)
cmd 2>&1
present output of cmd2 as file
cmd <(cmd2)
Redirect stdout to file
command > file
Force redirection of stdout to file (when noclobber is set)
command >| file
read contents of var into bar
read -r bar <<<"$var"
read contents of file into array arr
read -a arr < FILE

REDIRECTION

Redirecting Input
Redirecting Output
Appending Redirected Output
Redirecting Standard Output and Standard Error
Appending Standard Output and Standard Error
Here Documents
Here Strings
Duplicating File Descriptors
Moving File Descriptors
Opening File Descriptors for Reading and Writing




Before a command is executed, its input and output may be redirected using a special notation interpreted by the shell. 
Redirection allows commands' file handles to be duplicated, opened, closed, made
to refer to different files, and can change the files the command reads from and writes to. 
Redirection may also be used to modify file handles in the current shell execution environment. 
The following redirection operators may precede or appear anywhere within a simple command or may follow a command. 
Redirections are processed in the order they appear, from left to right.

Each redirection that may be preceded by a file descriptor number may instead be preceded by a word of the form {varname}. 
In this case, for each redirection operator except >&- and <&-, 
the shell will allocate a file descriptor greater than or equal to 10 and assign it to varname. 
If >&- or <&- is preceded by {varname}, the value of varname defines the file descriptor to close.

In the following descriptions, if the file descriptor number is omitted, and the first character of the redirection operator is <, the redirection refers to the standard input (file descriptor 0). If the first character of the redirection operator is >, the redirection refers to the standard output (file descriptor 1).

* The word following the redirection operator in the following descriptions, unless otherwise noted, is subjected to:
  brace expansion, tilde expansion, parameter and variable expansion, command substitution, 
  arithmetic expansion, quote removal, pathname expansion, and word splitting.
* If it expands to more than one word, bash reports an error.

Note that the order of redirections is significant. For example, the command ls > dirlist 2>&1
redirects both standard output and standard error to the file dirlist, while the command ls 2>&1 > dirlist
redirects only the standard output to file dirlist, because the standard error was 
duplicated from the standard output before the standard output was redirected to dirlist.


Bash handles several filenames specially when they are used in redirections, as described in the following table:

/dev/fd/fdn		If fdn is a valid integer, file descriptor fd is duplicated. /dev/fd/1
/dev/stdin 		File descriptor 0 is duplicated.
/dev/stdout 		File descriptor 1 is duplicated.
/dev/stderr 		File descriptor 2 is duplicated.
/dev/tcp/host/port 	bash attempts to open the corresponding TCP socket 1
/dev/udp/host/port 	bash attempts to open the corresponding UDP socket 1
1 If host is a valid hostname or IP address, and port is an integer port number or service name

* A failure to open or create a file causes the redirection to fail.
* Redirections using file descriptors greater than 9 should be used with care, 
  as they may conflict with file descriptors the shell uses internally. Also, I think, FD5 for some reason.

on cygwin:
/dev/stdout -> symlink to /proc/self/fd/1 -> symlink to /dev/pty18 ->  character special (136/18)



Redirecting Input
Redirection of input causes the file whose name results from the expansion of word to be opened 
for reading on file descriptor n, or the standard input (file descriptor 0) if n is not specified.

The general format for redirecting input is: [n]<word




Redirecting Output

Redirection of output causes the file whose name results from the expansion of word to be opened 
for writing on file descriptor n, or the standard output (file descriptor 1) if n is not specified. 
* if the file does not exist it is created
* if it does exist it is truncated to zero size

The general format for redirecting output is: [n]>word  [n]>|word

* If the redirection operator is >, and the noclobber option to the set builtin has been enabled, 
  the redirection will fail if the file whose name results from the expansion of word exists and is a regular file. 
* If the redirection operator is >|, or the redirection operator is > and the noclobber option is not enabled, 
  the redirection is attempted even if the file named by word exists.




Appending Redirected Output
Redirection of output in this fashion causes the file whose name results from the expansion of word to be opened for appending on file descriptor n, or the standard output (file descriptor 1) if n is not specified. If the file does not exist it is created.

The general format for appending output is: [n]>>word




Redirecting Standard Output and Standard Error

This construct allows both the standard output (file descriptor 1) and the standard error 
output (file descriptor 2) to be redirected to the file whose name is the expansion of word.

There are two formats for redirecting standard output and standard error: &>word  and  >&word

Of the two forms, the first is preferred. This is semantically equivalent to >word 2>&1

* When using the second form, word may not expand to a number or -
  If it does, other redirection operators apply for compatibility reasons.




Appending Standard Output and Standard Error
This construct allows both the standard output (file descriptor 1) and the standard error 
output (file descriptor 2) to be appended to the file whose name is the expansion of word.

The format for appending standard output and standard error is: &>>word

This is semantically equivalent to >>word 2>&1




Here Documents
This type of redirection instructs the shell to read input from the current source until 
a line containing only delimiter (with no trailing blanks) is seen. All of the lines read 
up to that point are then used as the standard input for a command.

The format of here-documents is:
<<[-]word
  here-document
delimiter

* No parameter and variable expansion, command substitution, arithmetic expansion, 
  or pathname expansion is performed on word. 
* If any characters in word are quoted, the delimiter is the result of quote removal on word, 
  and the lines in the here-document are not expanded. 
* If word is unquoted, all lines of the here-document are subjected to parameter expansion, 
  command substitution, and arithmetic expansion, the character sequence \<newline> (\n) is ignored, 
  and \ must be used to quote the characters \, $, and `.
* If the redirection operator is <<-, then all leading tab characters (only tabs, not spaces) are 
  stripped from input lines and the line containing delimiter.


Here Strings
A variant of here documents, the format is:  <<<word
The word undergoes brace expansion, tilde expansion, parameter and variable expansion, 
command substitution, arithmetic expansion, and quote removal.
Pathname expansion and word splitting are not performed. 
The result is supplied as a single string to the command on its standard input.


Duplicating File Descriptors
The redirection operator [n]<&word is used to duplicate input file descriptors. 
* If word expands to one or more digits, the file descriptor denoted by n is made to be a copy of that file descriptor. 
* If the digits in word do not specify a file descriptor open for input, a redirection error occurs. 
* If word evaluates to -, file descriptor n is closed. 
* If n is not specified, the standard input (file descriptor 0) is used (<& word)

The redirection operator [n]>&word is used to duplicate output file descriptors. 
* If n is not specified, the standard output (file descriptor 1) is used (>& word)
* If the digits in word do not specify a file descriptor open for output, a redirection error occurs. 
* If word evaluates to -, file descriptor n is closed. 
* As a special case, if n is omitted, and word does not expand to one or more digits or -, 
  the standard output and standard error are redirected as described previously.  (>&) 

ex. redirects output from stdout to stderr instead: echo "error" 1>&2  same as  echo "error" >&2

Moving (DuplicaTE & CLOSE) File Descriptors
The redirection operator [n]<&digit-
moves the file descriptor digit to file descriptor n, 
or the standard input (fd0) if n is not specified.  
digit is closed after being duplicated to n.
<&3-
0<&3-

Similarly, the redirection operator [n]>&digit-
moves the file descriptor digit to file descriptor n, 
or the standard output (fd1) if n is not specified.
digit is closed after being duplicated to n.
1>&3-
1>&3

Opening File Descriptors for Reading and Writing
The redirection operator  [n]<>word
causes the file whose name is the expansion of word to be 
opened for both reading and writing on file descriptor n,
or on file descriptor 0 if n is not specified. 
If the file does not exist, it is created.



INPUT
command < file 		Use the contents of file when command reads from stdin.
command 0< file 	Use the contents of file when command reads from stdin, exactly as in the previous example, 
				since FD0 (stdin) is the default for the < operator.
OUTPUT
command > file	 	Send the stdout of command to file.
command 1> file 	Send the stdout of command to file. Since stdout is FD1, that's the number we put in front of the redirection operator. 
				This is identical to the previous example, because FD1 is the default for the > operator.
ERROR
command 2> file		Send the stderr of command to file.

OUTPUT and ERROR
command &> file		Send the stdout and stderr of command to file. Less portable.
command >& file		Same as above, but less preffered
command > file 2>&1	Same as others, but more portable: redirect stdout to file, copy FD1 (stdout) to FD2 (stderr), 
				meaninig redirect stderr to the same file where stdout has been redirected


discard stdout:			Append stdout to file
command > /dev/null		command >> file
discard stderr:			Append stderr to file
command 2> /dev/null		command 2>> file
discard both:			Append both to file
command &> /dev/null		command &>> file
send to stderr (in script)
cmd 2>&1
present output of cmd2 as file
cmd <(cmd2)







REDIRECTING

Redirecting Input and Output
The shell moves text in designated "streams." The standard output is where the 
shell streams the text output of commands -- the screen on your terminal, by default.
The standard input, typically the keyboard, is where you input data for commands.
 
When a command reads the standard input, it usually keeps 
reading text until you type C-d on a new line by itself.

When a command runs and exits with an error, the error message is usually 
output to your screen, but as a separate stream called the standard error.
You redirect these streams -- to a file, or even another command -- with redirection. 

The following sections describe the shell redirection operators 
that you can use to redirect standard input and output:

 <  	Standard Input: Redirecting standard input.
 > 	Standard Output: Redirecting standard output to file
 >> 	Standard Output: Redirecting - appending standard output to file
 2> 	Standard Error: Redirecting standard error.
 2>>	Standard Error: Redirecting - appending standard error to a file
 &> 	redirect both standard output and standard error to the same file
 | 	Pipelines: Building pipelines. 
>>&  	append the standard output and standard error to the named FILE.
|&   	synonym for `2>&1 |', which redirects the STDERR for a command through a pipe.



Redirecting INPUT to a File
< To redirect standard input to a file, use the `<' operator.
  To do so, follow a command with < and the name of the file it should take input from. 
  For example, instead of giving a list of keywords 
  as arguments to apropos, you can redirect standard.
  input to a file containing a list of keywords to use. 
  To redirect standard input for apropos to file `keywords', type:
    $ apropos < keywords [RET]

Redirecting OUTPUT to a File
>  operator to redirect standard output to a file. 
   To use it, follow a command with > and the name of the file the output should be written to. 
   To redirect standard output of the command apropos shell bash to the file `commands', type:
       $ apropos shell bash > commands [RET]

>> If you redirect standard output to an existing file, it will overwrite 
   the file, unless you use the `>>' operator to append the standard output 
   to the contents of the existing file. To append the standard output 
   of apropos shells to an existing file `commands', type:
      $ apropos shells >> commands [RET]

Redirecting ERROR Messages to a File
2>  To redirect the standard error stream to a file, use the `>' operator 
    preceded by a `2'. Follow a command with 2> and the name of the file the 
    error stream should be written to. To redirect the standard error 
    of apropos shell bash to the file `command.error', type:
         $ apropos shell bash 2> command.error [RET]

2>> As with the standard output, use the `>>' operator instead of `>' to 
    append the standard error to the contents of an existing file.
    To append the standard error of apropos shells to an existing file `command.error', type:
         $ apropos shells 2>> command.error [RET]

Redirecting both, INPUT AND ERRORS, to a File
&>  To redirect both standard output and standard error to the same file, use `&>' instead. 
    To redirect the standard output and the standard error 
    of apropos shells to the file `commands', type:
         $ apropos shells &> commands [RET]

Redirecting OUTPUT to Another Command's INPUT
|   Piping is when you connect the standard output of one command to
    the standard input of another. You do this by specifying the two commands in 
    order, separated by a vertical bar character, `|' (sometimes called a "pipe"). 
    Commands built in this fashion are called pipelines.
    For example, it's often useful to pipe commands that display a
    lot of text output to less, a tool for perusing text).
    To pipe the output of apropos bash shell shells to less, type:
             $ apropos bash shell shells | less [RET]
    This redirects the standard output of command to the standard input 
    of the command less, which displays it on the screen.


>>&   There is a new >>& redirection operator, which appends
     the standard output and standard error to the named FILE.

|&   The parser now understands `|&' as a synonym for `2>&1 |', 
     which redirects the STDERR for a command through a pipe.
