# Subshell

A subshell allows creating isolated execution environment, providing a way to effectively manage processes so as to execute commands without affecting the environment of the main (parent) shell.

A subshell, also known as a child shell, is a separate instance of the shell that is spawned from the current shell process. It inherits the environment and variables from its parent shell but operates independently, allowing for isolated execution of commands and scripts.

When a subshell is created, it runs in a separate process, distinct from the parent shell. This means that any changes made to the environment within the subshell, such as modifying variables or defining functions, are isolated and do not persist in the parent shell after the subshell terminates.

Commands *enclosed in parenthesis* are executed in a subshell.

*Command substitution* creates a subshell and captures its output.

The `bash -c '…'` command can also be used to create a subshell explicitly.

You can check if the current shell is a subshell by inspecting the value of the `BASH_SUBSHELL` environment variable: it is 0 in the parent shell, non-zero in subshells.

Subshells can be nested, meaning that a subshell can spawn another subshell within itself. However, it may not be as expected as there are optimizations not to spawn unneeded processes. Each nested subshell inherits the environment from its parent subshell and the BASH_SUBSHELL increments accordingly.

Background processes run in a subshell.

Each command in a pipeline runs in its own subshells with FDs combined/connected.

# Subshell inducers

-   `( cmd-list )`
-  `$( … )`
-  `(( … ))`
- `$(( … ))`
- `<(…)` and `>(…)`
- cmd &
- bash -c '…'
- cmd1 | cmd2 | cmd3
- external programs
- `command_not_found_handle`
