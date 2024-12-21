# Functions

http://zsh.sourceforge.net/Doc/Release/Functions.html

Shell functions are defined with the `function` reserved word or the special syntax `funcname ()`. Shell functions are read in and stored internally. Alias names are resolved when the function is read. Functions are executed like commands with the arguments passed as positional parameters.

Functions execute in the same process as the caller and share all files and present working directory with the caller. A trap on `EXIT` set inside a function is executed after the function completes in the environment of the caller.

- The `return` builtin is used to return from function calls
- Function identifiers can be listed with the `functions` builtin
- Functions can be undefined with the `unfunction` builtin


## Autoloading Functions

A function can be marked as undefined using the `autoload` builtin (or `functions -u` or `typeset -fu`).

Such a function has no body. When the function is first executed, the shell searches for its definition using the elements of the `fpath` variable. Thus to define functions for autoloading, a typical sequence is:

```zsh
fpath=(~/myfuncs $fpath)
autoload myfunc1 myfunc2 ...
```

The usual alias expansion during reading will be suppressed if the `autoload` builtin or its equivalent is given the option `-U`. This is recommended for the use of functions supplied with the zsh distribution. Note that for functions precompiled with the `zcompile` builtin command the flag `-U` must be provided when the .zwc file is created, as the corresponding information is compiled into the latter.

For each element in `fpath`, the shell looks for 3 possible files,
the newest of which is used to load the definition for the function:

1. element.zwc    
file created with the zcompile builtin command, which is expected to contain the definitions for all functions in the directory named element. The file is treated in the same manner as a directory containing files for functions and is searched for the definition of the function. If the definition is not found, the search for a definition proceeds with the other two possibilities described below.

If element already includes a .zwc extension (i.e. the extension was explicitly given by the user), element is searched for the definition of the function without comparing its age to that of other files; in fact, there does not need to be any directory named element without the suffix. Thus including an element such as ‘/usr/local/funcs.zwc’ in fpath will speed up the search for functions, with the disadvantage that functions included must be explicitly recompiled by hand before the shell notices any changes.

2. element/function.zwc    
A file created with zcompile, which is expected to contain the definition for function. It may include other function definitions as well, but those are neither loaded nor executed; a file found in this way is searched only for the definition of function.


3. element/function    
A file of zsh command text, taken to be the definition for function.


