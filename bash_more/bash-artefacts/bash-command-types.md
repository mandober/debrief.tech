# Command types in bash

- assignment(s)
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
