# ENVIRONMENT

Before calling a filter, `rlwrap` sets the following environment variables:


`RLWRAP_FILTERDIR`
directory where `RlwrapFilter.pm` and most filters live (set by rlwrap, can be overridden by the user before calling rlwrap).

`PATH`
rlwrap automatically adds RLWRAP_FILTERDIR to the front of filter's PATH

`RLWRAP_VERSION`
rlwrap version (e.g. "0.35")

`RLWRAP_COMMAND_PID`
process ID of the rlwrapped command

`RLWRAP_COMMAND_LINE`
command line of the rlwrapped command

`RLWRAP_IMPATIENT`
whether rlwrap is in "impatient mode". In impatient mode, the candidate prompt is filtered through the output handler (and displayed before being overwritten by the cooked prompt).

`RLWRAP_INPUT_PIPE_FD`
File descriptor of input pipe (internal use only)

`RLWRAP_OUTPUT_PIPE_FD`
File descriptor of output pipe (internal use only)

`RLWRAP_MASTER_PTY_FD`
File descriptor of command's pty.

`RLWRAP_BREAK_CHARS`
The characters rlwrap considers as word-breakers.

`RLWRAP_DEBUG`
The value of the --debug option given to rlwrap.
