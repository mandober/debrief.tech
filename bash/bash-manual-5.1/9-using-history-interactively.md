
# 9. Using History Interactively

This chapter describes how to use the GNU History Library interactively,
from a user's standpoint. It should be considered a user's guide. For
information on using the GNU History Library in other programs, see the
GNU Readline Library Manual.

## 9.1 Bash History Facilities

When the '-o history' option to the 'set' builtin is enabled (The
Set Builtin), the shell provides access to the "command history", the
list of commands previously typed. The value of the 'HISTSIZE' shell
variable is used as the number of commands to save in a history list.
The text of the last '$HISTSIZE' commands (default 500) is saved. The
shell stores each command in the history list prior to parameter and
variable expansion but after history expansion is performed, subject to
the values of the shell variables 'HISTIGNORE' and 'HISTCONTROL'.

When the shell starts up, the history is initialized from the file
named by the 'HISTFILE' variable (default '~/.bash_history'). The file
named by the value of 'HISTFILE' is truncated, if necessary, to contain
no more than the number of lines specified by the value of the
'HISTFILESIZE' variable. When a shell with history enabled exits, the
last '$HISTSIZE' lines are copied from the history list to the file
named by '$HISTFILE'. If the 'histappend' shell option is set (*note
Bash Builtins), the lines are appended to the history file, otherwise
the history file is overwritten. If 'HISTFILE' is unset, or if the
history file is unwritable, the history is not saved. After saving the
history, the history file is truncated to contain no more than
'$HISTFILESIZE' lines. If 'HISTFILESIZE' is unset, or set to null, a
non-numeric value, or a numeric value less than zero, the history file
is not truncated.

If the 'HISTTIMEFORMAT' is set, the time stamp information associated
with each history entry is written to the history file, marked with the
history comment character. When the history file is read, lines
beginning with the history comment character followed immediately by a
digit are interpreted as timestamps for the following history entry.

The builtin command 'fc' may be used to list or edit and re-execute a
portion of the history list. The 'history' builtin may be used to
display or modify the history list and manipulate the history file.
When using command-line editing, search commands are available in each
editing mode that provide access to the history list (Commands For
History).

The shell allows control over which commands are saved on the history
list. The 'HISTCONTROL' and 'HISTIGNORE' variables may be set to cause
the shell to save only a subset of the commands entered. The 'cmdhist'
shell option, if enabled, causes the shell to attempt to save each line
of a multi-line command in the same history entry, adding semicolons
where necessary to preserve syntactic correctness. The 'lithist' shell
option causes the shell to save the command with embedded newlines
instead of semicolons. The 'shopt' builtin is used to set these
options. The Shopt Builtin::, for a description of 'shopt'.

## 9.2 Bash History Builtins

Bash provides two builtin commands which manipulate the history list and
history file.

'fc'
fc [-e ENAME] [-lnr] [FIRST] [LAST]
fc -s [PAT=REP] [COMMAND]

The first form selects a range of commands from FIRST to LAST from
the history list and displays or edits and re-executes them. Both
FIRST and LAST may be specified as a string (to locate the most
recent command beginning with that string) or as a number (an index
into the history list, where a negative number is used as an offset
from the current command number).

When listing, a FIRST or LAST of 0 is equivalent to -1 and -0 is
equivalent to the current command (usually the 'fc' command);
otherwise 0 is equivalent to -1 and -0 is invalid.

If LAST is not specified, it is set to FIRST. If FIRST is not
specified, it is set to the previous command for editing and -16
for listing. If the '-l' flag is given, the commands are listed on
standard output. The '-n' flag suppresses the command numbers when
listing. The '-r' flag reverses the order of the listing.
Otherwise, the editor given by ENAME is invoked on a file
containing those commands. If ENAME is not given, the value of the
following variable expansion is used: '${FCEDIT:-${EDITOR:-vi}}'.
This says to use the value of the 'FCEDIT' variable if set, or the
value of the 'EDITOR' variable if that is set, or 'vi' if neither
is set. When editing is complete, the edited commands are echoed
and executed.

