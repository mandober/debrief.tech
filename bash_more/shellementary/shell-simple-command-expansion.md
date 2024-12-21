# Simple command expansion

https://www.gnu.org/software/bash/manual/bash.html#Simple-Command-Expansion

When a simple command is executed, the shell performs the following expansions, assignments, and redirections, from left to right, in the following order.

The words that the parser has marked as *variable assignments* (those preceding the command name) and *redirections* are saved for later processing.

The words that are not variable assignments or redirections are *expanded*. If any words remain after expansion, the first word is taken to be the name of the command and the remaining words are the arguments.

Redirections are performed.

Before being assigned to the variable, the text after the '=' in each variable assignment undergoes:
- tilde expansion
- parameter expansion
- command substitution
- arithmetic expansion
- quote removal

If no command name results, the variable assignments affect the current shell environment.

In the case of such a command (one that consists only of assignment statements and redirections), assignment statements are performed before redirections.

Otherwise, the variables are added to the environment of the executed command and do not affect the current shell environment.

If any of the assignments attempts to assign a value to a readonly variable, an error occurs, and the command exits with a non-zero status.

If no command name results, redirections are performed, but do not affect the current shell environment.

A redirection error causes the command to exit with a non-zero status.


If there is a command name left after expansion, execution proceeds as described below. Otherwise, the command exits.

If one of the expansions contained a *command substitution*, the exit status of the command is the exit status of the last command substitution performed.

If there were no command substitutions, the command exits with a status of zero.
