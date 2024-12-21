Shell variables
Bash automatically assigns default values to a number of variables.


Bourne shell variables
Bash uses certain shell variables in the same way as the Bourne shell. 
In some cases, Bash assigns a default value to the variable.
CDPATH HOME IFS MAIL MAILPATH OPTARG OPTIND PATH PS1 PS2


Bash shell variables
These variables are set or used by Bash, but other shells do not normally treat them specially.


prompt
completion
history
locale
dir
debug
builtins
PS0
PS1
PS2
PS3
PS4
PROMPT_COMMAND
PROMPT_DIRTRIM
COMP_CWORD
COMP_KEY
COMP_LINE
COMP_POINT
COMP_TYPE
COMP_WORDBREAKS
COMP_WORDS
COMPREPLY
HOSTFILE
HISTCMD
HISTCONTROL
HISTFILE
HISTIGNORE
HISTSIZE
HISTFILESIZE
HISTTIMEFORMAT
histchars
FCEDIT
LANG
LANGUAGE
LC_ALL
LC_COLLATE
LC_CTYPE
LC_MESSAGES
LC_NUMERIC
LC_MONETARY
LC_TIME
PATH
HOME

CDPATH
DIRSTACK

PWD
OLDPWD

TMPDIR
TEMP
TMP
FUNCNAME
FUNCNEST
BASH_SOURCE
BASH_COMMAND
BASH_LINENO
LINENO
BASH_XTRACEFD
BASH_ARGC
BASH_ARGV
BASH_COMPAT
PIPESTATUS
CHILD_MAX
BASH_CMDS (hash)
BASH_ALIASES (alias)

fixtures
output
shell options




EUID
UID
BASHPID
PPID
GROUPS

BASH
SHELL
BASH_EXECUTION_STRING

HOSTNAME
HOSTTYPE
MACHTYPE
OSTYPE
REPLY
MAPFILE
BASH_REMATCH
OPTARG
OPTIND
OPTERR
SHELLOPTS (set)
BASHOPTS (shopt)
$-
IFS
INPUTRC














FIGNORE
INPUTRC
EXECIGNORE













debug






BASH_VERSINFO
BASH_VERSION

BASH_LOADABLES_PATH
BASH
SHELL

BASH_ENV
ENV

BASH_SUBSHELL
SHLVL
EUID
UID
BASHPID
PPID
GROUPS

auto_resume
COPROC
CHILD_MAX
MAIL
MAILCHECK
MAILPATH


TIMEFORMAT
TMOUT
GLOBIGNORE

IGNOREEOF

RANDOM
SECONDS

POSIXLY_CORRECT
READLINE_LINE
READLINE_POINT
REPLY
MAPFILE
BASH_REMATCH

OPTARG
OPTIND
OPTERR

COLUMNS
LINES
IFS
EMACS


