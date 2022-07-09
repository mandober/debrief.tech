# Function

Aliases are not commands, but only simple text substitutions.
When bash reads the input, after marking redirections and env injections, the first real work (that may modify the command line) it performs is dealing with aliases.

Aliases present in a function definition are expanded when a function is read, not when it is executed (because a function definition itself a command of sorts). Consequently, aliases that are defined in a function definition do not become active until after that function is executed.

The same happens to nested functions: it is allowed to define an inner function from inside the definition of the outer function, but the inner function doesn't exist until the outer function is called the first time. The execution running through the outter function, defines the nested function and moves it to the global scope.



without explicit declaration, var is global
