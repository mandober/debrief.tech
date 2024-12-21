# 3.2.2 Simple command

https://www.gnu.org/software/bash/manual/html_node/Simple-Commands.html

A **simple command** is a command that doesn't use any of the reserved words intended for creating pipelines (compound commands).

It's just a sequence of words separated by blanks, terminated by one of the shell's control operators (see Definitions). 

The first word generally specifies a command to be executed, with the rest of the words being that command's arguments.

The return status (see Exit Status) of a simple command is its exit status as provided by the POSIX 1003.1 waitpid function, or 128+n if the command was terminated by signal n.
