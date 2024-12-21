# Linux :: GLOSSARY

Linux Dictionary version 0.16 (2014)
- https://tldp.org/LDP/Linux-Dictionary/html/index.html
- INDEX: https://tldp.org/LDP/Linux-Dictionary/html/c46.html



## Bootloader
A bootloader is an essential piece of software which takes over the computer after the firmware relinquishes control of the system. It is the job of the bootloader to find an operating system to boot and perform all the operations needed in order to get the operating system's kernel and modules up and running.

## Block device
Block devices (block special files) provide *buffered access* to hardware devices and provide some abstraction from their specifics. Unlike character devices, block devices will always allow the programmer to read or write a block of any size (including single characters/bytes) and any alignment. The downside is that because block devices are buffered, the programmer does not know how long it will take before written data is passed from the kernel's buffers to the actual device, or indeed in what order two separate writes will arrive at the physical device.

## Capability
The traditional UNIX privilege scheme divides processes into two categories: those whose effective UID is 0 (root), which bypass all privilege checks, and all other processes, which are subject to privilege checking according to their user and group IDs. Linux capability scheme divides this all-or-nothing privilege scheme into individual capabilities that can be independently enabled or disabled. Using capabilities allows a program to perform some privileged operations, while preventing it from performing others.

## Character device
Character devices (character special files) provide direct *unbuffered access* to the hardware device. They do not necessarily allow programs to read or write single characters at a time (although that is up to the device in question). The character device for a HDD, for example, will normally require that all reads and writes be aligned to block boundaries and most certainly will not allow reading a single byte. Character devices are sometimes known as raw devices to avoid the confusion surrounding the fact that a character device for a piece of block-based hardware will typically require programs to read and write aligned blocks. A character device is one that can be accessed as a stream of bytes (like a file); a character driver is in charge of implementing this behavior.

## Child process
A process created by another process, called the parent process. Each process may create many child processes but has only one parent process, except for the very first process which has no parent. The first process, called `init`, is started by the kernel at boot time and it never terminates. A child process inherits most attributes of the parent process - in fact, the `fork` syscall duplicates a (parent) process, creating two identical processes. The child process (like any process) can use one of the `exec` syscalls to replace itself with a different process.

## Device file
A device file (device node, special file) is an interface to a device driver that appears in a file system as if it were an ordinary file. These special files allow programs to interact with a device by using its device driver via standard I/O system calls. Using standard system calls simplifies programming tasks, and leads to consistent user-space I/O mechanisms regardless of device features and functions. Additionally, device files are useful for accessing abstract resources, such as data sinks (/dev/null) and random number generators (/dev/random, /dev/urandom).

## D-Bus
D-Bus is the message bus, providing the infrasructure and protocols for messaging, especially in a graphical desktop environment where the amount of exchanged messages between parts of the sytem and between programs is enormous inspiring such management solution.

## Daemons
Daemons are special-purpose processes distinguished by the characteristics that they are long-lived - a daemon process is often started at system boot and remains in existence until the system is shut down - and they run in the background, with no controlling terminal from which it can read input or to which it can write output.

## Effective user ID
and effective group ID: These two IDs (in conjunction with the supplementary group IDs) are used in determining the permissions that the process has when accessing protected resources such as files and interprocess communication objects. Typically, the process's effective IDs have the same values as the corresponding real IDs. Changing the effective IDs is a mechanism that allows a process to assume the privileges of another user or group.

## Environment
Each process has an environment - a list (array) of KEY=VALUE pairs maintained within the user-space memory of the process. Each element of that list is called an environment variable and it consists of a name and an associated value. When a new process is created via fork, it inherits a copy of its parent's environment. Thus, the environment provides a mechanism for a parent process to pass some information down to a child process (but not vice versa). When a child process overlays a program using exec, the new program either inherits the environment or receives a new environment list explicitly as part of the exec call.

## File System Hierarchy
File System Hierarchy is the magic umbrella term that includes topics related to Linux file systems, governing the naming scheme and contents that a set of key directories should have, along with their position in the hierarchy.

## Init process
When booting the system, the kernel creates a special process called `init`, the parent of all processes, which is derived from the program file /sbin/init. All processes on the system are created (using fork) either by init or by one of its descendants. The init process always has the process ID 1 and runs with superuser privileges. The init process can't be killed (not even by the superuser), and it terminates only when the system is shut down. The main task of init is to create and monitor a range of processes required by a running system.

## Landlock
Landlock provides unprivileged access control; it provides means to restrict permissions of a set of processes (e.g. access to the fs). Landlock is a stackable LSM. It allows creating security sandboxes as new security layers, in addition to the existing system-wide access controls. This kind of sandbox is expected to help mitigate the security impact of bugs or unexpected or malicious behavior of userspace programs. Landlock allows a set of processes, including unprivileged ones, to securely restrict themselves.

