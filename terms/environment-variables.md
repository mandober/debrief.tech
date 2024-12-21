# Environment variables

https://en.wikipedia.org/wiki/Environment_variable

(env var, envvar, enwar, envar, evar)

## What are environment variables

Environment variables are a part of the *execution environment* of a process. Logically, they are just names associated with values, i.e. NAME=VALUE pairs.

## Purpose

The main purpose of environment variables is to hold some information handy. There are many places information could be stored, including files, but it was found that holding frequently accessed pieces of information in memory, in the form of VAR=VALUE pairs, is too convenient not to take the advantage of.

## Effect

Importantly, environment variables are descriptive, not prescriptive. A mere existence of some env var can't do shit. It is up to the programer to look it up and then decide whether and how to use the obtained information.

Of course, in time, the way particular programs use env vars became well-established, so manipulating the env vars that a program sees became another way to influence a program's behavior.

## Location

Environment variables are stored in memory, but every process has its own independent set of environment variables. Since each process inherits env vars from its parent, the question becomes where does the `init` (PID 1) process gets them from.

In Unix, the environment variables are initialized during system startup by the *system init startup scripts* (nowdays controlled by systemd). The `init` process is the first process, always with the PID 1, and it is ancestor of all other processes; it even adopts orphaned processes.

The `init` process gets a (relatively small) set of well-established environment variables (PATH, TEMP, HOST, TERM, USER, HOME, etc.) deemed to be useful to any processes - whether it be CLI or GUI related.

As additional processes start, each inherits the init's env vars, and some processes may introduce one or two additional env vars relevant to them. Tipically, nothing too dramatic happens and the set of env vars remains more-less the same (as it was in the 'init' process). That is, until the shell starts - bash, for example, introduces a wild bunch of environment variables, like there's no place else to store this data.


The login or interactive shell startup is a point when the set of env vars gets dramatically increased. During initialization, the shell will read various config files, ending up with quite a large set of env vars, only a fraction of which were inhirited. This new variables are relevant to the command line work and to a particular shell. At this point, the user's profile files are also loaded which augment the set of env var as well. So any process spawned by the shell inherits all these env vars; and shell is bound to spawn many processes during a typical session.


On the other hand, a subtree of processes related to GUI will get additional env vars relevant to them. Similarly for other subtrees of related processes. Since every process has a parent, all processes form a tree rooted at `init`. The init process then has a set of env vars common to all processes. Nodes of interest in the tree will be those processes (like the shell) when the set of env vars dramatically increases.



