# Functions :: Exporting functions

Bash stores exported function definitions as environment variables.

'export foo' will not export the function 'foo', 
`export -f foo` must be used.

'declare -x foo' will not export the function 'foo', 
`declare -fx foo` must be used, or `declare -Fx foo`.

To check if a function is really exported use:

```bash
( bash -c 'printenv; echo ${!BASH_FUNC_@}' )

# output:
BASH_FUNC_prn%%=() {  echo "$1"
}
BASH_FUNC_print%%=() {  echo $1
}
BASH_FUNC_pr%%=() {  echo $1
}
BASH_FUNC_println%%=() {  echo -n $1
}
```

Exported functions get an alias in the new environment: `BASH_FUNC_FNAME%%` where `FNAME` is the function's original name. This is in order to conform to a KEY=VALUE pair that all environment variables must have. Thus, the value of key, e.g. `BASH_FUNC_prn%%` is pressumably `(){ echo "$1"; }`.

`printenv` will actually also print functions marked for export in the current environment (no need to invoke printenv in a subshell). These functions will appear with the strange prefix, `BASH_FUNC_<FNAME>%%`.

* Can we then explicitly construct a key=value pair:

    BASH_FUNC_bar%%='() { echo abc; }'

No.

But temporarily augmenting the environment works:

```bash
env 'BASH_FUNC_foobar%%=() { echo pwd lol; }' env | grep BASH

env 'BASH_FUNC_foobar%%=() { echo pwd lol; }' printenv

env 'BASH_FUNC_foobar%%=() { pwd; }' bash -c 'printenv; foobar; '

# This insterestingly works:
# 'baz' fn is defined inline here and passed as temporary env augmentation
# to bash process which can then refer to this function 'baz' by name `baz`.
# And 'printenv' also confirms its existence, but as 'BASH_FUNC_baz%%'.
env 'BASH_FUNC_baz%%=() { echo -n pwd is:; pwd; }' bash -c 'printenv; baz; '
# ...(snip)...
# BASH_FUNC_baz%%=() {  echo -n pwd is:;
#  pwd
# }
# pwd is:/home/ivan
```


Messing around:

```bash
# regular fn format
zzz() { echo "arg: $1"; }

# fn-as-var format
zzz='() { echo "arg: $1"; }'
# OK

# fn-as-prefixed-var format
BASH_FUNC_zzz%%='() { echo "arg: $1"; }'
# ERROR: BASH_FUNC_zzz%%=() { echo "arg: $1"; }: command not found
```

## shellshock

https://unix.stackexchange.com/questions/157381/when-was-the-shellshock-cve-2014-6271-7169-bug-introduced-and-what-is-the-pat/157495#157495

https://unix.stackexchange.com/questions/157329/what-does-env-x-command-bash-do-and-why-is-it-insecure

https://seclists.org/oss-sec/2014/q3/att-693/variables-affix.patch


shows "vulnerable", you're still vulnerable: 
`env xx='() { echo vulnerable; }' bash -c xx`
