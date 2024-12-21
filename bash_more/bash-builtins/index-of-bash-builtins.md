# Index :: Bash Builtins

## Classification of bash builtins

Bash builtins
- by origin
  - Bourne shell builtins (sh)
  - Bash builtins (bash)
  - POSIX Special buitins
  - POSIX Intrinsic buitins
- by purpose
  - History
  - Job Control
  - Programmable completion (Readline)
  - Directory stack and navigation (dir)
  - Shell language (lang)
  - Shell configuration (config)
  - Controlling resources (res)
  - Command-related (cmd)

## Table 1

Name      | Origin | Purpose
----------|--------|-------------------------------------
alias     | bash   | cmd
unalias   | bash   | cmd
builtin   | bash   | cmd, controlling command precedence
command   | bash   | cmd, controlling command precedence
enable    | bash   | cmd, bash builtins
help      | bash   | cmd, bash builtins
type      | bash   | cmd
hash      | sh     | cmd
exit      | sh     | res
logout    | bash   | res
exec      | sh     | res
times     | sh     | res
trap      | sh     | res
umask     | sh     | res
ulimit    | bash   | res
fc        | bash   | history
history   | bash   | history
caller    | bash   | lang
declare   | bash   | lang, var
typeset   | bash   | lang, var
local     | bash   | lang, var
export    | sh     | lang, var
readonly  | sh     | lang, var
echo      | bash   | lang
printf    | bash   | lang
let       | bash   | lang
read      | bash   | lang
mapfile   | bash   | lang
readarray | bash   | lang
source    | bash   | lang
`.`       | sh     | lang
`:`       | sh     | lang
`[`       | sh     | lang
test      | sh     | lang
break     | sh     | shell language
continue  | sh     | lang
return    | sh     | lang
eval      | sh     | lang
getopts   | sh     | lang
shift     | sh     | lang
unset     | sh     | lang
true      | bash   | lang
false     | bash   | lang
set       | bash   | config
shopt     | bash   | config
cd        | sh     | dir
pwd       | sh     | dir
dirs      | bash   | dir
popd      | bash   | dir
pushd     | bash   | dir
bg        | bash   | jobs
fg        | bash   | jobs
disown    | bash   | jobs
jobs      | bash   | jobs
kill      | bash   | jobs
suspend   | bash   | jobs
wait      | bash   | jobs
bind      | bash   | completion
complete  | bash   | completion
compgen   | bash   | completion
compopt   | bash   | completion

## Table 2

