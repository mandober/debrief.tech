# File descriptor

File descriptor (fd) is an index into file descriptor table.

Process control block (PCB) keeps track of various properties of a process, called the *process context*. Among these things is the fd table (as array) which records all the resources that the process owns and can operate on, as pointer to resources.

In Linux, a file descriptor is a non-negative integer that identifies an opened file or other I/O resource such as a network socket or a pipe.

You are allowed to have up to 9 file descriptors open at a time. 

By convention, the first 3 fds, stdin (0), stdout (1), stderr (2), are reserved.

File descriptors are used to interact with resources using various system calls such as read(), write(), close().

File descriptors greater than fd 2 are typically used to represent files. When a file or resource is opened, the OS assigns a unique file descriptor to it and returns that fd to the calling process.
