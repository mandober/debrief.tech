---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Command-Execution-Environment.html
page-title:       Command Execution Environment (Bash Reference Manual)
article-title:    Command Execution Environment (Bash Reference Manual)
---
# Command Execution Environment (Bash Reference Manual)

Command Execution Environment (Bash Reference Manual)
---

#### 3.7.3 Command Execution Environment

The shell has an execution environment, which consists of the following:

-   open files inherited by the shell at invocation, as modified by redirections supplied to the `exec` builtin
-   the current working directory as set by `cd`, `pushd`, or `popd`, or inherited by the shell at invocation
-   the file creation mode mask as set by `umask` or inherited from the shell’s parent
-   current traps set by `trap`
-   shell parameters that are set by variable assignment or with `set` or inherited from the shell’s parent in the environment
-   shell functions defined during execution or inherited from the shell’s parent in the environment
-   options enabled at invocation (either by default or with command-line arguments) or by `set`
-   options enabled by `shopt` (see [The Shopt Builtin][1])
-   shell aliases defined with `alias` (see [Aliases][2])
-   various process IDs, including those of background jobs (see [Lists][3]), the value of `$$`, and the value of `$PPID`

When a simple command other than a builtin or shell function is to be executed, it is invoked in a separate execution environment that consists of the following. Unless otherwise noted, the values are inherited from the shell.

-   the shell’s open files, plus any modifications and additions specified by redirections to the command
-   the current working directory
-   the file creation mode mask
-   shell variables and functions marked for export, along with variables exported for the command, passed in the environment (see [Environment][4])
-   traps caught by the shell are reset to the values inherited from the shell’s parent, and traps ignored by the shell are ignored

A command invoked in this separate environment cannot affect the shell’s execution environment.

Command substitution, commands grouped with parentheses, and asynchronous commands are invoked in a subshell environment that is a duplicate of the shell environment, except that traps caught by the shell are reset to the values that the shell inherited from its parent at invocation. Builtin commands that are invoked as part of a pipeline are also executed in a subshell environment. Changes made to the subshell environment cannot affect the shell’s execution environment.

Subshells spawned to execute command substitutions inherit the value of the \-e option from the parent shell. When not in POSIX mode, Bash clears the \-e option in such subshells.

If a command is followed by a ‘&’ and job control is not active, the default standard input for the command is the empty file /dev/null. Otherwise, the invoked command inherits the file descriptors of the calling shell as modified by redirections.

---

[1]: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
[2]: https://www.gnu.org/software/bash/manual/html_node/Aliases.html
[3]: https://www.gnu.org/software/bash/manual/html_node/Lists.html
[4]: https://www.gnu.org/software/bash/manual/html_node/Environment.html
