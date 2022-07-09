 bash | manual

ENVIRONMENT VARIABLES | directory

PWD
OLDPWD
CDPATH
DIRSTACK
TMPDIR
PATH
HOME



PWD
The current working directory as set by the cd command.

OLDPWD
The previous working directory as set by the cd command.

CDPATH
The search path for the cd command.
This is a colon-separated list of directories in which the shell looks for destination 
directories specified by the cd command. A sample value is ".:~:/usr".

DIRSTACK
An array variable containing the current contents of the directory stack. 
Directories appear in the stack in the order they are displayed by the dirs builtin. 
Assigning to members of this array variable may be used to modify 
directories already in the stack, but the pushd and popd builtins must be used
to add and remove directories. Assignment to this variable will not change the current directory.
If DIRSTACK is unset, it loses its special properties, even if it is subsequently reset.

TMPDIR 
If set, bash uses its value as the name of a directory in which bash creates temporary files for the shell's use.

PATH
The search path for commands
* It is a colon-separated list of directories in which the shell looks for commands.
* A zero-length (null) directory name in the value of PATH indicates the current directory.
  A null directory name may appear as two adjacent colons, or as an initial or trailing colon.
* The default path is system-dependent, and is set by the administrator who installs bash. 
* A common value is /usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

HOME
* The home directory of the current user;
* the default argument for the cd builtin command. 
* The value of this variable is also used when performing tilde expansion.