In the second form, COMMAND is re-executed after each instance of
PAT in the selected command is replaced by REP. COMMAND is
interpreted the same as FIRST above.

A useful alias to use with the 'fc' command is 'r='fc -s'', so that
typing 'r cc' runs the last command beginning with 'cc' and typing
'r' re-executes the last command (Aliases).

'history'
history [N]
history -c
history -d OFFSET
history -d START-END
history [-anrw] [FILENAME]
history -ps ARG

With no options, display the history list with line numbers. Lines
prefixed with a '*' have been modified. An argument of N lists
only the last N lines. If the shell variable 'HISTTIMEFORMAT' is
set and not null, it is used as a format string for STRFTIME to
display the time stamp associated with each displayed history
entry. No intervening blank is printed between the formatted time
stamp and the history line.

Options, if supplied, have the following meanings:

'-c'
Clear the history list. This may be combined with the other
options to replace the history list completely.

'-d OFFSET'
Delete the history entry at position OFFSET. If OFFSET is
positive, it should be specified as it appears when the
history is displayed. If OFFSET is negative, it is
interpreted as relative to one greater than the last history
position, so negative indices count back from the end of the
history, and an index of '-1' refers to the current 'history
-d' command.

'-d START-END'
Delete the history entries between positions START and END,
inclusive. Positive and negative values for START and END are
interpreted as described above.

'-a'
Append the new history lines to the history file. These are
history lines entered since the beginning of the current Bash
session, but not already appended to the history file.

'-n'
Append the history lines not already read from the history
file to the current history list. These are lines appended to
the history file since the beginning of the current Bash
session.

'-r'
Read the history file and append its contents to the history
list.

'-w'
Write out the current history list to the history file.

'-p'
Perform history substitution on the ARGs and display the
result on the standard output, without storing the results in
the history list.

'-s'
The ARGs are added to the end of the history list as a single
entry.

When any of the '-w', '-r', '-a', or '-n' options is used, if
FILENAME is given, then it is used as the history file. If not,
then the value of the 'HISTFILE' variable is used.

## 9.3 History Expansion

The History library provides a history expansion feature that is similar
to the history expansion provided by 'csh'. This section describes the
syntax used to manipulate the history information.

History expansions introduce words from the history list into the
input stream, making it easy to repeat commands, insert the arguments to
a previous command into the current input line, or fix errors in
previous commands quickly.

History expansion is performed immediately after a complete line is
read, before the shell breaks it into words, and is performed on each
line individually. Bash attempts to inform the history expansion
functions about quoting still in effect from previous lines.

History expansion takes place in two parts. The first is to
determine which line from the history list should be used during
substitution. The second is to select portions of that line for
inclusion into the current one. The line selected from the history is
called the "event", and the portions of that line that are acted upon
are called "words". Various "modifiers" are available to manipulate the
selected words. The line is broken into words in the same fashion that
Bash does, so that several words surrounded by quotes are considered one
word. History expansions are introduced by the appearance of the
history expansion character, which is '!' by default.

History expansion implements shell-like quoting conventions: a
backslash can be used to remove the special handling for the next
character; single quotes enclose verbatim sequences of characters, and
can be used to inhibit history expansion; and characters enclosed within
double quotes may be subject to history expansion, since backslash can
escape the history expansion character, but single quotes may not, since
they are not treated specially within double quotes.

When using the shell, only '\' and ''' may be used to escape the
history expansion character, but the history expansion character is also
treated as quoted if it immediately precedes the closing double quote in
a double-quoted string.

Several shell options settable with the 'shopt' builtin (The
Shopt Builtin) may be used to tailor the behavior of history
expansion. If the 'histverify' shell option is enabled, and Readline is
being used, history substitutions are not immediately passed to the
shell parser. Instead, the expanded line is reloaded into the Readline
editing buffer for further modification. If Readline is being used, and
the 'histreedit' shell option is enabled, a failed history expansion
will be reloaded into the Readline editing buffer for correction. The
'-p' option to the 'history' builtin command may be used to see what a
history expansion will do before using it. The '-s' option to the
'history' builtin may be used to add commands to the end of the history
list without actually executing them, so that they are available for
subsequent recall. This is most useful in conjunction with Readline.

