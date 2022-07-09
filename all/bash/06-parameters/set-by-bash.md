 bash | manual

Shell Variables

bash - set by bash
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
BASH_REMATCH
BASH_SOURCE
BASH_SUBSHELL
BASH_VERSINFO
BASH_VERSION


COMP_CWORD
COMP_KEY
COMP_LINE
COMP_POINT
COMP_TYPE
COMP_WORDBREAKS
COMP_WORDS

READLINE_LINE
READLINE_POINT

OPTARG
OPTIND

PWD
OLDPWD

EXECIGNORE
GLOBIGNORE
FIGNORE

GROUPS
HOSTNAME
HOSTTYPE
MACHTYPE
OSTYPE

MAPFILE
REPLY
EUID
PPID
UID

COPROC
DIRSTACK
FUNCNAME
LINENO
PIPESTATUS
RANDOM
SECONDS
SHELLOPTS
SHLVL





The following variables are set by bash:


BASH
Expands to the full filename used to invoke this instance of bash.


BASHOPTS
A colon-separated list of enabled shell options. This variable is readonly.
(cdspell:checkwinsize:cmdhist:direxpand:dirspell:dotglob:extglob ...)
Each word in the list is a valid argument for the -s option to the shopt builtin command (shopt -s word)
The options appearing in BASHOPTS are those reported as ON (ENABLED) by shopt. 
If this variable is in the environment when bash starts up, each shell option in
the list will be enabled before reading any startup files. 


BASHPID
Expands to the process ID of the current bash process. 
This differs from $$ under certain circumstances, such as subshells that do not require bash to be re-initialized.


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
the first parameter of the initial call is at the bottom. 
When a subroutine is executed, the parameters supplied are pushed onto BASH_ARGV. 
The shell sets BASH_ARGV only when in extended debugging mode.


BASH_CMDS
An associative array variable whose members correspond to the internal hash table of commands as maintained by the hash builtin. 
Elements added to this array appear in the hash table; unsetting array elements cause commands to be removed from the hash table.


BASH_COMMAND
The command currently being executed or about to be executed, unless the shell is executing a
command as the result of a trap, in which case it is the command executing at the time of the trap.


BASH_EXECUTION_STRING
The command argument to the -c invocation option.


BASH_LINENO
An array whose members are the line numbers in source files where each corresponding member of FUNCNAME was invoked.  
${BASH_LINENO[$i]} is the line number in the source file ${BASH_SOURCE[$i+1]} where ${FUNCNAME[$i]} was called 
(or ${BASH_LINENO[$i-1]} if referenced within another shell function). 
Use LINENO to obtain the current line number.


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




COMP_CWORD
An index into $COMP_WORDS of the word containing the current cursor position. 
This variable is available only in shell functions invoked by the programmable completion facilities.

COMP_KEY
The key (or final key of a key sequence) used to invoke the current completion function.

COMP_LINE
The current command line. This variable is available only in shell functions and 
external commands invoked by the programmable completion facilities.

COMP_POINT
The index of the current cursor position relative to the beginning of the current command. 
If the current cursor position is at the end of the current command, the value of this variable is equal to ${#COMP_LINE}. 
This variable is available only in shell functions and external commands invoked by the programmable completion facilities.

COMP_TYPE
Set to an integer value corresponding to the type of completion attempted that caused a completion function to be called: TAB, for normal comple‐
tion, ?, for listing completions after successive tabs, !, for listing alternatives on partial word completion, @, to list completions if the word
is not unmodified, or %, for menu completion. This variable is available only in shell functions and external commands invoked by the program‐
mable completion facilities.

COMP_WORDBREAKS
The set of characters that the readline library treats as word separators when performing word completion. 
If COMP_WORDBREAKS is unset, it loses its special properties, even if it is subsequently reset.

COMP_WORDS
An array variable consisting of the individual words in the current command line. The line is split into words as readline would split it, using COMP_WORDBREAKS as described above. This variable is available only in shell functions invoked by the programmable completion facilities.




COPROC 
An array variable created to hold the file descriptors for output from and input to an unnamed coprocess.


DIRSTACK
An array variable containing the current contents of the directory stack. 
Directories appear in the stack in the order they are displayed by the dirs builtin. 
Assigning to members of this array variable may be used to modify 
directories already in the stack, but the pushd and popd builtins must be used
to add and remove directories. Assignment to this variable will not change the current directory.
* If DIRSTACK is unset, it loses its special properties, even if it is subsequently reset.


EUID
Expands to the effective user ID of the current user, initialized at shell startup. This variable is readonly.


EXECIGNORE
A colon-separated list of extended glob patterns.
* Files with full paths matching one of these patterns are not considered executable for 
  the purposes of completion and PATH searching, but the [, [[, and test builtins are not affected. 
* Use this variable to deal with systems that set the executable bit on files that are not actually executable.


GLOBIGNORE
A colon-separated list of patterns defining the set of filenames to be ignored by pathname expansion. 
* If a filename matched by a pathname expansion pattern also matches one of
  the patterns in GLOBIGNORE, it is removed from the list of matches.


FIGNORE
A colon-separated list of suffixes to ignore when performing filename completion. 
* A filename whose suffix matches one of the entries in FIGNORE is excluded from the list of matched filenames. 
  A sample value is .o:~


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


HOSTNAME
Automatically set to the name of the current host.


HOSTTYPE
Automatically set to a string that uniquely describes the type of 
machine on which bash is executing. The default is system-dependent.


LINENO 
Each time this parameter is referenced, the shell substitutes a decimal number representing 
the current sequential line number (starting with 1) within a script or function. 
* When not in a script or function, the value substituted is not guaranteed to be meaningful. 
* If unset, it loses its special properties, even if it is subsequently reset!


MACHTYPE
Automatically set to a string that fully describes the system type on which bash is executing, 
in the standard GNU cpu-company-system format. The default is system-dependent.


MAPFILE
An array variable created to hold the text read by the mapfile builtin when no variable name is supplied.


OLDPWD
The previous working directory as set by the cd command.




OPTARG
The value of the last option argument processed by the getopts builtin command.


OPTIND
The index of the next argument to be processed by the getopts builtin command.


OSTYPE
Automatically set to a string that describes the operating system 
on which bash is executing. The default is system-dependent.




PIPESTATUS
An array variable containing a list of exit status values from the processes in the 
most-recently-executed foreground pipeline (which may contain only a single command).


PPID
The process ID of the shell's parent. This variable is readonly.


PWD
The current working directory as set by the cd command.


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


SHLVL 
Incremented by one each time an instance of bash is started.


UID
Expands to the user ID of the current user, initialized at shell startup. 
This variable is readonly.



