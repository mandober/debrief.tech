# Shell :: Glossary

<!-- TOC -->

- [ASCII character](#ascii-character)
- [ASCII table 4x8x4](#ascii-table-4x8x4)
- [ASCII table 4x16x2](#ascii-table-4x16x2)
- [ASCII table 8x16](#ascii-table-8x16)
- [Almquist shell](#almquist-shell)
- [Assignment](#assignment)
- [Bash](#bash)
- [Bourne shell](#bourne-shell)
- [Background process](#background-process)
- [Bash handler](#bash-handler)
- [Blank](#blank)
- [Builtin](#builtin)
- [C shell](#c-shell)
- [Command line](#command-line)
- [Command-line interface](#command-line-interface)
- [Command name lookup](#command-name-lookup)
- [Control operator](#control-operator)
- [Environment variable](#environment-variable)
- [Extended attributes](#extended-attributes)
- [Group](#group)
- [Binding](#binding)
- [Exit status](#exit-status)
- [Field](#field)
- [File descriptor](#file-descriptor)
- [Filename](#filename)
- [fish](#fish)
- [Foreground](#foreground)
- [Job](#job)
- [Job control](#job-control)
- [Keyword](#keyword)
- [Keystroke stacking](#keystroke-stacking)
- [KornShell](#kornshell)
- [Metacharacter](#metacharacter)
- [Name](#name)
- [Nomenclature](#nomenclature)
- [Non-option](#non-option)
- [Observability](#observability)
- [Short option](#short-option)
- [Option](#option)
- [Operator](#operator)
- [Ontology](#ontology)
- [Permission](#permission)
- [Pipeline](#pipeline)
- [POSIX](#posix)
- [Process group](#process-group)
- [Process group identification](#process-group-identification)
- [rc](#rc)
- [Redirection](#redirection)
- [Redirection operators](#redirection-operators)
- [Reserved word](#reserved-word)
- [Return status](#return-status)
- [Shell](#shell)
- [Shell word](#shell-word)
- [Simple command](#simple-command)
- [Special characters](#special-characters)
- [Standard file descriptors](#standard-file-descriptors)
- [Shell execution context](#shell-execution-context)
- [stdin](#stdin)
- [stdout](#stdout)
- [stderr](#stderr)
- [Signal](#signal)
- [Synchronous command execution](#synchronous-command-execution)
- [Return code](#return-code)
- [Exit status](#exit-status-1)
- [Last exit status](#last-exit-status)
- [Special POSIX builtins](#special-posix-builtins)
- [Shell variable](#shell-variable)
- [Subshell](#subshell)
- [Standard stream](#standard-stream)
- [Tilde](#tilde)
- [Token](#token)
- [Variable](#variable)
- [Variable expansion operator](#variable-expansion-operator)
- [zsh](#zsh)

<!-- /TOC -->

## ASCII character
An ASCII character may be specified
- literally, if printable
- control characters (0x00-0x1f)
  - whitespace chars as C-backslash-escape
    - NUL, 0x00,` \0`, `^@`, null
    - BEL, 0x07,` \a`, `^G`, alert
    - BS,  0x08,` \b`, `^H`, backspace
    - HT,  0x09,` \t`, `^I`, horizontal tab
    - LF,  0x0a,` \n`, `^J`, line feed
    - VT,  0x0b,` \v`, `^K`, vertical tab
    - FF,  0x0c,` \f`, `^L`, form feed
    - CR,  0x0d,` \r`, `^M`, carriage return
    - ESC, 0x1b,` \e`, `^[`, escape


ASCII char names
- proper UNICODE name
- English name, slang name

ASCII char notation
- C backslash-escape (`\-escape`)
- caret-escape (`^-escape`)
- ASCII mnemonic
- numeric code
  - binary number,  0COLxxxx
  - octal number,   0o70
  - decimal number, 0-127
                      row    row
                       ↓      ↓
  - hex number,     0x00 - 0x7f
                      ↑      ↑
                     col    col

## ASCII table 4x8x4

```
col:    0          2        4         6
0     0 NUL     32       64 @      96 `  ^@                 ^`
1     1 SOH     33 !     65 A      97 a                     ^!
2     2 STX     34 "     66 B      98 b                     ^"
3     3 ETX     35 #     67 C      99 c  ^C for SIGINT      ^#
4     4 EOT     36 $     68 D     100 d  ^D for EOF         ^$
5     5 ENQ     37 %     69 E     101 e                     ^%
6     6 ACK     38 &     70 F     102 f                     ^&
7     7 BEL     39 '     71 G     103 g  ^G                 ^'
8     8 BS      40 (     72 H     104 h                     ^(
9     9 HT      41 )     73 I     105 i  ^I is TAB          ^)
A    10 LF      42 *     74 J     106 j  ^J is RET (as LF)  ^*
B    11 VT      43 +     75 K     107 k  ^K is VT           ^+
C    12 FF      44 ,     76 L     108 l  ^L is FF           ^,
D    13 CR      45 -     77 M     109 m  ^M is RET (as CR)  ^-
E    14 SO      46 .     78 N     110 n                     ^.
F    15 SI      47 /     79 O     111 o                     ^/

col:    1          3        5         7
0    16 DLE     48 0     80 P     112 p   0000
1    17 DC1     49 1     81 Q     113 q   0001 ^Q is resume (xon) 
2    18 DC2     50 2     82 R     114 r   0010
3    19 DC3     51 3     83 S     115 s   0011 ^S is stop (xoff)
4    20 DC4     52 4     84 T     116 t   0100
5    21 NAK     53 5     85 U     117 u   0101
6    22 SYN     54 6     86 V     118 v   0110 ^V for lnext
7    23 ETB     55 7     87 W     119 w   0111
8    24 CAN     56 8     88 X     120 x   1000
9    25 EM      57 9     89 Y     121 y   1001
A    26 SUB     58 :     90 Z     122 z   1010  ^Z is SIGTSTP ^:
B    27 ESC     59 ;     91 [     123 {   1011  ^[ is ESC      ^{ ^;
C    28 FS      60 <     92 \     124 |   1100  ^\ is SIGQUIT, ^| ^<
D    29 GS      61 =     93 ]     125 }   1101  ^=  ^]  ^}
E    30 RS      62 >     94 ^     126 ~   1110  ^^  ^>  ^~
F    31 US      63 ?     95 _     127 DEL 1111  ^?  ^_
```

`^I` or `^i` both signify TAB since the bit 


⁷ ⁶⁵⁴ ³²¹⁰ ordinal
0 000 1001

- bit₇ is unused, always set to 0
- bit₆ is 
- bit₅ is 
- bit₄ is 


## ASCII table 4x16x2

```
                              ctrl-bit⁷      shift-bit⁶
                              ↓              ↓
00∙00000 NUL    01∙00000      10∙00000 @    11∙00000 `
00∙00001 SOH    01∙00001 !    10∙00001 A    11∙00001 a
00∙00010 STX    01∙00010 "    10∙00010 B    11∙00010 b
00∙00011 ETX    01∙00011 #    10∙00011 C    11∙00011 c
00∙00100 EOT    01∙00100 $    10∙00100 D    11∙00100 d
00∙00101 ENQ    01∙00101 %    10∙00101 E    11∙00101 e
00∙00110 ACK    01∙00110 &    10∙00110 F    11∙00110 f
00∙00111 BEL    01∙00111 '    10∙00111 G    11∙00111 g
00∙01000 BS     01∙01000 (    10∙01000 H    11∙01000 h
00∙01001 HT     01∙01001 )    10∙01001 I    11∙01001 i
00∙01010 LF     01∙01010 *    10∙01010 J    11∙01010 j
00∙01011 VT     01∙01011 +    10∙01011 K    11∙01011 k
00∙01100 FF     01∙01100 ,    10∙01100 L    11∙01100 l
00∙01101 CR     01∙01101 -    10∙01101 M    11∙01101 m
00∙01110 SO     01∙01110 .    10∙01110 N    11∙01110 n
00∙01111 SI     01∙01111 /    10∙01111 O    11∙01111 o
00∙10000 DLE    01∙10000 0    10∙10000 P    11∙10000 p
00∙10001 DC1    01∙10001 1    10∙10001 Q    11∙10001 q
00∙10010 DC2    01∙10010 2    10∙10010 R    11∙10010 r
00∙10011 DC3    01∙10011 3    10∙10011 S    11∙10011 s
00∙10100 DC4    01∙10100 4    10∙10100 T    11∙10100 t
00∙10101 NAK    01∙10101 5    10∙10101 U    11∙10101 u
00∙10110 SYN    01∙10110 6    10∙10110 V    11∙10110 v
00∙10111 ETB    01∙10111 7    10∙10111 W    11∙10111 w
00∙11000 CAN    01∙11000 8    10∙11000 X    11∙11000 x
00∙11001 EM     01∙11001 9    10∙11001 Y    11∙11001 y
00∙11010 SUB    01∙11010 :    10∙11010 Z    11∙11010 z
00∙11011 ESC    01∙11011 ;    10∙11011 [    11∙11011 {
00∙11100 FS     01∙11100 <    10∙11100 \    11∙11100 |
00∙11101 GS     01∙11101 =    10∙11101 ]    11∙11101 }
00∙11110 RS     01∙11110 >    10∙11110 ^    11∙11110 ~
00∙11111 US     01∙11111 ?    10∙11111 _    11∙11111 DEL
```



## ASCII table 8x16

```
 0 00 NUL  16 10 DLE  32 20    48 30 0  64 40 @  80 50 P   96 60 `  112 70 p
 1 01 SOH  17 11 DC1  33 21 !  49 31 1  65 41 A  81 51 Q   97 61 a  113 71 q
 2 02 STX  18 12 DC2  34 22 "  50 32 2  66 42 B  82 52 R   98 62 b  114 72 r
 3 03 ETX  19 13 DC3  35 23 #  51 33 3  67 43 C  83 53 S   99 63 c  115 73 s
 4 04 EOT  20 14 DC4  36 24 $  52 34 4  68 44 D  84 54 T  100 64 d  116 74 t
 5 05 ENQ  21 15 NAK  37 25 %  53 35 5  69 45 E  85 55 U  101 65 e  117 75 u
 6 06 ACK  22 16 SYN  38 26 &  54 36 6  70 46 F  86 56 V  102 66 f  118 76 v
 7 07 BEL  23 17 ETB  39 27 '  55 37 7  71 47 G  87 57 W  103 67 g  119 77 w
 8 08 BS   24 18 CAN  40 28 (  56 38 8  72 48 H  88 58 X  104 68 h  120 78 x
 9 09 HT   25 19 EM   41 29 )  57 39 9  73 49 I  89 59 Y  105 69 i  121 79 y
10 0A LF   26 1A SUB  42 2A *  58 3A :  74 4A J  90 5A Z  106 6A j  122 7A z
11 0B VT   27 1B ESC  43 2B +  59 3B ;  75 4B K  91 5B [  107 6B k  123 7B {
12 0C FF   28 1C FS   44 2C ,  60 3C <  76 4C L  92 5C \  108 6C l  124 7C |
13 0D CR   29 1D GS   45 2D -  61 3D =  77 4D M  93 5D ]  109 6D m  125 7D }
14 0E SO   30 1E RS   46 2E .  62 3E >  78 4E N  94 5E ^  110 6E n  126 7E ~
15 0F SI   31 1F US   47 2F /  63 3F ?  79 4F O  95 5F _  111 6F o  127 7F DEL
```

Organizes 128 ASCII characters into 8 columns (labelled 0-7) by 16 rows (labelled 0-f) - hex numbering is the default. An ASCII character is a 7-bit encoding so the msb is always set to 0. Any ASCII char expressed as a binary number has the form `colxxxx`, where `col` signifies its *column*:
- 000 control codes part 1 (16)
- 001 control codes part 2 (16)
- 010 punctuation sumbols 
- 011 numbers, more punct
- 100 capital letters
- 101 capital letters, more punct
- 110 small letters
- 111 small letters, more punct


```
       0   1   2   3   4   5   6   7   8    9    a    b    c    d    e    f
  c/r  000 001 010 011 100 101 110 111 1000 1001 1010 1011 1100 1101 1110 1111
0 000  NUL SOH STX ETX EOT ENQ ACK BEL BS   HT   LF   VT   FF   CR   SO   SI
1 001  DLE DC1 DC2 DC3 DC4 NAK SYN ETB CAN  EM   SUB  ESC  FS   GS   RS   US
2 010  SPC !   "   #   $   %   &   '   (    )    *    +    ,    -    .    /
3 011  0   1   2   3   4   5   6   7   8    9    :    ;    <    =    >    ?
4 100  @   A   B   C   D   E   F   G   H    I    J    K    L    M    N    O
5 101  P   Q   R   S   T   U   V   W   X    Y    Z    [    \    ]    ^    _
6 110  `   a   b   c   d   e   f   g   h    i    j    k    l    m    n    o
7 111  p   q   r   s   t   u   v   w   x    y    z    {    |    }    ~    DEL
```

First column then row.



## Almquist shell
The Almquist shell (aka "A Shell", `ash`, and sometimes even `sh`) is a lightweight Unix shell originally written by Kenneth Almquist in the late 1980s. Initially a clone of the System V4 variant of the Bourne shell, it replaced the original Bourne shell in the BSD versions of Unix released in the early 1990s.

## Assignment
A simple command may optionally be prefixed by a list of assignment statements which cause those variables to exist only in the context of that command. However, assignment statements may also appear alone on the command line, in which case those variables are added to the context of the current shell. A standalone assignment statements are not considered commands - thus, they lack exit status and other things pertaining to commands.

## Bash
Bash is a direct descendent of the Bourne shell. The name "Bash" is an acronym of "Bourne-Again SHell", itself a pun on the Bourne shell created in the 1970's by Stephen Bourne. Bash was initially developed by Brain Fox, and the first release was in 1989. Bash is largely compatible with the Bourne shell, and bash the language could be considered a superset of sh.

## Bourne shell
The Bourne shell (sh) was created by Stephen Bourne at the Bell labs in 1970's. The first release was in 1979, appearing in the Seventh Edition Bell Labs Research version of Unix. The Bourne shell is still used today as a default shell on some systems. The Bourne shell may be considered a subset of bash. In fact, the "shell and utilities" part of the POSIX standard is based on the Bourne shell. The language of the Bourne shell is used when authoring shell scripts that prioritize portability across Unix-like operating systems.

## Background process
By default, processes run in the foreground, with their standard file descriptors connected to the terminal: stdin receives keyboard input, while stdout/err are sent to the screen.

However, programs may also run in the background, in which case its stdin is redirected to /dev/null (in the Bourne shell, at least)

To execute an external command, the shell normally creates a new process and waits for it to finish; both of these operations have the corresponding system calls. A command may be run without waiting for it to finish using the postfix operator `&`. For example, `print file &` calls the `print` command with argument `file` and runs it in the background. The `&` is a metacharacter interpreted by the shell and it is not passed as an argument to `print`.



Its FDs are disconnected from the tty, so it cannot interact with the user. 

To execute a program in the background append the `&` char to its name on the command line. To send an already running process to the background, first suspend it (Ctrl + Z), then allow it to run in the background with `bg`.

By default, a started program runs as a foreground process. Its three standard file descriptors are connected to the current tty; it receives input from the keyboard, and it can output its payload to stdout and errors to stderr.

stdin receives the user's keyboard input
stdout and stderr are free to print the process' output and possible errors messages. 

A program that executes in the background has its FDs dosconnected from the tty, so it cannot interact with the user. To execute a program in the background append the `&` char to its name on the command line. To send an already running process to the background, first suspend it (Ctrl + Z), then allow it to run in the background with `bg`.

## Bash handler
An event handler is a piece of code, usually a function, that the user provides in order to subscribe to an event. When the event occurs ("fires"), the system invokes the associated event handlers, possibly passing them some arguments. It is similar in the shell, and although bash is not much of an eventing system, it does provide a few hooking opportunities.

Just before printing the prompt, bash consults the environment variable `PROMPT_COMMAND`, executing its value as a command in the current shell context.

Values of shell variables are basically strings, but since strings lack structure they are not easy to manage. This is why bash allows the value of PROMPT_COMMAND to be an array of command strings that it will execute element by element. Being an array makes adding additional handlers easier.

For example, if the current value of PROMPT_COMMAND is a string `"history -a; history -n"`, it would be better to extract this commands into their own function (e.g. `save_history`), then put that function name as an array element.

```bash
# makes sure bash saves history across multiple simultaneous sessions
save_history () {
  history -a # Append history lines from this session to the history file.
  history -n # Read all history lines not already read from the history file
             # and append them to the history list.
}

# add save_history as the first element
PROMPT_COMMAND=(save_history)

# in the future, instead of dealing with strings,
# you can easily associate more handlers just by appending
# the previously-defined function names to the array:
PROMPT_COMMAND+=(is_git_repo)
# ...later
PROMPT_COMMAND+=(is_root)
# ...later
PROMPT_COMMAND+=(decorate_prompt)
```

## Blank
A blank is a `SPACE` or `TAB` character.

TAB character: C-escape `\t`, or dollar-single-quote `$'\t'`

## Builtin
An internal command provided by the shell, as opposed to an external command that is an external program. The most important difference is that builtins are executed by the current shell instance in the current environment, as opposed to the external programs, whose execution is delegated (by the current shell instance) to a freshly spawned subshell. For this reason, some commands are required to be implemented as builtins (`cd`, `popd`).

A builtin is a command internal to the shell. Builtins are executed by the shell in the current context, i.e. in the same environment that invoked them. Builtins, as internal commands, stand in contrast to the programs, located in the file system (in folders like /bin), which are deemed external because they are executed in a child shell. A child shell cannot ever influence the parent (invoking) shell - this is way the commands that change the current shell environment (like `cd`) must be implemented internally by the shell.

## C shell
csh (or the improved version, tcsh) is a Unix shell created by Bill Joy while he was a graduate student at University of California, Berkeley in the late 1970s. It has been widely distributed, beginning with the 2BSD release of the BSD which Joy first distributed in 1978. Other early contributors to the ideas or the code were Michael Ubell, Eric Allman, Mike O'Brien and Jim Kulp.

## Command line
Broadly, the term "command line" may mean the text-based human-to-computer interface or some of the surrounding aspects of such interaction. A more narrow meaning is to denote the actual place on the screen where the user types commands. It may also denote the actual raw string of characters the user typed in. It takes on a similar meaning as the shell takes that string as an input argument; the shell then proceeds to process it, fearing its efforts will be wasted if the monsieur has fallen off the wagon again.

## Command-line interface
The main component of a command-line interface is the *command line*. 

Today, a command line is just a place on the screen designated for typing in commands (in the past, the users typed the commands at the physical terminal). 

Today, *terminal emulators* are actually used, which emulate hardware terminals in the software. So the user sits at a typing commands in the terminal emulator, which acts a console that hosts the shell. The shell in turn provides a command-line interface.

The shell then interprets the command, replying it to the OS. The OS executes the command and sends the output of the command back to the shell which displays it to the user (to monitor today, to printer in the past).

A command-line shell requires the user to be familiar with
- the names of commands available on the system
- with the syntax the shell uses to call them
- with the specific shell language


## Command name lookup
The command lookup procedure takes place when the shell needs to locate a shell-word which is assumed to be a command. Aliases are searched first, but this happens before the command line is fully processed, so it doesn't count as a command lookup. Only when the command line is fully processed, the command lookup procedure commences by first searching the function names, then the builtin names, and finally external executables. When bash is in POSIX mode, the special builtins are searched before functions.

## Control operator
A token that performs a control function: `NL`, `&`, `;`, `;;`, `;&`, `;;&`, `|`, `|&`, `(`, `)`, `||`, `&&`.

## Environment variable
A shell variable receiving the 'x' (export) attribute gets promoted into an environment variable, meaning it will be inherited by subshells and child shell process. 

## Extended attributes
An extra set of attributes assignable to FS items.

## Group
A set of users gathered in a unit to ease the management of system permissions; namely, it is easier to assign the permissions to a group then to each group membner.

## Binding
1. The association of a named item with an element of a program.
2. The environment of a function at a point during the execution of a program is the set of identifiers in the function's scope and their bindings at that point.
3. The interface of a library with a programming language other than one it is written in.

## Exit status
The exit status, or the exit code, is an 8-bit integer returned by the most recently *executed command* to its caller (which may be the shell itself or another command). An exit code is always returned - if it is not explicitly controlled then it amounts to returning 0 in case of success, and 1 in case of any error. Manually controlling an exit code allows indicating different types of error that may have occurred; however, there's no standard interpretation of the various integers > 0, except that they signify some error - what error exactly is on the program's author to document.

The exit code is restricted to 8 bits, and it is used as a rudemetary machanism to indicate the status of a completed command, i.e. whether it finished successfully (an int > 0) or not (0).

The return status (code) is the same concept applied to a sourced file or a function. Generally, commands executed in a subshell have an exit code, while those executed by the current shell (in its environment) have a return code.

## Field
A unit of text that is the result of one of the shell expansions. After expansion, when executing a command, the resulting fields are used as the command name and arguments.

## File descriptor
A file descriptor (FD) is a file system abstraction, similar to a file handle. It is a communication channel that provides either an input or output channel to a process. By default, each process receives 3 standard FDs: *stdin* (for input), *stdout* (for output) and *stderr* (for printing out errors).

## Filename
A string of characters used to identify a file.

## fish
Fish (or friendly interactive shell) is a Unix-like shell with a focus on interactivity and usability. Fish is designed to be feature-rich, rather than highly configurable. Fish is considered an *exotic shell* since it does not adhere to POSIX shell standards, at the discretion of its maintainers.

## Foreground
By default, a process executes in the foreground, so it interact with the user; its FDs are connected to the current tty: therefore its stdin receives the user's keyboard input, while its stdout and stderr are free to print the process' output and possible errors messages. A program that executes in the background has its FDs dosconnected from the tty, so it cannot interact with the user.

## Job
A set of processes comprising a pipeline, and any processes descended from it, that are all in the same process group.

## Job control
A mechanism by which users can selectively stop (suspend) and restart (resume) execution of processes.

## Keyword
A keyword is a *reserved word*, *token* or *operator*. Keywords have a special meaning to the shell. Together with builtins they are the building blocks of the shell syntax. Bash keywords: `if, then, else, elif, fi, case, esac, for, select, while, until, do, done, in, coproc, function, time, !, { … }, [[ … ]]`. Keywords are similar to builtins in that they are also internal to the shell, but unlike builtins, keywords are not commands, but *subunits of command constructs*.

## Keystroke stacking
In anticipation of what a given running application may accept as keyboard input, the user of the shell instructs the shell to generate a sequence of simulated keystrokes, which the application will interpret as a keyboard input from an interactive user. By sending keystroke sequences the user may be able to direct the application to perform actions that would be impossible to achieve through input redirection or would otherwise require an interactive user. 

For example, if an application acts on keystrokes, which cannot be redirected, distinguishes between normal and extended keys, flushes the queue before accepting new input on startup or under certain conditions, or because it does not read through standard input at all. 

Keystroke stacking typically also provides means to control the timing of simulated keys being sent or to delay new keys until the queue was flushed. It also allows to simulate keys which are not present on a keyboard (because the corresponding keys do not physically exist or because a different keyboard layout is being used) and therefore would be impossible to type by a user.


## KornShell
ksh is a Unix shell developed by David Korn at Bell Labs in the early 1980s and announced at USENIX in 1983. The initial development was based on Bourne shell source code. Other early contributors were Bell Labs developers Mike Veach and Pat Sullivan, who wrote the Emacs and vi-style line editing modes' code, respectively.

## Metacharacter
Metacharacters are characters that have special meaning to the shell (when they are unquoted, of course). They also separate command line words. Unlike keywords and builtins, metacharacters need not be spaced out from the surrounding text.
Metacharacters: `( ) & ; | > <` and `SPACE`, `TAB`, `NL` (whitespace)

Metacharacters are also called break characters in relation to their use as separators of shell tokens. This use is especially important when the shell processes a command line input - the first stage of that process is locating the metacharacters in the input buffer, i.e. breaking the input by subunits separated by metacharacters.

a | b | c | d
a | b | c & d
{a | b} | {c ; d}
(a | b) | (c ; d)

echo "word" | sort | uniq | cat

## Name
A name is a word that begins with an ASCII alphabetic character or underscore, followed by alphanumerics and underscore; what is called an *identifier* in PLs. Names are used for shell variables and shell functions - except for names of shell functions since those can contain anything; even `3` can be a function name!

## Nomenclature
1. A set of rules used for forming the names or terms in a particular field of arts or sciences. 
2. A set of names or terms.

## Non-option
A non-option is an argument to a command that is not an option, i.e. it does not start with a dash or double dash.

## Observability
Observability is the ability to measure the internal states of a system by examining its outputs. A system is observable if the state of the system may be estimated by only examining its output (namely, sensory data). The term had originated decades ago within control theory (study of self-regulating systems), but it was used in reference to the distributed IT systems as well. In that context, observability refers to the use of telemetry data to more deeply expose the innards of a distributed system, thereby allowing a more precise insight into many aspects of its devious inner workings.

## Short option

- Options are divided into short option and long option. 
- A short option is a single letter prepended by a dash, e.g. `-l`. 
- Typically, each short option has a corresponding long option; however, not all long options have a corresponding short option. 
- Short options are intended for interactive use; long options, being descriptive, are meant for use in scripts. 
- A special feature of short options is *compactification*: several short options may be juxtaposed and introduced by a single dash, e.g. `-laF` is the same as `-l -a -F`.
- Short options that take arguments have two forms: either space or the equals sign must be used to separate the option from its argument, e.g. `-o file` or `-o=file`.
- A short option that takes an argument, e.g. `-o file`, may take part in a compact group but only as the last option, e.g. `-laFo file` or `-laFo=file`.

```bash
# short options in canonical form
cmd -l -a -F subject
# short options in compact form
cmd -laF subject

# short option -o takes an arg
cmd -l -a -F -o file subject
cmd -l -a -F -o=file subject
# compact form
cmd -laFo file subject
cmd -laFo=file subject




cmd -o file ; cmd -laFo file ; cmd --output file
cmd -o=file ; cmd -laFo=file ; cmd --output=file
```


## Option
Commands usually accept arguments, which are divided into options and non-options. Options come in two flavors: shot options, preceded with a dash, and long options, preceded with a double dash. Non-options arguments usually designate a payload. For example, the `ls` command accepts short options like `-l` and long options like `--directories-first`, but the main argument is a non-option (also called a payload) argument that specifies the name of the directory (or directories) to list. Payload argument is what the command is operating on, the thing it deals with. `ls` deals with directories, `kill` deals with signals, `ps` with processes, many commands (cat, tr, sort, uniq, diff, sed, awk, etc.) deal with text streams (obtained as stdin or from files).

## Operator
A *control operator* or a *redirection operator*. 
Operators contain at least one unquoted *metacharacter*.

## Ontology
(countable, computer science, information science) A structure of concepts or entities within a domain, organized by relationships; a system model.

## Permission
On Linux, a permission means a right to carry out some action. For example, files have the 3 basic permissions (read, write, execute), and a user needs to be granted permissions (by the system admin) that will allow them to carry out the corresponding actions. These basic file permissions are soemtimes called basic file attributes, since extended attributes exist as well.

## Pipeline
The stdout of one command may be connected to the stdin of another by placing the pipe symbol between them, `cmd1 | cmd2`. The stderr of cmd1 still goes to wherever it went before; to send it as well as input to cmd2, bash has the non-standard operator `|&`, which means the same as `cmd1 2>$1 | cmd2`.

## POSIX
POSIX is a family of open system standards based on Unix. The latest specification is `POSIX.1-2024`, which is also IEEE Std 1003.1 2024 and The Open Group Standard Base Specifications Issue 8. Bash is primarily concerned with the "Shell and Utilities" portion of the standard. Bash conforms to many aspects of the spec, but it also diverges in many aspects. However, when the POSIX mode is actived, Bash tries harder to minimize these differences.

## Process group
A collection of processes related by having the same PGID (process group ID).

## Process group identification
A unique number (identifier) that represents a process group (during its lifetime).

## rc
rc (for "run commands") is the command line interpreter for Version 10 Unix and Plan 9 from Bell Labs operating systems. It resembles the Bourne shell, but its syntax is somewhat simpler. It was created by Tom Duff, who is better known for an unusual C programming language construct called "Duff's device".

## Redirection
Redirection is an operation provided by the shell to manipulate the standard and custom I/O streams (file descriptors) of commands.

## Redirection operators
Redirection operators are based on metacharacters `>`, `<` and `|`. 
Standard FDs are referenced using `&` (e.g. `3>&-`).

## Reserved word
A word that has a special meaning to the shell. Most reserved words introduce shell flow control constructs, such as `for` and `while`.

## Return status
The return status, or return code, is almost identical to the concept of the exit status (or exit status).

{return,exit}{status,code}

only here it applies to a sourced file, or to the called function, or sometimes also to the builtins. Generally, commands executed in a subshell have an exit code, while those executed by the current shell (in its environment) have a return code.


The exit code is restricted to 8 bits, and it is used as a rudemetary machanism to indicate the status of a completed command, i.e. whether it finished successfully (an int > 0) or not (0).

A synonym for `exit status`.

## Shell
A shell is a console application that provides a text-based interface, exposing the means to invoke the services of the underlying operating system to its clients (the users and other programs).

The term shell has first appeared in the MULTICS system. It is, however, not universal; other terms include command interpreter, command language.

The name stems from the fact that a shell is the outermost layer around the operating system's kernel.

*Human-to-computer interface* (HCI) was realized quite differently at times. Initially, patch cables were used for input, while output was conveyed as light. Then the progress brough punctured cardboards to be used as input, while the output was printed (on the real paper) with a big-ass printer (imagine the guilt induced by the unnecessary paper waste arising from even the simplest mistakes; plus, the lack of the keyboard feedback had probably encouraged the multiplication of spelling errors, howdy-ho gee willikers).

The two of the most common HCIs are *command-line interface* (CLI) and *graphical user interface* (GUI).

The corresponding shells associated with these two interfaces are *command-line shell* and *graphical shell* (the term "shell" usually refers to the former).

A shell is a macro processor which allows for an interactive or non-interactive command execution.

An operating system software user interface, whose primary purpose is to launch other programs and control their interactions; the user's command interpreter. Shell is a way to separate the internal complexity of the implementation of the command from the user. The internals can change while the user experience/interface remains the same.


## Shell word
A shell word is any character or a string of characters (that is, any token) that carry some meaning to the shell. Shell words are somewhat analogous to words of a natural language.

## Simple command
A simple command consists of a command name and an optional list of arguments and redirections. A simple command may optionally be prefixed by a list of assignment statements to cause those variables to exist only in the context of the command; this is true whether a simple command is a builtin or external executable.

## Special characters
A character is said to be special if it has a meaning beyond its literal meaning, a meta-meaning. Along with keywords and builtins, special characters (especially metacharacters) are another crucial element of the Bash syntax.

A "meta" meaning is the meaning of a term on a higher level of abstraction. For example, in the context of regular expressions, `+` is a *meta character* - its has meta meaning - instead of representing itself (i.e. a plus sign), it means the previous character may occur one or more times.

As is the case for meta characters in different settings, the meta meaning can be removed, returning the character to its normal (literal) interpretation, by using an *escape mechanism*.

In this example, in order to use plus as a literal symbol (that matches itself), we can escape it by prepending a backslash in front of it (`\+`). In general, the meta meaning may also be stripped by using *quotation* or by employing a different encoding.

## Standard file descriptors
There are 3 standard file descriptors that each executed process is associated with: stdin, stdout and stderr. FDs may be manipulated (created, moved, closed, duplicated, etc.) by using redirection operators or the builtins (`exec`).

## Shell execution context
The shell has an execution context, just like any old process. The currently running interactive instance of the bash shell maintains an execution context ever since it was (presumably) started as a login shell.

## stdin
stdin is one of the 3 standard FDs intended as an input channel for a process.

## stdout
stdout is one of the 3 standard FDs; stdout is intended as an output channel for a process.

## stderr
stderr is one of the 3 standard FDs. It is also an output channel like stdout, but intended only for printing out potential error messages. Such behaviour (printing "proper" output to stdout and errors to stderrr ) is not enforced but a matter of respecting the convention (by a program's author). Programs, and thus processes, that follow this convention (among other things) are said to "behave".

## Signal
A mechanism by which a process may be notified by the kernel of an event occurring in the system.

## Synchronous command execution
Synchronous command execution is the usual way bash executes commands: it read the user's input, taking one command at a time, executes it, prints the possible payload and errors, and finally reports its exit status.
when completed returns to you for the next command.


## Return code

## Exit status

## Last exit status
The exit status of a simple command that was most recently executed is saved in the `$?` special shell parameter.

It is important to understand that while bash is busy with a command that you give it, you cannot interact with bash directly: you'll have to wait for it to be ready with executing its command and return to the script. For most commands, you'll barely notice this: they get executed so fast bash will be back for the next command before you realize.

## Special POSIX builtins
Several builtins have the special status when bash is in the POSIX mode: `break : . continue eval exec exit export readonly return set shift trap unset`. The special status means name resolution founds them before shell functions; if they return an error status, a non-interactive shell exits; assignment statements preceding the command (builtin name) stay in effect in the shell environment after the command completes.

## Shell variable
A shell variable is a `NAME=VALUE` pair; more precisely, it is a NAME possibly associated with a value (to account for `NAME=`, which is a NAME with null value); most precisely, it is a NAME, possibly assigned a value and a set of attributes.

Variables in the shell serve a similar purpose as those in PLs; they share the naming rules.

The properties of shell variables: name, value, attribute. Many traditional properties of variables (type, scope) are relied through attributes, to a degree. For one, shell variables are untyped - the values are just "names" - but a variable declared with the 'i' (for integer) attribute will only accept numbers as its values; on the other hand, an existing variable that holds a string value can also be given the 'i' attribute, and it will also accept only integers as values - in the future. Its current value, however, will remain a string (the same string).

Shell variables become *environment variables* when given the 'x' attribute. *Exported variables* always include environment variables, but assignments written before the command are made available to a child process as well; `set -o keyword` permits assignments to appear after a command, not only before it. These are also known as one-shot assignments.

*Inherited variables* are shell variable that a child process recives from the parent process; these include env vars and one-shot assignments.

## Subshell
When an external command (executable program or script located through the PATH) needs to be executed, the shell process forks itself and delegates the execution to the child process (immeditely after finishing the child process is discarded). The child process cannot convey information to the parent shell directly (so it cannot update a parent's envar), but it can emit a stream, write to files and exert other side-effects.

Creating a subshell seems to be different then creating a child shell. This implies that a subshell process is exactly like the parent shell process (aside from some minor differences [which?]), which is different from creating a new shell since the new child shell process won't see the parents shell's variables. For example, a shell script is executed in a new shell (not in a subshell).

## Standard stream
The standard streams are file descriptors `stdin` (fd0), `stdout` (fd1), `stderr` (fd2) used for input/output interaction with the users/clients. Standard and custom streams can be manipulated using the redirection operations provided by the shellL; e.g. metacharacter `>` redirects the stdout (to another file descriptor, such as a new file), `>>` appends the stdout (e.g. to the existing file contents), `|` pipes the stdout to another command, `|&` pipes both stdout and stderr to another command, `<` redirects the stdin, `<<` is a here-doc syntax, `<<<` is a here-string syntax; there is syntax for many more redirection types.

## Tilde
On Unix, user home directories can be referenced with the tilde character `~` prepended to user names; e.g. `~bob` refers to Bob's home directory, and admins can list its contents with `ls -la ~bob`, which is just a little shorter then the absolute path `/home/bob`. And if there's a web server involved, Bob's personal page is bound to be https://example.com/~bob. The logged in user need not bother typing the username part as they can refer to their own home dir by tilde alone, e.g. `cd ~` will put them there; `cd` with no args would too. Logged in users always need to choose whether to use `~` or `$HOME` to refer to their home dir.


## Token
A token is sequence of characters considered a single unit by the shell: either a (shell) word or operator.

Lexical analysis breaks the input stream of characters into tokens (shell words) which are the smallest semantic units - units of syntax that have a meaning. (The term "token" is used here as a more general then "word", since the latter suggest these semantic units are composed of letters, when, in fact, they are composed of any kind of character; the term "shell word" is perhaps more adequate then "word" alone).

## Variable
A variable is a shell entity that can hold data. A variable always has a name and it may be associated with a value; additionally, it may be associated with one or more attributes, which influence the behavior of variables. Shell functions are sometimes trated as shell valiables (can be exported), although their semantics makes them sufficiently different.

Because the value they hold may be changed, these containers are called variables (as opposed to constants). 

A variable is identified by its name, and the naming rules for regular variables are the same as for the identifiers. Only the name is required - besides its name, a variable may 

additionally have one or more attributes and it may be associated with a value.


A variable is a named containers that may hold a value. A variable is identified by its name, and the naming rules for regular variables are those of the identifiers.

## Variable expansion operator

associateds

(`$`) 

## zsh
The Z shell was created by a Princeton University student, Paul Falstad, who relased it 1990. zsh is a Bourne-compatible shell that introduces many extensions and enhanvements. It has several emulation modes that mimic the behavior of other shells, including the Bourne shell, the POSIX standard, bash, ksh. zsh is a default shell on Mac OS. 

In Sep-2024, the latest installable version of zsh on Ubuntu 22.04 is zsh-5.8.1 although the latest version is zsh-5.9 released on 2022-05-14 ("There are several visible improvements since 5.8.1, as well as bug fixes. All zsh installations are encouraged to upgrade as soon as possible").
