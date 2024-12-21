# Functions

- a function is a command called like a simple command
- on call it executes a compound command with a new set of positional params

```bash
name () compound-command [redirection]
function name [()] compound-command [redirection]
```

This defines a function named name. The keyword `function` is optional. If the `function` keyword is supplied, then parentheses are optional.

```bash
# function is a compound command
funcname () { ... }

# function body is executed in a subshell
funcname () ( ... )

function funcname () { ... }

function funcname { ... }

funcname () { ... } > file
```

- the body of a function is `compound-command`
- compound-command is usually a list (commands in braces), but it may also be a subshell (commands in parens)
* compound-command is executed whenever NAME is specified as the name of a simple command
> When in POSIX mode, NAME may not be the name of one of the **POSIX special builtins**.
* Any redirections specified when a function is defined are performed when the function is executed (not when defined).

EXIT STATUS of a function definition is zero unless a syntax error occurs or a readonly function with the same name already exists. 
EXIT STATUS of a function execution is the exit status of the last command executed in the body.

A shell function stores a series of commands for later execution. 
* When the name of a shell function is used as a simple command name, the list of commands associated with that function name is executed.
* Functions are executed in the context of current shell if braces are used; no new process is created to interpret them (unlike shell script). 
* When a function is executed, the arguments to the function become the positional parameters during its execution. 
  - The special parameter # is updated to reflect the change. 
  - Special parameter 0 is unchanged. 
  - The first element of the FUNCNAME variable is set to the name of the function while the function is executing.


All other aspects of the shell execution environment are identical between a function and its caller with these exceptions: 
- the DEBUG and RETURN traps are not inherited unless the function has been given the trace attribute (declare -t funcname) or
  the set -o functrace shell option has been enabled (in which case all functions inherit the DEBUG and RETURN traps), 
  and the ERR trap is not inherited unless the set -o errtrace shell option has been enabled.
- Variables local to the function may be declared with the local builtin command.
  Ordinarily, variables and their values are shared between the function and its caller.
- The FUNCNEST variable, if set to a numeric value greater than 0, defines a maximum function nesting level. 
  Function invocations that exceed the limit cause the entire command to abort.
- If the builtin command return is executed in a function, the function completes and execution resumes with the next 
  command after the function call. Any command associated with the RETURN trap is executed before execution resumes. 
- When a function completes, the values of the positional parameters and the special parameter # are restored to the values they had prior to the function's execution.


Function names and definitions may be *listed* with `declare -f`. To list the function names only use `declare -F`. To see the *source filename* and line number where the function is defined, enable extdebug shopt with `shopt -s extdebug`, then list the functions with `declare -F`.

A function may be *deleted* using `unset -f`. Note that shell functions and variables with the same name may result in multiple eponymous entries in the environment passed to the shell's children.

Functions may be *recursive*. The `FUNCNEST` variable may be used to limit the depth of the function call stack and restrict the number of function invocations. By default, no limit is imposed on the number of recursive calls.

Functions may be *exported* so that subshells automatically have them defined with `export -f FUNCNAME`. Exported functions will have special format; bash will encode them as env variables so they can be exported.


```bash
# function rbenv
rbenv () { echo 42; }

# to export it use
declare -fx rbenv
# or
export -f rbenv

# export function format
BASH_FUNC_rbenv%%=() { echo 42; }

# to remove the export attr
declare -f +x rbenv
# or
export -fn rbenv
```
