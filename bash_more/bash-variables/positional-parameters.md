# 3.4.1 Positional Parameters

https://www.gnu.org/software/bash/manual/bash.html#Positional-Parameters

A **positional parameter** is a parameter denoted by one or more digits, other than the single digit 0 (because `$0` is special and refers to a command name).

Positional parameters are assigned from the shell's arguments when it is invoked, and may be reassigned using the `set` builtin.

Positional parameter `N` may be referenced as `${N}`, or as `$N` when `N` consists of a single digit. A positional parameter consisting of more than a single digit must be enclosed in braces.

Positional parameters may not be assigned to with assignment statements, but they can be manipulated with `set`. `shift` builtin unsets them.

The positional parameters are temporarily replaced when a function is executed or a file is sourced; when the function/sourceable returns, they are restored.
