# Bash Builtins: caller

Returns the context of any active subroutine call (a shell function or a script executed with the source builtins)

caller [EXPR]

- without EXPR, caller displays the line number and source filename of the current subroutine call
- if a non-negative integer is supplied as EXPR, caller displays the line number, subroutine name and source file corresponding to that position in the current execution call stack. This extra information may be used, for example, to print a stack trace. The current frame is frame 0. 
- RETURN VALUE is 0 unless the shell is not executing a subroutine, call or EXPR does not correspond to a valid position in the call stack.
- http://wiki.bash-hackers.org/commands/builtin/caller 


- caller builtin prints execution frames of subroutine calls
- without giving a frame number, the topmost execution frame information is printed ("who called me") with line number and filename.
- When an execution frame number is given (0 - topmost), the linenumber,
  the subroutine (function) and the filename is printed. 
- When an invalid execution frame number is given, it exists FALSE. 
  This way it can be used in a loop.
- caller produces no output unless used in script
- not very useful for interactive use, but can be used to create a decent
  `die` function to track down errors in moderately complex scripts. 

    { bash /dev/stdin; } <<<$'f(){ g; }\ng(){ h; }\nh(){ while caller $((n++)); do :; done; }\nf'


For more sophisticated debugging, Bash extended debugging features are available and 
a number of special parameters that give more detail than caller (e.g. BASH_ARG{C,V}). 
Tools such as bashdb can assist in using some of Bash's more advanced debug features.

The Bash manpage and help text specifies that the argument to caller is an "expr" (whatever that means). 
Only an integer is actually allowed, with no special interpretation of an "expression" as far as we can tell.

Portability considerations
* caller is not specified by POSIX(R)
* caller builtin command appeared in Bash version 3.0


EXAMPLE
Simple stack trace
The code below defines a function die that is used to exit the program. 
It prints a list of execution frames, starting with the topmost frame (0).
The topmost frame is the "caller of the die function", in this case function "f1".
This way, you can print a "stack trace" for debugging or logging purposes.

#!/bin/bash
die() {
  local frame=0
  while caller $frame; do
    ((frame++));
  done
  echo "$*"
  return 1
}

Test functions:
f1() { die "*** an error occured ***"; }
f2() { f1; }
f3() { f2; }

Run:
f3

Output:
12 f1 ./callertest.sh
13 f2 ./callertest.sh
14 f3 ./callertest.sh
16 main ./callertest.sh
*** an error occured ***


