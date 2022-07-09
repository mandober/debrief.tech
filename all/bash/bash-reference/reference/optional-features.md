---
downloaded:       2021-12-20
page-url:         https://www.gnu.org/software/bash/manual/html_node/Optional-Features.html#Optional-Features
page-title:       Optional Features (Bash Reference Manual)
article-title:    Optional Features (Bash Reference Manual)
---
# Optional Features (Bash Reference Manual)

Optional Features (Bash Reference Manual)
---

### 10.8 Optional Features

The Bash `configure` has a number of \--enable-feature options, where feature indicates an optional part of Bash. There are also several \--with-package options, where package is something like ‘bash-malloc’ or ‘purify’. To turn off the default use of a package, use \--without-package. To configure Bash without a feature that is enabled by default, use \--disable-feature.

Here is a complete list of the \--enable- and \--with- options that the Bash `configure` recognizes.

`--with-afs`

Define if you are using the Andrew File System from Transarc.

`--with-bash-malloc`

Use the Bash version of `malloc` in the directory lib/malloc. This is not the same `malloc` that appears in GNU libc, but an older version originally derived from the 4.2 BSD `malloc`. This `malloc` is very fast, but wastes some space on each allocation. This option is enabled by default. The NOTES file contains a list of systems for which this should be turned off, and `configure` disables this option automatically for a number of systems.

`--with-curses`

Use the curses library instead of the termcap library. This should be supplied if your system has an inadequate or incomplete termcap database.

`--with-gnu-malloc`

A synonym for `--with-bash-malloc`.

`--with-installed-readline[=PREFIX]`

Define this to make Bash link with a locally-installed version of Readline rather than the version in lib/readline. This works only with Readline 5.0 and later versions. If PREFIX is `yes` or not supplied, `configure` uses the values of the make variables `includedir` and `libdir`, which are subdirectories of `prefix` by default, to find the installed version of Readline if it is not in the standard system include and library directories. If PREFIX is `no`, Bash links with the version in lib/readline. If PREFIX is set to any other value, `configure` treats it as a directory pathname and looks for the installed version of Readline in subdirectories of that directory (include files in PREFIX/`include` and the library in PREFIX/`lib`).

`--with-libintl-prefix[=PREFIX]`

Define this to make Bash link with a locally-installed version of the libintl library instead ofthe version in lib/intl.

`--with-libiconv-prefix[=PREFIX]`

Define this to make Bash look for libiconv in PREFIX instead of the standard system locations. There is no version included with Bash.

`--enable-minimal-config`

This produces a shell with minimal features, close to the historical Bourne shell.

There are several \--enable- options that alter how Bash is compiled, linked, and installed, rather than changing run-time features.

`--enable-largefile`

Enable support for [large files][1] if the operating system requires special compiler options to build programs which can access large files. This is enabled by default, if the operating system provides large file support.

`--enable-profiling`

This builds a Bash binary that produces profiling information to be processed by `gprof` each time it is executed.

`--enable-separate-helpfiles`

Use external files for the documentation displayed by the `help` builtin instead of storing the text internally.

`--enable-static-link`

This causes Bash to be linked statically, if `gcc` is being used. This could be used to build a version to use as root’s shell.

The ‘minimal-config’ option can be used to disable all of the following options, but it is processed first, so individual options may be enabled using ‘enable-feature’.

All of the following options except for ‘disabled-builtins’, ‘direxpand-default’, ‘strict-posix-default’, and ‘xpg-echo-default’ are enabled by default, unless the operating system does not provide the necessary support.

`--enable-alias`

Allow alias expansion and include the `alias` and `unalias` builtins (see [Aliases][2]).

`--enable-arith-for-command`

Include support for the alternate form of the `for` command that behaves like the C language `for` statement (see [Looping Constructs][3]).

`--enable-array-variables`

Include support for one-dimensional array shell variables (see [Arrays][4]).

`--enable-bang-history`

Include support for `csh`\-like history substitution (see [History Interaction][5]).

`--enable-brace-expansion`

Include `csh`\-like brace expansion ( `b{a,b}c` → `bac bbc` ). See [Brace Expansion][6], for a complete description.

`--enable-casemod-attributes`

Include support for case-modifying attributes in the `declare` builtin and assignment statements. Variables with the uppercase attribute, for example, will have their values converted to uppercase upon assignment.

`--enable-casemod-expansion`

Include support for case-modifying word expansions.

`--enable-command-timing`

Include support for recognizing `time` as a reserved word and for displaying timing statistics for the pipeline following `time` (see [Pipelines][7]). This allows pipelines as well as shell builtins and functions to be timed.

`--enable-cond-command`

Include support for the `[[` conditional command. (see [Conditional Constructs][8]).

`--enable-cond-regexp`

Include support for matching POSIX regular expressions using the ‘\=~’ binary operator in the `[[` conditional command. (see [Conditional Constructs][9]).

`--enable-coprocesses`

Include support for coprocesses and the `coproc` reserved word (see [Pipelines][10]).

`--enable-debugger`

Include support for the bash debugger (distributed separately).

`--enable-dev-fd-stat-broken`

If calling `stat` on /dev/fd/N returns different results than calling `fstat` on file descriptor N, supply this option to enable a workaround. This has implications for conditional commands that test file attributes.

`--enable-direxpand-default`

Cause the `direxpand` shell option (see [The Shopt Builtin][11]) to be enabled by default when the shell starts. It is normally disabled by default.

`--enable-directory-stack`

