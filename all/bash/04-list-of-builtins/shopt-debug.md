shopt: debugging

extdebug
inherit_errexit
shift_verbose


extdebug
If set, behavior intended for use by debuggers is enabled:
1. declare -F displays the source file name and line number corresponding to each function name supplied as an argument.
2. If the command run by the DEBUG trap returns a non-zero value, the next command is skipped and not executed.
3. If the command run by the DEBUG trap returns a value of 2, and the shell is executing in a subroutine 
   (a shell function or a shell script executed by the . or source builtins), a call to return is simulated.
4. BASH_ARGC and BASH_ARGV are updated as described in their descriptions above.
5. Function tracing is enabled: command substitution, shell functions, and 
   subshells invoked with ( command ) inherit the DEBUG and RETURN traps.
6. Error tracing is enabled: command substitution, shell functions, and 
   subshells invoked with ( command ) inherit the ERR trap.

inherit_errexit
[since bash 4.4] When set, causes command substitutions to inherit the `set -e` option.
By default, those subshells disable `-e`.  It's enabled as part of turning on posix mode.

shift_verbose
If set, shift builtin prints an error message when the 
shift count exceeds the number of positional parameters.

