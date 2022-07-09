 bash | man | builtins

declare

declare [-aAi fF cul gnrxt] [-p] [name[=value] ...]
typeset is the same command, although more portable

Declare variables and/or give them attributes.
If no names are given then display the values of variables

-p   display the attributes and values of each name
     * When -p is used with name arguments, additional options, other than -f and -F, are ignored.
     * When -p is supplied without name arguments, it will display the attributes and 
       values of all variables having the attributes specified by the additional options.
     * If no other options are supplied with -p, declare will display the attributes and values of all shell variables.

-f   option will restrict the display to shell functions
-F   option inhibits the display of function definitions: only the function name and attributes are printed. -F option implies -f

     * If the extdebug shell option is enabled using shopt, the source 
     file name and line number where the function is defined are displayed as well. 
	$ shopt -s extdebug  # turn on extdebug
	$ declare -F sql     #-> sql 215 /home/ivan/bing/func/file/load
	$ shopt -u extdebug  # turn off extdebug

-g   option forces variables to be created or modified at the global scope, 
     even when declare is executed in a shell function. It is ignored in all other cases. 
-i   The variable is treated as an integer; arithmetic evaluation is performed when the variable is assigned value.
-r   Make names readonly. These names cannot then be assigned values by subsequent assignment statements or unset.
-x   Mark names for export to subsequent commands via the environment.


-a   Each name is an indexed array variable
-A   Each name is an associative array variable
-f   Use function names only

-l   lower-case value at assignment
-u   upper-case value at assignment
-c   capitalize value at assignment (optionally-configurable)

-t   Give each name the trace attribute. Traced functions inherit the DEBUG and RETURN traps
     from the calling shell. The trace attribute has no special meaning for variables.

-n   Give each name the nameref attribute, making it a name reference to another variable. 
     That other variable is defined by the value of name.
     All references and assignments to name, except for changing the -n attribute itself, 
     are performed on the variable referenced by name's value.
     declare -n pri=ro; ro=dan; echo $pri #dan; echo $ro #dan
     declare +n pri; echo $pri #ro; echo $ro #dan
     ** The -n attribute cannot be applied to array variables. ✗
	   YES IT CAN reference the array:
	    alpha=(bravo charlie delta)
	    declare -n golf=alpha
	    echo "${golf[2]}"   -> outputs 'delta', but still 'golf' is not an array itself!


* Using + instead of - turns off the attribute instead, with the exceptions of -a and -r attributes
* When used in a function, declare and typeset make each name local, as with the local command, unless the -g option is supplied.
* If a variable name is followed by =value, the value of the variable is set to value.
* When using -a or -A and the compound assignment syntax to create array variables, 
  additional attributes do not take effect until subsequent assignments. 

* The return value is 0 unless an invalid option is encountered:
  - attempt  to define     function using `-f foo=bar'
  - attempt  to assign     value to a readonly variable
  - attempt  to turn off   readonly status for a readonly variable
  - attempt  to turn off   array status for an array variable, or 
  - attempt  to display    non-existent function with -f
  - attempt  to assign     value to an array variable without using the compound assignment syntax
  - attempt  to assign     value to a name that is invalid identifier

