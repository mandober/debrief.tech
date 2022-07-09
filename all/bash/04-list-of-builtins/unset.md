 bash | man | builtins

unset
unset [-fv] [-n] [name ...]
For each name, remove the corresponding variable or function. 
* If -v option is given, each name refers to a shell variable, and that variable is removed. 
  Read-only variables may not be unset. 
* If -f is specified, each name refers to a shell function, and the function definition is removed.
* If -n option is supplied, and name is a variable with the nameref attribute, name will be unset rather than the variable it references.
  -n has no effect if the -f option is supplied. 
* If no options are supplied, each name refers to a variable; 
  if there is no variable by that name, any function with that name is unset. 
* Each unset variable or function is removed from the environment passed to subsequent commands. 
* If any of COMP_WORDBREAKS, RANDOM, SECONDS, LINENO, HISTCMD, FUNCNAME, GROUPS, or DIRSTACK are unset, 
  they lose their special properties, even if they are subsequently reset. 
EXIT STATUS is true unless a name is readonly.
