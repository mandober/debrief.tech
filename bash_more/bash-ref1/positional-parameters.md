---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Positional-Parameters.html
page-title:       Positional Parameters (Bash Reference Manual)
article-title:    Positional Parameters (Bash Reference Manual)
---
# Positional Parameters (Bash Reference Manual)

Positional Parameters (Bash Reference Manual)
---

#### 3.4.1 Positional Parameters

A positional parameter is a parameter denoted by one or more digits, other than the single digit `0`. Positional parameters are assigned from the shell’s arguments when it is invoked, and may be reassigned using the `set` builtin command. Positional parameter `N` may be referenced as `${N}`, or as `$N` when `N` consists of a single digit. Positional parameters may not be assigned to with assignment statements. The `set` and `shift` builtins are used to set and unset them (see [Shell Builtin Commands][1]). The positional parameters are temporarily replaced when a shell function is executed (see [Shell Functions][2]).

When a positional parameter consisting of more than a single digit is expanded, it must be enclosed in braces.

[1]: https://www.gnu.org/software/bash/manual/html_node/Shell-Builtin-Commands.html
[2]: https://www.gnu.org/software/bash/manual/html_node/Shell-Functions.html
