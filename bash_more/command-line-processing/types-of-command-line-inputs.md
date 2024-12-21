# Types of command-line inputs

- command
- assignment(s)
- file creation due to redirection

Each line that the shell reads from STDIN or from a script is called a pipeline since it contains one or more commands [hmmm?] separated by zero or more pipe metacharacters.

>An assignment, i.e. a `NAME=VALUE` pair, is not considered a command.

Another way the end result of a command-line input does not amount to a command name is using redirection, `> file` as one example.

```bash
# this command line amounts to an assignment.
# the assignment is carried out in the current shell:
# first, a new variable named 'zed' is created,
# and it is immediately defined with this value.
# An assignment does not count as a command.
zed=gee

# on the other hand if the builtin
# declare/local/readonly
# is used, then it does count as a command:
declare zed=gee
```


The degenerate case of redirection also amounts to something that is not considered as a command.

```bash
> file
```

# Running code in bash

A user can run some code in the bash shell by typing out the name of the relevant command at the command line.


- bash-alias, invoking an alias
- bash-function, invoking a function
- bash-builtin
- sourced-script, sourcing a script
- executing a builtin
- executing a script
- executing a command


Commands
- sourceables
  - function
  - sourced script
- executables
  - script
