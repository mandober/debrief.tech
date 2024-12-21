---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Arithmetic-Expansion.html
page-title:       Arithmetic Expansion (Bash Reference Manual)
article-title:    Arithmetic Expansion (Bash Reference Manual)
---
# Arithmetic Expansion (Bash Reference Manual)

Arithmetic Expansion (Bash Reference Manual)
---

#### 3.5.5 Arithmetic Expansion

Arithmetic expansion allows the evaluation of an arithmetic expression and the substitution of the result. The format for arithmetic expansion is:

The expression is treated as if it were within double quotes, but a double quote inside the parentheses is not treated specially. All tokens in the expression undergo parameter and variable expansion, command substitution, and quote removal. The result is treated as the arithmetic expression to be evaluated. Arithmetic expansions may be nested.

The evaluation is performed according to the rules listed below (see [Shell Arithmetic][1]). If the expression is invalid, Bash prints a message indicating failure to the standard error and no substitution occurs.

[1]: https://www.gnu.org/software/bash/manual/html_node/Shell-Arithmetic.html
