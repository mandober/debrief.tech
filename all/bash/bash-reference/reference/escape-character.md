---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Escape-Character.html
page-title:       Escape Character (Bash Reference Manual)
article-title:    Escape Character (Bash Reference Manual)
---
# Escape Character (Bash Reference Manual)

Escape Character (Bash Reference Manual)
Next: [Single Quotes][1], Up: [Quoting][2]   \[[Contents][3]\]\[[Index][4]\]

A non-quoted backslash ‘\\’ is the Bash escape character. It preserves the literal value of the next character that follows, with the exception of `newline`. If a `\newline` pair appears, and the backslash itself is not quoted, the `\newline` is treated as a line continuation (that is, it is removed from the input stream and effectively ignored).

[1]: https://www.gnu.org/software/bash/manual/html_node/Single-Quotes.html
[2]: https://www.gnu.org/software/bash/manual/html_node/Quoting.html
[3]: https://www.gnu.org/software/bash/manual/html_node/index.html#SEC_Contents "Table of contents"
[4]: https://www.gnu.org/software/bash/manual/html_node/Indexes.html "Index"
