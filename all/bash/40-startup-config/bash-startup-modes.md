

If bash is invoked with the name sh, it tries to mimic the startup behavior of historical versions of sh as closely as possible, while conforming to the POSIX standard as well.

★ As interactive login shell, or a non-interactive shell with the --login option, 
   it first attempts to read and execute commands from /etc/profile and ~/.profile, in that order. 
   The --noprofile option may be used to inhibit this behavior. 

★ As interactive shell with the name sh, bash looks for the variable ENV, 
   expands its value if it is defined, and uses the expanded value as the 
   name of a file to read and execute. 
   Since a shell invoked as sh does not attempt to read and execute commands 
   from any other startup files, the --rcfile option has no effect. 

★ As non-interactive shell invoked with the name sh
   bash does not attempt to read any other startup files. 
   When invoked as sh, bash enters posix mode after the startup files are read.



posix mode

In posix mode, as with the --posix command line option, it follows the POSIX standard for startup files. 
In this mode, interactive shells expand the ENV variable and commands are read and 
executed from the file whose name is the expanded value. No other startup files are read.


Bash POSIX Mode

This will cause Bash to conform more closely to the POSIX standard by changing the 
behavior to match that specified by POSIX in areas where the Bash default differs:

* Starting Bash with the --posix command-line option (bash --posix) or 
* executing set -o posix while Bash is running 
* If POSIXLY_CORRECT variable is in the environment when bash starts, the shell enters posix 
  mode before reading the startup files, as if the --posix invocation option had been supplied. 
* If it is set while the shell is running, bash enables posix
  mode, as if the command set -o posix had been executed.
* When invoked as sh, Bash enters POSIX mode after reading the startup files.


The following list is what's changed when POSIX mode is in effect:

☑  When a command in the hash table no longer exists, Bash will re-search PATH to find the new location. 
    This is also available with shopt -s checkhash
☑  * message printed by the job control code and builtins when a job exits with a non-zero status is Done(status)
    * message printed by the job control code and builtins when a job is stopped 
      is `Stopped(signame)', where signame is, for example, SIGTSTP.
       * bg builtin uses the required format to describe each job placed in the background, which does not include 
      an indication of whether the job is the current or previous job.
☑  Reserved words appearing in a context where reserved words are recognized do not undergo alias expansion.
☑  POSIX PS1 and PS2 expansions of `!' to the history number and `!!' to `!' are enabled, and parameter 
    expansion is performed on the values of PS1 and PS2 regardless of the setting of the promptvars option.
☑  POSIX startup files are executed (ENV) rather than the normal Bash files.
☑  Tilde expansion is only performed on assignments preceding a 
    command name, rather than on all assignment statements on the line.
☑  The command builtin does not prevent builtins that take assignment statements as arguments from 
    expanding them as assignment statements; when not in POSIX mode, assignment builtins lose their 
    assignment statement expansion properties when preceded by command.
☑  The default history file is ~/.sh_history (this is the default value of HISTFILE).
☑  The output of kill -l prints all the signal names on a single 
    line, separated by spaces, without the `SIG' prefix.
☑  The kill builtin does not accept signal names with a `SIG' prefix.
☑  Non-interactive shells exit if filename in . filename is not found.
☑  Non-interactive shells exit if a syntax error in an 
    arithmetic expansion results in an invalid expression.
☑  Non-interactive shells exit if there is a syntax error in a script read
    with the . or source builtins, or in a string processed by the eval builtin.
☑  Redirection operators do not perform filename expansion on 
    the word in the redirection unless the shell is interactive.
☑  Redirection operators do not perform word splitting on the word in the redirection.
☑  Function names must be valid shell names. 
    That is, they may not contain characters other than letters, digits, and underscores, and may not start with a digit. 
    Declaring a function with an invalid name causes a fatal syntax error in non-interactive shells.
☑  Function names may not be the same as one of the POSIX special builtins.
☑  POSIX special builtins are found before shell functions during command lookup.
☑  The time reserved word may be used by itself as a command. 
    When used in this way, it displays timing statistics for the shell and its completed children. 
    The TIMEFORMAT variable controls the format of the timing information.
☑  When parsing and expanding a ${...} expansion that appears within double quotes, single quotes are no longer 
    special and cannot be used to quote a closing brace or other special character, unless the operator is one of 
    those defined to perform pattern removal. In this case, they do not have to appear as matched pairs.
☑  The parser does not recognize time as a reserved word if the next token begins with a `-'.
☑  If a POSIX special builtin returns an error status, a non-interactive shell exits. 
    The fatal errors are those listed in the POSIX standard, and include things like 
    passing incorrect options, redirection errors, variable assignment errors for 
    assignments preceding the command name, and so on.
☑  A non-interactive shell exits with an error status if a variable assignment error occurs
    when no command name follows the assignment statements. A variable assignment error occurs, 
    for example, when trying to assign a value to a readonly variable.
☑  A non-interactive shell exits with an error status if a variable assignment error occurs in 
    an assignment statement preceding a special builtin, but not with any other simple command.
☑  A non-interactive shell exits with an error status if the iteration variable in a for statement 
    or the selection variable in a select statement is a readonly variable.
