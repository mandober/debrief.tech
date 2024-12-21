# Shell :: System shell

This section is about a general concept of **shell**, about the features and concepts that Linux shells have in common, about the things that the POSIX standard tries to accomplish.

**Shell** is a *command interpretor*, but also a programming language on its own, with complete programming language constructs such as conditionals, loops, variables, functions.



In the past, the *canonical shell* (in fact, the only shell program) was the *Bourne shell*. Its binary was named `sh`. File names would often be appended with the `.sh` suffix to indicate a shell script. Today, the `bash` shell has won the privilege of being the *default shell* on many Linux distributions (the default shell on Mac is `zsh`). Bash is an enhancement of the Bourne shell, inheriting many of its concepts and features. The canonical name `sh` (that is `/bin/sh`) is often symlinked to `bash`. Bash has several execution modes, one of which is the close (but not perfect) emulation of the Bourne shell.

Later, many shell programs were developed alongside each other, borrowing features from one another as development progressed, while also introducing new ones.






The *C-shell*, `csh`, had introduced better command-line editing capabilities. The *Korn shell*, `ksh`, had impoved the capabilities of shell functions. Some other notable shells were the *Thomson shell* ,`tsh`; `mksh`, `pksh`.

Then came a wave of shell that aimed for simplicity: `dash`, `ash`.

Another wave of shell aimed for progress and improvement of existing capabilities and introduction of new: `zsh`, `fish`.

The POSIX standard was established, prescribing the behavior of the POSIX-compliant shells.




Today, the default *system shell* on many Linux distributions is `bash`. Mac OS has `zsh` as the default shell. Windows OSs do not use POSIX-frindly shells, but curiously, Microsoft's *PowerShell* had gone cross-platform, with its package available in the Ubuntu's universal repository.

The PowerShell, `pwsh`, is also an interesting case because it trades the *traditional text-only I/O* for a more structured approach; that is, the pwsh's output (much more than the user-typed input of course) has the form of a stuctured data (object-like data structure) - it is not merely plain text.


is most often set as `bash`, many use `zsh` or `fish` shell



Each Linux shell (bash, zsh, fish, ksh, etc.) has its own idiosyncrasies (idiosyncrasies of the bash shell are called *bashism*), but shells also have many common features, and for a large part, they also share the same syntax used to invoke those features.

For example, the `zsh` shell has extended the concept of shell aliases and functions, offering far more features than `bash` (which is the default shell in many Linux distributions) - however, the basic syntax to define an alias or a function (bash syntax) is understood by zsh.

The fish shell is the only one among the popular Linux shells that has its own specific syntax for these things, and it cannot interpret the bash syntax.

The POSIX standard defines the behavior of the POSIX-compliant shells. Although the POSIX standard is precisely defined, its implementation is not as precise because there are many small discrepancies across the shells that claim POSIX-compatibility. Almost all Linux shells (whether or not explicitly running in the POSIX mode) are to some extent POSIX compliant (except notably the fish shell).

## bash

The Bourne Again Shell is a Unix shell and command language created as an extension of the Bourne shell (sh) in 1989. The shell program is the default login shell for many Linux distributions and earlier versions of macOS.

Bash introduces features not found in the Bourne shell including (many of these features are not bash-invented but rather borrowed-by-bash from other shells):
- *brace expansion*
- command completion
- basic *debugging*
- signal handling with *traps*
- command history
- conditionals: `if` and `case` statements
- *heredoc support*

Since bash is a superset of sh, most sh scripts execute in bash without any additional changes.

The Bash Shell (or Bourne-again Shell), `bash`, was written by Brain Fox for the GNU Project as a free replacement for the previously ubiquitous Bourne Shell (`sh`). Bash was first released in 1989. It is the default shell in many Linux distributions (Kali Linux has zsh as default shell; bash was default on macOS until Catalina when it was replaced by zsh). Bash has played a pivotal role in the evolution of open-source software, offering a consistent interface for users to interact with the OS.


## zsh

The Z Shell, or Zsh is also a UNIX shell that is very similar to Bash. You can also script and use the shell as a command interpreter.

Zsh is an extension of the Bourne shell with a lot of improvements. Zsh was released in 1990 by Paul Falstad, and it has some features that Bash, Korn Shell, and C Shell share.

macOS by default uses the Zsh Shell.

