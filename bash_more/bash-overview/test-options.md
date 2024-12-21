# Index of Test Options

Test contexts:
- `test`, `[` (builtins)
- `[[` (keyword)


## Test options

### Files

-b file Tests if file is a block special file.
-c file Tests if file is a character special file.
-d file Tests if file exists and is a directory.
-e file Tests if file exists.
-f file Tests if file exists and is an ordinary file.
-g file Tests if file exists and has its setgid bit set.
-k file Tests if file exists and has its sticky bit set.
-n string Tests if string is nonempty.
-o option Tests if option is turned on.
-p file Tests if file exists and is a named pipe (fifo).
-r file Tests if file exists and is readable.
-s file Tests if file exists and has a size greater than zero.

-t file descriptor Tests if file descriptor is open and associated with a terminal device.

-u file Tests if file exists and has its setuid bit set.
-w file Tests if file exists and is writable.
-x file Tests if file exists and is executable.
-z string Tests if string is empty (length zero).
-G file Tests if file exists and is owned by the current group.
-L file Tests if file exists and is a symbolic link.
-O file Tests if file exists and is owned by the current user.
-S file Tests if file exists and is a socket.

file1 -ef file2 Tests if the two filenames refer to the same file.
file1 -nt file2 Tests if file1 is newer than file2.
file1 -ot file2 Tests if file1 is older than file2.

string == pattern Tests if the string matches the pattern.
string != pattern Tests if the string doesn’t match the pattern.
string1 > string2 Compares strings based on their ASCII values.
string1 < string2 Compares strings based on their ASCII values.
string =~ regex Tests if the string matches the regular expression

-e FILE           True if file (is any shell object; alias -a)
-s FILE           True if file is not empty
-f FILE         True if file is a regular file
-d FILE         True if file is a directory
-L FILE           True if file is a symbolic link (alias: -h)
-b FILE           True if file is a block special file
-c FILE           True if file is a character special file
-p FILE           True if file is a named pipe
-S FILE           True if file is a socket
-r FILE         True if file is readable by you
-w FILE         True if file is writable by you
-x FILE         True if file is executable by you
-O FILE           True if file is effectively owned by you
-G FILE           True if file is effectively owned by your group
-g FILE         True if file is set-group-id
-u FILE         True if file is set-user-id
-k FILE         True if file has its sticky bit set
-N FILE           True if file has been modified since it was last read

FILE1 -nt FILE2   True if file1 is newer than file2 (mod date)
FILE1 -ot FILE2   True if file1 is older than file2
FILE1 -ef FILE2   True if file1 is a hard link to file2


DO NOT FORGET A SWITCH, otherwise what seems like a file name is a string,
i.e., it evals if the given string is empty. LITERAL STRING IS NEVER EMPTY!


All file operators (except -h and -L)
are acting on the target of a symbolic link
not on the symlink itself
(if FILE is a symbolic link at all)


FILE DESCIPTORS
===============

-t FD   True if FD is opened on a terminal
#
Should be used to check if the stdin or stderr is connected to a terminal 
before outputing ANSI colored text.

[[ -t 0 ]] evals to true if stdin is connected to a terminal
[[ -t 1 ]] evals to true if stdout is connected to a terminal
[[ -t 2 ]] evals to true if stderr is connected to a terminal
(and not to something else such as pipe, socket, file, etc.)



STRING OPERATORS
================

 -z STRING  True if string is empty

 -n STRING  True if string is not empty. Or just test
    STRING  True if string is not empty

STRING1 = STRING2
True if the strings are equal

STRING1 != STRING2
True if the strings are not equal

STRING1 < STRING2
True if STRING1 sorts before STRING2 lexicographically

STRING1 > STRING2
True if STRING1 sorts after STRING2 lexicographically


OTHER OPERATORS
===============

-o OPTION        True if shell option OPTION is enabled.
-v VAR           True if shell var VAR is set.
-R VAR           True if shell var VAR is set and is a name reference.

! EXPR           True if expr is false.

EXPR1 -a EXPR2   True if both   expr1  AND  expr2 are true.
EXPR1 -o EXPR2   True if either expr1  OR   expr2 is true.

arg1 OP arg2     Arithmetic tests, OP is: -eq, -ne, -lt, -le, -gt, -ge

Arithmetic binary operators return TRUE if ARG1 is
  equal,        not-equal,
  less-than,    less-than-or-equal,
  greater-than, greater-than-or-equal
than ARG2.

Exit Status:
Returns success if EXPR evaluates to true.
Fails if EXPR evaluates to false or an invalid argument is given.
