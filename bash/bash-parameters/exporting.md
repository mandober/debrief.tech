# Exporting

Shell variables and functions can be exported.

>Child shell (subshell) WILL NOT inherit variables and functions that have not been marked for export, even though the child process is a duplicate of the main shell process - because `execve` used by bash after `fork`ing the main shell process allows specifying env vars that are passed to it explicitly.

seems execve syscall is used: `execve (command, args, env);`
https://github.com/bminor/bash/blob/master/execute_cmd.c#L5960


https://github.com/bminor/bash/blob/master/execute_cmd.c#L5564
says:

Execute a simple command that is hopefully defined in a disk file somewhere.
1. `fork`
2. connect pipes
3. look up the command
4. do redirections
5. `execve`
6. If `execve` failed, see if the file has executable mode set. If so, and it is not a directory, then execute its contents as a shell script.

Note that the filename hashing stuff has to take place up here, in the parent. This is probably why the Bourne style shells do not handle it, since that would require them to go through this gnarly hair, for no good reason.

NOTE: callers expect this to `fork` or `exit`.