For example, the name of the currently loggin user was such information so the `USER` env var was introduced. Another is `PATH`, now present on all OSs, which contains a list of directories with programs which are searched whenever the location of a program cannot be determined (usually because the user typed only the program's name, not the full path). `TEMP`, redundantly also as `TMP`, holds the location of the system's temporary directory. There is a set of environment variables that hold information about the current locale, and these are queried perhaps the most, especially when working in the shell.



A process is free to query any and all available environment variables. Usually it wants to get their value, but sometimes a mere existence is sufficient (when a variable serves as a binary flag).

A process can query all available env vars in batch-like manner, or just individual variables by thier name. So, the programmer can either get env vars as a collection, or selectively if they know the names of variables theyu want to query. 

Some environment variables have long standing and well-established names like PATH, TEMP or TMP, HOME, USER.


## Origin

Environment variables were introduced in their modern form in 1979 in *Version 7 Unix*, and have been available in Unix-like systems since, including Linux and MacOS.

Environment variables debuted in a Microsoft's product in 1982, appearing in PC DOS v2.0. Having recognized their usefulness, they were a staple of all the subsequent Microsoft OSs, albeit with a different syntax.

## Use

### Use in Linux

In the shell, environment variables are just shell variables marked for export, i.e. variables with the 'x' attribute set.

A new variable can be created in several way
- using an assignment statement `NAME=VALUE` followed by `export NAME` command
- using the export builtin, `export NAME=VALUE`
- using the declare builtin with 'x' attr, `declare -x NAME=VALUE`

*Assignment statement* has the form `NAME=VALUE` and when it appears by itself on the command line, it creates a new shell variable NAME in the current environment and assigns it the VALUE. Assignment statements are not deemed commands proper - they are degenerate forms like `>file` is when it appears alone on the command line.

Q: Are there more forms besides these two? I was contemplating condidates for degenerate forms and only came up with that redirection. 



A new variable can be created using an assignment statement like `NAME=VALUE` by itself (alone on the command line), or more explicitly, as a command `declare -x NAME=VALUE`


### Use in Windows

to dereference a var it needs to be surrounded by percentage signs, e.g. `%USERPROFILE%`, but to delay its expansion to the use site (as opposed to the definition site?) it also needs to be surrounded in bangs (in addition to percent signs), `!%USERPROFILE%!`.



## Design

Each process has its own separate set of environment variables.

By default, when a process is created, it gets a duplicate of the parent's run-time environment, except for changes that the parent explicitly made when creating the child process. At the API level, these changes are done between running `fork` and `exec`.

The user can also change one or more envars for the command they are about to run, by prepending the command name with a set of `name=value` pairs (not necessarily denoting an environment variable).

invocation by indirectly invoking it via the `env` command or using the `VARIABLE=VALUE <command_name>` notation. A running program can access the values of environment variables for configuration purposes.

Shell scripts and batch files use environment variables to communicate data and preferences to child processes. They can also be used to store temporary values for reference later in a shell script. However, in Unix, non-exported variables are preferred for this as they don't leak outside the process.

In Unix, an environment variable that is changed in a script or compiled program will only affect that process and possibly child processes. The parent process and any unrelated processes will not be affected. Similarly, changing or removing a variable's value inside a DOS batch file will change the variable for the duration of COMMAND.COM's existence.

In Unix, the environment variables are normally initialized during system startup by the system init startup scripts, and hence inherited by all other processes in the system. Users can, and often do, augment them in the profile script for the command shell they are using. In Microsoft Windows, each environment variable's default value is stored in the Windows registry or set in the AUTOEXEC.BAT file.

On Unix, a setuid program is given an environment chosen by its caller, but it runs with different authority from its caller. The dynamic linker will usually load code from locations specified by the environment variables $LD_LIBRARY_PATH and $LD_PRELOAD and run it with the process's authority. If a setuid program did this, it would be insecure, because its caller could get it to run arbitrary code and hence misuse its authority. For this reason, libc unsets these environment variables at startup in a setuid process. setuid programs usually unset unknown environment variables and check others or set them to reasonable values.

In general, the collection of environment variables function as an associative array where both the keys and values are strings. The interpretation of characters in either string differs among systems. When data structures such as lists need to be represented, it is common to use a colon (common on Unix and Unix-like) or semicolon-deliminated (common on Windows and DOS) list.



---


https://en.wikipedia.org/wiki/Environment_variable
https://en.wikipedia.org/wiki/Name_resolution_(programming_languages)
https://en.wikipedia.org/wiki/Runtime_system
https://en.wikipedia.org/wiki/Env
https://en.wikipedia.org/wiki/Child_process
https://en.wikipedia.org/wiki/Environment_variable#Unix
https://en.wikipedia.org/wiki/C_standard_library
https://en.wikipedia.org/wiki/Fork_(system_call)
https://en.wikipedia.org/wiki/Exec_(system_call)
https://en.wikipedia.org/wiki/Buildroot
https://en.wikipedia.org/wiki/Cross_compiler
https://en.wikipedia.org/wiki/Debian_build_toolchain
https://en.wikipedia.org/wiki/DevOps_toolchain
https://en.wikipedia.org/wiki/GNU_toolchain
https://en.wikipedia.org/wiki/LLVM
