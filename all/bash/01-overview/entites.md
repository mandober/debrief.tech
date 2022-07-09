# Bash Syntax



* tokens
  * shell words
    - reserved words, keywords
    - ordinary words
      - no unquoted metacharacters
      - some have special meaning (assignment, literals) dep. on location
  * metacharacters
    - blanks
    - operators (one or more metachars)
      - control operators
      - redirection operators




* ASCII character set classification
  - Control character set 00-2f, 7f
  - Printable set
  - Punctuation character set

* Characters
  * *metacharacters*: SPC, TAB, LF, `;`, `&`, `|`, `(`, `)`, `<`, `>`
    - *blanks*:
      - SPACE, TAB
    - *operators*:
      - *control operators*:
        - 1-char control operators: LF, `;`, `&`, `|`, `(`, `)`
        - 2-char control operators: `|&`, `||`, `&&`, `;;`, `;&`
        - 3-char control operators: `;;&`
      * *redirection operators*
        - `0<&1`
        - `1>&1`
        - `1>&2`
        - stdin:  `0<` or `<`
        - stdout: `1>` or `>`
        * Redirection types
          - input
          - output
            - palyload
            - error
      * *expansion operators*
        - variable expansion operators


* Characters (more...)
  - bultins: `:`, `.`
  - keywords: `{`, `}`


* Input source
  - stdin
  - script file
  - special positional params: `-`, (bash: `-c`, `-s`)


* Names
  - identifiers
    - variable name
  - alias name
  - function name
  - builtin name
  - command
  - filename


* Namespaces
  - variable name
  - alias name
  - function name


* Types of shells
  - interactive shell
  - non-interactive shell
  - login shell
  - non-login shell
  - POSIX


* Commands
  - function
  - builtin
  - sourcable
  - executable


* Builtin Types
  - bourne builtins
  - bash builtins
  - POSIX builtins
  - Special POSIX builtins




* Internal
  - bash aliases
  - bash functions
* External
  - programs
  - scripts
  - other file system items
  e

Command types
- Simple command
- Pipeline
- List
- Compound command
