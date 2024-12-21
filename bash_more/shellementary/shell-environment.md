# Environment

https://www.gnu.org/software/bash/manual/bash.html#Environment

When a program is invoked it is given an array of strings called the *environment*. This is a list of name-value pairs, of the form `name=value`.

Bash provides several ways to manipulate the environment. 

On invocation, the shell scans its own environment and creates a parameter for each name found, *automatically marking it for export to child processes*.

Executed commands inherit the environment.

The `export` and `declare -x` builtins allow parameters and functions to be added to and deleted from the environment.

If the value of a parameter in the environment is modified, the new value becomes part of the environment, replacing the old. 

The environment inherited by any executed command consists of
- the shell's initial environment, whose values may be modified in the shell
- minus any pairs removed by the `unset` and `export -n` commands
- plus any additions via the `export` and `declare -x` commands

The environment for any simple command or function may be augmented temporarily by prefixing it with parameter assignments. These assignment statements affect only the environment seen by that command.


If the `set -k` option is set (see `set` builtin), then all parameter assignments are placed in the environment for a command, not just those that precede the command name. For example, 
```bash
set -k
sum () { echo $(( x + y + z )); }
x=2 sum y=6 z=7
# 15
```

When Bash invokes an external command, the variable `$_` is set to the full pathname of the command and passed to that command in its environment.
