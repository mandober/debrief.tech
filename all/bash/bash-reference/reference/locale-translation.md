---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Locale-Translation.html
page-title:       Locale Translation (Bash Reference Manual)
article-title:    Locale Translation (Bash Reference Manual)
---
# Locale Translation (Bash Reference Manual)

Locale Translation (Bash Reference Manual)
---

#### 3.1.2.5 Locale-Specific Translation

A double-quoted string preceded by a dollar sign (‘$’) will cause the string to be translated according to the current locale. The gettext infrastructure performs the message catalog lookup and translation, using the `LC_MESSAGES` and `TEXTDOMAIN` shell variables, as explained below. See the gettext documentation for additional details. If the current locale is `C` or `POSIX`, or if there are no translations available, the dollar sign is ignored. If the string is translated and replaced, the replacement is double-quoted.

Some systems use the message catalog selected by the `LC_MESSAGES` shell variable. Others create the name of the message catalog from the value of the `TEXTDOMAIN` shell variable, possibly adding a suffix of ‘.mo’. If you use the `TEXTDOMAIN` variable, you may need to set the `TEXTDOMAINDIR` variable to the location of the message catalog files. Still others use both variables in this fashion: `TEXTDOMAINDIR`/`LC_MESSAGES`/LC\_MESSAGES/`TEXTDOMAIN`.mo.
