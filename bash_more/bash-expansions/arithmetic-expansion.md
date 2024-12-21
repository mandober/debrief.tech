# Arithmetic Expansion

*Arithmetic expansion* is eval and substitution of arith.expr with the result. 

Arithmetic Expansion Format: `$((EXPR))`

- EXPR is treated as if double-quoted, explicit inner dquotes are ignored
- Arithmetic expansions may be nested

All tokens in the expression undergo:
- parameter and variable expansion
- command substitution
- quote removal

The result is treated as the arithmetic expression to be evaluated

The evaluation is performed according to the rules listed below under ARITHMETIC EVALUATION. 
If expression is invalid, bash prints a message indicating failure and no substitution occurs.


ar.expr  Arithmetic expression
ar.expa  Arithmetic expansion
