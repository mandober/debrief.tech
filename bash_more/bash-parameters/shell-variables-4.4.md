Shell variables

* <var-env>           variable environmentalis
* <var-bash>          variable managed by bash
* <var-special>       variable managed by bash that has special props
* <var-ro>            variable with read-only (-r) attribute
* <var-nameref>       variable with nameref (-n) attribute
* <var-trace>         variable with trace (-x) attribute
* <var-array>	   	    variable binding an array
* <var-assoc>         variable binding an associative array (-A)
* <var-indexed>       variable binding an indexed array (-a)
* <var-int>           variable holding an integer (-i)
* <var-string>        variable holding a string
* <var-csl>           variable holding a colon-separated list (string)




A-B (21)

auto_resume
BASH
BASH_ALIASES
BASH_ARGC
BASH_ARGV
BASH_CMDS
BASH_COMMAND
BASH_COMPAT
BASH_ENV
BASH_EXECUTION_STRING
BASH_LINENO
BASH_LOADABLES_PATH
BASH_REMATCH
BASH_SOURCE
BASH_SUBSHELL
BASH_VERSINFO
BASH_VERSION
BASH_XTRACEFD
BASHOPTS
BASHPID



auto_resume
This variable controls how the shell interacts with the user and job control. If this variable is set, single word simple commands
without redirections are treated as candidates for resumption of an existing stopped job. There is no ambiguity allowed; if there
is more than one job beginning with the string typed, the job most recently accessed is selected. The name of a stopped job, in
this context, is the command line used to start it. If set to the value exact, the string supplied must match the name of a
stopped job exactly; if set to substring, the string supplied needs to match a substring of the name of a stopped job. The sub‐
string value provides functionality analogous to the %? job identifier (see JOB CONTROL below). If set to any other value, the
supplied string must be a prefix of a stopped job's name; this provides functionality analogous to the %string job identifier.


BASH
Expands to the full filename used to invoke this instance of bash.
<set by bash>

BASH_ALIASES
An associative array variable whose members correspond to the internal list of aliases as maintained by the alias builtin.
Elements added to this array appear in the alias list; however, unsetting array elements currently does not cause aliases to be
removed from the alias list. If BASH_ALIASES is unset, it loses its special properties, even if it is subsequently reset.
<set by bash>

BASH_ARGC
An array variable whose values are the number of parameters in each frame of the current bash execution call stack. The number of
parameters to the current subroutine (shell function or script executed with . or source) is at the top of the stack. When a sub‐
routine is executed, the number of parameters passed is pushed onto BASH_ARGC. The shell sets BASH_ARGC only when in extended
debugging mode (see the description of the extdebug option to the shopt builtin below)
<set by bash>

BASH_ARGV
An array variable containing all of the parameters in the current bash execution call stack. The final parameter of the last sub‐
routine call is at the top of the stack; the first parameter of the initial call is at the bottom. When a subroutine is executed,
the parameters supplied are pushed onto BASH_ARGV. The shell sets BASH_ARGV only when in extended debugging mode (see the descrip‐
tion of the extdebug option to the shopt builtin below)
<set by bash>

BASH_CMDS
An associative array variable whose members correspond to the internal hash table of commands as maintained by the hash builtin.
Elements added to this array appear in the hash table; however, unsetting array elements currently does not cause command names to
be removed from the hash table. If BASH_CMDS is unset, it loses its special properties, even if it is subsequently reset.
<set by bash>

BASH_COMMAND
The command currently being executed or about to be executed, unless the shell is executing a 
command as the result of a trap, in which case it is the command executing at the time of the trap.
<set by bash>

BASH_COMPAT
The value is used to set the shell's compatibility level. See the description of the shopt builtin below under SHELL BUILTIN COM‐
MANDS for a description of the various compatibility levels and their effects. The value may be a decimal number (e.g., 4.2) or an
integer (e.g., 42) corresponding to the desired compatibility level. If BASH_COMPAT is unset or set to the empty string, the com‐
patibility level is set to the default for the current version. If BASH_COMPAT is set to a value that is not one of the valid com‐
patibility levels, the shell prints an error message and sets the compatibility level to the default for the current version. The
valid compatibility levels correspond to the compatibility options accepted by the shopt builtin described below (for example, com‐
pat42 means that 4.2 and 42 are valid values). The current version is also a valid value.

