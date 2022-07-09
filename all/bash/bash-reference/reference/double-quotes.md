---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Double-Quotes.html
page-title:       Double Quotes (Bash Reference Manual)
article-title:    Double Quotes (Bash Reference Manual)
---
# Double Quotes (Bash Reference Manual)

Double Quotes (Bash Reference Manual)
---

#### 3.1.2.3 Double Quotes

Enclosing characters in double quotes (‘"’) preserves the literal value of all characters within the quotes, with the exception of ‘$’, ‘\`’, ‘\\’, and, when history expansion is enabled, ‘!’. When the shell is in POSIX mode (see [Bash POSIX Mode][1]), the ‘!’ has no special meaning within double quotes, even when history expansion is enabled. The characters ‘$’ and ‘\`’ retain their special meaning within double quotes (see [Shell Expansions][2]). The backslash retains its special meaning only when followed by one of the following characters: ‘$’, ‘\`’, ‘"’, ‘\\’, or `newline`. Within double quotes, backslashes that are followed by one of these characters are removed. Backslashes preceding characters without a special meaning are left unmodified. A double quote may be quoted within double quotes by preceding it with a backslash. If enabled, history expansion will be performed unless an ‘!’ appearing in double quotes is escaped using a backslash. The backslash preceding the ‘!’ is not removed.

The special parameters ‘\*’ and ‘@’ have special meaning when in double quotes (see [Shell Parameter Expansion][3]).

[1]: https://www.gnu.org/software/bash/manual/html_node/Bash-POSIX-Mode.html
[2]: https://www.gnu.org/software/bash/manual/html_node/Shell-Expansions.html
[3]: https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
