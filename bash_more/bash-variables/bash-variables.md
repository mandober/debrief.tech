# Bash :: Variables

## Summary

- shell variables are containers that can hold a single value
- shell variables are `VAR=VALUE` pairs
- VAR is the name of variable and it must conform to the rules of identifiers
- vars and functions live in different namespaces, so it is possible
- `$` derefrences a variable, producing its value


Shell variables or just variables - because no other kinds of variables exist in the shell; environment variables are still shell variables - are named containers that can store a single value.

A variable has
- a name (mandatory) conforming to the rules for identifiers
- (possibly) it is assigned a value
- (possibly) it has some attributes set



Different "types" of variables 




Shell variables and shell functions live in different namespaces, so it is possible to have a variable and function with the same name. Functions are commands, so we invoke then just by stating their name; but the name of variable invokes shit and to retrieve its value we must "derefrence" it using the dollar "operator" (more like a sigil).



## Namespace of variables

Shell variables live in their own namespace. It is a namespace distinct from the namespace of functions and namespace of aliases.

The user can define
- aliases, and thus introduce new command names
- functions, and thus introduce new command names
- variables, which don't introduce new command names
- external programs
- sourceables (files that are sourced; PATH is also searched for those)


## Code

```bash
# declare variable ZX
declare ZX
echo $ZX


epo=42
epo
epo: command not found
# exit code 127
$epo
42: command not found
# exit code 127


error: command not found
42
echo $epo
42

epo () { echo 42; }
epo
42
```
