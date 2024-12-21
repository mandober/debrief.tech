# bash builtins: command

Execute a simple (shadowed) command or display info about commands.

> command [-pVv] command [arg ...]

Runs COMMAND with ARGS suppressing shell function lookup, 
or displays info about the specified COMMAND(s). 
Useful tool to invoke a command that is bring shadowed by a function.

Options:
* `-p` Uses default `PATH` guaranteed to find all the standard utilities
* `-V` Prints verbose desc of each COMMAND
* `-v` Prints desc of COMMAND akin to `type` builtin (i.e. shows a single word that indicates the command or filename used to invoke the command)

Exit Codes:
- 0     success, COMMAND found (info mode, with -V, -v)
- 1     failure, COMMAND not found (info mode, with -V, -v)
- 127   COMMAND not found (execution mode)
- $?    same as COMMAND's (execution mode)

Exit Status:
- with `-V` or `-v`, exit status is 0 if COMMAND was found, else 1
- if neither option is supplied and an error occurred, or COMMAND cannot be found, the exit status is 127
- else, exit status is the exit status of COMMAND
