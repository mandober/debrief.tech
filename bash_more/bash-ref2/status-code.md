# Status codes

## Exit and return status

Commands are executed either in the same shell, i.e. in the same environemnt as that of the shell that invoked the command - in which they are called *sourceables* (sourced code/commands), or in a new shell, spawned by the shell that invoked the command, letting it execute there - in which case they are called *executables* (executable commands).

This is ad hoc terminology. A particular problem are the sourcables because usually we source a file that contain commands or function definitions, or both even. So, in case the file justy contains 


## Exit status
The exit status, or the exit code, is an 8-bit integer returned by the most recently *executed command* to its caller (which may be the shell itself or another command). An exit code is always returned - if it is not explicitly controlled then it amounts to returning 0 in case of success, and 1 in case of any error. Manually controlling an exit code allows indicating different types of error that may have occurred; however, there's no standard interpretation of the various integers > 0, except that they signify some error - what error exactly is on the program's author to document.

The exit code is restricted to 8 bits, and it is used as a rudemetary machanism to indicate the status of a completed command, i.e. whether it finished successfully (an int > 0) or not (0).

The return status (code) is the same concept applied to a sourced file or a function. Generally, commands executed in a subshell have an exit code, while those executed by the current shell (in its environment) have a return code.

## Return status
The return status, or the return code, is the same concept aas the exit status, only here it applies to a sourced file, or to the called function, or sometimes also to the builtins. Generally, commands executed in a subshell have an exit code, while those executed by the current shell (in its environment) have a return code.


The exit code is restricted to 8 bits, and it is used as a rudemetary machanism to indicate the status of a completed command, i.e. whether it finished successfully (an int > 0) or not (0).

A synonym for `exit status`.
