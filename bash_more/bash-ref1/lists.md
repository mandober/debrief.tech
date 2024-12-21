---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Lists.html
page-title:       Lists (Bash Reference Manual)
article-title:    Lists (Bash Reference Manual)
---
# Lists (Bash Reference Manual)

Lists (Bash Reference Manual)
---

#### 3.2.4 Lists of Commands

A `list` is a sequence of one or more pipelines separated by one of the operators ‘;’, ‘&’, ‘&&’, or ‘||’, and optionally terminated by one of ‘;’, ‘&’, or a `newline`.

Of these list operators, ‘&&’ and ‘||’ have equal precedence, followed by ‘;’ and ‘&’, which have equal precedence.

A sequence of one or more newlines may appear in a `list` to delimit commands, equivalent to a semicolon.

If a command is terminated by the control operator ‘&’, the shell executes the command asynchronously in a subshell. This is known as executing the command in the background, and these are referred to as asynchronous commands. The shell does not wait for the command to finish, and the return status is 0 (true). When job control is not active (see [Job Control][1]), the standard input for asynchronous commands, in the absence of any explicit redirections, is redirected from `/dev/null`.

Commands separated by a ‘;’ are executed sequentially; the shell waits for each command to terminate in turn. The return status is the exit status of the last command executed.

AND and OR lists are sequences of one or more pipelines separated by the control operators ‘&&’ and ‘||’, respectively. AND and OR lists are executed with left associativity.

An AND list has the form

command2 is executed if, and only if, command1 returns an exit status of zero (success).

An OR list has the form

command2 is executed if, and only if, command1 returns a non-zero exit status.

The return status of AND and OR lists is the exit status of the last command executed in the list.

---

[1]: https://www.gnu.org/software/bash/manual/html_node/Job-Control.html