The *Z shell*, `zsh`, is a Unix shell created as an extension for the Bourne shell in the early 1990s. zsh is a feature-rich shell that borrows many ideas from `ksh` and `tcsh` to create a featurefull alternative.

The executable location is in /bin/zsh. The prompt is `user@hostname host %` for regular users, and `hostname#` for the root user. The Z shell is the default shell of Kali Linux and Mac OS.

Some new features added to the zsh include:
- *shared history* among all running shell sessions
- improved array and variable handling
- *spell corrections*
- *command name autofill*
- various compatibility modes
- *extensibility through plugins*
- highly configurable
- highly customizable

The shell is said to be verey configurable and customizable, and extensible via "plugins" and has many community-maintained "frameworks" [[it all probably comes down to aliases; like a rust plugin for zsh probably just defines a bunch of aliases to invoke cargo, a git plugin surely does the alias overkill, perhaps also embelishing the prompt with git status candy]].



## fish

The Friendly Interactive Shell (fish) is a Unix shell released in the mid-2000s with a focus on usability. The feature-rich shell does not require additional configuration, which makes it user-friendly from the start.

The default executable path is /usr/bin/fish. The user prompt is `user@hostname location>`, while the root prompt is `root@hostname location#`.

Features include:
- advanced suggestions/tab completion based on the current directory history
- helpful syntax highlighting and descriptive error messages
- web-based configuration
- command history with search options

The main drawback of fish is non-POSIX compliance. However, the developers aim to improve flawed designs from POSIX.

---

Fish is a UNIX shell environment with an emphasis on interactivity and usability. Unlike Zsh, Fish aims to give the user interactivity by default instead of trusting the user to implement their own configuration.  

It was created by Axel Liljencrantz in 2005. Fish is considered to be an "exotic shell" due to the fact that it does not comply to the POSIX shell standards.

Fish prefers features as commands rather than syntax. This makes features visible in terms of commands with options and help texts. Fish's scripting language is different than Zsh and Bash. Fish avoids aliases in the scripting language.

A standout features of fish is its *auto-suggestions*, which provide real-time feedback based on your command history, allowing for quicker command execution.

Fish also boasts a vibrant and colorful interface, with real-time (as-you-type) *syntax highlighting* that makes it easier to read and understand commands. Its web-based configuration allows users to customize their shell experience without delving into complex configuration files.

One of the biggest differences is when you try capturing output from a command. In Bash you may be used to this:

```bash
today=$(date)
echo "Today is $today"
```

Whereas in Fish, capturing the output works differently. The equivalent script to above would look like this:

```fish
set today (date)
echo "Today is $today"
```

## csh

The *C shell*, `csh` (pronounced "see-shell"), was developed by Bill Joy (also wrote `vi`) in the late 1970s at the University of California, Berkeley. It introduced several features and scripting syntax that were inspired by the C programming language.

csh - new interactive features:
- History of the previous command
- User-defined aliases for programs
- Relative home directory (~)
- Built-in expression grammar

csh pros
- improved readability and performance compared to sh
- interactive features and innovations influenced all subsequent shells

csh cons
- syntactic inconsistencies
- no support for standard FDs (stdin, stdout, stderr)
- not fully recursive, which limits complex command handling

## tcsh

The *Tenex C Shell*, `tcsh` (pronounced "tee-shell"), is an enhanced version of csh ("Tenex" is a reference to the TENEX OS). tcsh incorporated all the features of csh and added additional improvements, such as *command-line editing*, *job control*, and *command completion*.

`tcsh` is backwards compatible with `csh`, with additional features and concepts borrowed from the TENEX OS.

Early versions of Mac OS and the default root shell of FreeBSD use tcsh.

Additional features of `tcsh`
- advanced command history
- programmable autocomplete
- wildcard matching
- job control
- built-in where command

Since tcsh was an extension of csh, many drawbacks of csh persisted in the tcsh.


## ksh

The *KornShell*, `ksh`, was developed by David G. Korn at AT&T Bell Labs in the early 1980s. It combines features from csh and sh. It has advanced scripting capabilities [what?].

The KornShell (ksh) is a Unix shell and language based on the Bourne shell (sh) developed in the early 1980s. The location is in /bin/ksh or /bin/ksh93, while the prompt is the same as the Bourne shell (`$` for a user and `#` for root).

