 bash | man | builtins

readonly

readonly [-aAf] [-p] [name[=word] ...]

The given names are marked readonly; the values of these names may not be changed by subsequent assignment
-f the functions corresponding to the names are so marked
-a restricts the variables to indexed arrays
-A restricts the variables to associative arrays
-p or no arguments causes output to be displayed in a format that may be reused as input
* If -a and -A options are supplied, -A takes precedence
* The other options may be used to restrict the output to a subset of the set of readonly names
* If a variable name is followed by =word, the value of the variable is set to word
* The return status is 0 unless an invalid option is encountered, one of the names is 
  not a valid shell variable name, or -f is supplied with a name that is not a function.