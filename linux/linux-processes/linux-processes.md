# Processes

https://ttt.bartificer.net/book.html#ttt08

## History

DOS was more of a thin-wrapper than an OS because it would hand control of the system to the started program. Two programs could not run at the same time.

Windows 3.1 used time-slicing to run processes in round-robin fashion to create the illusion of multitasking. It was *preemptive* OS, using a hardware timer to get back the control from a running process after a certain time has passed. Then it would give control to the next process which meant a lot of context switching which includes taking a snap-shot of the state of the running process, saving it, then loading the last saved state of the next process in the queue. If you had 10 processes and a 1 MHz CPU, then each process got about 100,000 CPU cycles to work with per second, enough to give you the impression that the programs were executing simoultaneously.

There is literally an entire university semester of material in designing strategies for efficiently scheduling the CPU time between processes. The kernel scheduler can associate priorities with processes, and it can use those priorities to give some processes preferential treatment over others.

Each app has at least one process associated with it, but once an app is running it can fork, spawning as many child processes as it needs. For example, a word processing could be running in one process, while using a separate background process for spell checking.

There are two broad classes of processes
- *system processes*: used by the kernel to provide system services
- *user processes*: instigated by users for their tasks

There are many processes that don't have a visual representation, and these typically run in the background.

## Linux processes

Each running process on a Linux computer has an associated PID (process id) which is just an integer used to identify it.

The first process, i.e. the kernel itself, gets the PID 0. It loads the startup system, e.g. `init`, which gets PID 1 and then it starts the other processes. Every subsequent process gets the next free PID. Each process (except for the kernel), also has a reference to its parent process ID (PPID). These two idntifiers (PID and PPID) make it possible to construct a tree hierarchy of processes, with the kernel at the root, thanks to the fact that the only was to create a new process is by forking the current.

Another reference each process holds is UID, the ID of a particular user. In fact, each process runs with the permissions and privileges of that user. So, whether a given file can be accessed by a process is determined by the UID associated with it (and the permissions set on the file).

## Process context

- PID
- PPID
- UID
- cwd
- env vars
- FDs
- umask
- ulimit
- defined traps


Again, the only way to create a new process is by forking an existing process. When a process is `fork`ed it creates an identical copy of itself. The process on which the system call `fork` was invoked is the parent and the other process is the child. They are identical save for their PIDs, i.e. `child's PPID = parent's PID`.

This regularly happens in the shell when the shell needs to execute an external command: the shell fork itself, then replaces the child with the command that needed to be executed. The parent shell process remains the controlling process of the process group which contains the child shell process to be able to kill it if it misbehaves.

Since the child's environment is a copy of the parent's environment, all variables that were present in the parent's context will be copied into the child. If the child process (subshell) changes some variable, that change won't be reflected back in the parent. When a shell spawns a subshell, any change made in the subshell has no effect on the parent; plus, the subshell itself and the changes made to its environment are destroyed as soon as it finishes executing the given command.
