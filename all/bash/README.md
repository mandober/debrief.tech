# bash

![Bash Component Architecture][url]

Bash Component Architecture

[url]: ./bash-diagram.png


```
Input
↓
lexical analysis and parsing
↓
EXPANSION
↑       ↓
↑       |-> brace expansion
↑       |-> tilde expansion
↑       |-> var/param expansion; command/process/arith substitution
↑       |-> word splitting
↑       |-> filename generation
↑ <- <- |<- <- <- <- <- <- <- ↓
        ↓
command execution
↓
exit status
```
