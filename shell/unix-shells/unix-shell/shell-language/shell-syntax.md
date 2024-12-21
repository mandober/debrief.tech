# Shell syntax

The shell command language has several namespaces:
- special characters
- metacharacters
- keywords
- builtins
- functions
- programs

Special characters, metacharacters, keywords and builtins are internal to the shell, they need not be searched for. 

The crucial difference between commands is whether they can affect the current environment or not, the propery which separates them into internal and external commands.

External commands (executable programs and sripts) cannot affect the current environment. Internal commands (functions, builtins, and sourceable file containing commands) can affect the current environment unless they are forced to execute in a subshell.

Builtins and programs: both model actions 

Builtins and functions: functions are, in a way, similar to builtins since both are immediately available (need not be searched for).

Loaded functions, that is, functions loaded into memory, available in the current shell environment,

Functions are made available in the current shell environment either by defining them on the command line or by sourcing a file which contains their definition.

When a file that contains a function definition is sourced, the function definition is only checked for syntax errors.
