# Variables






- vars may be declared explicitly, using `declare`
- vars may be declared implicitly on assignment, `x=4`
- var data types
  - string
  - integer, `-i`
  - indexed array, `-a`
  - associative array, `-A`
- var attributes
  - readonly, `-r`: once enabled cannot be disabled
  - nameref, `-n`: enables indirection (without the bang symbol: `${!x}`)
  - *global*, `-g` (only within a function)
  - *local*: keywords: `local` or `declare` (only within a function)
  - *export*: `export` keyword, `-x` attribute
- string var attr:
  - `-l`  convert var's value to *lower case* on assignment
  - `-u`  convert var's value to *upper case* on assignment


Query:
- `-p`  display the attributes and value of each NAME
- `-f`  display function names and definitions
- `-F`  display function names only

Notes
- Using + (instead of -) turns off the given attribute, if permitted.
- var with `-i` have arithmetic evaluation context on assignment
- in a function, `declare` declares a *local var* (same as `local` builtin)
- `-g` attr makes a var in a func *global var*


Exit Status:
Returns success unless an invalid option is supplied or a variable
assignment error occurs


## L-value and R-value
Since everything in bash is a string, there needs to be a way to discern between literal strings and variables. Unlike majority of programming languages that require strings to appear inside quotes, bash, being a command interpreter, cannot impose such restrictions without severly hurting usability.

Big problem with this approach is the difficulty to tell whether a word on the command line represents itself (literal string) or something else (alias, function, bash keyword, builtin, program, FS object).

This is why variable references need the dollar sign prefix, which informs bash that we want the variable's value. The dollar sigil in prefix position, with a variabe's name wrapped in braces are sufficiant markers to make the variable distinguishable, even when immediately surrounded with strings.



in bash strings may appear unqouted. Since bash is the command interpreter first and a programming language second, most of interaction with bash happens by typing text in the command line, so it would be very tedious if users were made to quote each and every strings.



we need a sigil (the dollar sign) to indicate that we want a variable's value, that is, we expect bash to perform variable expansion, producing a r-value (variable's value) given a l-value (variable's name).




## Indirect reference

There are 3 ways to indirectly reference a variable:
1. nameref, `declare -n func_name=$1`
2. bang operator, `"${!var}"`
3. using eval, `eval y=\$$x`


Indirect referencing with `eval` is a longer process:
- a variable named `x` is directly referenced as `$x`
- referencing the reference: `$$x`
- must escape the first dollar: `\$$x`
- finally, force re-eval of expr to assign it: `eval y=\$$x`
