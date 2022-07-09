# bash builtins: type

> type [-aftpP] name [name ...]

Without options, indicates how NAME would be interpreted if used as a command.


`-t`
- prints one of these strings
  - alias       (bash alias)
  - keyword     (bash reserved word)
  - function    (bash function)
  - builtin     (bash builtin)
  - file        (disk file)
- if NAME not found, nothing is printed and the exit status is 1


`-p`
- type either returns the name of the disk file that would be executed if NAME were a command, or nothing if `type -t NAME` would not return "file".

`-P`
- forces PATH search for each NAME, even if `type -t name` wouldn't return file
- if a command is hashed, `-p` and `-P` print the hashed value, which is not necessarily the file that appears first in PATH.

`-a`
- type prints all the places that contain an executable named NAME
- includes aliases and functions, iff `-p` is not used as well
- the table of hashed commands is not consulted when using `-a`

`-f`
- suppresses shell function lookup


Return Status:
- 0 if all NAMEs found
- 1 if at least one NAME not found
