# Bash Architecture

The digest of the article by Chet Ramey 
[Bash Component Architecture](http://www.aosabook.org/en/bash.html) 

Bash processing is much like a shell pipeline: after being read from the terminal or a script, data is passed through a number of stages, transformed at each step, until the shell finally executes a command and collects its return status.

This chapter will explore bash's major components: input processing, parsing, the various word expansions and other command processing, and command execution, from the pipeline perspective. These components act as a pipeline for data read from the keyboard or from a file, turning it into an executed command.

![Bash Architecture](./bash-diagram.png)


```js
  ┌ Input
  │
  ↓
  ├ Lexical Analysis and Parsing
  │
  ↓
  ├─>─┐
  ↑   ↓
E │   Word Splitting
  │   │
X │   Brace Expansion
  │   │
P │   Tilde Expansion
  │   │
A │   Variable and Parameter Expansion
  ↑   │
N │   Arithmetic Substitution
  │   │
S │   Command Substitution
  │   │
I │   Process Substitution
  │   │
O │   Filename Generation
  ↑   ↓
N │   │
  ├─<─┘
  │
  ↓
  ├ Command execution
  │
  ↓
  └ Exit Status
```


- input
- lexical analysis and parsing
- alias expansion
- expansions
  - brace expansion
  - tilde expansion
  - variable and parameter expansion
  - (substitutions)
    - arith substitution
    - command substitution, `$(…)`
    - process substitution, `<(…)`
  - word splitting
  - filename generation
- command execution
- exit status
