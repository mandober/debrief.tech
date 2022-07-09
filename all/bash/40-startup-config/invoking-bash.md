Invoking Bash


bash [long-opt] [-ir] [-abefhkmnptuvxdBCDHP] [-o option] [-O shopt_option] [argument ...]
bash [long-opt] [-abefhkmnptuvxdBCDHP] [-o option] [-O shopt_option] -c string [argument ...]
bash [long-opt] -s [-abefhkmnptuvxdBCDHP] [-o option] [-O shopt_option] [argument ...]

All of the single-character options used with the set builtin (see section 4.3.1 The Set Builtin) can be used as options when the shell is invoked. In addition, there are several multi-character options that you can use. These options must appear on the command line before the single-character options to be recognized.

--debugger
    Arrange for the debugger profile to be executed before the shell starts. Turns on extended debugging mode (see 4.3.2 The Shopt Builtin for a description of the extdebug option to the shopt builtin).

--dump-po-strings
    A list of all double-quoted strings preceded by `$' is printed on the standard output in the GNU gettext PO (portable object) file format. Equivalent to `-D' except for the output format.

--dump-strings
    Equivalent to `-D'.

--help
    Display a usage message on standard output and exit successfully.

--init-file filename
--rcfile filename
    Execute commands from filename (instead of `~/.bashrc') in an interactive shell.

--login
    Equivalent to `-l'.

--noediting
    Do not use the GNU Readline library (see section 8. Command Line Editing) to read command lines when the shell is interactive.

--noprofile
    Don't load the system-wide startup file `/etc/profile' or any of the personal initialization files `~/.bash_profile', `~/.bash_login', or `~/.profile' when Bash is invoked as a login shell.

--norc
    Don't read the `~/.bashrc' initialization file in an interactive shell. This is on by default if the shell is invoked as sh.

--posix
    Change the behavior of Bash where the default operation differs from the POSIX standard to match the standard. This is intended to make Bash behave as a strict superset of that standard. See section 6.11 Bash POSIX Mode, for a description of the Bash POSIX mode.

--restricted
    Make the shell a restricted shell (see section 6.10 The Restricted Shell).

--verbose
    Equivalent to `-v'. Print shell input lines as they're read.

--version
    Show version information for this instance of Bash on the standard output and exit successfully. 



There are several single-character options that may be supplied at invocation which are not available with the set builtin.

-c
Read and execute commands from the first non-option argument after processing the options, then exit. 
Any remaining arguments are assigned to the positional parameters, starting with $0.

-i
Force the shell to run interactively. Interactive shells are described in 6.3 Interactive Shells.

-l
Make this shell act as if it had been directly invoked by login. When the shell is interactive, this is equivalent to starting a login shell with `exec -l bash'. When the shell is not interactive, the login shell startup files will be executed. `exec bash -l' or `exec bash --login' will replace the current shell with a Bash login shell. See section 6.2 Bash Startup Files, for a description of the special behavior of a login shell.

-r
 Make the shell a restricted shell (see section 6.10 The Restricted Shell).

-s
If this option is present, or if no arguments remain after option processing, then commands are read from the standard input. This option allows the positional parameters to be set when invoking an interactive shell.

-D
A list of all double-quoted strings preceded by `$' is printed on the standard output. These are the strings that are subject to language translation when the current locale is not C or POSIX (see section 3.1.2.5 Locale-Specific Translation). This implies the `-n' option; no commands will be executed.

[-+]O [shopt_option]
shopt_option is one of the shell options accepted by the shopt builtin (see section 4.3.2 The Shopt Builtin). If shopt_option is present, `-O' sets the value of that option; `+O' unsets it. If shopt_option is not supplied, the names and values of the shell options accepted by shopt are printed on the standard output. If the invocation option is `+O', the output is displayed in a format that may be reused as input.

-- 
A -- signals the end of options and disables further option processing. Any arguments after the -- are treated as filenames and arguments. 

A login shell is one whose first character of argument zero is `-', or one invoked with the `--login' option.

An interactive shell is one started without non-option arguments, unless `-s' is specified, without specifying the `-c' option, and whose input and output are both connected to terminals (as determined by isatty(3)), or one started with the `-i' option. See section 6.3 Interactive Shells, for more information.

If arguments remain after option processing, and neither the `-c' nor the `-s' option has been supplied, the first argument is assumed to be the name of a file containing shell commands (see section 3.8 Shell Scripts). When Bash is invoked in this fashion, $0 is set to the name of the file, and the positional parameters are set to the remaining arguments. Bash reads and executes commands from this file, then exits. Bash's exit status is the exit status of the last command executed in the script. If no commands are executed, the exit status is 0.