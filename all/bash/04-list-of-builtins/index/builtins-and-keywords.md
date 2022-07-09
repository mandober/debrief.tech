# Builtins and Keywords

- Bash Builtins (bb): 61
- Bash Keywords (bk): 22


synonym pairs:
-    `test` ≈ `[`
-    `true` ≈ `:`
-  `source` ≡ `.`
- `declare` ≡ `typeset`
- `mapfile` ≡ `readarray`


word/sym    | k | cat | notes
------------|---|-----|-------------------------------------------
:           | b | mi  | "nul", always succeeds
!           | k | ops | reverts exit status
.           | k | io  | `source` synonym
[           | b | ops | `test` synonym, requires closing `]` symbol



## Index of Builtins and Keywords


:
! *kw*
.
[
[[ *kw*
]] *kw*
{ *kw*
} *kw*
alias
bg
bind
break
builtin
caller
case *kw*
cd
command
compgen
complete
compopt
continue
coproc *kw*
declare
dirs
disown
do *kw*
done *kw*
echo
elif *kw*
else *kw*
enable
esac *kw*
eval
exec
exit
export
false
fc
fg
fi *kw*
for *kw*
function *kw*
getopts
hash
help
history
if *kw*
in *kw*
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
select *kw*
set
shift
shopt
source
suspend
test
then *kw*
time *kw*
times
trap
true
type
typeset
ulimit
umask
unalias
unset
until *kw*
wait
while *kw*
