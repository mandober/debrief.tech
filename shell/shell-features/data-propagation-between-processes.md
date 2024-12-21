# Data propagation between processes

## Internal and external commands

The shell classifies commands into *internal commands* (aliases, keywords, fucntions, builtins) and *external command* (executable scripts and programs) caring only whether it needs to spawn a subprocess to execute them or not.

Internal commands are executed in the current shell. Well, *aliases* are not really executed (per se), they are just macros-like syntactic substitutions, and they are replaced very early in the processing of a command line (right after the buffer representing a command line is split on special characters). *Keywords* are the building blocks of compound commands


in 
the process that shell performs on 



since they are internal 

but external commands are exectuted in a child process


Unlike external commands which are 

name resolution does not apply.

Unlike names of external commands, a name of an internal command is never searched for; since they are in memory, the shell knows where each internal command is, that is, name resolution does not apply.







The first classification of command is not terribly informative, although it is based on the important property: *internal commands*, which execute in the current shell, and *external commands*, which execute in a subshell. 

## Propagating data from a subprocess back to the parent



Depending on a use case, this may be a frustrating property because a subshell (child process) cannot affect the main shell (parent process). One way to propagate the data nevertheless is to use the file system. For example, you can record commands in a file to be sourced into the main shell. The problem is to setup a way so that file is automatically sourced 


(by whom? maybe set up a timer or a handler and hook into COMMAND_PROMPT).
