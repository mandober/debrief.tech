# Shell

https://en.wikipedia.org/wiki/Shell_(computing)
https://en.wikipedia.org/wiki/Command-line_interface
https://en.wikipedia.org/wiki/List_of_command-line_interpreters

In general, **shell** is a program that provides an interface to the operating system's services to the users or other programs.

Its name stems from the fact that it is the outermost layer around the OS.

Shells use either a *command-line interface* (CLI) or *graphical user interface* (GUI), depending on a computer's role and particular operation, although, more commonly, the term "shell" refers to the former.

*Human-to-computer interface* (HCI) may be realized in several different ways, but the most fundamental and oldest way is the *text mode interaction* in which the user interacts with the computer by typing out commands on the keyboard and views computer's responses on the monitor (before monitors became common, computer's responses were printed). This type of interaction is mediated by a shell which provides a command-line interface to a computer; that is, a shell exposes functionality offered by an OS through a set of commands the users can issue.

*Command-line shells* require the user to be familiar with *commands* and their calling syntax, and to understand the specific *shell language*.


*Graphical shells* that provide a GUI come with a CLI as well. In fact, a GUI is often just a presentation layer that makes interaction with the comptuer easier. For example, clicking on an icon with the mouse actually triggers the appropriate CLI command. CLI shells are used more often for advanced tasks because not all actions can be presented with a graphical interface.

