# Shell language

## Shell words
In the shell, unquoted words, containing no special characters, are treated as strings. These are called shell words, barewords or just words. This is one of
the distinguishing syntactical features when considering the shell as a programming language; in constrast, most PLs require strings to be enclosed in quotes, while bare words are used as keywords or as the names of language entities (variables, functions, data structures, etc.).

## Names
Names are shell words used as identifiers for variables. Names of shell variables are subject to the same constraints as vars in most PLs.

Bash manual says that names are variable or function identifiers, but in reality function names are not subject to the same constraints. Bash allows functions to have some really strange names like `3`.

## Namespaces
Shell entities may be divided into several namespaces: special characters and tokens, aliases, keywords, functions, builtins, programs.

## Commands
Commands are divided into internal and external commands. *Internal commands* are, by default, executed in the current shell environment. Aliases, functions, keywords and builtins are internal commands. *External commands* are programs found by searching the `PATH`. They are executed in a child process (subshell).

## Execution of commands
The crucial difference between the two kinds of commands is that external commands cannot affect the current shell environment.

To execute an external command, Bash forks to create a child process to which it delegates the execution of the program. The main bash process waits for the child process to finish, collects its exit code, and disposes of the child process.
