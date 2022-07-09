source

     . filename [args]
source filename [args]

Read and execute commands from filename in the current shell environment
and return the exit status of the last command executed from filename.

* If filename does not contain a slash, PATH is searched for filename (unless shopt -u sourcepath)
  If filename is not found in PATH, current directory is searched (unless bash is in POSIX mode).
* filename need not be executable.
* If any args are supplied, they become the positional parameters when filename is sourced. 

RETURN STATUS
- is the status of the last command from sourced script
- 0 if no commands are sourced
- 1 if filename is not found or cannot be read
