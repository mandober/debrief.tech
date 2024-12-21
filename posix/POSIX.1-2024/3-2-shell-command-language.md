# Shell Command Language

https://pubs.opengroup.org/onlinepubs/9799919799/utilities/contents.html

POSIX.1-2024 › 
  - 1. Base definitions
  - 2. System intefaces
  - 3. *Shell and Utilities*
    - 1. Introduction
    - 2. *Shell Command Language*
    - 3. Utilities
  - 4. Rationale

## TOC

2. Shell Command Language
  - 2.1 Shell Introduction
  - 2.2 Quoting
    - 2.2.1 Escape Character (Backslash)
    - 2.2.2 Single-Quotes
    - 2.2.3 Double-Quotes
    - 2.2.4 Dollar-Single-Quotes
  - 2.3 Token Recognition
    - 2.3.1 Alias Substitution
  - 2.4 Reserved Words
    - 2.5 Parameters and Variables
    - 2.5.1 Positional Parameters
    - 2.5.2 Special Parameters
    - 2.5.3 Shell Variables
  - 2.6 Word Expansions
    - 2.6.1 Tilde Expansion
    - 2.6.2 Parameter Expansion
    - 2.6.3 Command Substitution
    - 2.6.4 Arithmetic Expansion
    - 2.6.5 Field Splitting
    - 2.6.6 Pathname Expansion
    - 2.6.7 Quote Removal
  - 2.7 Redirection
    - 2.7.1 Redirecting Input
    - 2.7.2 Redirecting Output
    - 2.7.3 Appending Redirected Output
    - 2.7.4 Here-Document
    - 2.7.5 Duplicating an Input File Descriptor
    - 2.7.6 Duplicating an Output File Descriptor
    - 2.7.7 Open File Descriptors for Reading and Writing
  - 2.8 Exit Status and Errors
    - 2.8.1 Consequences of Shell Errors
    - 2.8.2 Exit Status for Commands
  - 2.9 Shell Commands
    - 2.9.1 Simple Commands
    - 2.9.2 Pipelines
    - 2.9.3 Lists
    - 2.9.4 Compound Commands
    - 2.9.5 Function Definition Command
  - 2.10 Shell Grammar
    - 2.10.1 Shell Grammar Lexical Conventions
    - 2.10.2 Shell Grammar Rules
  - 2.11 Job Control
  - 2.12 Signals and Error Handling
  - 2.13 Shell Execution Environment
  - 2.14 Pattern Matching Notation
    - 2.14.1 Patterns Matching a Single Character
    - 2.14.2 Patterns Matching Multiple Characters
    - 2.14.3 Patterns Used for Filename Expansion
  - 2.15 Special builtins
    - break
    - colon
    - continue
    - dot
    - eval
    - exec
    - exit
    - export
    - readonly
    - return
    - set
    - shift
    - times
    - trap
    - unset

## 2.1 Shell Introduction

The *shell* is a command language interpreter.

This chapter describes the syntax of that command language as it is used by the `sh` utility and the system() and popen() functions defined in the System Interfaces volume of POSIX.1-2024.

The shell operates according to the following general overview of operations (the specific details are included in the cited sections of this chapter):

- The shell reads its input
  - from a file
  - from the `-c` option
  - from the system() and popen() functions 
  If the first line of a file of shell commands starts with the characters `#!`, the results are unspecified.

- The shell breaks the input into tokens: words and operators
  (see 2.3 Token Recognition)

- The shell parses the input into simple commands and compound commands.
  (see 2.9.1 Simple Commands and 2.9.4 Compound Commands)

- For each word within a command, the shell processes BACKSLASH-escape sequences inside dollar-single-quotes (see 2.2.4 Dollar-Single-Quotes) and then performs various word expansions (see 2.6 Word Expansions). In the case of a simple command, the results usually include a list of pathnames and fields to be treated as a command name and arguments (see 2.9 Shell Commands).

- The shell performs redirection (see 2.7 Redirection) and removes redirection operators and their operands from the parameter list.

- The shell executes a function (see 2.9.5 Function Definition Command), built-in (see 2.15 Special Built-In Utilities ), executable file, or script, giving the names of the arguments as positional parameters numbered 1 to n, and the name of the command (or in the case of a function within a script, the name of the script) as special parameter 0 (see 2.9.1.4 Command Search and Execution).

- The shell optionally waits for the command to complete and collects the exit status (see 2.8.2 Exit Status for Commands).



## 2.2 Quoting
### 2.2.1 Escape Character (Backslash)
### 2.2.2 Single-Quotes
### 2.2.3 Double-Quotes
### 2.2.4 Dollar-Single-Quotes

## 2.3 Token Recognition

### 2.3.1 Alias Substitution



## 2.4 Reserved Words
## 2.5 Parameters and Variables
2.5.1 Positional Parameters
2.5.2 Special Parameters
2.5.3 Shell Variables
## 2.6 Word Expansions
2.6.1 Tilde Expansion
2.6.2 Parameter Expansion
2.6.3 Command Substitution
2.6.4 Arithmetic Expansion
2.6.5 Field Splitting
2.6.6 Pathname Expansion
2.6.7 Quote Removal
## 2.7 Redirection
2.7.1 Redirecting Input
2.7.2 Redirecting Output
2.7.3 Appending Redirected Output
2.7.4 Here-Document
2.7.5 Duplicating an Input File Descriptor
2.7.6 Duplicating an Output File Descriptor
2.7.7 Open File Descriptors for Reading and Writing
## 2.8 Exit Status and Errors
2.8.1 Consequences of Shell Errors
2.8.2 Exit Status for Commands
## 2.9 Shell Commands
2.9.1 Simple Commands
2.9.2 Pipelines
2.9.3 Lists
2.9.4 Compound Commands
2.9.5 Function Definition Command
## 2.10 Shell Grammar
2.10.1 Shell Grammar Lexical Conventions
2.10.2 Shell Grammar Rules
## 2.11 Job Control
## 2.12 Signals and Error Handling
## 2.13 Shell Execution Environment
## 2.14 Pattern Matching Notation
2.14.1 Patterns Matching a Single Character
2.14.2 Patterns Matching Multiple Characters
2.14.3 Patterns Used for Filename Expansion
## 2.15 Special Built-In Utilities
