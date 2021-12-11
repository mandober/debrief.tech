# Bash Keywords

- { }
- !
- [[    ]]
- case...in...esac
- for...in...do...done
- until...do...done
- while...do...done
- if then elif else fi
- select
- function
- time
- coproc



## Keywords vs Builtins

Differences between bash keywords and bash builtins:
- a builtin's name must be delimited with blanks (followed by a space)
- a keyword doesn't care about such trivial things

For example, `[` is a builtin and `[[` is a keyword. The former must be delimited from the subsequent words, the same way that any command must be separated from its options.

```bash
# command is `[` of the builtin provenance
# it is followed by option `-e`
[ -e $f ]

# builtin `test` is its synonym
test -e $f

# command `[[` is a keyword
[[-e $f]]
```
