# Bash Builtin: compopt

compopt [-o option] [-DE] [+o option] [name]


Modify completion options for each name according to the options, 
or for the currently-executing completion if no names are supplied.

-   if no options are given, display the completion options for each name or the current completion. 
    The possible values of option are those valid for the complete builtin.
 
-D  option indicates that the remaining options should apply to the `default' command completion;
    that is, completion attempted on a command for which no completion has previously been defined.

-E  option indicates that the remaining options should apply to `empty' 
    command completion; that is, completion attempted on a blank line.


RETURN VALUE 
is true unless
* an invalid option is supplied
* an attempt is made to modify the options for a name for which no completion specification exists
* an output error occurs
