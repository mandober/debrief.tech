# Names of variables

Names of shell variables conform to the naming rules of identifiers, which are common to many programing languages.

The identifier rule may be specified as a regular expression: 
    [a-zA-Z_][a-zA-Z0-9_]


- names of functions
- names of exported functions, `BASH_FUNC%%()` (?)

(It seems impossible to fuck with the naming restriction. I've tried quoting, escaping, strange Unicode characters, but no dice)

`BASH_FUNC_foo%%` environment variable (where `foo` is the function being exported).

`${!BASH_FUNC_@}`

`declare -x srcall` still shows as `-f srcall`
`declare -Fx srcall` makes it show as `-Fx srcall`

## Exporting functions

Seems a function is not exported with `export foo` only with `declare -Fx foo`?

A function `srcall` defined as:

```bash
srcall () {
  local srcdir=${1:-$HOME/bash.d/bashrc}
 if [[ -d $srcdir ]]; then
   echo "the dir exists"
 else
   echo "the dir no existas"
 fi
 for file in $srcdir/*; do
   echo "$file"
 done
}
```

and exported by `export srcall`, 

`( bash -c 'printenv; echo ${!BASH_FUNC_@}' )`

in a new environment, when listed with `printenv` appears as:


```bash
BASH_FUNC_srcall%%=() {  local srcdir=${1:-$HOME/bash.d/bashrc};
 if [[ -d $srcdir ]]; then
 echo "the dir exists";
 else
 echo "the dir no existas";
 fi;
 for file in $srcdir/*;
 do
 echo "$file";
 done
}
```

print () { echo $1; }