Include support for a `csh`\-like directory stack and the `pushd`, `popd`, and `dirs` builtins (see [The Directory Stack][12]).

`--enable-disabled-builtins`

Allow builtin commands to be invoked via ‘builtin xxx’ even after `xxx` has been disabled using ‘enable -n xxx’. See [Bash Builtins][13], for details of the `builtin` and `enable` builtin commands.

`--enable-dparen-arithmetic`

Include support for the `((…))` command (see [Conditional Constructs][14]).

`--enable-extended-glob`

Include support for the extended pattern matching features described above under [Pattern Matching][15].

`--enable-extended-glob-default`

Set the default value of the extglob shell option described above under [The Shopt Builtin][16] to be enabled.

`--enable-function-import`

Include support for importing function definitions exported by another instance of the shell from the environment. This option is enabled by default.

`--enable-glob-asciirange-default`

Set the default value of the globasciiranges shell option described above under [The Shopt Builtin][17] to be enabled. This controls the behavior of character ranges when used in pattern matching bracket expressions.

`--enable-help-builtin`

Include the `help` builtin, which displays help on shell builtins and variables (see [Bash Builtins][18]).

`--enable-history`

Include command history and the `fc` and `history` builtin commands (see [Bash History Facilities][19]).

`--enable-job-control`

This enables the job control features (see [Job Control][20]), if the operating system supports them.

`--enable-multibyte`

This enables support for multibyte characters if the operating system provides the necessary support.

`--enable-net-redirections`

This enables the special handling of filenames of the form `/dev/tcp/host/port` and `/dev/udp/host/port` when used in redirections (see [Redirections][21]).

`--enable-process-substitution`

This enables process substitution (see [Process Substitution][22]) if the operating system provides the necessary support.

`--enable-progcomp`

Enable the programmable completion facilities (see [Programmable Completion][23]). If Readline is not enabled, this option has no effect.

`--enable-prompt-string-decoding`

Turn on the interpretation of a number of backslash-escaped characters in the `$PS0`, `$PS1`, `$PS2`, and `$PS4` prompt strings. See [Controlling the Prompt][24], for a complete list of prompt string escape sequences.

`--enable-readline`

Include support for command-line editing and history with the Bash version of the Readline library (see [Command Line Editing][25]).

`--enable-restricted`

Include support for a *restricted shell*. If this is enabled, Bash, when called as `rbash`, enters a restricted mode. See [The Restricted Shell][26], for a description of restricted mode.

`--enable-select`

Include the `select` compound command, which allows the generation of simple menus (see [Conditional Constructs][27]).

`--enable-single-help-strings`

Store the text displayed by the `help` builtin as a single string for each help topic. This aids in translating the text to different languages. You may need to disable this if your compiler cannot handle very long string literals.

`--enable-strict-posix-default`

Make Bash POSIX\-conformant by default (see [Bash POSIX Mode][28]).

`--enable-usg-echo-default`

A synonym for `--enable-xpg-echo-default`.

`--enable-xpg-echo-default`

Make the `echo` builtin expand backslash-escaped characters by default, without requiring the \-e option. This sets the default value of the `xpg_echo` shell option to `on`, which makes the Bash `echo` behave more like the version specified in the Single Unix Specification, version 3. See [Bash Builtins][29], for a description of the escape sequences that `echo` recognizes.

The file config-top.h contains C Preprocessor ‘#define’ statements for options which are not settable from `configure`. Some of these are not meant to be changed; beware of the consequences if you do. Read the comments associated with each definition for more information about its effect.

---

[1]: http://www.unix.org/version2/whatsnew/lfs20mar.html
[2]: https://www.gnu.org/software/bash/manual/html_node/Aliases.html
[3]: https://www.gnu.org/software/bash/manual/html_node/Looping-Constructs.html
[4]: https://www.gnu.org/software/bash/manual/html_node/Arrays.html
[5]: https://www.gnu.org/software/bash/manual/html_node/History-Interaction.html
[6]: https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html
[7]: https://www.gnu.org/software/bash/manual/html_node/Pipelines.html
[8]: https://www.gnu.org/software/bash/manual/html_node/Conditional-Constructs.html
[9]: https://www.gnu.org/software/bash/manual/html_node/Conditional-Constructs.html
[10]: https://www.gnu.org/software/bash/manual/html_node/Pipelines.html
[11]: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
[12]: https://www.gnu.org/software/bash/manual/html_node/The-Directory-Stack.html
[13]: https://www.gnu.org/software/bash/manual/html_node/Bash-Builtins.html
[14]: https://www.gnu.org/software/bash/manual/html_node/Conditional-Constructs.html
[15]: https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html
[16]: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
[17]: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
[18]: https://www.gnu.org/software/bash/manual/html_node/Bash-Builtins.html
[19]: https://www.gnu.org/software/bash/manual/html_node/Bash-History-Facilities.html
[20]: https://www.gnu.org/software/bash/manual/html_node/Job-Control.html
[21]: https://www.gnu.org/software/bash/manual/html_node/Redirections.html
[22]: https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html
[23]: https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion.html
[24]: https://www.gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html
[25]: https://www.gnu.org/software/bash/manual/html_node/Command-Line-Editing.html
[26]: https://www.gnu.org/software/bash/manual/html_node/The-Restricted-Shell.html
[27]: https://www.gnu.org/software/bash/manual/html_node/Conditional-Constructs.html
[28]: https://www.gnu.org/software/bash/manual/html_node/Bash-POSIX-Mode.html
[29]: https://www.gnu.org/software/bash/manual/html_node/Bash-Builtins.html
