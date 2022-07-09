# bash builtins: builtin

builtin SHELL_BUILTIN [arguments]

Execute the specified shell builtin with supplied args, and forward return its exit status.

`builtin` is useful when there is a function in the env, whose name shadows a builtin. In such sitation, it provides a way to still call that builtin, despite the function.

The `cd` builtin is often redefined this way: the function named `cd` is defined to first perform some extra duties before actually changing directory by invoking the `cd` command. However, without the `builtin` prefix, that call would result in an unbounded recursive invocation of the same `cd` function. 

The `builtin` in prefix position, as in `builtin cd`, makes sure that the command-lookup procedure only consults the shell builtins.  The command-lookup procedure is normally performed in this order: aliases, functions, builtins, files.

Return Status:
- 1: if the given SHELL_BUILTIN is not a valid builtin
- 0: otherwise