*Graphical interfaces* are coprised of the so-called *widgets*, which are graphical elements meant to help accomplish an action. Different interactions can be realized using combination of elementary widgets. Examples of common widgets are buttons, drop-down menus, selection menus, text boxes, icons, info boxes (for viewing computer's output), dialog boxes (for requesting user input), and many more.

On the other hand, *command-line interface* consists of the *command line*, which is a place designated to type in commands.

The entire interaction consists of the user issuing commands (as if they were sitting at a terminal), with the computer executing those commands, and then displaying the results (monitor today, printer in the past).


## Overview

Operating systems provide various services including file management, process management (starting and stoping applications), batch processing, monitoring and configuration of the OS itself, etc.

Most (command-mode) shells are not direct interfaces to the underlying *kernel*, even if a shell communicates with the user via peripheral devices attached to the computer directly.

Shells are actually special applications that consume the kernel's API in the same way as any other application.

A shell manages the user-system interaction by prompting the user for input, interpreting the input, relying requested tasks to the OS, and then handling the output from the OS. In this way, a shell functions much like a REPL.

Since a shell is just an application, it may be easily replaced with another shell (`chsh` command chages the default shell).

## History

Early interactive systems provided a simple *command-line interpreter* that would run as a resident program. On receiving the user input, the interpreter was able to execute one of a number of predefined commands. These predefined commands included the routines for logging a user on and off the system, manipulating files, querying information about the system, manipulating running processes, viewing logs, and similar things. Importantly, there was no language - this really wasn't an interpreter at all - only if the user typed in one of the predefined commands would it be executed. There was no way to extend this system, although one of these predefined comamnds was to run a program provide by the user. So, any more engaging interaction required the user to program in advance instructions they would like to perform - there was no ad hoc aspect to the shell interaction.

In 1964, for the Multics OS, *Louis Pouzin* conceived the idea of "using commands somehow like a programming language," and coined the term *shell* to describe this.

In a 1965 document, shell was desribed as a procedure to be automatically called by the OS (supervisor) when the user types a message at the console, that was executed if there was no other process executing.

>Such procedure was to act as an interface between commands issued at the console and subroutines exposed by the OS.

Multics also introduced *active function* - the concept that later evolved into aliases and shell functions. An active function was described as a string (entered by a user) that was expanded before a command line was executed, thus enabling a kind of command-language macros.

In 1971, Ken Thompson developed the *Thompson shell* in the first version of Unix. While simpler than the Multics shell, it contained some innovative features that influenced later shells, such as the use of `<` and `>` for input and output redirection.

## Command-line shells

*Command-line shells* are essentially *command-line interpreters* that provide a *command-line interface* (CLI).

A command-line interface is an operating system shell that uses *alphanumeric characters*, typed on a keyboard, to rely instructions and data to the OS, in an interactive manner.

For example, a teletypewriter can send codes representing keystrokes to a command interpreter running on the computer. The command interpreter first parses the received sequence of keystrokes, replying with an error messages in case it cannot recognize the sequence of characters; otherwise, it carries out the requested action.

OSs like Linux can decide which shell to use from a number of choices, each comming with a similar, but enough distinctive, syntax and offering different set of (internal) capabilities. The POSIX standard defines the set of minimal features (the baseline) that all Linux shells must implement.

Unlike in the past, modern applications have a choice between implementing a command-line interface (in which case they are called *console apps*) or a graphical interface, or even both. Today, in a desktop environment, the user can click on an icon to run a particular application. Modern OSs employ multi-tasking, so the user can start more applications, all running at the same time, with users switching between them as they please.

In the past, however, when only the command-line interface was available, only one application could run at a time. A shell program was running in the console, interpreting the user's input and relying it to the OS. When the user started a particular application, it would run in the same console, replacing the shell that invoke it. In fact, the shell wasn't killed, but the shell process was suspended (*backgrounded*), waiting for the app to close, so it could became the active (*foregrounded*) process again.

For example, the `telnet` program has commands for controlling the connection to the remote system. Since such commands are made of the same keystrokes as the data being sent to the remote computer, there must be a means to distinguish between the two. An *escape sequence* can be defined using special keystrokes (keystrokes that are not forwarded but interpreted locally). Then the program becomes modal, switching between interpreting commands from the keyboard, or forwarding the keystrokes as data to be processed.

### Shell scripts

A feature of many command-line shells is the ability to save sequences of commands for re-use.

A data file can contain sequences of commands which the CLI can be made to follow as if typed in by a user.

Special features in the CLI may apply when it is carrying out these stored instructions.

Such batch files (script files) can be used repeatedly to automate routine operations such as initializing a set of programs when a system is restarted.

*Batch mode* use of shells usually involves structures, conditionals, variables, and other elements of programming languages; some have the bare essentials needed for such a purpose, others are very sophisticated programming languages in and of themselves.

Conversely, some programming languages can be used interactively from an operating system shell or in a purpose-built program.

Several command-line shells (bash, zsh, xonsh) offer *command-line completion*, enabling the interpreter to expand commands based on a few characters input by the user.

A command-line interpreter may offer a *history* function, so that the user can recall earlier commands issued to the system and repeat them, possibly with some editing.

Since all commands to the operating system had to be typed by the user, short command names and compact systems for representing program options were developed. Short names were sometimes hard for a user to recall, and early systems lacked the storage resources to provide a detailed on-line user instruction guides.

## Other uses

"Shell" is also used loosely to describe application software that is "built around" a particular component, such as web browsers and email clients, in analogy to the shells found in nature. Indeed, the (command-line) shell encapsulates the operating system kernel. These are also sometimes referred to as "wrappers".

## Unix shells

Almquist
Bash
Bourne
csh
fish
Hamilton
Korn
PowerShell
PWB
Q shell
rc
sash
tcsh
Thompson
Wish
Zsh


## Refs

https://en.wikipedia.org/wiki/Shell_(computing)
https://en.wikipedia.org/wiki/List_of_command-line_interpreters
https://en.wikipedia.org/wiki/Comparison_of_command_shells
https://en.wikipedia.org/wiki/Shell_account
https://en.wikipedia.org/wiki/Shell_builtin
https://en.wikipedia.org/wiki/Unix_shell
https://en.wikipedia.org/wiki/Human%E2%80%93computer_interaction
https://en.wikipedia.org/wiki/User_interface
https://en.wikipedia.org/wiki/Command-line_interface
