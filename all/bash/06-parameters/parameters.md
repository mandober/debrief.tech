# Parameters

* parameter is a named value
* parameter classes: variables, positional params, special params
* variable is a parameter denoted by a name: var
* variable has a value and zero or more attributes: declare -i int=123
  Attributes are assigned using the declare builtin command.
* parameter is set if it has been assigned a value: var=abcd
* the null string is a valid value: var=
* once a variable is set, it may be unset only by using the unset builtin command: unset var
* char $ is not part of var name; when used it substitutes var name with var value.


assignment operator: =
A variable may be assigned to by a statement of the form: name=[value] i.e. declare var; var="abcd"
If value is not given, the variable is assigned the null string: var=

All values undergo expansions:
- tilde expansion ~
- parameter and variable expansion $
- command substitution $(..)
- arithmetic expansion ((..))
- quote removal ".."
* Pathname expansion is not performed
* Word splitting is not performed, with the exception of "$@"

If the variable has its integer attribute set, then value is evaluated as an arithmetic expression 
even if the $((...)) expansion is not used. (declare -i int=2; int+=5;  # int=7, without -i it would be 25)

Assignment statements may also appear as arguments to the alias, declare/typeset, export, readonly, and local builtin commands. When in POSIX mode, 
these builtins may appear in a command after one or more instances of the command builtin and retain these assignment statement properties.


append/add operator: +=
In the context where an assignment statement is assigning a value to a shell variable or array index, 
the += operator can be used to append to (strings) or add to (numbers) the variable's previous value.

* When += is applied to a variable for which the integer attribute has been set, value is evaluated as
  an arithmetic expression and added to the variable's current value, which is also evaluated. 
  declare -i int=2; int+=5; #:7

* When += is applied to an array variable using compound assignment, the variable's value is not unset 
  (as it is when using =), and new values are appended to the array beginning at one greater than the 
  array's maximum index (for indexed arrays) or added as additional key-value pairs in an associative array.
  declare -a arr=(a b c d); arr+=(e f g)

* When applied to a string valued variable, value is expanded and appended to the variable's value.
  declare str=2; str+=5; #:25


nameref attribute: -n
* A variable can be assigned the nameref attribute using the -n option to the declare or local builtin commands to create a nameref, 
  i.e. a reference to another variable. This allows variables to be manipulated indirectly. declare -i num=2; declare -n int=num;

* Whenever the nameref variable is referenced or assigned to, the operation is 
  actually performed on the variable specified by the nameref variable's value.
  
  A nameref is commonly used within shell functions to refer to a variable whose name is passed as an argument to the function. 
  For instance, if a variable name is passed to a shell function as its first argument, running:  declare -n ref=$1
  inside the function creates a nameref variable ref whose value is the variable name passed as the first argument. 
  References and assignments to ref are treated as references and assignments to the variable whose name was passed as $1. 

* If the control variable in a for loop has the nameref attribute, the list of words can be a list of shell variables, 
  and a name reference will be established for each word in the list, in turn, when the loop is executed. 
  declare -n ref; for ref in LIST do ...

* Array variables cannot be given the -n attribute. 
  However, nameref variables can reference array variables and subscripted array variables.  

* Namerefs can be unset using the -n option to the unset builtin.
  unset -n ref
  Otherwise, if unset is executed with the name of a nameref variable as an argument, 
  the variable referenced by the nameref variable will be unset.