In summary, the order of searching is:
1. in the parents of directories in `fpath for the newer of either a compiled directory or a directory in fpath; second, if more than one of these contains a definition for the function that is sought, the leftmost in the fpath is chosen; and third, within a directory, the newer of either a compiled function or an ordinary function definition is used.

If the KSH_AUTOLOAD option is set, or the file contains only a simple definition of the function, the file’s contents will be executed. This will normally define the function in question, but may also perform initialization, which is executed in the context of the function execution, and may therefore define local parameters. It is an error if the function is not defined by loading the file.

Otherwise, the function body (with no surrounding ‘funcname() {...}’) is taken to be the complete contents of the file. This form allows the file to be used directly as an executable shell script. If processing of the file results in the function being re-defined, the function itself is not re-executed. To force the shell to perform initialization and then call the function defined, the file should contain initialization code (which will be executed then discarded) in addition to a complete function definition (which will be retained for subsequent calls to the function), and a call to the shell function, including any arguments, at the end.

For example, suppose the autoload file func contains

func() { print This is func; }
print func is initialized
then ‘func; func’ with KSH_AUTOLOAD set will produce both messages on the first call, but only the message ‘This is func’ on the second and subsequent calls. Without KSH_AUTOLOAD set, it will produce the initialization message on the first call, and the other message on the second and subsequent calls.

It is also possible to create a function that is not marked as autoloaded, but which loads its own definition by searching fpath, by using ‘autoload -X’ within a shell function. For example, the following are equivalent:
myfunc() {
  autoload -X
}
myfunc args...
and

unfunction myfunc   # if myfunc was defined
autoload myfunc
myfunc args...
In fact, the functions command outputs ‘builtin autoload -X’ as the body of an autoloaded function. This is done so that

eval "$(functions)"
produces a reasonable result. A true autoloaded function can be identified by the presence of the comment ‘# undefined’ in the body, because all comments are discarded from defined functions.

To load the definition of an autoloaded function myfunc without executing myfunc, use:

autoload +X myfunc
[ << ]	[ < ]	[ Up ]	[ > ]	[ >> ]	 	 	 	 	[Top]	[Contents]	[Index]	[ ? ]
9.2 Anonymous Functions
If no name is given for a function, it is ‘anonymous’ and is handled specially. Either form of function definition may be used: a ‘()’ with no preceding name, or a ‘function’ with an immediately following open brace. The function is executed immediately at the point of definition and is not stored for future use. The function name is set to ‘(anon)’.

Arguments to the function may be specified as words following the closing brace defining the function, hence if there are none no arguments (other than $0) are set. This is a difference from the way other functions are parsed: normal function definitions may be followed by certain keywords such as ‘else’ or ‘fi’, which will be treated as arguments to anonymous functions, so that a newline or semicolon is needed to force keyword interpretation.

Note also that the argument list of any enclosing script or function is hidden (as would be the case for any other function called at this point).

Redirections may be applied to the anonymous function in the same manner as to a current-shell structure enclosed in braces. The main use of anonymous functions is to provide a scope for local variables. This is particularly convenient in start-up files as these do not provide their own local variable scope.

For example,

variable=outside
function {
  local variable=inside
  print "I am $variable with arguments $*"
} this and that
print "I am $variable"
outputs the following:

I am inside with arguments this and that
I am outside
Note that function definitions with arguments that expand to nothing, for example ‘name=; function $name { ... }’, are not treated as anonymous functions. Instead, they are treated as normal function definitions where the definition is silently discarded.

[ << ]	[ < ]	[ Up ]	[ > ]	[ >> ]	 	 	 	 	[Top]	[Contents]	[Index]	[ ? ]
9.3 Special Functions
Certain functions, if defined, have special meaning to the shell.


9.3.2 Trap Functions
The functions below are treated specially but do not have corresponding hook arrays.

TRAPNAL
If defined and non-null, this function will be executed whenever the shell catches a signal SIGNAL, where NAL is a signal name as specified for the kill builtin. The signal number will be passed as the first parameter to the function.

If a function of this form is defined and null, the shell and processes spawned by it will ignore SIGNAL.

The return status from the function is handled specially. If it is zero, the signal is assumed to have been handled, and execution continues normally. Otherwise, the shell will behave as interrupted except that the return status of the trap is retained.

Programs terminated by uncaught signals typically return the status 128 plus the signal number. Hence the following causes the handler for SIGINT to print a message, then mimic the usual effect of the signal.

TRAPINT() {
  print "Caught SIGINT, aborting."
  return $(( 128 + $1 ))
}
The functions TRAPZERR, TRAPDEBUG and TRAPEXIT are never executed inside other traps.

TRAPDEBUG
If the option DEBUG_BEFORE_CMD is set (as it is by default), executed before each command; otherwise executed after each command. See the description of the trap builtin in Shell Builtin Commands for details of additional features provided in debug traps.

TRAPEXIT
Executed when the shell exits, or when the current function exits if defined inside a function. The value of $? at the start of execution is the exit status of the shell or the return status of the function exiting.

TRAPZERR
Executed whenever a command has a non-zero exit status. However, the function is not executed if the command occurred in a sublist followed by ‘&&’ or ‘||’; only the final command in a sublist of this type causes the trap to be executed. The function TRAPERR acts the same as TRAPZERR on systems where there is no SIGERR (this is the usual case).

The functions beginning ‘TRAP’ may alternatively be defined with the trap builtin: this may be preferable for some uses. Setting a trap with one form removes any trap of the other form for the same signal; removing a trap in either form removes all traps for the same signal. The forms

TRAPNAL() { 
 # code
}
(’function traps’) and

trap '
 # code
' NAL
(’list traps’) are equivalent in most ways, the exceptions being the following:

Function traps have all the properties of normal functions, appearing in the list of functions and being called with their own function context rather than the context where the trap was triggered.
The return status from function traps is special, whereas a return from a list trap causes the surrounding context to return with the given status.
Function traps are not reset within subshells, in accordance with zsh behaviour; list traps are reset, in accordance with POSIX behaviour.
