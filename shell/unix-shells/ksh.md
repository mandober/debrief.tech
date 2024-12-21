# KornShell

https://github.com/topics/kornshell

- oksh
- mksh

https://github.com/ksh-community/ksh
https://github.com/ksh93/ksh

http://www.kornshell.com/
http://www.github.com/att/ast

The KornShell - command and programming language
- Package: ksh
- Version: 20211217
- Section: universe/shells
- Source: `ksh93u+m` (1.0.0~beta.2-1)
- Homepage: http://www.kornshell.com/
- developer: David G. Korn (@ AT&T Bell Labs)



- `{,pd,m,o}ksh{,93}` plugin. Coloring built in.
https://github.com/DesantBucie/korny
https://github.com/topics/ksh
https://github.com/topics/ksh93
https://github.com/att/ast/tree/ksh2020
https://github.com/att/ast/tree/old-gh-pages
https://gist.github.com/ormaaj/6195070
https://github.com/topics/pdksh
https://github.com/topics/bourne-shell
https://github.com/topics/kornshell
https://github.com/izabera/libash

* *Modernish* is a library for writing robust, portable, readable, and powerful programs for POSIX-based shells and utilities.
https://github.com/modernish/modernish

* *Shell snippets* of random value. Not intended to be packaged, more like aid to developers, training purposes or a code library. Each of the snippets is separate and may have separate authors
https://github.com/mirabilos/shellsnippets

## KornShell Overview

### The KornShell language

**The KornShell language** was designed and developed by *David G. Korn* working at AT&T Bell Labs.

The KornShell language is a complete, powerful, high-level programming language for writing applications, often more easily and quickly than with other high-level languages.

This makes it especially suitable for prototyping.

There are two other widely used shells, *the Bourne shell* developed by Steven Bourne at AT&T Bell Laboratories, and *the C shell* developed by Bill Joy at the University of California. ksh has the best features of both, plus many new features of its own.

ksh can do much more to enhance your productivity and the quality of your work, both in interacting with the system, and in programming.

ksh programs are easier to write, and are more concise and readable than programs written in a lower level language such as C.

The new version of ksh has the functionality of other scripting languages such as awk, icon, perl, rexx, and tcl.

For this and many other reasons, ksh is a much better scripting language than any of the other popular shells. 

The code size for ksh is larger than the Bourne shell or C shell programs. The revised version is even larger.

- In spite of its increased size, ksh provides better performance. 
You can write programs to run faster with ksh than with either the Bourne shell or the C shell, sometimes an order of magnitude faster.

- ksh has evolved and matured with extensive user feedback. 
It has been used by many thousands of people at AT&T since 1982, and at many other companies and universities. A survey conducted at one of the largest AT&T Bell Laboratories computer centers showed that 80% of their customers, both programmers and non-programmers, use ksh. 

- ksh is compatible with the Bourne shell. 
Virtually all programs written for the Bourne shell run with ksh. If you are familiar with the Bourne shell, you can use ksh immediately, without retraining.

- ksh is compatible with itself. 
The new version of ksh is compatible with earlier versions of ksh. 

- ksh is readily available. 
It is sold (source and binary) by AT&T and Novell, and by other companies under license from AT&T both in the USA and abroad. It has been purchased by dozens of major corporations, and by many individuals for use on home computers.

- ksh is extensible. 
The KornShell language uses the same syntax for builtins as for non-builtin commands. Therefore, system developers can add new commands "transparently" to the KornShell language; that is, with minimum effort and with no differences visible to users other than faster execution. On systems with dynamic linking, it is possible to *add new builtins at run time*. 

Novell has extended the new version of ksh to enable X-windows programming for their desktop ksh product, dtksh. `dtksh` is a standard part of *Common Desktop Environment (CDE)* defined by *Common Operating System Environment (COSE)*, supported by most major UNIX system hardware vendors.

`tksh` is an extended version of ksh that enables Tk programming.

ksh is intended to conform to the *Shell Language Standard* developed by the *IEEE POSIX 1003.2 Shell and Utilities Language Committee*.
