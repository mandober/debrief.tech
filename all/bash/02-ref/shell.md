# Shell

Shells are primarily *command interpreters* that provide a *text mode* interface through which people can interact with a computer. The shell accepts and translats user's commands, relaying them to the OS.



The large standalone physical *teletypes* (tty), i.e., *terminals* and *consoles*, have been absorbed by modern computers, where they now exist as *terminal emulators* and run just like any other software. Unfortunately, while the majority of software kept evolving en par with the advances in computer technology, programs closely related to terminals, along with terminal emulators themselves have stagnated, choosing to stay married to the ancient past. It's been said, as if it is a good thing, that precisely due to this conversatism, code written today can still run on a quinquagenarian.

The other major part of a shell is the embedded rudamentary programming language, aimed to ease the non-interactive use, such a scripting.




The programming language features allow these utilities to be combined.

Files containing commands can be created, and become commands themselves.

These new commands have the same status as system commands in directories such as /bin, allowing users or groups to establish custom environments to automate their common tasks.

Shells may be used interactively or non-interactively. In interactive mode, they accept input typed from the keyboard. When executing non-interactively, shells execute commands read from a file.

A shell allows execution of GNU commands, both synchronously and asynchronously. The shell waits for synchronous commands to complete before accepting more input; asynchronous commands continue to execute in parallel with the shell while it reads and executes additional commands. The redirection constructs permit fine-grained control of the input and output of those commands. Moreover, the shell allows control over the contents of commands’ environments.

Shells also provide a small set of built-in commands (builtins) implementing functionality impossible or inconvenient to obtain via separate utilities. For example, cd, break, continue, and exec cannot be implemented outside of the shell because they directly manipulate the shell itself. The history, getopts, kill, or pwd builtins, among others, could be implemented in separate utilities, but they are more convenient to use as builtin commands. All of the shell builtins are described in subsequent sections.

While executing commands is essential, most of the power (and complexity) of shells is due to their embedded programming languages. Like any high-level language, the shell provides variables, flow control constructs, quoting, and functions.

Shells offer features geared specifically for interactive use rather than to augment the programming language. These interactive features include job control, command line editing, command history and aliases. Each of these features is described in this manual.
