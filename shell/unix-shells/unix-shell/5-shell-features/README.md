# Shell :: Shell Features

- Execution: The ability to execute programs and commands
- I/O handling: The control of program and command input and output
- Programming: The ability to execute sequences of programs and commands
- start-up files



## Shell Tasks

- command name resolution
- command name search
- command precedence


## Classification of commands

*Command namespaces*: a command with the same name may exist at the same time in all namespaces. For example, `cd` is the name of the bash builtin, 


Commands are classified into classes according to various factors. 

First, commands are split into internal and external.

Command namespaces
- variables
- functions
- keywords and builtins
- programs


*Command precedence* determines the order in which *command namespaces* are searched 

more than one command with the same name


## Shell Features

- I/O redirection
- signal handling (trap)

- interactive use
- non-interactive use, scripting support

- job control
  - background execution (`&`)
- command sequencing (`;`)
- command pipeline (`|`)

- pattern matching
- globbing

- control flow constructs
- conditional constructs

- shell variables
- environment variables

- command history
- command line editing
- completion
  - auto-completion of file names
  - auto-completion of shell variables
  - completion of fs items
  - programmable completion
- support for aliases
- support for functions
- brace expansion
- command substitution
- process substitution
- arithmetic expansion
- tilde expansion
- here-doc
- here-string
- emulation modes
- compatibility modes
- exposing shell settings


*Alias argument selectors*: aliases can take arguments which they forward to the commands they refer to. Tcsh is the only shell that provides this feature (in lieu of functions).
