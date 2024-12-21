# Command line processing

Chapter from `The Architecture of Open Source Applications`
Bash by Chet Ramey 
https://aosabook.org/en/v1/bash.html


A Unix shell provides an interface that lets the user interact with the operating system by running commands.

But a shell is also a fairly rich programming language: there are constructs for flow control, alternation, looping, conditionals, basic mathematical operations, named functions, string variables, and two-way communication between the shell and the commands it invokes.

Shells can be used *interactively*, from a terminal like xterm, and *non-interactively*, reading commands from a file.

Most modern shells support *command-line editing* in which command-line can be edited and manipulated by the user (using emacs or vi-like commands) until they submit it. Various forms of *command-line history* (of commands of previous sessions) are supported as well, allowing for a quick recall of previously entered commands.

## Command-line processing stages

Bash **command-line processing** works in much the same way as the *shell pipeline*: after reading a command-line as input (directly from the terminal or from script, or given as a command-line argument on the shell invocation), data traverses a number of *processing stages*, being transformed at each step, until the shell, having resolved what command corresponds to a command-line name, finally executes that command, and collects and reports the return status.

This chapter will explore bash's major components: input processing, parsing, the various word expansions, and other command processing, and command execution, from the pipeline perspective.

These components act as a pipeline for data that is read from the keyboard or from a file, turning it into an executed command.
