---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Pipelines.html
page-title:       Pipelines (Bash Reference Manual)
article-title:    Pipelines (Bash Reference Manual)
---
# Pipelines (Bash Reference Manual)

Pipelines (Bash Reference Manual)
---

#### 3.2.3 Pipelines

A `pipeline` is a sequence of one or more commands separated by one of the control operators ‘|’ or ‘|&’.

The format for a pipeline is

\[time \[-p\]\] \[!\] command1 \[ | or |& command2 \] …

The output of each command in the pipeline is connected via a pipe to the input of the next command. That is, each command reads the previous command’s output. This connection is performed before any redirections specified by the command.

If ‘|&’ is used, command1’s standard error, in addition to its standard output, is connected to command2’s standard input through the pipe; it is shorthand for `2>&1 |`. This implicit redirection of the standard error to the standard output is performed after any redirections specified by the command.

The reserved word `time` causes timing statistics to be printed for the pipeline once it finishes. The statistics currently consist of elapsed (wall-clock) time and user and system time consumed by the command’s execution. The \-p option changes the output format to that specified by POSIX. When the shell is in POSIX mode (see [Bash POSIX Mode][1]), it does not recognize `time` as a reserved word if the next token begins with a ‘\-’. The `TIMEFORMAT` variable may be set to a format string that specifies how the timing information should be displayed. See [Bash Variables][2], for a description of the available formats. The use of `time` as a reserved word permits the timing of shell builtins, shell functions, and pipelines. An external `time` command cannot time these easily.

When the shell is in POSIX mode (see [Bash POSIX Mode][3]), `time` may be followed by a newline. In this case, the shell displays the total user and system time consumed by the shell and its children. The `TIMEFORMAT` variable may be used to specify the format of the time information.

If the pipeline is not executed asynchronously (see [Lists][4]), the shell waits for all commands in the pipeline to complete.

Each command in a pipeline is executed in its own subshell, which is a separate process (see [Command Execution Environment][5]). If the `lastpipe` option is enabled using the `shopt` builtin (see [The Shopt Builtin][6]), the last element of a pipeline may be run by the shell process.

The exit status of a pipeline is the exit status of the last command in the pipeline, unless the `pipefail` option is enabled (see [The Set Builtin][7]). If `pipefail` is enabled, the pipeline’s return status is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands exit successfully. If the reserved word ‘!’ precedes the pipeline, the exit status is the logical negation of the exit status as described above. The shell waits for all commands in the pipeline to terminate before returning a value.

---

[1]: https://www.gnu.org/software/bash/manual/html_node/Bash-POSIX-Mode.html
[2]: https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
[3]: https://www.gnu.org/software/bash/manual/html_node/Bash-POSIX-Mode.html
[4]: https://www.gnu.org/software/bash/manual/html_node/Lists.html
[5]: https://www.gnu.org/software/bash/manual/html_node/Command-Execution-Environment.html
[6]: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
[7]: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
