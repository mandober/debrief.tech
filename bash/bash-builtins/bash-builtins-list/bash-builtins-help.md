# help

`help` - display information about builtin commands.

```bash
help --help

help [-dms] [PAT …]

help << DESC
  Displays brief summaries of builtin commands.
  If PATTERN is specified, gives detailed help
  on all commands matching PATTERN,
  otherwise the list of help topics is printed.
DESC

help << OPTIONS
  -d     Output short description for each topic.
  -m     Display usage in pseudo-manpage format.
  -s     Output only a short usage synopsis for each topic matching PATTERN.
OPTIONS

help << ARGS
  PAT   Pattern specifying a help topic
ARGS


help << EXIT_STATUS
  Returns success unless PATTERN is not found or an invalid option is given.
EXIT_STATUS
```


## help

These shell commands are defined internally to
GNU bash, version 5.0.17(1)-release (x86_64-pc-linux-gnu)
- Type 'help' to see this list.
- Type 'help name' to find out more about the function 'name'.
- Use 'info bash' to find out more about the shell in general.
- Use 'man -k' or 'info' to find out more about commands not in this list.
- A star (*) next to a name means that the command is disabled.

```bash
help

# BUILTINS

## STATIC BUILTINS

:       exit_status is true, alias for `true`
true    exit_status is true
false   exit_status is false
# These are not like comments because the input is still processed with possible side-effect executed. Below, the assignment will go on:
: ${x:=42}

## SYMBOLIC BUILTINS

. FILENAME [ARGS]     : alias to `source`
(( EXP ))
[[ EXP ]]
[ ARG … ]
{ COMMANDS ; }


alias [-p] [name[=value] … ]
bg [job_spec …]
bind [-lpsvPSVX] [-m keymap] [-f filename] [-q name] [-u name] [-r keyseq] [-x >
break [n]
builtin [shell-builtin [arg …]]
caller [expr]
cd [-L|[-P [-e]] [-@]] [dir]
command [-pVv] command [arg …]
compgen [-abcdefgjksuv] [-o option] [-A action] [-G globpat] [-W wordlist]  [-F>
complete [-abcdefgjksuv] [-pr] [-DEI] [-o option] [-A action] [-G globpat] [-W >
compopt [-o|+o option] [-DEI] [name …]
coproc [NAME] command [redirections]
dirs [-clpv] [+N] [-N]
disown [-h] [-ar] [jobspec … | pid …]
echo [-neE] [arg …]
enable [-a] [-dnps] [-f filename] [name …]
eval [arg …]
exec [-cl] [-a name] [command [args …]] [redirection …]
exit [n]

fc [-e ename] [-lnr] [first] [last] or fc -s [pat=rep] [command]
fg [job_spec]
getopts optstring name [arg]
hash [-lr] [-p pathname] [-dt] [name …]
help [-dms] [pattern …]
history [-c] [-d offset] [n] or history -anrw [filename] or history -ps arg [a>
job_spec [&]
jobs [-lnprs] [jobspec …] or jobs -x command [args]
kill [-s sigspec | -n signum | -sigspec] pid | jobspec … or kill -l [sigspe>
let arg [arg …]
logout [n]
mapfile [-d delim] [-n count] [-O origin] [-s count] [-t] [-u fd] [-C callback>
popd [-n] [+N | -N]
printf [-v var] format [args]
pushd [-n] [+N | -N | dir]
pwd [-LP]
read [-ers] [-a array] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt>
readarray [-d delim] [-n count] [-O origin] [-s count] [-t] [-u fd] [-C callba>
set [-abefhkmnptuvxBCHP] [-o option-name] [--] [arg …]
shopt [-pqsu] [-o] [optname …]
source filename [args]
suspend [-f]
test [expr]
times
trap [-lp] [[arg] signal_spec …]
type [-afptP] name [name …]
ulimit [-SHabcdefiklmnpqrstuvxPT] [limit]
umask [-p] [-S] [mode]
unalias [-a] name [name …]
unset [-f] [-v] [-n] [name …]
wait [-fn] [id …]
variables - Names and meanings of some shell variables

continue [n]
case WORD in [PATTERN [| PATTERN]…) COMMANDS ;;]… esac
declare [-aAfFgilnrtux] [-p] [name[=value] …]
export [-fn] [name[=value] …] or export -p
for NAME [in WORDS … ] ; do COMMANDS; done
for (( exp1; exp2; exp3 )); do COMMANDS; done
function name { COMMANDS ; } or name () { COMMANDS ; }
if COMMANDS; then COMMANDS; [ elif COMMANDS; then COMMANDS; ]… [ else COMMAN>
local [option] name[=value] …
readonly [-aAf] [name[=value] …] or readonly -p
return [n]
select NAME [in WORDS … ;] do COMMANDS; done
shift [n]
time [-p] pipeline
typeset [-aAfFgilnrtux] [-p] name[=value] …
until COMMANDS; do COMMANDS; done
while COMMANDS; do COMMANDS; done
```


## help variables

variables - Names and meanings of some shell variables

```bash
$ help variables

# Common shell variable names and usage:

HISTFILE
# The name of the file where your command history is stored.
HISTSIZE
# The max number of history lines that a running shell can access.
HISTFILESIZE
# The max number of lines this file can contain.
HISTIGNORE
# A colon-separated list of patterns used to decide which commands should be saved on the history list.
histchars
# Characters controlling history expansion and quick substitution.
# The first character is the history substitution character, usually '!'.
# The second is the 'quick substitution' character, usually '^'.
# The third is the 'history comment' character, usually '#'.

auto_resume
# Non-null means a command word appearing on a line by itself is first looked for in the list of currently stopped jobs. If found there, that job is foregrounded. A value of 'exact' means that the command word must exactly match a command in the list of stopped jobs. A value of 'substring' means that the command word must match a substring of the job. Any other value means that the command must be a prefix of a stopped job.

SHELLOPTS
# A colon-separated list of enabled shell options.

GLOBIGNORE
# A colon-separated list of filename patterns to ignore when expanding paths.

IGNOREEOF
# Controls the shell action when the EOF char is received as the only input.
# If set, it is the number of EOF chars in a row before shell exits.
# If unset, EOF signifies the end of input.
# Default is 10.

TIMEFORMAT
# The output format for timing statistics shown by the 'time' reserved word.

BASH_VERSION
# Version information for this Bash.

PWD
# The full pathname of the current directory.
HOME
# The complete pathname to your login directory.
PATH
# A colon-separated list of dirs to search when looking for commands.
CDPATH
# A colon-separated list of dirs to search for dirs when args to 'cd'.

PS1
# The primary prompt string.
PS2
# The secondary prompt string.
PROMPT_COMMAND
# Command to execute before printing the primary prompt.

MAILCHECK
# How often, in seconds, Bash checks for new mail.
MAILPATH
# A colon-separated list of filenames which Bash checks for new mail.

TERM
# The name of the current terminal type.
HOSTNAME
# The name of the current host.

OSTYPE
# The version of Unix this version of Bash is running on.
MACHTYPE
# A string describing the current system Bash is running on.
HOSTTYPE
# The type of CPU this version of Bash is running under.
```
