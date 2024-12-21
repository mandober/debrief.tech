---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Simple-Commands.html
page-title:       Simple Commands (Bash Reference Manual)
article-title:    Simple Commands (Bash Reference Manual)
---
# Simple Commands (Bash Reference Manual)

Simple Commands (Bash Reference Manual)
---

#### 3.2.2 Simple Commands

A simple command is the kind of command encountered most often. It’s just a sequence of words separated by `blank`s, terminated by one of the shell’s control operators (see [Definitions][1]). The first word generally specifies a command to be executed, with the rest of the words being that command’s arguments.

The return status (see [Exit Status][2]) of a simple command is its exit status as provided by the POSIX 1003.1 `waitpid` function, or 128+n if the command was terminated by signal n.

[1]: https://www.gnu.org/software/bash/manual/html_node/Definitions.html
[2]: https://www.gnu.org/software/bash/manual/html_node/Exit-Status.html
