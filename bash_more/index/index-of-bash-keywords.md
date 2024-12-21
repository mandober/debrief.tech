# Index :: Bash Keywords

## Bash keywords

- {
- }
- !
- [[
- ]]
- if
- then
- else
- elif
- fi
- case
- esac
- for
- select
- while
- until
- do
- done
- in
- function
- time
- coproc

## Grouped bash keywords

- !
- { … }
- [[ … ]]
- if … then … else … elif … fi
- case … esac
- for … in
- select … in
- while/until … do … done
- function
- time
- coproc


## Generating a list of bash keywords

```bash
# compgen [-abcdefgjksuv]

compgen -a # list of aliases
compgen -b # list of bash builtins
compgen -c # list of commands (aliases, functions, keywords, builtins, binaries)
compgen -k # list of bash keywords
compgen -u # list of users
compgen -g # list of groups
```

## Reserved words

Reserved words are shell words that have special meaning to the shell. 
They are used to begin and end the shell's compound commands.

These names,
- when unquoted
- when they are the first word (head-word) of an input line 
are recognized as reserved-words
- !
- `{` … `}`
- `[[` … `]]`
- time
- coproc
- function
- if then elif else fi
- for … in
- case … esac
- while, until, select, do … done

- `in` is recognized as a reserved word if
   it is the 3rd word of a *case* or *select* command

- `in` and `do` are recognized as reserved words if
   they are the 3rd word in a *for* command.


```bash
if COND; then
  …
elif
  …
else
  …
fi
```

## Index of Shell Reserved Words

- !         Pipelines
- time      Pipelines
- function  Shell Procedures
- coproc    Shell Procedures
- {         Command Grouping          Opening keyword
- }         Command Grouping          Closing keyword
- do        Looping Constructs        Opening keyword
- done      Looping Constructs        Closing keyword
- until     Looping Constructs
- while     Looping Constructs
- for       Looping Constructs
- in        Conditional Constructs
- select    Conditional Constructs
- [[        Conditional Constructs    Opening keyword
- ]]        Conditional Constructs    Closing keyword
- case      Conditional Constructs    Opening keyword
- esac      Conditional Constructs    Closing keyword
- if        Conditional Constructs    Opening keyword
- then      Conditional Constructs
- else      Conditional Constructs
- elif      Conditional Constructs
- fi        Conditional Constructs    Closing keyword
