---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/What-is-Bash_003f.html
page-title:       What is Bash? (Bash Reference Manual)
---
# About bash

Bash is a shell or command language interpreter, for the GNU operating system.

The name is an acronym for the *Bourne-Again SHell*, a pun on Stephen Bourne, the author of the original unix shll, `sh`, which first appeared in the 7th Edition Bell Labs Research version of Unix.

Bash shell (bash) is largely compatible with the Bourne shell (sh). Bash is intended to be a conformant implementation of the `IEEE POSIX Shell and Tools portion` of the `IEEE POSIX` specs from the `IEEE Standard 1003.1`. When the term "POSIX" is mentioned, it is usually the POSIX kind of compatibility that is sought. POSIX standard also defines what it means for a shell, particularly for a shell script, to be *portable*, which it does by defining the subset of common shell syntax that all conforming shells must implement.

During the years, many companies and individual authors, also affected by such things as computing platform and computer architecture, have introduced, whether deliberately or accidentaly, an incredible amount of incompatibilities across different shells, different platforms, even different versions of the same shell. This is mostly reflected in that a relatively small set of names is present in the syntax of many distinct shells, but with the ever so slightly different semantics behind. For example, even commands that are supposed to be simple to comprehend, like `echo`, have a myriad of tiny differences across the well-known shells.

Shells have often (and still do) introduced new concepts, with other shells always trying to implement a popular concept, but practically never in a way that is 100% compatible. At least some tiny obscure bit have to change, which is the worst case becasue isuch small differences are hard to observe.


Thus, although there is such thing as the "common shell syntax", it is so incompatible that a new standard had to be specified and today it is the most well known one - the POSIX specs. Unfortunatelly, the POSIX standard is not very reach in features because it just tries to defines the core features all shell should respect. This always results in friction between users: those who like to maintan compatibility and those who like to use the brand new features.


Bash incorporates useful features from the Korn shell `ksh` and the C shell `csh`.


It offers functional improvements over `sh` for both interactive and programming use.

While the GNU operating system provides other shells, including a version of `csh`, Bash is the default shell. 

Like other GNU software, Bash is quite portable.

It currently runs on nearly every version of Unix and a few other operating systems - independently-supported ports exist for MS-DOS, OS/2, and Windows platforms.
