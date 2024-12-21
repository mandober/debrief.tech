# Index :: Bash redicarection operators

General syntax: `lhs OP rhs`

- fd 0 stdin
- fd 1 stdout
- fd 2 stderr
- `&` denotes a FD (as a target)

stdin
- `<` primary operator
- `<<` append
- `<<` here-doc
- `<<<` here-string

stdout
- `>` primary operator

stderr
- `2>` primary operator

stdout and stderr