new in bash 4.4:
EXECIGNORE a colon-separate list of patterns that will cause matching filenames to be ignored when searching for commands.
BASH_LOADABLES_PATH variable containing a list of directories where the `enable -f' command looks for shared objects containing loadable builtins.
PS0 Expanded and displayed by interactive shells after reading a complete command but before executing it.


BASH
BASHOPTS
BASHPID
BASH_ALIASES
BASH_ARGC
BASH_ARGV
BASH_CMDS
BASH_COMMAND
BASH_EXECUTION_STRING
BASH_LINENO
BASH_LOADABLES_PATH
BASH_REMATCH
BASH_SOURCE
BASH_SUBSHELL
BASH_VERSINFO
BASH_VERSION
COPROC
EXECIGNORE
EUID
GLOBIGNORE
FUNCNAME
GROUPS
LINENO
MAPFILE
OPTARG
OPTIND
PIPESTATUS
PPID
RANDOM
READLINE_LINE
READLINE_POINT
REPLY
SECONDS
SHELLOPTS
SHLVL
UID
BASH_COMPAT
BASH_ENV
BASH_XTRACEFD
CHILD_MAX
COLUMNS
LINES
EMACS
ENV
FCEDIT
FUNCNEST
IFS
IGNOREEOF
INPUTRC
MAIL
MAILCHECK
MAILPATH
OPTERR
POSIXLY_CORRECT
SHELL
TIMEFORMAT
TMOUT
auto_resume



BASH
Expands to the full filename used to invoke this instance of bash.

BASHOPTS
A colon-separated list of enabled shell options. This variable is readonly.
(cdspell:checkwinsize:cmdhist:direxpand:dirspell:dotglob:extglob ...)
Each word in the list is a valid argument for the -s|-u option to the shopt builtin command (shopt -s word)
The options appearing in BASHOPTS are those reported as ON (ENABLED) by shopt. 
If this variable is in the environment when bash starts up, each shell option in the list will be enabled before reading any startup files. 

BASHPID
process ID of the current bash process. This differs from $$ sometimes, like in subshells that do not require bash to be re-initialized.

BASH_ALIASES
An associative array variable whose members correspond to the internal list of aliases as maintained by the alias builtin. 
Elements added to this array appear in the alias list; unsetting array elements cause aliases to be removed from the alias list.

BASH_ARGC
An array variable whose values are the number of parameters in each frame of the current bash execution call stack. 
The number of parameters to the current subroutine (shell function or script executed with source) is at the top of the stack. 
When a subroutine is executed, the number of parameters passed is pushed onto BASH_ARGC. 
The shell sets BASH_ARGC only when in extended debugging mode.

BASH_ARGV
An array variable containing all of the parameters in the current bash execution call stack. 
The final parameter of the last subroutine call is at the top of the stack; 
The first parameter of the initial call is at the bottom. 
When a subroutine is executed, the parameters supplied are pushed onto BASH_ARGV. 
The shell sets BASH_ARGV only when in extended debugging mode.

BASH_CMDS
An associative array variable whose members correspond to the internal hash table of commands as maintained by the hash builtin. 
Elements added to this array appear in the hash table; unsetting array elements cause commands to be removed from the hash table.
hash less

BASH_COMMAND
The command currently being executed or about to be executed, unless the shell is executing a
command as the result of a trap, in which case it is the command executing at the time of the trap.

BASH_EXECUTION_STRING
The command argument to the -c invocation option.

BASH_LINENO
An array variable whose members are the line numbers in source files where each corresponding member of FUNCNAME was invoked.  
  ${BASH_LINENO[$i]} is the line number in the source file (${BASH_SOURCE[$i+1]}) where ${FUNCNAME[$i]} was called
(or ${BASH_LINENO[$i-1]} if referenced within another shell function). 
Use LINENO to obtain the current line number.


BASH_LOADABLES_PATH
variable containing a list of directories where the `enable -f' command looks for shared objects containing loadable builtins.


