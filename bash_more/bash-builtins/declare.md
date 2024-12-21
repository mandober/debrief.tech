# declare

- name: declare
- alias: typeset
- origin: Bourne shell

declare [-aAfFgiIlnrtux] [-p] [name[=value] ...]

Set variable values and attributes.

Declare variables and give them attributes. If no NAMEs are given, display the attributes and values of all variables.

## Declaring variables

Bash builtins that affect variables (string, integer, ref, function, array)
- declare (typeset)
- export
- readonly
- unset


## Options

-p        display the attributes and value of each NAME

-f        restrict display (action) to *function definitions*
-F        restrict display to *function names*. 
          If debug ios on: line number and source file of fns' definition

-g        create a global var when used inside function; else ignored

-I        if creating a *local variable*, inherit the attributes and value 
          of a variable with the same name at a previous scope

## Options which set attributes

-a        to make NAMEs indexed arrays (if supported)
-A        to make NAMEs associative arrays (if supported)
-i        to make NAMEs have the `integer' attribute
-l        to convert the value of each NAME to lower case on assignment
-n        make NAME a reference to the variable named by its value
-r        to make NAMEs readonly
-t        to make NAMEs have the `trace' attribute
-u        to convert the value of each NAME to upper case on assignment
-x        to make NAMEs export

## Details

Using `+' instead of `-' turns off the given attribute.

Variables with the integer attribute have arithmetic evaluation (see the `let' command) performed when the variable is assigned a value.

When used in a function, `declare' makes NAMEs local, as with the `local' command.  The `-g' option suppresses this behavior.

## Exit Status
Returns success unless an invalid option is supplied or a variable
assignment error occurs.


## Lists

declare [aAfFgiIlnrtux]

a  indexed array
A  associated array
f  functions (name and definition)
F  functions (name only)
g  global variables (inside functions)

i  vars with integer attribute
n  vars with reference attribute
l  vars with lowercase attribute
u  vars with uppercase attribute
r  vars with readonly attribute
t  vars with traced attribute
x  vars with export attribute
I  vars with inherit attribute

`declare -I`
When creating a local variable, inherit the attributes and value of a variable with the same name at a previous scope.
