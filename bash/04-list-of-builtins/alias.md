# bash builtins: alias

`alias [-p] [name[=value]]`


`alias`, `alias -p`   
Prints the list of aliases in the form `alias name=value` on stdout.


For each name in the argument list for which no value is supplied, the name and value of the alias is printed. `alias name1 name2`

When arguments are supplied, an alias is defined for each name whose value is given: `alias name='value' name2='value2'`

A trailing space in value causes the next word to be checked for alias substitution when the alias is expanded.

alias c='cd '; $ alias h='/home/user/'; $ c h  # works
alias c='cd'; $ alias h='/home/user/'; $ c h   # doesn't work


RETURN STATUS: 0 unless a name is given for which no alias has been defined.


```bash
# no good
alias -='cd -'

# use doubledash to introduce operands
alias -- -='cd -'

# redifine alias with a function
alias() {
  : -s save defined alias to $ALIAS file
}
```
