---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Bourne-Shell-Variables.html
page-title:       Bourne Shell Variables (Bash Reference Manual)
article-title:    Bourne Shell Variables (Bash Reference Manual)
---
# Bourne Shell Variables (Bash Reference Manual)

Bourne Shell Variables (Bash Reference Manual)
Bash uses certain shell variables in the same way as the Bourne shell. In some cases, Bash assigns a default value to the variable.

`CDPATH`

A colon-separated list of directories used as a search path for the `cd` builtin command.

`HOME`

The current user’s home directory; the default for the `cd` builtin command. The value of this variable is also used by tilde expansion (see [Tilde Expansion][1]).

`IFS`

A list of characters that separate fields; used when the shell splits words as part of expansion.

`MAIL`

If this parameter is set to a filename or directory name and the `MAILPATH` variable is not set, Bash informs the user of the arrival of mail in the specified file or Maildir-format directory.

`MAILPATH`

A colon-separated list of filenames which the shell periodically checks for new mail. Each list entry can specify the message that is printed when new mail arrives in the mail file by separating the filename from the message with a ‘?’. When used in the text of the message, `$_` expands to the name of the current mail file.

`OPTARG`

The value of the last option argument processed by the `getopts` builtin.

`OPTIND`

The index of the last option argument processed by the `getopts` builtin.

`PATH`

A colon-separated list of directories in which the shell looks for commands. A zero-length (null) directory name in the value of `PATH` indicates the current directory. A null directory name may appear as two adjacent colons, or as an initial or trailing colon.

`PS1`

The primary prompt string. The default value is ‘\\s-\\v\\$ ’. See [Controlling the Prompt][2], for the complete list of escape sequences that are expanded before `PS1` is displayed.

`PS2`

The secondary prompt string. The default value is ‘\> ’. `PS2` is expanded in the same way as `PS1` before being displayed.

[1]: https://www.gnu.org/software/bash/manual/html_node/Tilde-Expansion.html
[2]: https://www.gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html