BASH_ENV
If this parameter is set when bash is executing a shell script, its value is interpreted as a filename containing commands to ini‐
tialize the shell, as in ~/.bashrc. The value of BASH_ENV is subjected to parameter expansion, command substitution, and arith‐
metic expansion before being interpreted as a filename. PATH is not used to search for the resultant filename.

BASH_EXECUTION_STRING
The command argument to the -c invocation option.
<set by bash>

BASH_LINENO
An array variable whose members are the line numbers in source files where each corresponding member of FUNCNAME was invoked.
${BASH_LINENO[$i]} is the line number in the source file (${BASH_SOURCE[$i+1]}) where ${FUNCNAME[$i]} was called (or
${BASH_LINENO[$i-1]} if referenced within another shell function). Use LINENO to obtain the current line number.
<set by bash>

BASH_LOADABLES_PATH
A colon-separated list of directories in which the shell looks for dynamically loadable builtins specified by the enable command.
<set by bash>

BASH_REMATCH
An array variable whose members are assigned by the =~ binary operator to the [[ conditional command. The element with index 0 is
the portion of the string matching the entire regular expression. The element with index n is the portion of the string matching
the nth parenthesized subexpression. This variable is read-only.
<set by bash>

BASH_SOURCE
An array variable whose members are the source filenames where the corresponding shell function names in the FUNCNAME array vari‐
able are defined. The shell function ${FUNCNAME[$i]} is defined in the file ${BASH_SOURCE[$i]} and called from
${BASH_SOURCE[$i+1]}.
<set by bash>

BASH_SUBSHELL
Incremented by 1 within each subshell or subshell environment when 
bash begins executing in that environment. The initial value is 0.
<set by bash>


BASH_VERSINFO
A readonly array variable whose members hold version information for this instance of bash. The values assigned to the array mem‐
bers are as follows:
BASH_VERSINFO[0] The major version number (the release).
BASH_VERSINFO[1] The minor version number (the version).
BASH_VERSINFO[2] The patch level.
BASH_VERSINFO[3] The build version.
BASH_VERSINFO[4] The release status (e.g., beta1).
BASH_VERSINFO[5] The value of MACHTYPE.
BASH_VERSION
Expands to a string describing the version of this instance of bash.
<set by bash>

BASH_VERSION
Expands to a string describing the version of this instance of bash.


BASH_XTRACEFD
If set to an integer corresponding to a valid file descriptor, bash will write the trace output generated when set -x is enabled to
that file descriptor. The file descriptor is closed when BASH_XTRACEFD is unset or assigned a new value. Unsetting BASH_XTRACEFD
or assigning it the empty string causes the trace output to be sent to the standard error. Note that setting BASH_XTRACEFD to 2
(the standard error file descriptor) and then unsetting it will result in the standard error being closed.


BASHOPTS
A colon-separated list of enabled shell options. Each word in the list is a valid argument for the -s option to the shopt builtin
command (see SHELL BUILTIN COMMANDS below). The options appearing in BASHOPTS are those reported as on by shopt. If this variable
is in the environment when bash starts up, each shell option in the list will be enabled before reading any startup files. This
variable is read-only.
<set by bash>

BASHPID
Expands to the process ID of the current bash process. This differs from $$ under 
certain circumstances, such as subshells that do not require bash to be re-initialized.
<set by bash>



C (12)

CDPATH
CHILD_MAX
COLUMNS
COMP_CWORD
COMP_KEY
COMP_LINE
COMP_POINT
COMP_TYPE
COMP_WORDBREAKS
COMP_WORDS
COMPREPLY
COPROC


CDPATH 
The search path for the cd command. This is a colon-separated list of directories in which the 
shell looks for destination directories specified by the cd command. A sample value is ".:~:/usr".

CHILD_MAX
Set the number of exited child status values for the shell to remember. Bash will not allow this value to be decreased below a
POSIX-mandated minimum, and there is a maximum value (currently 8192) that this may not exceed. The minimum value is system-dependent.

COLUMNS
Used by the select compound command to determine the terminal width when printing selection lists. Automatically set if the check‐
winsize option is enabled or in an interactive shell upon receipt of a SIGWINCH.

COMP_CWORD
An index into ${COMP_WORDS} of the word containing the current cursor position. This variable is available only in shell functions
invoked by the programmable completion facilities (see Programmable Completion below).
<set by bash>

COMP_KEY
The key (or final key of a key sequence) used to invoke the current completion function.
<set by bash>

COMP_LINE
The current command line. This variable is available only in shell functions and external commands invoked by the programmable
completion facilities (see Programmable Completion below).
<set by bash>

COMP_POINT
The index of the current cursor position relative to the beginning of the current command. If the current cursor position is at
the end of the current command, the value of this variable is equal to ${#COMP_LINE}. This variable is available only in shell
functions and external commands invoked by the programmable completion facilities (see Programmable Completion below).
<set by bash>

COMP_TYPE
Set to an integer value corresponding to the type of completion attempted that caused a completion function to be called: TAB, for
normal completion, ?, for listing completions after successive tabs, !, for listing alternatives on partial word completion, @, to
list completions if the word is not unmodified, or %, for menu completion. This variable is available only in shell functions and
external commands invoked by the programmable completion facilities (see Programmable Completion below).
<set by bash>

COMP_WORDBREAKS
The set of characters that the readline library treats as word separators when performing word completion. If COMP_WORDBREAKS is
unset, it loses its special properties, even if it is subsequently reset.
<set by bash>

COMP_WORDS
An array variable (see Arrays below) consisting of the individual words in the current command line. The line is split into words
as readline would split it, using COMP_WORDBREAKS as described above. This variable is available only in shell functions invoked
by the programmable completion facilities (see Programmable Completion below).
<set by bash>

COMPREPLY
An array variable from which bash reads the possible completions generated by a shell function invoked by the programmable comple‐
tion facility (see Programmable Completion below). Each array element contains one possible completion.

COPROC
An array variable (see Arrays below) created to hold the file descriptors for output from and input to an unnamed coprocess (see
Coprocesses above).
<set by bash>



D-G





DIRSTACK
An array variable (see Arrays below) containing the current contents of the directory stack. Directories appear in the stack in
the order they are displayed by the dirs builtin. Assigning to members of this array variable may be used to modify directories
already in the stack, but the pushd and popd builtins must be used to add and remove directories. Assignment to this variable will
not change the current directory. If DIRSTACK is unset, it loses its special properties, even if it is subsequently reset.
<set by bash>



EMACS 
If bash finds this variable in the environment when the shell starts with value "t", it assumes that the shell is running in an
Emacs shell buffer and disables line editing.

ENV
Similar to BASH_ENV; used when the shell is invoked in POSIX mode.

EUID 
Expands to the effective user ID of the current user, initialized at shell startup. This variable is readonly.
<set by bash>

EXECIGNORE
A colon-separated list of shell patterns (see Pattern Matching) defining the list of filenames to be ignored by command search
using PATH. Files whose full pathnames match one of these patterns are not considered executable files for the purposes of comple‐
tion and command execution via PATH lookup. This does not affect the behavior of the [, test, and [[ commands. Full pathnames in
the command hash table are not subject to EXECIGNORE. Use this variable to ignore shared library files that have the executable
bit set, but are not executable files. The pattern matching honors the setting of the extglob shell option.



FCEDIT 
The default editor for the fc builtin command.

FIGNORE
A colon-separated list of suffixes to ignore when performing filename completion (see READLINE below). A filename whose suffix
matches one of the entries in FIGNORE is excluded from the list of matched filenames. A sample value is ".o:~".

FUNCNAME
An array variable containing the names of all shell functions currently in the execution call stack. 
The element with index 0 is the name of any currently-executing shell function.
The bottom-most element (the one with the highest index) is "main". 
This variable exists only when a shell function is executing.
Assignments to FUNCNAME have no effect. 
If FUNCNAME is unset, it loses its special properties, even if it is subsequently reset.
This variable can be used with BASH_LINENO and BASH_SOURCE. 
Each element of FUNCNAME has corresponding elements in BASH_LINENO and BASH_SOURCE to describe the call stack. 
For instance, ${FUNCNAME[$i]} was called from the file ${BASH_SOURCE[$i+1]} at line number
${BASH_LINENO[$i]}. The caller builtin displays the current call stack using this information.
<set by bash>


FUNCNEST
If set to a numeric value greater than 0, defines a maximum function nesting level. Function [INVOCATION](#invocation)s that exceed this nesting
level will cause the current command to abort.



GLOBIGNORE
A colon-separated list of patterns defining the set of filenames to be ignored by pathname expansion. If a filename matched by a
pathname expansion pattern also matches one of the patterns in GLOBIGNORE, it is removed from the list of matches.

HISTCONTROL
A colon-separated list of values controlling how commands are saved on the history list. If the list of values includes ignores‐
pace, lines which begin with a space character are not saved in the history list. A value of ignoredups causes lines matching the
previous history entry to not be saved. A value of ignoreboth is shorthand for ignorespace and ignoredups. A value of erasedups
causes all previous lines matching the current line to be removed from the history list before that line is saved. Any value not
in the above list is ignored. If HISTCONTROL is unset, or does not include a valid value, all lines read by the shell parser are
saved on the history list, subject to the value of HISTIGNORE. The second and subsequent lines of a multi-line compound command
are not tested, and are added to the history regardless of the value of HISTCONTROL.

HISTFILE
The name of the file in which command history is saved (see HISTORY below). The default value is ~/.bash_history. If unset, the
command history is not saved when a shell exits.

HISTFILESIZE
The maximum number of lines contained in the history file. When this variable is assigned a value, the history file is truncated,
if necessary, to contain no more than that number of lines by removing the oldest entries. The history file is also truncated to
this size after writing it when a shell exits. If the value is 0, the history file is truncated to zero size. Non-numeric values
and numeric values less than zero inhibit truncation. The shell sets the default value to the value of HISTSIZE after reading any
startup files.

HISTIGNORE
A colon-separated list of patterns used to decide which command lines should be saved on the history list. Each pattern is
anchored at the beginning of the line and must match the complete line (no implicit `*' is appended). Each pattern is tested
against the line after the checks specified by HISTCONTROL are applied. In addition to the normal shell pattern matching charac‐
ters, `&' matches the previous history line. `&' may be escaped using a backslash; the backslash is removed before attempting a
match. The second and subsequent lines of a multi-line compound command are not tested, and are added to the history regardless of
the value of HISTIGNORE. The pattern matching honors the setting of the extglob shell option.

HISTSIZE
The number of commands to remember in the command history (see HISTORY below). If the value is 0, commands are not saved in the
history list. Numeric values less than zero result in every command being saved on the history list (there is no limit). The
shell sets the default value to 500 after reading any startup files.

HISTTIMEFORMAT
If this variable is set and not null, its value is used as a format string for strftime(3) to print the time stamp associated with
each history entry displayed by the history builtin. If this variable is set, time stamps are written to the history file so they
may be preserved across shell sessions. This uses the history comment character to distinguish timestamps from other history
lines.

HOME
The home directory of the current user; the default argument for the cd builtin command. The value of this variable is also used
when performing tilde expansion.

HOSTFILE
Contains the name of a file in the same format as /etc/hosts that should be read when the shell needs to complete a hostname. The
list of possible hostname completions may be changed while the shell is running; the next time hostname completion is attempted
after the value is changed, bash adds the contents of the new file to the existing list. If HOSTFILE is set, but has no value, or
does not name a readable file, bash attempts to read /etc/hosts to obtain the list of possible hostname completions. When HOSTFILE
is unset, the hostname list is cleared.

IFS 
The Internal Field Separator that is used for word splitting after expansion and to split lines into words with the read builtin
command. The default value is ``<space><tab><newline>''.

IGNOREEOF
Controls the action of an interactive shell on receipt of an EOF character as the sole input. If set, the value is the number of
consecutive EOF characters which must be typed as the first characters on an input line before bash exits. If the variable exists
but does not have a numeric value, or has no value, the default value is 10. If it does not exist, EOF signifies the end of input
to the shell.

INPUTRC
The filename for the readline startup file, overriding the default of ~/.inputrc (see READLINE below).

LANG 
Used to determine the locale category for any category not specifically selected with a variable starting with LC_.

LC_ALL 
This variable overrides the value of LANG and any other LC_ variable specifying a locale category.

LC_COLLATE
This variable determines the collation order used when sorting the results of pathname expansion, and determines the behavior of
range expressions, equivalence classes, and collating sequences within pathname expansion and pattern matching.

LC_CTYPE
This variable determines the interpretation of characters and the behavior of character classes within pathname expansion and pat‐
tern matching.

LC_MESSAGES
This variable determines the locale used to translate double-quoted strings preceded by a $.

LC_NUMERIC
This variable determines the locale category used for number formatting.

LC_TIME
This variable determines the locale category used for data and time formatting.

LINES 
Used by the select compound command to determine the column length for printing selection lists. Automatically set if the check‐
winsize option is enabled or in an interactive shell upon receipt of a SIGWINCH.

MAIL 
If this parameter is set to a file or directory name and the MAILPATH variable is not set, bash informs the user of the arrival of
mail in the specified file or Maildir-format directory.

MAILCHECK
Specifies how often (in seconds) bash checks for mail. The default is 60 seconds. When it is time to check for mail, the shell
does so before displaying the primary prompt. If this variable is unset, or set to a value that is not a number greater than or
equal to zero, the shell disables mail checking.

MAILPATH
A colon-separated list of filenames to be checked for mail. The message to be printed when mail arrives in a particular file may
be specified by separating the filename from the message with a `?'. When used in the text of the message, $_ expands to the name
of the current mailfile. Example:
MAILPATH='/var/mail/bfox?"You have mail":~/shell-mail?"$_ has mail!"'
Bash can be configured to supply a default value for this variable (there is no value by default), but the location of the user
mail files that it uses is system dependent (e.g., /var/mail/$USER).

OPTERR 
If set to the value 1, bash displays error messages generated by the getopts builtin command (see SHELL BUILTIN COMMANDS below).

OPTERR 
is initialized to 1 each time the shell is invoked or a shell script is executed.

PATH 
The search path for commands. It is a colon-separated list of directories in which the shell looks for commands (see COMMAND EXE‐
CUTION below). A zero-length (null) directory name in the value of PATH indicates the current directory. A null directory name
may appear as two adjacent colons, or as an initial or trailing colon. The default path is system-dependent, and is set by the
administrator who installs bash. A common value is ``/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin''.

POSIXLY_CORRECT
If this variable is in the environment when bash starts, the shell enters posix mode before reading the startup files, as if the
--posix [INVOCATION](#invocation) option had been supplied. If it is set while the shell is running, bash enables posix mode, as if the command
set -o posix had been executed.

PROMPT_COMMAND
If set, the value is executed as a command prior to issuing each primary prompt.

PROMPT_DIRTRIM
If set to a number greater than zero, the value is used as the number of trailing directory components to retain when expanding the
\w and \W prompt string escapes (see PROMPTING below). Characters removed are replaced with an ellipsis.
PS0 The value of this parameter is expanded (see PROMPTING below) and displayed by interactive shells after reading a command and
before the command is executed.
PS1 The value of this parameter is expanded (see PROMPTING below) and used as the primary prompt string. The default value is
``\s-\v\$ ''.
PS2 The value of this parameter is expanded as with PS1 and used as the secondary prompt string. The default is ``> ''.
PS3 The value of this parameter is used as the prompt for the select command (see SHELL GRAMMAR above).
PS4 The value of this parameter is expanded as with PS1 and the value is printed before each command bash displays during an execution
trace. The first character of PS4 is replicated multiple times, as necessary, to indicate multiple levels of indirection. The
default is ``+ ''.

SHELL 
The full pathname to the shell is kept in this environment variable. If it is not set when the shell starts, bash assigns to it
the full pathname of the current user's login shell.

TIMEFORMAT
The value of this parameter is used as a format string specifying how the timing information for pipelines prefixed with the time
reserved word should be displayed. The % character introduces an escape sequence that is expanded to a time value or other infor‐
mation. The escape sequences and their meanings are as follows; the braces denote optional portions.
%% A literal %.
%[p][l]R The elapsed time in seconds.
%[p][l]U The number of CPU seconds spent in user mode.
%[p][l]S The number of CPU seconds spent in system mode.
%P The CPU percentage, computed as (%U + %S) / %R.

The optional p is a digit specifying the precision, the number of fractional digits after a decimal point. A value of 0 causes no
decimal point or fraction to be output. At most three places after the decimal point may be specified; values of p greater than 3
are changed to 3. If p is not specified, the value 3 is used.

The optional l specifies a longer format, including minutes, of the form MMmSS.FFs. The value of p determines whether or not the
fraction is included.

If this variable is not set, bash acts as if it had the value $'\nreal\t%3lR\nuser\t%3lU\nsys\t%3lS'. If the value is null, no
timing information is displayed. A trailing newline is added when the format string is displayed.

TMOUT 
If set to a value greater than zero, TMOUT is treated as the default timeout for the read builtin. The select command terminates
if input does not arrive after TMOUT seconds when input is coming from a terminal. In an interactive shell, the value is inter‐
preted as the number of seconds to wait for a line of input after issuing the primary prompt. Bash terminates after waiting for
that number of seconds if a complete line of input does not arrive.

TMPDIR 
If set, bash uses its value as the name of a directory in which bash creates temporary files for the shell's use.

histchars
The two or three characters which control history expansion and tokenization (see HISTORY EXPANSION below). The first character is
the history expansion character, the character which signals the start of a history expansion, normally `!'. The second character
is the quick substitution character, which is used as shorthand for re-running the previous command entered, substituting one
string for another in the command. The default is `^'. The optional third character is the character which indicates that the
remainder of the line is a comment when found as the first character of a word, normally `#'. The history comment character causes
history substitution to be skipped for the remaining words on the line. It does not necessarily cause the shell parser to treat
the rest of the line as a comment.









GROUPS
An array variable containing the list of groups of which the current user is a member. Assignments to GROUPS have no effect. If
GROUPS is unset, it loses its special properties, even if it is subsequently reset.
<set by bash>

HISTCMD
The history number, or index in the history list, of the current command. If HISTCMD is unset, it loses its special properties,
even if it is subsequently reset.
<set by bash>

HOSTNAME
Automatically set to the name of the current host.
<set by bash>

HOSTTYPE
Automatically set to a string that uniquely describes the type of machine on which bash is executing. The default is system-depen‐
dent.
<set by bash>

LINENO
Each time this parameter is referenced, the shell substitutes a decimal number representing the current sequential line number
(starting with 1) within a script or function. When not in a script or function, the value substituted is not guaranteed to be
meaningful. If LINENO is unset, it loses its special properties, even if it is subsequently reset.
<set by bash>

MACHTYPE
Automatically set to a string that fully describes the system type on which bash is executing, in the standard GNU cpu-company-sys‐
tem format. The default is system-dependent.
<set by bash>

MAPFILE
An array variable (see Arrays below) created to hold the text read by the mapfile builtin when no variable name is supplied.
<set by bash>

OLDPWD
The previous working directory as set by the cd command.
<set by bash>

OPTARG
The value of the last option argument processed by the getopts builtin command (see SHELL BUILTIN COMMANDS below).
<set by bash>

OPTIND
The index of the next argument to be processed by the getopts builtin command (see SHELL BUILTIN COMMANDS below).
<set by bash>

OSTYPE
Automatically set to a string that describes the operating system on which bash is executing. The default is system-dependent.
<set by bash>

PIPESTATUS
An array variable (see Arrays below) containing a list of exit status values from the processes in the most-recently-executed fore‐
ground pipeline (which may contain only a single command).
<set by bash>

PPID
The process ID of the shell's parent. This variable is readonly.
<set by bash>

PWD 
The current working directory as set by the cd command.
<set by bash>

RANDOM 
Each time this parameter is referenced, a random integer between 0 and 32767 is generated. The sequence of random numbers may be
initialized by assigning a value to RANDOM. If RANDOM is unset, it loses its special properties, even if it is subsequently reset.
<set by bash>

READLINE_LINE
The contents of the readline line buffer, for use with "bind -x" (see SHELL BUILTIN COMMANDS below).
<set by bash>

READLINE_POINT
The position of the insertion point in the readline line buffer, for use with "bind -x" (see SHELL BUILTIN COMMANDS below).
<set by bash>

REPLY 
Set to the line of input read by the read builtin command when no arguments are supplied.
<set by bash>

SECONDS
Each time this parameter is referenced, the number of seconds since shell [INVOCATION](#invocation) is returned. If a value is assigned to SEC‐
ONDS, the value returned upon subsequent references is the number of seconds since the assignment plus the value assigned. If SEC‐
ONDS is unset, it loses its special properties, even if it is subsequently reset.
<set by bash>

SHELLOPTS
A colon-separated list of enabled shell options. Each word in the list is a valid argument for the -o option to the set builtin
command (see SHELL BUILTIN COMMANDS below). The options appearing in SHELLOPTS are those reported as on by set -o. If this vari‐
able is in the environment when bash starts up, each shell option in the list will be enabled before reading any startup files.
This variable is read-only.
<set by bash>

SHLVL 
Incremented by one each time an instance of bash is started.
<set by bash>

UID 
Expands to the user ID of the current user, initialized at shell startup. This variable is readonly.
<set by bash>
