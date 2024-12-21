# Figure shit out

- trap inheritance

set -o functrace, set -T
set -o errtrace, set -E
set -o histexpand, set -H
set -o xtrace, set -x

READLINE_LINE READLINE_MARK READLINE_POINT
BASH_XTRACEFD


invo`c`ation → invo`k`ed
mimi`c` → mimic`k`ing

* `set -o errtrace`, `set -E`
If set, any trap on ERR is inherited by shell functions, command substitutions, and commands executed in a subshell environment. The ERR trap is normally not inherited in such cases.


command subst `$(cat file)` can be replaced by faster `$(< file)`
