# Builtins and binaries

Many commands are realized as both bash builtins and standalone utilities.

Bash builtins have precedence over binary utilities, so typing `[` will invoke the bash builtin `[`, and not the `/bin/[` utility.

To force the utility to take precedence, use the `command` builtin.
To force the a builtin to take precedence, use the `builtin` builtin.

To find out what a 'name' on the command line referrs to, the shell will search for it in these *namespaces*. The search stops with the first hit. If no hits, the command-not-found error is emitted (which is often tied to the program called `command-not-found`, whose purpose is to suggest installing a program with the matching NAME, if such a program exists in the DB of packages).

Namespaces
- bash alias
- bash function
- bash keyword
- bash builtin
- external program

+ shell reserved words
+ shell metacharacters
+ shell keywords
