# bash: Glossary

## Background
By default, a process executes in the foreground, meaning its FDs are connected to the current tty: therefore its stdin receives the user's keyboard input, while its stdout and stderr are free to print the process' output and possible errors messages. A program that executes in the background has its FDs dosconnected from the tty, so it cannot interact with the user. To execute a program in the background append the `&` char to its name on the command line. To send an already running process to the background, first suspend it (Ctrl + Z), then allow it to run in the background with `bg`.

## Blank
A blank is a space or tab character.

## Builtin
A command that is provided by the shell itself, rather than by an external program. The huge difference is that builtins execute in the current shell unlike external programs that always execute in subshells. For this reason, it would be impossible to implement, e.g. `cd` as an external program.

## Control operator
A *token* that performs a control function: NL (newline), `&`, `;`, `;;`, `;&`, `;;&`, `|`, `|&`, `(`, `)`, `||`, `&&`.

## Exit status
The value returned by a command to its caller. The value is restricted to eight bits, so the maximum value is 255.

## Field
A unit of text that is the result of one of the shell expansions. After expansion, when executing a command, the resulting fields are used as the command name and arguments.

## File descriptor
A file descriptor (FD) is a file system abstraction, similar to a file handle. It is a communication channel that provides either an input or output channel to a process. By default, each process receives 3 standard FDs: *stdin* (for input), *stdout* (for output) and *stderr* (for printing out errors).

## Filename
A string of characters used to identify a file.

## Foreground
By default, a process executes in the foreground, so it interact with the user; its FDs are connected to the current tty: therefore its stdin receives the user's keyboard input, while its stdout and stderr are free to print the process' output and possible errors messages. A program that executes in the background has its FDs dosconnected from the tty, so it cannot interact with the user.

## Job
A set of processes comprising a pipeline, and any processes descended from it, that are all in the same process group.

## Job control
A mechanism by which users can selectively stop (suspend) and restart (resume) execution of processes.

## Metacharacter
A character that, when unquoted, separates words. A metacharacter is a `space`, `tab`, `newline`, or one of the following characters: '|', '&', ';', '(', ')', '<', or '\>'.

## Name
A `word` consisting solely of letters, numbers, and underscores, and beginning with a letter or underscore. `Name`s are used as shell variable and function names. Also referred to as an `identifier`.

## Operator
A `control operator` or a `redirection operator`. See Redirections, for a list of redirection operators. Operators contain at least one unquoted `metacharacter`.

## POSIX
A family of open system standards based on Unix. Bash is primarily concerned with the Shell and Utilities portion of the POSIX 1003.1 standard.

## Process group
A collection of related processes each having the same process group ID.

## Process group ID
A unique identifier that represents a `process group` during its lifetime.

## Reserved word
A `word` that has a special meaning to the shell. Most reserved words introduce shell flow control constructs, such as `for` and `while`.

## Return status
A synonym for `exit status`.

## Standard file descriptors
There are 3 standard file descriptors that each executed process is associated with: stdin, stdout and stderr. FDs may be manipulated (created, moved, closed, duplicated, etc.) by using redirection operators or the builtins (`exec`).

## stdin
stdin is one of the 3 standard FDs intended as an input channel for a process.

## stdout
stdout is one of the 3 standard FDs; stdout is intended as an output channel for a process.

## stderr
stderr is one of the 3 standard FDs. It is also an output channel like stdout, but intended only for printing out potential error messages. Such behaviour (printing "proper" output to stdout and errors to stderrr ) is not enforced but a matter of respecting the convention (by a program's author). Programs, and thus processes, that follow this convention (among other things) are said to "behave".

## Signal
A mechanism by which a process may be notified by the kernel of an event occurring in the system.

## Special builtin
A shell builtin command that has been classified as special by the POSIX standard.

## Token
A sequence of characters considered a single unit by the shell. It is either a `word` or an `operator`.

## Word
A sequence of characters treated as a unit by the shell. Words may not include unquoted `metacharacters`.
