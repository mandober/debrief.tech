# Command Execution

command: aliases -> functions → builtins → keywords -> executables

executables: check hash → search PATH → command_not_found_handle() → exit 127 (command not found)

After a command has been split into words, if it results in a simple 
command and an optional list of arguments, the following actions are taken.

★ If the command name contains no slashes, the shell performs a lookup:

  - If there exists a shell function by that name, that function is invoked. 
  - If the name does not match a function, the shell searches for it in the list of shell builtins. 
    If a match is found, that builtin is invoked.
  
  - If the name is neither a shell function nor a builtin, and contains no slashes, 
    bash searches each element of the PATH for a directory containing an executable file by that name.
    * Bash uses a hash table to remember the full pathnames of executable files. 
    * A full search of the directories in PATH is performed only if the command is not found in the hash table.
    * If the search is unsuccessful, the shell searches for a defined shell function named command_not_found_handle. 
      If that function exists, it is invoked with the original command and the 
      original command's arguments as its arguments, and the function's exit status becomes the exit status of the shell. 
    * If that function is not defined, the shell prints an error message and returns an exit status of 127.

★ If the search is successful, or if the command name contains one or more slashes, 
   the shell executes the named program in a separate execution environment. 
   Argument 0 is set to the name given, and the remaining arguments to the 
   command are set to the arguments given, if any.

★ If this execution fails because the file is not in executable format, and the file is not a directory, 
   it is assumed to be a shell script, a file containing shell commands.  
   A subshell is spawned to execute it. This subshell reinitializes itself, 
   so that the effect is as if a new shell had been invoked to handle the script, 
   with the exception that the locations of commands remembered by the parent are retained by the child.

★ If the program is a file beginning with #!, the remainder of the first line specifies an interpreter for the program. 
   The shell executes the specified interpreter on operating systems that do not handle this executable format themselves. 
   The arguments to the interpreter consist of a single optional argument following 
   the interpreter name on the first line of the program, followed by the name of the 
   program, followed by the command arguments, if any.


## Simple command execution

If a parsed simple command contains no slashes, the shell attempts to locate and execute it:

functions → builtins → check hash → search PATH → command_not_found_handle() → exit 127 (command not found)

As of Bash Version 4, when a command search fails, the shell executes a shell function named command_not_found_handle() using the failed command as arguments. This can be used to provide user friendly messages or install software packages etc. Since this function runs in a separate execution environment, you can't really influence the main shell with it (changing directory, setting variables).
