Special Parameters

The shell treats several parameters specially. 
These parameters may only be referenced; assignment to them is not allowed.

$*  pos.params
$@  pos.params
$#  no. of pos.params
$?  exit status of latest fg pipeline
$-  shell option flags
$$  shell PID
$!  backgrounded job PID
$0  shell name or shell script name
$_  last arg to prev cmd


$*
Expands to the positional parameters, starting from 1.

* When the expansion is not within double quotes, each positional parameter expands to a separate word. 
  In contexts where it is performed, those words are subject to further word splitting and pathname expansion. 
  $* -> $1 $2 $3 … ${N}
  
* When the expansion occurs within double quotes, it expands to a single word with the value of each parameter 
  separated by the first character of the IFS special variable. 
  That is, $* is equivalent to $1c$2c..., where c is the first character of the value of the IFS variable.
  "$*" -> "$1c$2c$3c…c${N}"
  If IFS is unset, the parameters are separated by spaces. 
  If IFS is null, the parameters are joined without intervening separators.


$@
Expands to the positional parameters, starting from one. 

* When the expansion occurs within double quotes, each parameter expands to a separate word. 
  That is, $@ is equivalent to "$1" "$2" ... 
  $@ -> $1 $2 $3 … ${N}

* If the double-quoted expansion occurs within a word, the expansion of the first parameter is 
  joined with the beginning part of the original word, and the expansion of the last parameter 
  is joined with the last part of the original word.
  "$@" -> "$1" "$2" "$3" … "${N}"

When there are no positional parameters, "$@" and $@ expand to nothing (i.e., they are removed).


$#
Expands to the number of positional parameters in decimal.


$?
Expands to the exit status of the most recently executed foreground pipeline.


$-
Expands to the current option flags as specified upon invocation, by the set builtin command, 
or those set by the shell itself (such as the -i option).


$$
Expands to the process ID of the shell. 
In a () subshell, it expands to the process ID of the current shell, not the subshell.


$!
Expands to the process ID of the job most recently placed into the background, 
whether executed as an asynchronous command or using the bg builtin.


$0
Expands to the name of the shell or shell script. This is set at shell initialization. 
* If bash is invoked with a file of commands, $0 is set to the name of that file. 
* If bash is started with the -c option, then $0 is set to the first argument after the string to be executed, if one is present. 
* Otherwise, it is set to the filename used to invoke bash, as given by argument zero.

$_
* At shell startup, set to the absolute pathname used to invoke the shell or 
  shell script being executed as passed in the environment or argument list. 
* Subsequently, expands to the last argument to the previous command, after expansion. 
* Also set to the full pathname used to invoke each command executed and placed in the environment exported to that command. 
  When checking mail, this parameter holds the name of the mail file currently being checked.