BASH_REMATCH
An readonly array variable whose members are assigned by the =~ binary operator to the [[ conditional command. 
The element with index 0 is the portion of the string matching the entire regular expression. 
The element with index n is the portion of the string matching the nth parenthesized subexpression. 

BASH_SOURCE
An array variable whose members are the source filenames where the 
corresponding shell function names in the FUNCNAME array variable are defined. 
The shell function ${FUNCNAME[$i]} is defined in the file ${BASH_SOURCE[$i]} and called from ${BASH_SOURCE[$i+1]}.

BASH_SUBSHELL
Incremented by one within each subshell or subshell environment when the 
shell begins executing in that environment. The initial value is 0.

BASH_VERSINFO
readonly array variable whose members hold version information for this instance of bash.
The values assigned to the array members are as follows:
BASH_VERSINFO[0]    The major version number (the release).
BASH_VERSINFO[1]    The minor version number (the version).
BASH_VERSINFO[2]    The patch level.
BASH_VERSINFO[3]    The build version.
BASH_VERSINFO[4]    The release status (e.g., beta1).
BASH_VERSINFO[5]    The value of MACHTYPE.

BASH_VERSION
Expands to a string describing the version of this instance of bash.

COPROC 
An array variable created to hold the file descriptors for output from and input to an unnamed coprocess.

EXECIGNORE
a colon-separate list of patterns that will cause matching filenames to be ignored when searching for commands.


EUID
Expands to the effective user ID of the current user, initialized at shell startup. This variable is readonly.

GLOBIGNORE
A colon-separated list of patterns defining the set of filenames to be ignored by pathname expansion. 
* If a filename matched by a pathname expansion pattern also matches one of
  the patterns in GLOBIGNORE, it is removed from the list of matches.

FUNCNAME
An array variable containing the names of all shell functions currently in the execution call stack. 
* The element with index 0 is the name of any currently-executing shell function. 
* The bottom-most element (the one with the highest index) is "main". 
* This variable exists only when a shell function is executing. 
* Assignments to FUNCNAME have no effect and return an error status. 
*** If unset, it loses its special properties, even if it is subsequently reset ***

This variable can be used with BASH_LINENO and BASH_SOURCE. 
* Each element of FUNCNAME has corresponding elements in BASH_LINENO and BASH_SOURCE to describe the call stack. 
  For instance, ${FUNCNAME[$i]} was called from the file ${BASH_SOURCE[$i+1]} at line number ${BASH_LINENO[$i]}. 
  The caller builtin displays the current call stack using this information.

GROUPS 
An array variable containing the list of groups of which the current user is a member. 
Assignments to GROUPS have no effect and return an error status. 
*** If unset, it loses its special properties, even if it is subsequently reset ***

LINENO 
Each time this parameter is referenced, the shell substitutes a (decimal) number representing 
the current sequential line number (starting with 1) within a script or function. 
When not in a script or function, the value substituted is not guaranteed to be meaningful. 
*** If unset, it loses its special properties, even if it is subsequently reset ***

MAPFILE
An array variable created to hold the text read by the mapfile builtin when no variable name is supplied.

OPTARG
The value of the last option argument processed by the getopts builtin command.

OPTIND
The index of the next argument to be processed by the getopts builtin command.

PIPESTATUS
An array variable containing a list of exit status values from the processes in the 
most-recently-executed foreground pipeline (which may contain only a single command).

PPID
The process ID of the shell's parent. This variable is readonly.

RANDOM
Each time this parameter is referenced, a random integer between 0 and 32767 is generated. 
The sequence of random numbers may be initialized by assigning a value to RANDOM. 
*** If unset, it loses its special properties, even if it is subsequently reset ***

READLINE_LINE
The contents of the readline line buffer, for use with "bind -x"

READLINE_POINT
The position of the insertion point in the readline line buffer, for use with "bind -x"

REPLY
Set to the line of input read by the read builtin command when no arguments are supplied.

SECONDS
Each time this parameter is referenced, the number of seconds since shell invocation is returned. 
If a value is assigned to SECONDS, the value returned upon subsequent references is the number 
of seconds since the assignment plus the value assigned. 
*** If unset, it loses its special properties, even if it is subsequently reset ***

SHELLOPTS
A colon-separated list of enabled shell options. 
Each word in the list is a valid argument for the -o option to the set builtin command.
The options appearing in SHELLOPTS are those reported as on by set -o. 
If this variable is in the environment when bash starts up, each shell option in the list 
will be enabled before reading any startup files. This variable is readonly.
SHELLOPTS="braceexpand:emacs:hashall:histexpand:history:interactive-comments:monitor"

SHLVL 
Incremented by one each time an instance of bash is started.

UID
Expands to the user ID of the current user, initialized at shell startup. This variable is readonly.




~ ~ ~




The following variables are used by the shell. In some cases, bash assigns a default value to a variable; these cases are noted below.

BASH_COMPAT
The value is used to set the shell's compatibility level. 
See the description of the shopt builtin below under SHELL BUILTIN COMMANDS 
for a description of the various compatibility levels and their effects. 
The value may be a decimal number (e.g., 4.2) or an integer (e.g., 42) 
corresponding to the desired compatibility level. 
* If BASH_COMPAT is unset or set to the empty string, the compatibility level is set to the default for the current version. 
* If BASH_COMPAT is set to a value that is not one of the valid compatibility levels, the shell prints an error message and 
  sets the compatibility level to the default for the current version. 
The valid compatibility levels correspond to the compatibility options accepted by the shopt builtin 
(for example, compat42 means that 4.2 and 42 are valid values). The current version is also a valid value.

BASH_ENV
If set, its value (subject to parameter expansion, command substitution, and 
arithmetic expansion) is interpreted as a filename to a file that will be 
sourced in the same environment as the script about to be executed. 
BASH_ENV has to be exported and resultant filename has to be absolute.
export BASH_ENV=$HOME/pre-script-hook.bash

If this parameter is set, when bash is about to execute a shell script, its value is interpreted as a filename containing commands to initialize the shell (like ~/.bashrc but only for scripts). The value of BASH_ENV is subjected to parameter expansion, command substitution, and arithmetic expansion before being interpreted as a filename. PATH is not used to search for the resultant filename.


BASH_XTRACEFD
If set to an integer corresponding to a valid file descriptor, bash will write 
the trace output generated when set -x is enabled to that file descriptor.
* The file descriptor is closed when BASH_XTRACEFD is unset or assigned a new value. 
* Unsetting BASH_XTRACEFD or assigning it the empty string causes 
  the trace output to be sent to the standard error. 
* Note that setting BASH_XTRACEFD to 2 (the standard error file descriptor) 
  and then unsetting it will result in the standard error being closed.

CHILD_MAX
Set the number of exited child status values for the shell to remember. Bash will not allow this value to be decreased below a POSIX-mandated
minimum, and there is a maximum value (currently 8192) that this may not exceed. The minimum value is system-dependent.


COLUMNS
Used by the select compound command to determine the terminal width when printing selection lists. 
Automatically set if the checkwinsize option is enabled or in an interactive shell upon receipt of a SIGWINCH.


LINES 
Used by the select compound command to determine the column length for printing selection lists. 
Automatically set if the checkwinsize option is enabled or in an interactive shell upon receipt of a SIGWINCH.


EMACS 
If bash finds this variable in the environment when the shell starts with value "t", it 
assumes that the shell is running in an Emacs shell buffer and disables line editing.

ENV
Similar to BASH_ENV; used when the shell is invoked in POSIX mode.

FCEDIT 
The default editor for the fc builtin command.

FUNCNEST
If set to a numeric value greater than 0, defines a maximum function nesting level.
Function invocations that exceed this nesting level will cause the current command to abort.

IFS
The Internal Field Separator that is used for word splitting after expansion and to split lines 
into words with the read builtin command. The default value is `<space><tab><newline>'.

IGNOREEOF
Controls the action of an interactive shell on receipt of an EOF character as the sole input. 
* If set, the value is the number of consecutive EOF characters which must be 
  typed as the first characters on an input line before bash exits. 
* If the variable exists but does not have a numeric value, or has no value, the default value is 10. 
* If it does not exist, EOF signifies the end of input to the shell.

INPUTRC
The filename for the readline startup file, overriding the default of ~/.inputrc.

MAIL
If this parameter is set to a file or directory name and the MAILPATH variable is not set, 
bash informs the user of the arrival of mail in the specified file or Maildir-format directory.

MAILCHECK
Specifies how often (in seconds) bash checks for mail. 
* The default is 60 seconds. 
* When it is time to check for mail, the shell does so before displaying the primary prompt. 
* If this variable is unset, or set to a value that is not a number greater than or equal to zero, the shell disables mail checking.

MAILPATH
A colon-separated list of filenames to be checked for mail. 
* The message to be printed when mail arrives in a particular file may be specified by separating 
  the filename from the message with a ?. 
* When used in the text of the message, $_ expands to the name of the current mailfile.
  Example:
  MAILPATH='/var/mail/bfox?"You have mail":~/shell-mail?"$_ has mail!"'
* Bash supplies a default value for this variable, but the location of the user mail 
  files that it uses is system dependent (e.g., /var/mail/$USER).

OPTERR
If set to the value 1, bash displays error messages generated by the getopts builtin command. 
OPTERR is initialized to 1 each time the shell is invoked or a shell script is executed.


POSIXLY_CORRECT
If this variable is in the environment when bash starts, the shell enters posix mode before 
reading the startup files, as if the --posix invocation option had been supplied. 
If it is set while the shell is running, bash enables posix mode, as if the command set -o posix had been executed.


SHELL
The full pathname to the shell is kept in this environment variable. 
If it is not set when the shell starts, bash assigns to it the full pathname of the current user's login shell.

TIMEFORMAT
The value of this parameter is used as a format string specifying how the timing 
information for pipelines prefixed with the time reserved word should be displayed.
* The % character introduces an escape sequence that is expanded to a time value or other information. 
* The escape sequences and their meanings are as follows (the braces denote optional portions):
       %%    		A literal %
       %[p][l]R 		The elapsed time in seconds
       %[p][l]U 	The number of CPU seconds spent in user mode
       %[p][l]S 	The number of CPU seconds spent in system mode
       %P    		The CPU percentage, computed as (%U + %S) / %R

* The optional p is a digit specifying the precision, the number of fractional digits after a decimal point. 
  - A value of 0 causes no decimal point or fraction to be output
  - At most 3 places after the decimal point may be specified
  - values of p greater than 3 are changed to 3.
  - If p is not specified, the value 3 is used.

* The optional l specifies a longer format, including minutes, of the form MMmSS.FFs 
  The value of p determines whether or not the fraction is included.

* If this variable is not set, bash acts as if it had the value $'\nreal\t%3lR\nuser\t%3lU\nsys\t%3lS'
* If the value is null, no timing information is displayed
* A trailing newline is added when the format string is displayed


TIMEFORMAT=$'\nreal\t%3lR\nuser\t%3lU\nsys\t%3lS'
time somescript.sh
real    0m5.966s
user    0m1.620s
sys     0m4.100s

TIMEFORMAT=$'\nreal\t%3lR\nuser\t%3lU\nsyst\t%3lS\nCPU%%\t%P'
time somescript.sh
real    0m2.628s
user    0m0.706s
sys     0m1.740s
CPU     93.07


TMOUT 
If set to a value greater than zero, TMOUT is treated as the default timeout for the read builtin. 
The select command terminates if input does not arrive after TMOUT seconds when input is coming from a terminal. 
In an interactive shell, the value is interpreted as the number of seconds to wait for a line of input after issuing the primary prompt. 
Bash terminates after waiting for that number of seconds if a complete line of input does not arrive.



auto_resume
This variable controls how the shell interacts with the user and job control. 
If this variable is set, single word simple commands without redirections are treated as candidates for resumption of an existing stopped job.
There is no ambiguity allowed: if there is more than one job beginning with the string typed, the job most recently accessed is selected. 
The name of a stopped job, in this context, is the command line used to start it.
- if set to the value exact, the string supplied must match the name of a stopped job exactly
- if set to substring, the string supplied needs to match a substring of the name of a stopped job
  The substring value provides functionality analogous to the %? job identifier. 
- if set to any other value, the supplied string must be a prefix of a stopped job's name; 
  this provides functionality analogous to the %string job identifier.

