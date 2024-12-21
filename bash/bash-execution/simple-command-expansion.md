# Simple Command Expansion

https://www.gnu.org/software/bash/manual/bash.html#Simple-Command-Expansion

- simple command
- expansions
- assignments
- redirections
- variable assignments
- command name and arguments


When a *simple command* is executed, the shell performs the following expansions, assignments, and redirections, from left to right, in the following order.

The words that the parser has marked as *variable assignments* (those preceding the command name) and *redirections* are saved for later processing.

The words that are not variable assignments or redirections are *expanded*.

If any words remain after expansion, the first word is taken to be a *command name* and the remaining words are the arguments.

Redirections are performed as described.

Before it is assigned to the variable name on the left, the text on the right side of the equals sign of an assignment undergoes:
- tilde expansion,      VAR=~/dir
- parameter expansion,  VAR=$HOME/dir
- command substitution, VAR="$(declare -p abc)"
- arithmetic expansion, VAR=$((3 + 5))
- quote removal,        VAR="TAB \t hex \x09 tab"

If no *command name* results, the variable assignments affect the *current shell environment*.

With such a command (one that consists only of assignment statements and redirections), *assignment statements* are performed before redirections.

Otherwise, when there is a command name, the variables are added to the environment in which the command is to be executed; thus, they do not affect the current shell environment.

If any of the assignments attempts to assign a value to a *readonly variable*, an error occurs, and the command exits with a non-zero status.

If no command name results, *redirections* are performed, but do not affect the current shell environment, i.e. they don't remain in effect. A redirection error causes the command to exit with a non-zero status.

If there is a command name left after expansion, execution proceeds as described in "Command Search and Execution". Otherwise, the command exits. 

If one of the expansions contained a command substitution, the exit status of the command is the exit status of the last command substitution performed.

If there were no command substitutions, the command exits with a status of zero.
