# RUNCOM

*Louis Pouzin* released a paper in 1965 describing a design for the Multics shell which includes a brief description of RUNCOM followed by a second paper he released five days later describing a design for RUNCOM that added commands for control flow, conditional branching and looping.

See project MAC at MIT and the two papers by Louis Pouzin
- `The SHELL: A Global Tool for Calling and Chaining Procedures in the System`
  by Louis Pouzin, April 2, 1965
  https://people.csail.mit.edu/saltzer/Multics/Multics-Documents/MDN/MDN-4.pdf
- `RUNCOM: A Macro-Procedure Processor for the 636 System`
  by Louis Pouzin, April 7, 1965
  https://people.csail.mit.edu/saltzer/Multics/Multics-Documents/MDN/MDN-5.pdf

Louis Pouzin has participated in the developement of CTSS (Compatible Time-Sharing System) at MIT during 1963 and 1964. "After having written dozens of commands for CTSS, I reached the stage where I felt that commands should be usable as building blocks for writing more commands, just like subroutine libraries. Hence, I wrote RUNCOM, a sort of shell driving the execution of command scripts, with argument substitution". The tool became very popular as it allowed automation of common tasks; it was possible to leave long runcoms executing overnight.

However, RUNCOM was not a shell in the sense of the UNIX shell. When the user typed commands into CTSS they went to the supervisor (kernel), not any shell-like program. RUNCOM could not accept user input but it could process commands from files. 

CTSS files had first and second name separated by a space (e.g. FOO BCD). *RUNCOM command-chains* also known as *macro-commands* (basically scripts) were files with a second name of either `RUNCOM` or `BCD`, containing zero or more lines.

Legal lines were
- blank lines
- comments
- regular commands (those valid on the supervisor's command line)
- pseudo-command (command built into RUNCOM only) `CHAIN`

Comments start with either `$` or `*` as the first character of the line. Comments using `$` are printed (including the `$`) when RUNCOM runs while ones with `*` are not. Parameter substitution does not occur in comments.

When the user invoked RUNCOM, the arguments to it must first start with the first name of the file containing the script (?).

If the user invoked RUNCOM without any arguments, it prints some instructions on how to use it and stops, returning the user to the supervisor's command line. 

The remaining arguments, if any, are either command names, values to be used as arguments in the script, or the strings `(NIL)` or `(END)` including parens.

In the script, `CHAIN` gives names to arguments that were stated on the command line when invoking RUNCOM; e.g. putting `CHAIN LALA FAFA` in the script and invoking `RUNCOM XYZZY 3` caused `LALA` in the script to be substituted with `3` when it appeared on any line after `CHAIN`, while `FAFA` remained `FAFA` as RUNCOM did not specify anything for it.

If an argument to RUNCOM is `(NIL)`, a positional parameter denoted as an argument to CHAIN in the script was expanded into nothing; e.g. `CHAIN ALPHA BETA GAMMA` combined with `RUNCOM A (NIL) B` caused `ALPHA` to be substituted with `A` and `GAMMA` with `B`, while `BETA` was removed from any command that followed CHAIN in the script.

If a RUNCOM argument was `(END)`, the corresponding CHAIN argument was treated as `(NIL)`, and all the subsequent args were also treated as `(NIL)`.

Any parameter to CHAIN was used as the command name in the script, i.e. it could come first before any arguments. For example, `RUNCOM SCRIPT LISTF` combined with `CHAIN CMD` and followed by `CMD` at the start of a following line would cause `CMD` to be substituted with `LISTF`, which lists the dir contents.

Once the substitutions were completed, RUNCOM sends the commands to the `SCHAIN` library subroutine which is available to other programs as well.
