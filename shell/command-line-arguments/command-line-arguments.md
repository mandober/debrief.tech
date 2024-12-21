# Command-line arguments

command
arguments
options
non-options
long
short
operands
simple command
compound command
command-list


## Command
A command is usually distinguished as the first name on the command line, or more generally, the first name in a pipeline. A pipeline is more general form of a command, that accounts for all the different ways to combine commands together. A simple command is also counted as a pipeline, although it has no pipe; as are commands combined with `&&` and `||`. So simple commands, compound commands, command-lists and any other form that forms a job.

## Internal and external commands
In the shell, a command can be a lot of things: aliases, keywords, functions, builtins, scripts, programs. The basic classification of commands has to do with the way they are executed: internal commands (alias, keyword, function, builtin) are excuted in the current shell; external commands (executable scripts and programs) are executed in a subshell.

## Operand
Unix philosophy is about making programs that do one thing only (and do it well), so almost every program (command, utility, application) has an object that is its central interest. 

## Order
Normally *options* and *operands* can appear in almost any (reasonable) order, and the program should be able to arrange them in the canonical format such that all options appear before any operands.

For example, `sort -r passwd -t :` acts like `sort -r -t : passwd`, since `:` is an *option-argument* of `-t`.  However, if the `POSIXLY_CORRECT` environment variable is set, options must appear before operands, unless otherwise specified for a particular command.
