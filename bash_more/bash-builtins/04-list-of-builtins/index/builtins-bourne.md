# Bourne Builtins

compgen    ProgrammableCompletion
complete   ProgrammableCompletion
compopt    ProgrammableCompletion

jobs       JobControl
fg         JobControl
bg         JobControl
kill       JobControl
wait       JobControl
suspend    JobControl
disown     JobControl

set        Configuration
shopt      Configuration

fc         History
history    History

dirs       DirStack
popd       DirStack
pushd      DirStack
cd         (sh builtin)
pwd        (sh builtin)

alias      (bash builtin)
unalias    (bash builtin)

enable     (bash builtin)
builtin    (bash builtin)
command    (bash builtin)
type       (bash builtin)
hash       (sh builtin)

declare    (bash builtin)  typeset    (bash builtin)
readonly   (sh builtin)
local      (bash builtin)
export     (sh builtin)
unset      (sh builtin)

echo       (bash builtin)
printf     (bash builtin)

read       (bash builtin)
readarray  (bash builtin)
mapfile    (bash builtin)

trap       (sh builtin)
umask      (sh builtin)
ulimit     (bash builtin)

.          (sh builtin)  source     (bash builtin)
exec       (sh builtin)

return     (sh builtin)
exit       (sh builtin)
continue   (sh builtin)
break      (sh builtin)
logout     (bash builtin)

shift      (sh builtin)
getopts    (sh builtin)

[          (sh builtin)
test       (sh builtin)

bind       (bash builtin)
caller     (bash builtin)

eval       (sh builtin)
times      (sh builtin)
:          (sh builtin)

let        (bash builtin)
help       (bash builtin)
