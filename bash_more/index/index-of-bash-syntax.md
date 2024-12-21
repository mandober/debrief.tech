# Index :: Bash Syntax

- Elements of bash syntax
  - space character
  - whitespace characters
  - blank characters
  - metacharacters
  - word-breaking characters
  - operators
  - quoting characters
  - escape characters
  - ASCII character
  - string, sequence of characters
  - shell word
  - word
  - name
    - identifier
    - variable name
    - keyword name
    - builtin name
    - function name
    - alias name
    - program name


- Blank
  - SPACE
  - TAB
- Whitespace
  - SPACE
  - TAB
  - VTAB
- Metacharacters
  - operators: `( ) & ; | > <`
  - whitespace: `SPACE`, `TAB`, `NL`
- Assignment statements
  - `NAME=VALUE`
- Control operators
  - command terminators: `NL`, `;`, `&`
  - logical command connectors: `||`, `&&`
  - pipes: `|`, `|&`
  - subshell: `(`, `)`
  - case constructs: `;;`, `;&`, `;;&`
- operator (contains at least one unquoted metacharacter)
  - control operators
  - redirection operators
- Redirection operators
  - `>&-`
  - `<&-`
  - input
    - stdin: `<` i.e. `<0`
    - here-doc: `<<`
    - here-string: `<<<`
  - output
    - stdin: `>` i.e. `1>`
    - override noclobber: `>|` i.e. `1>|`
    - append: `>>`

- QUOTING
  - 3 quoting mechanisms:
    - the escape character, BACKSLASH (`\`)
    - single-quotes, `'…'`
      - single-quotes cannotappear within single-quotes
    - double-quotes, `"…"`
      - preserve literal value, except for
      - except: `$`, `\`, `BACKTICK`, `!` (if history expansion ON)
    - dollar-double-quotes, `$"…"`, for locale-specific translation
  - ANSI-C Quoting
    - dollar-single-quotes, `$'…'`
    - expanded result is single-quoted as if the dollar was not present
    - backslash-escaped characters in `…` are replaced as follows:
      - `\a` BELL
      - `\b` BS
      - `\c` supresses further output
      - `\e` ESC, or `\E`
      - `\f` FF
      - `\n` LF, NL
      - `\r` CR
      - `\t` TAB
      - `\v` VTAB
      - `\\` backslash
      - `\'` single-quote
      - `\"` double-quote
      - `\?` question-mark
      - `\nnn` 8-bit char whose value is octal nnn (1-3 octal digits)
      - `\xHH` 8-bit char whose value is hex HH (1-2 hex digits)
      - `\uHHHH` Unicode char whose value is hex HHHH (1-4 hex digits)
      - `\UHHHHHHHH` Unicode char whose value is hex HHHH (1-8 hex digits)
      - `\cx` a control-x character (?); but `\c` supresses further output?!


    - hex-notation, \x1b
    - octal-notation, \033
    - unicode-escapes-4, \u1a0f
    - unicode-escapes-6, \u1f3a4c
    - caret-escapes, ^@


- Globs
  - `*`   zero-or-more-chars
  - `?`   one-char
  - `[…]` char-class

- Extended regex
  - `@` 
  - `+` 
  - `*` 
- commands
  - assignment
  - Simple command
    - [NAME=VALUE]… command [arg]… [redirections]
    - sole command name: ascii
    - command and args: ascii -b Z
    - assignments preceding a command: HOME=$PWD USER=joe printenv
    - command with redirections: IFS= read -r < file.text
  - Compound command
  - pipeline
  - list
  - expression
- token (sequence of characters considered a single unit by the shell)
  - word
  - operator
- word
  - sequence of characters treated as a unit by the shell
  - words may not include unquoted metacharacters
- shell vocab
  - commands
  - control structures
  - shell functions
  - shell parameters
  - shell expansions
  - redirections


## BNF grammar

```
blank     := SPACE | TAB
wsp       := blank | NL

metachars := wsp
           | ( | )
           | & | ;
           | ¦ | > | <

name      := [a-zA-Z_][a-zA-Z0-9_]

fname     := name | pretty-much-anything

function  := fname () {…}
           | fname () (…)
           | [function] fname[ ][()] [{…} | (…)]

if-const  := if C1; then E1; fi
           | if C1; then E1; else ED; fi
           | if C1; then E1; elif C2; then E2; else ED; fi
           | if C1; then E1; [elif C2; then E2;] [else ED;] fi

builtins  := .
           | :
           | [ | […]

keywords  := !
           | {  | }  | {…}
           | [[ | ]] | [[…]]
           | (( | )) | ((…))

quotes    := single-quote
           | double-quote
           | dollar-single-quote
           | dollar-double-quote

escape    := BS
           | quotes

c-escapes := \a | \b | \c | \e | \f | \n | \r | \t | \v
           | \xFF
           | \uUUUU
           | \uUUUUUU

comment   := #




simple-command: [NAME=VAL]… simple_command [arg]… [red]…
redir := red-op fd
fd     | &
std-fds := 0 | 1 | 2
stdin := 0 | stdin | fd0 | /dev/stdin | /dev/fd0
```


## Redirection examples

```
2>filename
2>&1
2>&-
&>/dev/null
```
