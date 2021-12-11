# Index of bash keywords

**Reserved words** or **keywords** are one of the three major classes of words in bash. The other two are builtins and metacharacters.

```bash
{    }    !    [[    ]]
case      esac        for     in
until     while       do      done
if        then        elif    else    fi
select    time     coproc     function
```

## Keywords vs Builtins

The differences between keywords and builtins:
- a builtin command must be space-separated from other words
- for a keyword, the whitespace blanks are optional
- builtins are like external commands, except thry are executed in the same env
- keywords are similar to the reserved words in PL; in bash they are used to denote conditional control flow.
- a keyword by itself doesn't make a complete command


For example, `[` is a builtin and like any other command, must be space- separated from the next token. On the other hand a keyword, the `[[` is a keyword so being space-delimited from the next token is optional.


```bash
# `[` is a builtin so it must be followed by a blank
[ -e $f ]
# this would cause an error:
[-e $f ]

# `[[` is a keyword so space is optional
[[ -e $f ]]
[[-e $f]]
# both variants work
```
