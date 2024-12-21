---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Quoting.html
page-title:       Quoting (Bash Reference Manual)
article-title:    Quoting (Bash Reference Manual)
---
# Quoting (Bash Reference Manual)

Quoting (Bash Reference Manual)
---

#### 3.1.2 Quoting

Quoting is used to remove the special meaning of certain characters or words to the shell. Quoting can be used to disable special treatment for special characters, to prevent reserved words from being recognized as such, and to prevent parameter expansion.

Each of the shell metacharacters (see [Definitions][1]) has special meaning to the shell and must be quoted if it is to represent itself. When the command history expansion facilities are being used (see [History Interaction][2]), the history expansion character, usually ‘!’, must be quoted to prevent history expansion. See [Bash History Facilities][3], for more details concerning history expansion.

There are three quoting mechanisms: the escape character, single quotes, and double quotes.

[1]: https://www.gnu.org/software/bash/manual/html_node/Definitions.html
[2]: https://www.gnu.org/software/bash/manual/html_node/History-Interaction.html
[3]: https://www.gnu.org/software/bash/manual/html_node/Bash-History-Facilities.html