Builtin   | Origin | Executable  | Alias       | Notes
----------|--------|-------------|-------------|---------------
:         | Bourne |             | true        |
.         | Bourne |             | source      |
[         | Bourne | /bin/[      | test        |
alias     |        |             |             |
bg        |        |             |             |
bind      |        |             |             |
break     | Bourne |             |             |
builtin   |        |             |             |
caller    |        |             |             |
cd        | Bourne |             |             |
command   |        |             |             |
compgen   |        |             |             |
complete  |        |             |             |
compopt   |        |             |             |
continue  | Bourne |             |             |
declare   |        |             |             |
dirs      |        |             |             |
disown    |        |             |             |
echo      |        |             |             |
enable    |        |             |             |
eval      | Bourne |             |             |
exec      | Bourne |             |             |
exit      | Bourne |             |             |
export    | Bourne |             |             |
false     |        |             |             |
fc        |        |             |             |
fg        |        |             |             |
getopts   | Bourne |             |             |
hash      | Bourne |             |             |
help      |        |             |             |
history   |        |             |             |
jobs      |        |             |             |
kill      |        |             |             |
let       |        |             |             |
local     |        |             |             |
logout    |        |             |             |
mapfile   |        |             |             |
popd      |        |             |             |
printf    |        |             |             |
pushd     |        |             |             |
pwd       | Bourne |             |             |
read      |        |             |             |
readarray |        |             |             |
readonly  | Bourne |             |             |
return    | Bourne |             |             |
set       |        |             |             |
shift     | Bourne |             |             |
shopt     |        |             |             |
source    |        |             |             |
suspend   |        |             |             |
test      | Bourne |             | test        |
times     | Bourne |             |             |
trap      | Bourne |             |             |
true      |        |             |             |
type      |        |             |             |
typeset   |        |             |             |
ulimit    |        |             |             |
umask     | Bourne |             |             |
unalias   |        |             |             |
unset     | Bourne |             |             |
wait      |        |             |             |




## POSIX Special Builtins

The following 14 builtins are designated as special builtins by POSIX:

    break       :          .         continue
    eval        exec       exit      export
    readonly    return     set       shift
    trap        unset

https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_15

## POSIX Intrinsic Builtins

The following 16 builtins are designated as intrinsic builtins by POSIX

    alias         bg            cd          fc
    fg            command       getopts     hash
    jobs          kill          read        type
    ulimit        umask         unalias     wait

https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap01.html#tag_18_07


## Index of all builtins

- .
- :
- [
- alias
- bg
- bind
- break
- builtin
- caller
- cd
- command
- compgen
- complete
- compopt
- continue
- declare
- dirs
- disown
- echo
- enable
- eval
- exec
- exit
- export
- false
- fc
- fg
- getopts
- hash
- help
- history
- jobs
- kill
- let
- local
- logout
- mapfile
- popd
- printf
- pushd
- pwd
- read
- readarray
- readonly
- return
- set
- shift
- shopt
- source
- suspend
- test
- times
- trap
- true
- type
- typeset
- ulimit
- umask
- unalias
- unset
- wait


## Index of Bash builtins

Builtins in bash v.5.1.16

```bash
.
:
[
alias
bg
bind
break
builtin
caller
cd
command
compgen
complete
compopt
continue
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
fg
getopts
hash
help
history
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
set
shift
shopt
source
suspend
test
times
trap
true
type
typeset
ulimit
umask
unalias
unset
wait
```


## Bash builtins

GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)

These shell commands are defined internally. 
Type `help` to see this list. 
Type `help NAME` to find out more about the command NAME. 
Use `info bash` to find out more about the shell in general. 
Use `man -k` or `info` to find out more about commands not in this list. 

An asterisk next to a name means the builtin is disabled. 
Builtins can be disabled with the `disable` builtin, e.g. 
`disable disable` is a sensible command.

## The help builtin

job_spec [&]
(( expression ))
. filename [arguments]
:
[ arg... ]
[[ expression ]]
alias [-p] [name[=value] ... ]
bg [job_spec ...]
bind [-lpsvPSVX] [-m keymap] [-f filename] [-q name] [-u name] [-r keyseq] [-x keyseq:sh>
break [n]
builtin [shell-builtin [arg ...]]
caller [expr]
case WORD in [PATTERN [| PATTERN]...) COMMANDS ;;]... esac
cd [-L|[-P [-e]] [-@]] [dir]
command [-pVv] command [arg ...]
compgen [-abcdefgjksuv] [-o option] [-A action] [-G globpat] [-W wordlist] [-F function]>
complete [-abcdefgjksuv] [-pr] [-DEI] [-o option] [-A action] [-G globpat] [-W wordlist]>
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
mapfile [-d delim] [-n count] [-O origin] [-s count] [-t] [-u fd] [-C callback] [-c qua>
popd [-n] [+N | -N]
printf [-v var] format [arguments]
pushd [-n] [+N | -N | dir]
pwd [-LP]
read [-ers] [-a array] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt] [-t tim>
readarray [-d delim] [-n count] [-O origin] [-s count] [-t] [-u fd] [-C callback] [-c q>
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



## Classification of builtins

- .
- :
- [
+ alias
- bg
+ bind
- break
+ builtin
+ caller
- cd
+ command
- compgen
- complete
- compopt
- continue
+ declare
- dirs
- disown
+ echo
+ enable
- eval
- exec
- exit
- export
- false
- fc
- fg
- getopts
- hash
+ help
- history
- jobs
- kill
+ let
+ local
+ logout
+ mapfile
- popd
+ printf
- pushd
- pwd
+ read
+ readarray
- readonly
- return
- set
- shift
- shopt
+ source
- suspend
- test
- times
- trap
- true
+ type
+ typeset
+ ulimit
- umask
+ unalias
- unset
- wait