The shell implements features from csh and sh, focusing on interactive commands and programming features.

KornShell added its own new features
- *built-in mathematical functions*
- *floating-point arithmetic*
- *object-oriented programming*
- *extensibility of built-in commands*
- associative arrays

ksh is compatible with sh. 
ksh is faster than csh and sh.

One of the standout features of ksh are *associative arrays*, a feature that wasn't common for shells for a long time. ksh also introduced the `select` builtin, which makes menu generation in scripts easier. It *command-line editing* and *history-management capabilities* were later adopted by other shells like bash.

- `rksh` is a restricted mode of executing ksh.
- `rpfksh` is a restricted mode to user profiles of executing ksh.

## pdksh

pdksh v.5.2.8 (Aug-96), `pdksh-5.2.7.tar.gz`
- Keywords: pdksh, ksh, Korn, shell, command line interpreter
- Author: michael@cs.mun.ca (Michael Rendell)
- Primary-site: sunsite.unc.edu:/pub/Linux/system/Shells/pdksh-5.2.7.tar.gz
- Platforms: Written in C, runs on most UNIX boxes
- OS: works best in a POSIX or BSD environment. Also runs on OS/2.
- Copying: Freely Redistributable (mostly public domain, some copyrighted)

**PD-ksh** is a mostly complete AT&T ksh look-alike. Work is currently underway to make it fully compatible with both POSIX and AT&T ksh (when the two don't conflict).

Since `pdksh` is free and compiles and runs on most common unix systems, it is very useful in creating a consistent user interface across multiple machines.

For example, in the MUN CS dept., pdksh is installed on a variety of machines (Suns, HPs, DecStations, PCs running Linux, etc.) and is the login shell of about 4500 users.

## rc

**rc** shell, v.1.5 beta, `rc-1.5-bin.tar.gz`, July 23, 1997
author:         Byron Rakitzis
maintained-by:  Neil Schemenauer
written-in:     ANSI C
runs-on:        most Unix systems
license:        freely redistributable
keywords:       rc, plan9, plan 9 shell

`rc` is a shell designed by Tom Duff of Bell Labs to replace the venerable Bourne `sh` in Plan 9.

The design of rc is extremely clean, in that precisely those features of Bourne's sh that have caused problems over the years (the *slightly awkward flow control syntax*, the *Byzantine quoting rules*, the failure to export all variables into the environment) were reworked, and the temptation to add superfluous features was strongly resisted.

This is Byron Rakitzis's version of rc that is portable between many versions of UNIX and is largely compatible with Duff's design.

## scsh

*Scheme Shell*, `scsh`, is a broad-spectrum systems-programming environment for Unix embedded in R4RS Scheme. Runs on most major Unix platforms. The latest version of scsh is 0.6.7, released May 16, 2006.

scsh
https://scsh.net/

Scheme
https://groups.csail.mit.edu/mac/projects/mac/
https://groups.csail.mit.edu/mac/projects/scheme/

PLT Scheme (morphed into `Racket`)
http://www.plt-scheme.org/software/
http://www.plt-scheme.org/

Guile
https://www.gnu.org/software/guile/


## dash

The *Debian Almquist Shell*, `dash` is a Unix shell developed in the late 1990s and derived from the *Almquist shell*, `ash`, which was ported to Debian and renamed.

Dash is famous for being the default shell for Ubuntu and Debian. dash is minimal and POSIX compliant, convenient for executing the OS startup scripts.

The executable path is /bin/dash, in addition to /bin/sh pointing to /bin/dash on Ubuntu and Debian. The default and root user prompt is the same as in sh.

Dash pros
- Execution speeds up to 4x faster than bash and other shells
- Requires minimal disk space, CPU, and RAM compared to alternatives

The main drawback is that dash is not bash-compatible. The features not included in dash are known as "bashisms". Bash scripts require refactoring out all the bashism to run on dash.


## Refs

https://ss64.com/bash/
https://www.tecmint.com/different-types-of-linux-shells/
https://en.wikipedia.org/wiki/Unix_shell
https://phoenixnap.com/kb/linux-shells

https://www.ibiblio.org/pub/Linux/utils/shell/!INDEX.short.html
https://www.ibiblio.org/pub/Linux/system/shells/!INDEX.html
