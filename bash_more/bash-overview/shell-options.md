# Index of shopts and setopts

- setopts, `shopt -op`
- shopts: `shopt -p`

```bash
# ====================
# setopts
# ====================
set +o allexport
set -o braceexpand
set -o emacs
set +o errexit
set +o errtrace
set +o functrace
set -o hashall
set -o histexpand
set -o history
set +o ignoreeof
set -o interactive-comments
set +o keyword
set -o monitor
set +o noclobber
set +o noexec
set +o noglob
set +o nolog
set +o notify
set +o nounset
set +o onecmd
set +o physical
set +o pipefail
set +o posix
set +o privileged
set +o verbose
set +o vi
set +o xtrace

# ====================
# shopts
# ====================
shopt -u assoc_expand_once    # since v.5.0

shopt -u autocd
shopt -u cdable_vars
shopt -s cdspell
shopt -s checkhash
shopt -s checkjobs
shopt -s checkwinsize
shopt -s cmdhist
shopt -u compat31
shopt -u compat32
shopt -u compat40
shopt -u compat41
shopt -u compat42
shopt -u compat43
shopt -s complete_fullquote
shopt -u direxpand
shopt -s dirspell
shopt -s dotglob
shopt -u execfail
shopt -s expand_aliases
shopt -u extdebug
shopt -s extglob
shopt -s extquote
shopt -s failglob
shopt -s force_fignore
shopt -s globasciiranges
shopt -s globstar
shopt -u gnu_errfmt
shopt -s histappend
shopt -u histreedit
shopt -u histverify
shopt -u hostcomplete
shopt -u huponexit
shopt -u inherit_errexit
shopt -s interactive_comments
shopt -s lastpipe
shopt -u lithist
shopt -u localvar_unset       # since v.5.0
shopt -u localvar_inherit     # since v.5.0
shopt -s login_shell          # auto-set
shopt -u mailwarn
shopt -s no_empty_cmd_completion
shopt -s nocaseglob
shopt -u nocasematch
shopt -s nullglob
shopt -s progcomp
shopt -u progcomp_alias       # since v.5.0
shopt -s promptvars
shopt -u restricted_shell
shopt -u shift_verbose
shopt -s sourcepath
shopt -s xpg_echo
```
