# Shell functions

## Bash functions

- functions are internal shell commands, so, by default, they are executed in the same shell environment. A subshell may be forced with `(…)`.
- functions are like user-defined builtins; along with shell keywords they constitute the internal shell commands that are readily avaialable, that need not be searched for as opposed to external commands (programs).
- functions have higher precedence then keywords and builtins, but lower then aliases. A name resolution procedure checks namespaces in this order: aliases, functions, keywords, builtins, programs.
- To skip the function namespace on behalf of builtins, use the `builtin` builtin. To skip the function namespace on behalf of programs use the `command` builtin. This is useful in case a function has the same name as a builtin or program; or, to make sure you are really invoking a builtin, and not some function that has the same name (e.g. for security reasons).
- a function may be defined directly on the command line or sourced from a file
- sourcing a file that defines a function, bash only checks the function syntax for syntax errors, it doesn't execute it.
- redirection following a function happens at invocation
- functions and variables live in separate namespaces
- when we invoke a function the return status (exit code) is the exit status of the last command executed within the function's body. The `return` builtin may given an explicit return code; it primary purpose is to stop execution and return control to the caller. Besides functions, `return` may also be used inside files intended to be sourced. On encoutering `return` while sourcing a file, bash stops its execution.







## Examples

```bash
$ for for in for; do echo $for; done
for

# to define a fn with the same name as a bash keyword (for)
# you must use the longer function def form:
$ function for () { echo function_for; }

$ for
function_for
$ for for in for; do echo for; done
for

# alias with the same name as bash keyword (for)
$ alias for='echo alias_for'

# check it
$ for
alias_for
$ \for
function_for

# after defining this alias, this doesn't work anymore:
$ for for in for; do echo for; done
bash: syntax error near unexpected token 'do'
# cos the first word
```


## Function syntax

Bash syntax to define functions has several equivalent forms:

    function fname () { … }
    function fname    { … }
             fname () { … }

When `()` is used, space is optional between it and the function name.

    fname () { … }
    fname() { … }

The form `fname () { cmd-list; }` is preferred. 

A function has a name (here `fname`) and its body is delineated using braces. 

*Braces* are bash keywords, not special or meta characters, so they must be space-separated from the surrounding words. Braces are used from grouping commands, which is exactly their use here.

*Parenthesis*, on the other hand are also used to group commands, but they primary use is to induce a subshell. The function body may be delimited by parenthesis in which case it will always be executed in a subshell.

  `fname () ( cmd-list )`

executing this function in a subshell, as `(fname)`, induces two subshells

Functions are defined in a file, and when the file is sourced, the file is read line by line and the commands are executed in the current shell. However, a function definition is not executed, it is only checked for sytax errors. Intead of being executed, the function is loaded into memory and becomes available as a new command under the given name (e.g. `fname`).

IIFE:
- `f () { cmd-list; } ; f` execute in fg
- `f () { cmd-list; } | f` execute in bg

## Return value

Like all commands, functions can only return a *return code* (0-255). This is the "true" return value and it only serves to indicate whether the command finished successfully (return code 0), or not (non-zero code).

A supplement mechanism used by bash itself is to dedicate a shell variable to hold return value. Bash `read` builtin stores its result in the variable named `REPLY`, unless the user supplies a name. Because builtins are internal commands, they are executed in the same environment, so it is feasable to assign a value to a variable. If the user supplies a name, bash will create a new variable with that name and assign the result of 'read' to it.

The usual way to go about this is called *capturing*, and it works even with external commands, which are executed in a child process. There is no way to set a variable (in the parent's env) in this case - a child process cannot affect the parent.

Each command is given the 3 standard streams, so the text that a function outputs to stdout can be captured, e.g. `x=$(fname)`. This resambles returning a value. This mechanism is used in pipelines, so in `cmd1 | cmd2`, the stdout of `cmd1` is automatically connected to stdin of `cmd2` (and thus captured). 

However, pipelined commands are executed in a subshell regardless if they are internal or not. `fn1 | fn2` is a pipeline of two fucntions but both are executed in a subshell.

The controlling (or parent) bash process, forks twice, giving a function to each child subshell to execute. The stdout of the first child is connected to the stdin of the second child.
