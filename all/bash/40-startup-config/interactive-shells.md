Interactive shell is one started without non-option arguments (unless `-s' is specified), without specifying the `-c' option, 
and whose input and error output are both connected to terminals (as determined by isatty), or one started with the `-i' option.
An interactive shell generally reads from and writes to a user's terminal.
The `-s' invocation option may be used to set the positional parameters when an interactive shell is started.


Is this Shell Interactive?
To determine within a startup script whether or not Bash is running interactively, 
test the value of the `-' special parameter. It contains i when the shell is interactive. For example:
case "$-" in
*i*)	echo This shell is interactive ;;
*)	echo This shell is not interactive ;;
esac

Alternatively, startup scripts may examine the variable PS1; it is unset in non-interactive shells, and set in interactive shells. Thus:
if [ -z "$PS1" ]; then
   echo "This shell is not interactive"
else
   echo "This shell is interactive"
fi

Interactive Shell Behavior
When the shell is running interactively, it changes its behavior in several ways:

Startup files are read and executed
Job Control is enabled by default. When job control is in effect, 
Bash ignores keyboard-generated job control signals SIGTTIN, SIGTTOU, and SIGTSTP.
Bash expands and displays PS1 before reading the first line of a command, and expands
and displays PS2 before reading the second and subsequent lines of a multi-line command.
Bash executes the value of the PROMPT_COMMAND variable as a command before printing the primary prompt, PS1
Readline is used to read commands from the user's terminal.
Bash inspects the value of the ignoreeof option to set -o instead of exiting 
immediately when it receives an EOF on its standard input when reading a command.
Command history and history expansion are enabled by default. 
Bash will save the command history to the file named by HISTFILE when a shell with history enabled exits.
Alias expansion is performed by default.
In the absence of any traps, Bash ignores SIGTERM.
In the absence of any traps, SIGINT is caught and handled. SIGINT will interrupt some shell builtins.
An interactive login shell sends a SIGHUP to all jobs on exit if the huponexit shell option has been enabled.
The `-n' invocation option is ignored, and `set -n' has no effect.
set -n  Read commands but do not execute them. This is ignored by interactive shells.
Bash will check for mail periodically, depending on the values of the MAIL, MAILPATH, and MAILCHECK shell variables.
Expansion errors due to references to unbound shell variables after `set -u' has been enabled will not cause the shell to exit
The shell will not exit on expansion errors caused by var being unset or null in ${var:?word} expansions
Redirection errors encountered by shell builtins will not cause the shell to exit.
When running in POSIX mode, a special builtin returning an error status will not cause the shell to exit.
A failed exec will not cause the shell to exit.
Parser syntax errors will not cause the shell to exit.
Simple spelling correction for directory arguments to the cd builtin is enabled by default.
The shell will check the value of the TMOUT variable and exit if a command is not read within the specified number of seconds after printing PS1

