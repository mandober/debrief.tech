# Shell :: Special characters

A **special character** is one that has a meaning beyond its literal meaning (a meta meaning).

For example, in the context of regular expressions, `+` character has meta meaning: instead of representing itself (i.e. a plus), it means the previous character set may occur one or more times. In order to use a literal plus, i.e. in order to allow this character to be interpreted as itself, we *escape it* by putting a backslash in front of it (`\+`).

Along with keywords and builtins, special characters are crucial elements of Bash syntax.
