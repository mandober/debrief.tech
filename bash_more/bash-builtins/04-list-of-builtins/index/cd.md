shopt: dir/cd


autocd
cdable_vars
cdspell 


autocd
If set, a command name that is the name of a directory is executed as if it were 
the argument to the cd command. This option is only used by interactive shells.

cdable_vars
If set, an argument to the cd builtin command that is not a directory is 
assumed to be the name of a variable whose value is the directory to cd to.

cdspell
If set, minor errors in the spelling of a directory component in a cd command will be corrected. 
The errors checked for are transposed characters, a missing character, and one character too many. 
If a correction is found, the corrected filename is printed, and the command proceeds. 
This option is only used by interactive shells.