# Positional Parameters

A **positional parameter** is a parameter denoted by one or more digits, 
other than the single digit 0, (`$1`, `$2`, …). To refer to a positional parameter consisting of more than a single digit, enclose it in braces, `${10}`.


Positional parameters are assigned from the shell's arguments when it is invoked.

Positional parameters may be reassigned using the `set` builtin.

`set -- a b c  # $1=a`

Positional parameters can only be referenced, never assigned to.

The positional parameters are temporarily replaced when a shell function is executed.


Positional parameters are operationally an array, or at least *array-like*, except the name of the array is weird (`$` or `*`) and its elements are referenced by numbers alone, `$1`, `$2`, etc. The `shift` builtin is used to destroy its elements: it takes the positional parameter array implicitly, as well as the last index or last element, and removes it.

```bash
set -- 1 2 3 4 5
echo "$@"
# 1 2 3 4 5
shift
# 1 2 3 4
shift 2
# 1 2
```

It is also a strange kind of array in that it can be printed entirely with `echo`. For regular bash arrays, referring to an array itself refers to its first element in most cases, although with some builtins, the array variable itself is referenced.
