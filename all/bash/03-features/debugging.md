debugging

BASH_ARGC
BASH_ARGV
BASH_COMMAND
BASH_LINENO
LINENO

FUNCNAME
FUNCNEST
BASH_SOURCE
BASH_XTRACEFD
BASH_COMPAT
PIPESTATUS
CHILD_MAX


BASH_ARGC
An array variable whose values are the number of parameters in each frame of the current bash execution call stack. 
The number of parameters to the current subroutine (shell function or script executed with source) is at the top of the stack. 
When a subroutine is executed, the number of parameters passed is pushed onto BASH_ARGC. 
The shell sets BASH_ARGC only when in extended debugging mode.
extdebug | iarray

BASH_ARGV
An array variable containing all of the parameters in the current bash execution call stack. 
The final parameter of the last subroutine call is at the top of the stack; 
The first parameter of the initial call is at the bottom. 
When a subroutine is executed, the parameters supplied are pushed onto BASH_ARGV. 
The shell sets BASH_ARGV only when in extended debugging mode.
extdebug | iarray

BASH_SOURCE
An array variable whose members are the source filenames where the 
corresponding shell function names in the FUNCNAME array variable are defined. 
The shell function ${FUNCNAME[$i]} is defined in the file ${BASH_SOURCE[$i]} and called from ${BASH_SOURCE[$i+1]}.
iarray

BASH_COMMAND
The command currently being executed or about to be executed, unless the shell is executing a
command as the result of a trap, in which case it is the command executing at the time of the trap.

BASH_LINENO
An array variable whose members are the line numbers in source files where each corresponding member of FUNCNAME was invoked.  
${BASH_LINENO[$i]} is the line number in the source file (${BASH_SOURCE[$i+1]}) where ${FUNCNAME[$i]} was called (or 	
${BASH_LINENO[$i-1]} if referenced within another shell function). Use LINENO to obtain the current line number.

LINENO
Each time this parameter is referenced, the shell substitutes a decimal number representing the current 
sequential line number (starting with 1) within a script or function. When not in a script or function, 
the value substituted is not guaranteed to be meaningful. If LINENO is unset, it loses its special properties, 
even if it is subsequently reset.

