# printenv

The `printenv` command displays the values of environment variables.
If the name argument is specified, only the value associated with name is printed. If it is not specified, printenv displays the current environment variables, one name=value pair per line.

If a name argument is specified but is not defined in the environment variable, printenv returns exit status 1; otherwise it returns status 0.

In the tcsh shell, printenv prints the names and values of all environment variables or, with name, the value of the environment variable named. For more information, see tcsh - Invoke a C shell.
