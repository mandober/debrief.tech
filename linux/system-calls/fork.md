# fork

https://en.wikipedia.org/wiki/Fork_(system_call)

The `fork` syscall instructs the kernel to create a copy of the process that invoke it. Two identical processes are created, differing only in the PID. The return code of the fork call in the parent process is the PID of the child. The return code of the fork call in the child process is 0. This allows to implement different logic for the subsequent code, otherwise both processes will execute identical code. 

Typically, after the `fork` is called, the child process will invoke one of the `exec` syscalls to overlay itself with another process.



Fork is an interface which is required for compliance with the POSIX and Single UNIX Specification standards.

Fork is usually implemented as a C standard library wrapper to the `fork`, `clone`, or other system calls of the kernel.

Fork is the primary method of process creation on Unix-like operating systems. The call to `fork` will duplicate everything in the execution context of the parent process, including open file descriptors. Thus parent and child will read and write to the same file descriptors after fork, which may end up with stdout displaying garbled text. Also, if the parent was reading data from a file, post fork, both parent and child will read from that file, each getting subsets of data in the file. This can be a welcome feature to do pallel processing, but it may also be a bug if used incorrectly or accidentaly.



A child process inherits most of its attributes, such as file descriptors, from its parent. In Unix, a child process is typically created as a copy of the parent, using the `fork` system call. The child process can then overlay itself with a different program (using `exec`) as required.

Each process may create many child processes but will have at most one parent process; if a process does not have a parent this usually indicates that it was created directly by the kernel. In some systems, including Linux-based systems, the very first process (called `init`) is started by the kernel at booting time and never terminates (see Linux startup process); other parentless processes may be launched to carry out various daemon tasks in userspace. Another way for a process to end up without a parent is if its parent dies, leaving an *orphan process*; but in this case it will shortly be adopted by `init`.

The SIGCHLD signal is sent to the parent of a child process when it exits, is interrupted, or resumes after being interrupted. By default the signal is simply ignored.

When the fork is called, the parent process typically must `wait` for the child processes to finish, otherwise if the parent process finishes before the child, in Linux, all of the child processes will be automatically terminated by the operating system.
