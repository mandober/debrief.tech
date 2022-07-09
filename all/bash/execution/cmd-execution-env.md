# Command Execution Environment


The shell maintains its execution environment:

* *FDs*: open files inherited by the shell at invocation, along with the set of redirections currently in effect (possibly modified with `exec`)
* *cwd* as set by `cd`, `pushd`, `popd`, or inherited by the shell at invocation
* *umask*: file creation mode mask (as set by `umask`) or inherited from the shell's parent
* *traps*: current traps set by trap
* *params*: shell params set by var assignment or with `set` or inherited from the shell's parent in the environment
* *functions* defined during execution or inherited from the shell's parent in the environment
* *setopts*: `BASHOPTS`, `$-` i.e. bash options enabled at invocation (either by default or with command-line arguments) or set by the `set` builtin
* *shopt*: options enabled by the `shopt` builtin
* *aliases* defined with the `alias` builtin
* various *process IDs*, including those of background jobs, the value of `$$`, and the value of `PPID`


When a simple command (other than a builtin or shell function) is to be executed, it is invoked in a separate execution environment
(unless otherwise noted, the values are inherited from the shell)
* *FDs*: shell's open files along with redirections in effect
* *cwd*: the current working directory
* *umask*: the file creation mode mask
* *vars and functions marked for export*, along with the key=value pairs injected to the subshell env (by prepending them to the command's invocation)
* *traps* caught by the shell are reset to the values inherited from the shell's parent, and traps ignored by the shell are ignored

A command invoked in this separate environment cannot affect the shell's execution environment.

Command substitution, commands grouped with parentheses, and asynchronous commands are invoked in a subshell environment that is a copy of the shell environment, except that traps caught by the shell are reset to the values that the shell inherited from its parent at invocation.

Builtin commands that are invoked as part of a pipeline are also executed in a subshell environment. Changes made to the subshell environment cannot affect the shell's execution environment.

Subshells spawned to execute command substitutions inherit the value of the `-e` option from the parent shell. When not in POSIX mode, bash clears the `-e` option in such subshells.

If a command is followed by a `&` and job control is not active, the default stdin for the command is the file `/dev/null`. Otherwise, the invoked command inherits the file descriptors of the calling shell as modified by redirections.
