# Commands

## Basic commands in Linux

Commands that change the current shell environment must be implemented as shell builtins. For example, `cd` cannot be an external command.


file system
  inode
  file name
  file suffix
  path
  path component
  file system navigation, `cd`
  absolute path
  relative path
    /home/user/work/../.ssh
  current dir (..), `cd ..`
  parent dir (.)
  hidden items (.name)
  `pwd`
  `cd`
  `ls`
  `pushd`, `popd`, (cd -)
  `ln`
    symlinks
    hardlinks
- `cat`
- `man`
  - apropos
  - whatis

cp
mv
rm
grep
find
diff
wc (word count)
tar

* Shell-specific
* bash-specific builtions
  - history
  - redirecting
  - piping
  - tab completion in bash via *readline*

`make` - Makefiles to build the programs
`gcc` - compiling programs
`gdb` - debigger



Filesystem commands
  - bash builtins
    - cd
    - popd
    - pushd
    - CDPATH

Getting information
- which
- 

Help system
- help - display information about bash builtins
- man
  - apropos
  - whatis
- info (emacs help system)

Pages
- less
- more
- most
- using vim as pager

File editors
- nano
- vim
- emacs

File managers
- ranger
- mc


## bash builtins

{job_spec} [&]
(( … ))
[ … ]
{ … }
( … )
$( … )
[[ … ]]
.

source
alias
bg {job_spec}
bind
break
builtin
caller
case
cd
command
compgen
complete
compopt
continue
coproc
declare
dirs
disown
echo
enable
eval
exec
exit
export
false
fc
fg {job_spec}
for
for
function
getopts
hash
help
history
if
jobs
kill
let
local
logout
mapfile
popd
printf
pushd
pwd
read
readarray
readonly
return
select
set
shift
shopt
source
suspend
test
time
times
trap
true
type
typeset
ulimit
umask
unalias
unset
until
variables
wait
while

fc - Display or execute commands from the history list



```
help

job_spec [&]
(( expression ))
. filename [arguments]
:
[ arg... ]
[[ expression ]]
alias [-p] [name[=value] ... ]
bg [job_spec ...]
bind [-lpsvPSVX] [-m keymap] [-f filename] [-q name] [-u name] [-r keyseq] [-x keyseq:shell-command] [>
break [n]
builtin [shell-builtin [arg ...]]
caller [expr]
case WORD in [PATTERN [| PATTERN]...) COMMANDS ;;]... esac
cd [-L|[-P [-e]] [-@]] [dir]
command [-pVv] command [arg ...]
compgen [-abcdefgjksuv] [-o option] [-A action] [-G globpat] [-W wordlist] [-F function] [-C command] >
complete [-abcdefgjksuv] [-pr] [-DEI] [-o option] [-A action] [-G globpat] [-W wordlist] [-F function]>
compopt [-o|+o option] [-DEI] [name ...]
continue [n]
coproc [NAME] command [redirections]
declare [-aAfFgiIlnrtux] [-p] [name[=value] ...]
dirs [-clpv] [+N] [-N]
disown [-h] [-ar] [jobspec ... | pid ...]
echo [-neE] [arg ...]
enable [-a] [-dnps] [-f filename] [name ...]
eval [arg ...]
exec [-cl] [-a name] [command [argument ...]] [redirection ...]
exit [n]
export [-fn] [name[=value] ...] or export -p
false
fc [-e ename] [-lnr] [first] [last] or fc -s [pat=rep] [command]
fg [job_spec]
for NAME [in WORDS ... ] ; do COMMANDS; done
for (( exp1; exp2; exp3 )); do COMMANDS; done
function name { COMMANDS ; } or name () { COMMANDS ; }
getopts optstring name [arg ...]
hash [-lr] [-p pathname] [-dt] [name ...]
help [-dms] [pattern ...]

history [-c] [-d offset] [n] or history -anrw [filename] or history -ps arg [arg...]
if COMMANDS; then COMMANDS; [ elif COMMANDS; then COMMANDS; ]... [ else COMMANDS; ] fi
jobs [-lnprs] [jobspec ...] or jobs -x command [args]
kill [-s sigspec | -n signum | -sigspec] pid | jobspec ... or kill -l [sigspec]
let arg [arg ...]
local [option] name[=value] ...
logout [n]
mapfile [-d delim] [-n count] [-O origin] [-s count] [-t] [-u fd] [-C callback] [-c quantum] [array]
popd [-n] [+N | -N]
printf [-v var] format [arguments]
pushd [-n] [+N | -N | dir]
pwd [-LP]
read [-ers] [-a array] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt] [-t timeout] [-u fd] >
readarray [-d delim] [-n count] [-O origin] [-s count] [-t] [-u fd] [-C callback] [-c quantum] [arra>
readonly [-aAf] [name[=value] ...] or readonly -p
return [n]
select NAME [in WORDS ... ;] do COMMANDS; done
set [-abefhkmnptuvxBCHP] [-o option-name] [--] [arg ...]
shift [n]
shopt [-pqsu] [-o] [optname ...]
source filename [arguments]
suspend [-f]
test [expr]
time [-p] pipeline
times
trap [-lp] [[arg] signal_spec ...]
true
type [-afptP] name [name ...]
typeset [-aAfFgiIlnrtux] [-p] name[=value] ...
ulimit [-SHabcdefiklmnpqrstuvxPT] [limit]
umask [-p] [-S] [mode]
unalias [-a] name [name ...]
unset [-f] [-v] [-n] [name ...]
until COMMANDS; do COMMANDS; done
variables - Names and meanings of some shell variables
wait [-fn] [-p var] [id ...]
while COMMANDS; do COMMANDS; done
{ COMMANDS ; }
```
