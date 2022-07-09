---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/What-is-a-shell_003f.html
page-title:       What is a shell? (Bash Reference Manual)
---
# About shells

A shell is usually plays two roles: it acts as a *command interpreter*, but it can also be considered a *programming language*.

## Shell as a command interpreter

The primary task of a shell is, most of theti me, to execute commands according to a user's input. However, in order to do this, a shell first needs to *interpret* that input, which is typed by a user, in form of a plain text, on the *command line*.

A shell is generally a *macro processor*, the term which means functionality where text and symbols are expanded to create larger expressions.

As a *command interpreter*, the shell provides the *user interface* to the rich set of GNU utilities.

The *programming language* features allow these utilities to be combined.

Files containing commands can be created, and become commands themselves. These new commands have the same status as system commands, allowing users or groups to establish custom environments to automate their common tasks.

Shells may be used interactively or non-interactively. In *interactive mode*, a shell accepts input typed from the keyboard. When executing in an *non-interactive mode*, shells execute commands read from a file. Operationally, these two modes are often abstracted in the form of a special entity (special datatype for input/output abstractions) called **file descriptor**. Namely, the input is abstracted as a file descriptor called `stdin` i.e. *standard input*, which covers various ways of input, whether it comes directly from a user that is typing on the keyboard, or by way of reading a file.


A shell allows execution of GNU commands, both *synchronously* and *asynchronously*. The shell waits for synchronous commands to complete before accepting more input; asynchronous commands continue to execute in parallel with the shell while it reads and executes additional commands.

The *redirection* constructs permit fine-grained control of the input and output of those commands.

Moreover, the shell allows control over the contents of commands' environments.

Shells also provide a small set of built-in commands, called *builtins*, implementing functionality impossible or inconvenient to obtain via separate utilities. For example, `cd`, `break`, `continue`, and `exec` cannot be implemented outside of the shell because they directly manipulate the shell itself. The `history`, `getopts`, `kill`, or `pwd` builtins, among others, could be implemented in separate utilities, but they are more convenient to use as builtins.

While executing commands is essential, most of the power (and complexity) of shells is due to their embedded programming languages. Like any high-level language, the shell provides variables, flow control constructs, quoting, and functions.

Shells offer features geared specifically for interactive use rather than to augment some programming language. These interactive features include *job control*, *command line editing*, *command history* and *aliases*.
