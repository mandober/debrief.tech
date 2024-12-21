# 8. Command Line Editing

https://www.gnu.org/software/bash/manual/bash.html#Command-Line-Editing

This chapter describes the basic features of the command line editing interface. Command line editing is provided by the Readline library, which is used by several different programs, including Bash.

Command line editing is enabled by default when using an interactive shell, unless the `--noediting` option is supplied at shell invocation.

Line editing is also used when using the `-e` option to the `read` builtin.

By default, the line editing commands are similar to those of Emacs. A vi-style line editing interface is also available. Line editing can be enabled at any time using the `-o emacs` or `-o vi` options to the `set` builtin, or disabled using the `+o emacs` or `+o vi` options to `set`.


## 8.3.1 Readline Init File Syntax

https://www.gnu.org/software/bash/manual/bash.html#Readline-Init-File

There are only a few basic constructs allowed in the Readline init file. Blank lines are ignored. Lines beginning with a `#` are comments. Lines beginning with a `$` indicate conditional constructs. Other lines denote variable settings and key bindings.
