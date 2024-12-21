# Child process

https://en.wikipedia.org/wiki/Child_process

A child process is a process created by another process, called the parent process.

This technique pertains to multitasking operating systems, and is sometimes called a *subprocess*, or traditionally a *subtask*.

There are two major procedures for creating a child process:
- `fork` system call (preferred in Linux)
- `spawn` system call (preferred in Windows)

## Children created by fork

https://en.wikipedia.org/wiki/Fork_(system_call)

A child process inherits most of its attributes, such as file descriptors, from its parent. In Unix, a child process is typically created as a copy of the parent, using the fork system call. The child process can then overlay itself with a different program (using exec) as required.

Each process may create many child processes but will have at most one parent process; if a process does not have a parent this usually indicates that it was created directly by the kernel. In some systems, including Linux-based systems, the very first process (called init) is started by the kernel at booting time and never terminates (see Linux startup process); other parentless processes may be launched to carry out various daemon tasks in userspace. Another way for a process to end up without a parent is if its parent dies, leaving an orphan process; but in this case it will shortly be adopted by init.

The SIGCHLD signal is sent to the parent of a child process when it exits, is interrupted, or resumes after being interrupted. By default the signal is simply ignored.

## Children created by spawn

https://en.wikipedia.org/wiki/Spawn_(computing)
