# Bash builtins :: help

help [-dms] [pattern ...]

Display information about builtin commands.

Displays brief summaries of builtin commands. If PATTERN is specified, gives detailed help on all commands matching PATTERN, otherwise the list of all help topics is printed.

OPTIONS
- `-d`   Output short description for each topic
- `-m`   Display usage in pseudo-manpage format
- `-s`   Output only a short usage synopsis for each topic matching PATTERN

ARGUMENTS

`PATTERN` - the pattern specifying a help topic

EXIT STATUS
- 0 Success
- 1 pattern not found
- 2 invalid option
