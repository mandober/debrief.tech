# Bash :: Grammar

Based on the Bourne shell grammar.


```bnf
item           := word
                | input-output

simple-command := item
                | simple-command item

command        := simple-command
                | '(' command-list ')'
                | '{' command-list '}'
                | 'for' name 'do' command-list 'done'
                | 'for' name 'in' word… 'do' command-list 'done'
                | 'while' command-list  'do' command-list 'done'
                | 'until' command-list  'do' command-list 'done'
                | 'case' word 'in' case-part… 'esac'
                | 'if' command-list 'then' command-list else-part 'fi'

pipeline       := command
                | pipeline '|' command

andor          := pipeline
                | andor '&&' pipeline
                | andor '||' pipeline

command-list   := andor
                | command-list ';'
                | command-list '&'
                | command-list ';' andor
                | command-list '&' andor

input-output   := '>' word
                | '>>' word
                | '<' word
                | '<<' word

case-part      := pattern ')' command-list ';;'

pattern        := word
                | pattern '|' word

else-part      := 'elif' command-list 'then' command-list else-part
                | 'else' command-list
                | ε

word           := (sequence of non-blank ASCII characters)
name           := (identifier)
digit          := 0-9
```

## Bash

command
simple-command
command-list
compund-command
compund-group
pipeline



```bnf
blank          := SPACE | TAB
whitespace     := blank | VTAB | NEWLINE
metachars      := ';' | '&'
```



## Bourne shell syntax - Metacharacters and reserved words

- Syntactic
  - `|`   pipe symbol
  - `&&`  andf symbol
  - `||`  orf symbol
  - `;`   command separator
  - `;;`  case delimiter
  - `&`   background commands
  - `(…)` command grouping
  - `<`   input redirection
  - `<<`  here-doc (input from a here-doc)
  - `>`   output creation
  - `>>`  output append
- Patterns
  - `*`   matches any characters zero or more times
  - `?`   matches any single character
  - `[…]` matches any of the enclosed characters
- Substitution
  - `${…}` substitution of shell variables
  - `…`    (TICKS) substitution of command output; in bash also as `$(…)`
- Quoting
  - `\` (BACKSLASH) quotes the next character
  - `'…'` (single-quotes) quote the enclosed chars except for single-quotes
  - `"…"` (double-quotes) quote the enclosed chars except `$ TICK \ "`
    - i.e. ‹dollar-symbol, tick, backslash, double-quote› remain special
- Reserved words (13)
  - `if then else elif fi`
  - `case in esac`
  - `for while until do done`
  - bash added 7 more
    - `time`
    - `select`
    - `coproc`
    - `function`
    - `!`
    - `{ … }`
    - `[[ … ]]`
