# Redirection

https://www.gnu.org/software/bash/manual/html_node/Redirections.html



## Input redirection in command substitution

`$(<file)`

A redirection `< dir/file` opens the file for reading on standard input for the duration of the command that the redirection applies to. When there is no command, the file is open for reading (which leads to an error if the file doesn't exist or lacks proper permission), but other than that the redirection has no effect.

Ksh added this extension, which has been adopted by bash and ksh: if a command substitution contains an input redirection and nothing else, `$(<"dir/file")`, (no command, no other redirection, no assignment, etc.), then the command susbtitution is replaced by the content of the file.

Thus `$(<"dir/file")` is equivalent to `$(cat "dir/file")`, except that it doesn't call `cat` and the bash manual says it is faster. This would do the same thing even if `cat` wasn't in the command search path, i.e. it doesn't depend on `cat`.
