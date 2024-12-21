# Index :: Bash Command Types

## Simple command
A simple command consists of a command name and an optional list of arguments and redirections. A simple command may optionally be prefixed by a list of assignment statements to cause those variables to exist only in the context of the command; this is true whether a simple command is a builtin or external executable.

## Assignments
A simple command may be prefixed by a list of assignment statements which cause those variables to exist only in the context of that command. However, assignment statements may also appear alone on the command line, in which case those variables are added to the context of the current shell. A standalone assignment statement is not considered a command - thus, it lacks exit status among other things that commands have.








## Terms

- assignments
- simple commands
  - simple command
  - command with arguments (options)
  - simple command without redirections
  - assignments preceding a command
- compound command
  - looping constructs
  - conditional constructs
  - grouping commands
- pipeline
- expression
- grouping commands
  - function, `NAME () { … } 2> {n}`
  - command group, `{ … }`
  - command subshell, `(…)`
  - pipeline, `{ c1 | c2 | (c3 && c4) 2> {n} | c5 | c6 && c7 } &> {m}`
- command sequence
- command list
- command group, `{ … }` (spacing necessary)
  - `{` is a shell keyword, `}` is a shell keyword
- subshell, `(…)` (spacing not necessary)
- brackets
  - single brackets, `[ … ]` (spacing necessary)
    - `[`  is a shell builtin
    - `[[` is a shell keyword, `]]` is a shell keyword
  - double brackets, `[[ … ]]` (spacing necessary)
- operator precedence

Compound commands
- loops
  - unbounded loops
  - bounded loops
- iteration, looping over a list
  - delineated by `do` and `done` keywords
  - `while` and `until`, `select`, `for`, 
  - C-style for loop
    for (( EXP1 ; EXP2 ; EXP3 )); do LIST; done
    for (( j=1; j < 10; j++ )); do echo $j; done
  - bounded for-loop
    - for NAME in NAMES; do … done
    - for NAME in WORDS; do LIST; done
    - `for for in for; do echo for; done` will print "for"
    - `for for in for for; do echo $for; done` prints "for\nfor"
- conditionals: execute list only if a condition is met; `if`, `case`, `for`
- command groups
  - grouped commands sharing external redirections and exit code
  - exit code is that of the last command in the group
  - subshell, `(list)`
  - command group, `{ list; }`
