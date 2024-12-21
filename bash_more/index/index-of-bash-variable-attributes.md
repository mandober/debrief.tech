# Bash :: Attributes of variables

Variables may be assigned none, one or more attributes which affect the type of the variable and its value.

By default, variables, like shell words, are typeless, i.e. they are strings if anything.

When declaring a variable using the `declare` builtin, we may assign it some attributes.


A declared or defined variable

Attributes that affect variable's type
- `-i` attribute makes variable only accept integers

Attributes (-linuxAcart)



- type: scalar (-) OR indexed (a) OR assoc. array (A).
- casing: uppercase (u), lowercase (l), titlecase (c).
- other: integer (i), ref (n), export (x), readonly (r), trace (t).


Attributes: `-aAinrtxluc` `-fFIg`

- a  indexed array
- A  associative array
- i  integer
- r  readonly
- n  reference (nameref)

t  trace
x  export
I  

l  lowercase
u  UPPERCASE
c  Title case

g  global


-f  restrict action or display to function names and definitions
-F  restrict display to function names only (plus line number and
    source file when debugging)
-g  create global variables when used in a shell function; otherwise ignored
-I  if creating a local variable, inherit the attributes and value
    of a variable with the same name at a previous scope
-p  display the attributes and value of each NAME

Using `+' instead of `-' turns off the given attribute.

Variables with the integer attribute have arithmetic evaluation (see
the `let' command) performed when the variable is assigned a value.

When used in a function, `declare' makes NAMEs local, as with the `local'
command.  The `-g' option suppresses this behavior.

declare
export
readonly
local

Variable declaration

declare NAME

## Exporting

- set -k
- declare a variable and mark it for export: `declare -x NAME`
- export an already defined variable: `export NAME`
- unexport a variable (remove -x attribute): `export -n NAME`
- unexport a variable (remove -x attribute): `declare +x NAME`

- mark variables which are modified or created for export. This exports all mentioned variables in a file. State it at the top of the file.
  - `set -a`
  - `set -o allexport`
