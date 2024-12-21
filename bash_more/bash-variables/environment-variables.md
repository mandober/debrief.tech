# Environment variables

**Environment variables** are shell variables marked for export using `export` builtin or `declare` builtin with the `-x` attribute.

```bash
VAR1=23
# export var using 'export' builtin
export VAR1

# add 'x' attr
declare -x VAR2
VAR2=abc

# remove export attr
declare +x VAR2
# or
export -n VAR2

set -a # or
set -o allexport
# means all vars are exported from now on
```


If Bash is started with the name 'rbash', or the '--restricted' or '-r' option is supplied at invocation, or when already running with 'set -r' or 'shopt -s restricted_shell', the shell becomes restricted. A **restricted shell** is used to set up an environment more controlled than the standard shell. In restricted mode, bash disallows setting or unsetting the values of `SHELL`, `PATH`, `HISTFILE`, `ENV`, `BASH_ENV`.
