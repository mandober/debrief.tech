# Bash operation

https://www.gnu.org/software/bash/manual/bash.html#Shell-Operation

The following is a brief description of the shell's operation when it reads and executes a command. Basically, the shell does the following:

- Reads input
  - from a file
  - from a string supplied as an argument to the `-c` invocation option
  - from the user's terminal

- Breaks input
  - into words and operators, obeying the *quoting rules*
  - these tokens are separated by *metacharacters*
  - performs *alias expansion*

- Parses tokens
  - into a simple compound
  - into a compound command

- Performs expansions
  - breaking expanded tokens into lists of filenames, and commands and args

- Performs redirections
  - removes the redirection operators and their operands from arg list

- Executes the command
  - Optionally, waits for the command to complete, and
  - collects its exit status
