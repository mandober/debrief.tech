 bash | man | builtins

trap

trap [-lp] [[arg] sigspec ...]

The command arg is to be read and executed when the shell receives signal(s) SIGSPEC. 

* If arg is absent (and there is a single sigspec) or -, each specified signal is 
  reset to its original disposition (the value it had upon entrance to the shell).

* If arg is the null string the signal specified by each sigspec 
  is ignored by the shell and by the commands it invokes. 

-p  If arg is not present and -p has been supplied, then the 
    trap commands associated with each sigspec are displayed. 
    If no arguments are supplied or if only -p is given, trap 
    prints the list of commands associated with each signal. 

-l  causes the shell to print a list of signal names and their corresponding numbers. 


* Each sigspec is either a signal name defined in <signal.h>, or a signal number. 
* Signal names are case insensitive and the SIG prefix is optional.


DEBUG
command arg is executed:
- before every simple command
- for command
- case command
- select command
- every arithmetic for command 
- just before the first command in a function body is executed (implemented for bash debugger)

DEBUG trap is run:
- before binding the variable and running the action list in a for command
- before binding the selection variable and running the query in a select command
- before attempting a match in a case command

Refer to the description of the extdebug option to the shopt builtin for details of its effect on the DEBUG trap:
If extdebug is enabled, a non-zero return value from a DEBUG trap causes the next command to be skipped;
return value of 2 while in a function or sourced script forces a RETURN.


ERR
command arg is executed whenever 
  - a pipeline (which may consist of a single simple command)
  - a list
  - a compound command 
returns a non-zero exit status, subject to the following conditions.
The ERR trap is not executed if the failed command is:
  - part of the command list immediately following a while or until keyword
  - part of the test in an if statement
  - part of a command executed in a && or || list (except the command following the final && or ||)
  - any command in a pipeline but the last
  - or if the command's return value is being inverted using !
These are the same conditions obeyed by the errexit (-e) option




RETURN
command arg is executed each time a shell function or a 
script executed with the . or source builtins finishes executing.
Not when inherited child processes returns; it is inherited by command 
substitution if function tracing is enabled and the debugger is active

EXIT
command arg is executed on exit from the shell.

functrace (set -T) and errtrace options (set -E) cause DEBUG and ERR traps, respectively, to be inherited by shell functions. 
functrace option also controls whether or not the DEBUG trap is inherited by sourced scripts.


* Signals ignored upon entry to the shell cannot be trapped or reset.
* Trapped signals that are not being ignored are reset to their original 
  values in a subshell or subshell environment when one is created.


RETURN STATUS
is false if any sigspec is invalid; otherwise trap returns 0





from bash FAQ:

New variables to support the bash debugger:  
BASH_ARGC, BASH_ARGV, BASH_SOURCE, BASH_LINENO, 
BASH_SUBSHELL, BASH_EXECUTION_STRING, BASH_COMMAND

i.  FUNCNAME has been changed to support the debugger: it's now an array variable.
j.  for, case, select, arithmetic commands now keep line number information for the debugger.
k.  There is a new `RETURN' trap executed when a function or sourced script
    returns (not inherited child processes; inherited by command substitution
    if function tracing is enabled and the debugger is active).
l.  New invocation option:  --debugger.  Enables debugging and turns on new `extdebug' shell option.
m.  New `functrace' and `errtrace' options to `set -o' cause DEBUG and ERR
    traps, respectively, to be inherited by shell functions.  Equivalent to
    `set -T' and `set -E' respectively.  The `functrace' option also controls
    whether or not the DEBUG trap is inherited by sourced scripts.
n.  The DEBUG trap is run before binding the variable and running the action
    list in a `for' command, binding the selection variable and running the
    query in a `select' command, and before attempting a match in a `case' command.
o.  New `--enable-debugger' option to `configure' to compile in the debugger support code.
p.  `declare -F' now prints out extra line number and source file information if the `extdebug' option is set.
q.  If `extdebug' is enabled, a non-zero return value from a DEBUG trap causes
    the next command to be skipped, and a return value of 2 while in a
    function or sourced script forces a `return'.
r.  New `caller' builtin to provide a call stack for the bash debugger.
s.  The DEBUG trap is run just before the first command in a function body is executed, for the debugger.
t.  `for', `select', and `case' command heads are printed when `set -x' is enabled.







