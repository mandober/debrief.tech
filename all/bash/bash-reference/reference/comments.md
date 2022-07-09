---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Comments.html
page-title:       Comments (Bash Reference Manual)
article-title:    Comments (Bash Reference Manual)
---
# Comments (Bash Reference Manual)

Comments (Bash Reference Manual)
---

#### 3.1.3 Comments

In a non-interactive shell, or an interactive shell in which the `interactive_comments` option to the `shopt` builtin is enabled (see [The Shopt Builtin][1]), a word beginning with ‘#’ causes that word and all remaining characters on that line to be ignored. An interactive shell without the `interactive_comments` option enabled does not allow comments. The `interactive_comments` option is on by default in interactive shells. See [Interactive Shells][2], for a description of what makes a shell interactive.

[1]: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
[2]: https://www.gnu.org/software/bash/manual/html_node/Interactive-Shells.html