☑  Process substitution is not available.
☑  While variable indirection is available, it may not be applied to the `#' and `?' special parameters.
☑  Assignment statements preceding POSIX special builtins persist in the shell environment after the builtin completes.
☑  Assignment statements preceding shell function calls persist in the shell environment 
    after the function returns, as if a POSIX special builtin command had been executed.
☑  The export and readonly builtin commands display their output in the format required by POSIX.
☑  The trap builtin displays signal names without the leading SIG.
☑  The trap builtin doesn't check the first argument for a possible signal specification and 
    revert the signal handling to the original disposition if it is, unless that argument consists 
    solely of digits and is a valid signal number. If users want to reset the handler for a given 
    signal to the original disposition, they should use `-' as the first argument.
☑  The . and source builtins do not search the current directory
    for the filename argument if it is not found by searching PATH.
☑  Subshells spawned to execute command substitutions inherit the value of the `-e' option 
    from the parent shell. When not in POSIX mode, Bash clears the `-e' option in such subshells.
☑  Alias expansion is always enabled, even in non-interactive shells.
☑  When the alias builtin displays alias definitions, it does not display
    them with a leading `alias ' unless the `-p' option is supplied.
☑  When the set builtin is invoked without options, it does not display shell function names and definitions.
☑  When the set builtin is invoked without options, it displays variable values without quotes, 
    unless they contain shell metacharacters, even if the result contains nonprinting characters.
☑  When the cd builtin is invoked in logical mode, and the pathname constructed from $PWD and the 
    directory name supplied as an argument does not refer to an existing directory, 
    cd will fail instead of falling back to physical mode.
☑  The pwd builtin verifies that the value it prints is the same as the current directory, 
    even if it is not asked to check the file system with the `-P' option.
☑  When listing the history, the fc builtin does not include an indication 
    of whether or not a history entry has been modified.
☑  The default editor used by fc is ed.
☑  The type and command builtins will not report a non-executable file as having been found, 
    though the shell will attempt to execute such a file if it is the only so-named file found in $PATH.
☑  The vi editing mode will invoke the vi editor directly when 
    the `v' command is run, instead of checking $VISUAL and $EDITOR.
☑  When the xpg_echo option is enabled, Bash does not attempt to interpret any arguments to echo as options. 
    Each argument is displayed, after escape characters are converted.
☑  The ulimit builtin uses a block size of 512 bytes for the `-c' and `-f' options.
☑  The arrival of SIGCHLD when a trap is set on SIGCHLD does not interrupt the wait builtin and 
    cause it to return immediately. The trap command is run once for each child that exits.
☑  The read builtin may be interrupted by a signal for which a trap has been set. 
    If Bash receives a trapped signal while executing read, the trap 
    handler executes and read returns an exit status greater than 128.

There is other POSIX behavior that Bash does not implement by default even when in POSIX mode. Specifically:
☐ The fc builtin checks EDITOR as a program to edit history entries if FCEDIT is unset, 
   rather than defaulting directly to ed. fc uses ed if EDITOR is unset.
☐ As noted above, Bash requires the xpg_echo option to be enabled for the echo builtin to be fully conformant.

Bash can be configured to be POSIX-conformant by default, by
specifying the `--enable-strict-posix-default' to configure when building 


remote mode (ssh)

Bash attempts to determine when it is being run with its standard input connected to a network connection, 
as when executed by the remote shell daemon, usually rshd, or the secure shell daemon sshd.

If bash determines it is being run in this fashion, it reads and executes 
commands from ~/.bashrc, if that file exists and is readable.

It will not do this if invoked as sh.
The --norc option may be used to inhibit this behavior, 
and the --rcfile option may be used to force another file to be read, 
but neither rshd nor sshd generally invoke the shell with those options 
or allow them to be specified.



protected mode

If the shell is started with the effective user (group) id not equal 
to the real user (group) id, and the -p option is not supplied:
✔ no startup files are read
✔ shell functions are not inherited from the environment
✔ SHELLOPTS, BASHOPTS, CDPATH, and GLOBIGNORE variables are ignored
✔ effective user id is set to the real user id

bash -p
If the -p option is supplied at invocation, the startup 
behavior is the same, but the effective user id is not reset.
✔ no startup files are read
✔ shell functions are not inherited from the environment
✔ SHELLOPTS, BASHOPTS, CDPATH, and GLOBIGNORE variables are ignored
✗ effective user id is not set to the real user id


protected mode

If the shell is started with the effective user (group) id not equal 
to the real user (group) id, and the -p option is not supplied:
✔ no startup files are read
✔ shell functions are not inherited from the environment
✔ SHELLOPTS, BASHOPTS, CDPATH, and GLOBIGNORE variables are ignored
✔ effective user id is set to the real user id

bash -p
If the -p option is supplied at invocation, the startup 
behavior is the same, but the effective user id is not reset.
✔ no startup files are read
✔ shell functions are not inherited from the environment
✔ SHELLOPTS, BASHOPTS, CDPATH, and GLOBIGNORE variables are ignored
✗ effective user id is not set to the real user id
