---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Shell-Operation.html
page-title:       Shell Operation (Bash Reference Manual)
article-title:    Shell Operation (Bash Reference Manual)
---
# Shell Operation (Bash Reference Manual)

Shell Operation (Bash Reference Manual)
---

#### 3.1.1 Shell Operation

The following is a brief description of the shell’s operation when it reads and executes a command. Basically, the shell does the following:

1.  Reads its input from a file (see [Shell Scripts][1]), from a string supplied as an argument to the \-c invocation option (see [Invoking Bash][2]), or from the user’s terminal.
2.  Breaks the input into words and operators, obeying the quoting rules described in [Quoting][3]. These tokens are separated by `metacharacters`. Alias expansion is performed by this step (see [Aliases][4]).
3.  Parses the tokens into simple and compound commands (see [Shell Commands][5]).
4.  Performs the various shell expansions (see [Shell Expansions][6]), breaking the expanded tokens into lists of filenames (see [Filename Expansion][7]) and commands and arguments.
5.  Performs any necessary redirections (see [Redirections][8]) and removes the redirection operators and their operands from the argument list.
6.  Executes the command (see [Executing Commands][9]).
7.  Optionally waits for the command to complete and collects its exit status (see [Exit Status][10]).

[1]: https://www.gnu.org/software/bash/manual/html_node/Shell-Scripts.html
[2]: https://www.gnu.org/software/bash/manual/html_node/Invoking-Bash.html
[3]: https://www.gnu.org/software/bash/manual/html_node/Quoting.html
[4]: https://www.gnu.org/software/bash/manual/html_node/Aliases.html
[5]: https://www.gnu.org/software/bash/manual/html_node/Shell-Commands.html
[6]: https://www.gnu.org/software/bash/manual/html_node/Shell-Expansions.html
[7]: https://www.gnu.org/software/bash/manual/html_node/Filename-Expansion.html
[8]: https://www.gnu.org/software/bash/manual/html_node/Redirections.html
[9]: https://www.gnu.org/software/bash/manual/html_node/Executing-Commands.html
[10]: https://www.gnu.org/software/bash/manual/html_node/Exit-Status.html