The shell allows control of the various characters used by the
history expansion mechanism with the 'histchars' variable, as explained
above (Bash Variables). The shell uses the history comment
character to mark history timestamps when writing the history file.

### 9.3.1 Event Designators

An event designator is a reference to a command line entry in the
history list. Unless the reference is absolute, events are relative to
the current position in the history list.

'!'
Start a history substitution, except when followed by a space, tab,
the end of the line, '=' or '(' (when the 'extglob' shell option is
enabled using the 'shopt' builtin).

'!N'
Refer to command line N.

'!-N'
Refer to the command N lines back.

'!!'
Refer to the previous command. This is a synonym for '!-1'.

'!STRING'
Refer to the most recent command preceding the current position in
the history list starting with STRING.

'!?STRING[?]'
Refer to the most recent command preceding the current position in
the history list containing STRING. The trailing '?' may be
omitted if the STRING is followed immediately by a newline. If
STRING is missing, the string from the most recent search is used;
it is an error if there is no previous search string.

'^STRING1^STRING2^'
Quick Substitution. Repeat the last command, replacing STRING1
with STRING2. Equivalent to '!!:s^STRING1^STRING2^'.

'!#'
The entire command line typed so far.

### 9.3.2 Word Designators

Word designators are used to select desired words from the event. A ':'
separates the event specification from the word designator. It may be
omitted if the word designator begins with a '^', '$', '*', '-', or '%'.
Words are numbered from the beginning of the line, with the first word
being denoted by 0 (zero). Words are inserted into the current line
separated by single spaces.

For example,

'!!'
designates the preceding command. When you type this, the
preceding command is repeated in toto.

'!!:$'
designates the last argument of the preceding command. This may be
shortened to '!$'.

'!fi:2'
designates the second argument of the most recent command starting
with the letters 'fi'.

Here are the word designators:

'0 (zero)'
The '0'th word. For many applications, this is the command word.

'N'
The Nth word.

'^'
The first argument; that is, word 1.

'$'
The last argument.

'%'
The first word matched by the most recent '?STRING?' search, if the
search string begins with a character that is part of a word.

'X-Y'
A range of words; '-Y' abbreviates '0-Y'.

'*'
All of the words, except the '0'th. This is a synonym for '1-$'.
It is not an error to use '*' if there is just one word in the
event; the empty string is returned in that case.

'X*'
Abbreviates 'X-$'

'X-'
Abbreviates 'X-$' like 'X*', but omits the last word. If 'x' is
missing, it defaults to 0.

If a word designator is supplied without an event specification, the
previous command is used as the event.

### 9.3.3 Modifiers

After the optional word designator, you can add a sequence of one or
more of the following modifiers, each preceded by a ':'. These modify,
or edit, the word or words selected from the history event.

'h'
Remove a trailing pathname component, leaving only the head.

't'
Remove all leading pathname components, leaving the tail.

'r'
Remove a trailing suffix of the form '.SUFFIX', leaving the
basename.

'e'
Remove all but the trailing suffix.

'p'
Print the new command but do not execute it.

'q'
Quote the substituted words, escaping further substitutions.

'x'
Quote the substituted words as with 'q', but break into words at
spaces, tabs, and newlines. The 'q' and 'x' modifiers are mutually
exclusive; the last one supplied is used.

's/OLD/NEW/'
Substitute NEW for the first occurrence of OLD in the event line.
Any character may be used as the delimiter in place of '/'. The
delimiter may be quoted in OLD and NEW with a single backslash. If
'&' appears in NEW, it is replaced by OLD. A single backslash will
quote the '&'. If OLD is null, it is set to the last OLD
substituted, or, if no previous history substitutions took place,
the last STRING in a !?STRING'[?]' search. If NEW is is null, each
matching OLD is deleted. The final delimiter is optional if it is
the last character on the input line.

'&'
Repeat the previous substitution.

'g'
'a'
Cause changes to be applied over the entire event line. Used in
conjunction with 's', as in 'gs/OLD/NEW/', or with '&'.

'G'
Apply the following 's' or '&' modifier once to each word in the
event.
