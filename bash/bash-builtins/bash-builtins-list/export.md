 bash | man | builtins

export

export [-fn] [name[=word]] ...
export -p

The supplied names are marked for automatic export to the environment of subsequently executed commands. 

-f the names refer to functions
-p or if no names are given, a list of names of all exported variables is printed.
-n remove export property from each name.

If a variable name is followed by =word, the value of the variable is set to word.

EXIT STATUS 0 unless an invalid option is encountered:
- one of the names is not a valid shell variable name, 
- or -f is supplied with a name that is not a function.


Exported functions will have special format - bash will encode them as variables so they can be exported:
  BASH_FUNC_rbenv%%=() { ... }
  name of this exported function was rbenv
  to export it use: declare -fx rbenv or export -f rbenv
  to remove export: declare -f +x require or export -fn rbenv

