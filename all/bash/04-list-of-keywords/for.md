# bash keywords: for

```bash
for name [ [ in [ word ... ] ] ; ] do list ; done

for name in word; do
  list
done

for name; do
  list
done

# same as
for name in $@; do
  list
done
```

- the list of `word`s following `in` is expanded, generating a list of items.
- the variable `name` is set to each element of this list in turn, and `list` is executed each time.
- if `in` is omitted, the word-list is `$@`

return status
- is the exit status of the last command that executes.
- if the expansion of the items following `in` results in an empty list, no commands are executed, and the return status is 0.


## The C-style for-loop

```bash
for (( expr1 ; expr2 ; expr3 )) ; do list ; done
```

First, the arithmetic expression expr1 is evaluated according to the rules of ARITHMETIC EVALUATION.

The arithmetic expression expr2 is then evaluated repeatedly until it evaluates to zero.

Each time expr2 evaluates to a non-zero value, list is executed and the arithmetic expression expr3 is evaluated.

If any expression is omitted, it behaves as if it evaluates to 1.

The return value is the exit status of the last command in list that is executed, or false if any of the expressions is invalid.


```bash
for (( <EXPR1> ; <EXPR2> ; <EXPR3> )); do
  <LIST>
done

# as a special case: without semicolon after ((...))
for (( <EXPR1> ; <EXPR2> ; <EXPR3> )) do
  <LIST>
done

# alternative historical undocumented syntax
for (( <EXPR1> ; <EXPR2> ; <EXPR3> )) {
  <LIST>
}
```

- EXPR is arithmetic expression contexts.
- each time one of the contexts is to be evaluated, it is first processed for:  brace, parameter, command, arithmetic, and process substitution/expansion (as usual for arithmetic contexts)
* if one of these arithmetic expressions in the for-loop is empty, it behaves as if it would be 1 (i.e. `true` in arithmetic context)



## Context
There is a lot of context involved [in bash parser]. e.g. the same word for can be a *reserved word*, *an identifier*, *part of an assignment statement*, or *another word*, making this a valid syntax:

```bash
for for in for; do
  for=for
done
echo $for # for

# or
for for in for; do for=for; done; echo $for

# or worse:
for for in for ]] } [[ {; do echo $for; done
```
