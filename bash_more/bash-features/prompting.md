# Prompting

## Primary prompt

When executing interactively, bash signals that it is ready to read a command by displaying the primary prompt identified by the value of *PS1* env variable which is expanded and rendered on the screen as a, possibly stylized, line of text.

## Secondary prompt

The secondary prompt is a command continuation prompt and it is displayed when a user enters something that bash doesn't deem to constitute a complete command, or if there are unbalanced punctuations (quotes, parenthesis), or if forced by user by *escaping the newline*, which is done by typing ` \` (<SPACE><BACKSLASH>) before hitting enter.

The secondary prompt is identified by the value of *PS2* env variable which is expanded and rendered on the screen as a, possibly stylized, line of text.


## Prompt codes

Bash has a set of special prompt codes that signify misc info. They are mostly made of backslash-escaped characters and decoded according to this table:

### Basic info


### Date and time

```
\t      current time in 24-hour HH:MM:SS format
\T      current time in 12-hour HH:MM:SS format
\@      current time in 12-hour am/pm format
\A      current time in 24-hour HH:MM format
\d      date in "Weekday Month Date" format (e.g. "Tue May 26")
\D{FMT} the {FMT} formatting string is passed to *strftime(3)*, the result
        of which is inserted into the prompt; the empty {FMT} results in a
        locale-specific time representation.
```



```
\a        an ASCII bell character (07)
\e        an ASCII escape character (033)
\n         newline
\r         carriage return
\\         backslash
\nnn      the character corresponding to the octal number nnn
```



```
\h         the hostname up to the first `.'
\H         the hostname
\u         the username of the current user
\j         the number of jobs currently managed by the shell
\l         the basename of the shell's terminal device name
\s         shell name, the basename of $0
\v         the version of bash (e.g., 2.00)
\V         the release of bash, version + patch level (e.g., 2.00.0)
\w         the current working directory, with $HOME abbreviated with a tilde (see PROMPT_DIRTRIM)
\W         the basename of the current working directory, with $HOME abbreviated with a tilde
\!         the history number of this command
\#         the command number of this command
\$         if the effective UID is 0, a #, otherwise a $
```


```
\[         begin a sequence of non-printing characters, which could be
                used to embed a terminal control sequence into the prompt
\]         end a sequence of non-printing characters
```

The command number and the history number are usually different:

**The history number** of a command is its position in the history list, which may include commands restored from the history file.

**The command number** is the position in the sequence of commands executed during the current shell session.

After the string is decoded, it is expanded via:
- parameter expansion
- command substitution 
- arithmetic expansion
- quote removal
and subject to the value of the *promptvars* shell option.


## Types of prompts and envars

Prompt-related env vars:
- PS0
- PS1
- PS2
- PS3
- PS4
- PROMPT_COMMAND
- PROMPT_DIRTRIM


### PS0
Expanded and displayed by interactive shells 
after reading a complete command but 
before executing it.

### PS1
The value of this parameter is expanded and used as the primary prompt string. The default value is `\s-\v\$`

### PS2
The value of this parameter is expanded as with PS1 and used as the secondary prompt string. The default is `>`

### PS3
The value of this parameter is used as the prompt for the select command.

### PS4
The value of this parameter is expanded as with PS1 and the value is printed before each command bash displays during an execution trace. The first character of PS4 is replicated multiple times, as necessary, to indicate multiple levels of indirection. The default is `+`.    
Suggestion:
`export PS4='+${BASH_SOURCE}:${LINENO}: ${FUNCNAME[0]:+${FUNCNAME[0]}(): } '`

### PROMPT_COMMAND
If set, the value is executed as a command prior to issuing each primary prompt.

### PROMPT_DIRTRIM
If set to a number greater than zero, the value is used as the number of trailing directory components to retain when expanding the `\w` and `\W` prompt string escapes. Characters removed are replaced with an ellipsis.
