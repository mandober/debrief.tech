# Bash :: Parameters :: Assignment

*Variables* are parameters whose names are identifiers.

*Assignment statements*, pertaining only to variables, are `VAR=VALUE` pairs.

*Declaration builtins* (alias, declare/typeset, export, readonly, local) take assignment statements as operands.

An *operand* is the subject of a command; e.g. operands of `ls` are directories, operands of `ps` are PIDs, operands of `chmod` are fs items.



An **assignment statement** is a `VAR=VALUE` pair. It may appear by itself on the command line (possibly along with some redirections), in which case the variable `VAR` with VALUE is added to the current environment.

A command line consisting only of assignment statements and/or redirections does not count as a proper command, but a degerate one. It has no exit code.

An assignment statement - as one or more assignment pairs - that precedes a command has two consequences: it induces a subshell for the command to be evaluated in, and the assignment is valid only in the subshell.

An internal command (function or builtin), appearing by itself on a command line, is executed in the current environment. But if it is preceded with an assignment statement, then it is executed in a subshell. This makes little difference with external command since they are always executed in a subshell anyway. In any case, the assignment has an effect only in the subshell and it is discarded along with it.

Assignment statements may also appear as arguments to *declaration builtins*: alias, declare/typeset, export, readonly, and local. When bash is in POSIX mode, these builtins may appear in a command after one or more instances of the `command` builtin and retain these assignment statement properties.





Assignment statements
- quoting
  - single quotes
  - double quotes
  - baskslash quotes

Values (strings) that contain space must be quoted to be assigned as intended to a variable.

```bash
var1='factor 100'
var2="factor 100"
var3=factor\ 100


var="de factor"
var="Mary O'Connor"
```

## Augmenting environment temporarily

The environment for any simple-command may be augmented by prefixing it with one or more assignments to parameters.

Thus these two lines are equivalent:

    TERM=450 cmd args
    (export TERM; TERM=450; cmd args)

If the `-k` flag is set (with `set -k` or `set -o keyword`), all keyword arguments are placed in the environment, even if they occur after the command name. The following first prints `a=b c`, then `c`:

```bash
echo a=b c
# a=b c
set -k
echo a=b c
# c
```
