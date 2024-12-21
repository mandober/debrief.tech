# Executing programs

## The mechanics of program execution

When the user specifies a command, the most important issue for the shell is if the name designates an internal or external command.

*Internal commands* (keywords, functions, builtins) are executed in the current shell environment (current context), while *external commands* are executed in a subshell (child process).

Each process has its own execution context which among other things includes the standard file descriptors (stdin, stdout and stderr). When the shell itself starts it gets these 3 FDs, with the stdin connected to the terminal so it can receive commands typed by the user on a keyboard; the stdout and stderr are both connected to the screen so the commands' payload as well as errors can be displayed.

The `exec` builtin can be used to mess with these streams for the current shell (session, instance). The shell also provides redirection operators that allow the user to manipulate the FDs of commands.

When two commands are combined using a pipe, `cmd1 | cmd2`, the stdout of the left command is connected to the stdin of the right command. Other standard FDs are not changed; e.g. the stderr of the left command still points to where it usually would (to the screen).


One issue about this 

So the shell forks itself into the parent and child process, and the child process is then replaced with the program's process.
