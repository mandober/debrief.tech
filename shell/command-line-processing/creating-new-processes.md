# Creating new processes

On Unix-like systems like Linux, new processes cannot be created from scratch. New process is created with the fork and exec mechanisms. The `fork` system call clones the process that called it, resulting in two processes that differ only in their PID. The parent process keeps the same PID and the child process gets a fresh PID. In the child process, the value of PPID is the PID of the parent.

For example, in C, a `fork` syscall issued from the current (parent) process creates two identical processes that share the same code from that point on.

More precisely, when the parent process calls fork, it can test the returned value of that call: in the parent, the return value is the child's PID, while in the child, the return value is 0. So the same test returns two different values depending on the context! This test can be used to control the further flow of the program. Remember that the two processes are both running and they share the same code following the forking point. Without a test or some similar contraption, the two process would execute the same code, i.e. the same code would be executed twice. For example, if all that happens after the fork is to print the string "process forked", then this string will be printed twice - once by the parent process and once by the child process.

After a process forks, it is usually the child process that calls one of the `exec` functions to "overlay" a new process. The `exec` family of system calls (execv, execve, execvp, execl, execle, execlp) provides various combinations of the following information to pass to the new process: a pathname to to the executable, a name for arg0, an array of arguments, an array of env vars.

Thus, when the shell forks, the subshell (i.e. the child process) indeed has the same exact execution environment as the parent shell. However, the exec syscalls allow the programmer to be selective regarding the environment variables the subshell receives. This could explains why a subshell may lack some environment or shell variables. 

The actual question is does a subshell inherits all variables (environment or otherwise) from the main shell process. It has to do with the requirement that a shell variable needs to be exported to be available in a subshell.