## Linux Process Model
Linux Process Model is the magic phrase about all things processes in Linux.

## Limits
Each process consumes resources, such as open files, memory, and CPU time. Using the setrlimit() system call, a process can establish upper limits on its consumption of various resources. Each such resource limit has two associated values: a soft limit, which limits the amount of the resource that the process may consume; and a hard limit, which is a ceiling on the value to which the soft limit may be adjusted. An unprivileged process may change its soft limit for a particular resource to any value in the range from zero up to the corresponding hard limit, but can only lower its hard limit. When a new process is created with fork, it inherits copies of its parent's resource limit settings. The resource limits of the shell can be adjusted using the `ulimit` command. These limit settings are inherited by the child processes that the shell creates to execute commands.

## Privileged ports
Known (low or privileged) ports are the privileged ports up to 1024 (2¹⁰). The remaining ports up to 65536 (2¹⁶) are called higher or unprivileged ports. The configuration file /etc/services maps the privileged port numbers to service names. Each service is associated with a default set of ports. The function 'getportbyname' uses this file to resolve the name of service supplied as the argument, e.g. `getportbyname("https")` returns 443.

## Porcelain commands
Porcelain commands are primarily designed for direct human consumption, as opposed to plumbing commands which are optimized for pipelines.

## Privileged process
A privileged process is one whose effective user ID is 0 (root). Such a process bypasses the permission restrictions normally applied by the kernel. By contrast, the term unprivileged (or non-privileged) is applied to processes run by other users. Such processes have a nonzero effective user ID and must abide by the permission rules enforced by the kernel. A process may be privileged because it was created by another privileged process-for example, by a login shell started by root. Another way a process may become privileged is via the *set UID* mechanism, which allows a process to assume an effective user ID that is the same as the user ID of the program file that it is executing.

## Plumbing commands
Plumbing commands are primarily designed to be combined in a pipeline, as opposed to porcelain commands which are primarily designed for direct human consumption.

## Pseudo devices
Device nodes do not necessarily have to correspond to physical devices - pseudo devices lack this correspondence. Some common (character-based) pseudo devices include `/dev/null` discards all input, `/dev/random` spits out random bytes, `/dev/fd/1` provides accesses to the file descriptor 1 (stdout) of a process, and many, many others.

## Real user ID
and real group ID: These identify the user and group to which the process belongs. A new process inherits these IDs from its parent. A login shell gets its real user ID and real group ID from the corresponding fields in the system password file.

## Set UID
Set-user-ID and GID mechanisms allow a process to assume an effective user ID (and group ID) that is the same as the user ID (and group ID) of the program file that it is executing.

## Spool
Spool (Simultaneous Peripheral Operations On-line) or Spooling is an operating system technique used to manage slow I/O operations efficiently. It works by temporarily storing data from input devices (like keyboards) or output devices (like printers), allowing the computer to continue processing other tasks while the data is being transferred to or from the device. So basically buffering.

## Supplementary group IDs
These IDs identify additional groups to which a process belongs. A new process inherits its supplementary group IDs from its parent. A login shell gets its supplementary group IDs from the system group file.

## Systemd
The systemd is the new startup manager on Linux, successor to the `sysvinit` system. When the booting completes, the startup manager takes over and loads the rest of the system. It does this as the `init` process, which gets the PID 1 and then becomes the universal ancestor of all other processes; it adopts the orphaned processes as well. Systemd uses its role as the new init to provide a unified management of all services on the system (installing, activating, starting, stopping, logging). However, systemd gets a lot of pushback, presumably because it goes too much against the so-called Unix philosophy. The first transgression is that, like `terminfo`, it uses binary configuration files, althought it does support LSB and *SysV init scripts*. However, unlike terminfo which sticks to doing one thing (and doing it well), systemd has a much bigger appetite: it provides aggressive parallelization capabilities, uses socket and D-Bus activation for starting services, offers on-demand starting of daemons, keeps track of processes using Linux control groups, maintains mount and automount points, implements an elaborate transactional dependency-based service control logic. Other parts include a logging daemon, utilities to control basic system configuration like the hostname, date, locale, maintain a list of logged-in users and running containers and virtual machines, system accounts, runtime directories and settings, and daemons to manage simple network configuration, network time synchronization, log forwarding and name resolution.

## System call
A sycall is a controlled entry point into the kernel, allowing a process to request that the kernel perform some action on the process's behalf.

## Thread
Each process can have multiple threads of execution. A process may be composed of a set of threads that share the same virtual memory, as well as a range of other attributes. Each thread is executing the same program code and shares the same data area and heap. However, each thread has it own stack containing local variables (thread-local stack) and function call linkage information. Threads can communicate with each other through global variables or IPC. The threading API provides condition variables and mutexes for synchronization.

## tty
A tty terminal device is a character device that performs input and output on a character-by-character basis.


---

https://www.linfo.org/index.html
https://www.linfo.org/kernel.html
