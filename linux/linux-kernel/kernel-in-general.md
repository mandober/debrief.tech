# Linux kernel

https://en.wikipedia.org/wiki/Linux_kernel

- Linux is a monolithic kernel
- Linux is the name of kernel created by Linus Torvalds in 1991
- Linux kernel is modelled after the UNIX kernel


The Linux kernel is a free and open source, UNIX-like kernel that is used in many computer systems worldwide. The kernel was created by Linus Torvalds in 1991 and was soon adopted as the kernel for the GNU operating system (OS) which was created to be a free replacement for Unix. Since the late 1990s, it has been included in many operating system distributions, many of which are called Linux. One such Linux kernel operating system is Android which is used in many mobile and embedded devices.

Most of the kernel code is written in C as supported by the GNU compiler collection (GCC) which has extensions beyond standard C.

The code also contains assembly code for architecture-specific logic such as optimizing memory use and task execution.

The kernel has a modular design such that modules can be integrated as software components - including dynamically loaded. The kernel is monolithic in an architectural sense since the entire OS runs in kernel space.

Linux is provided under the GNU General Public License version 2, although it contains files under other compatible licenses.


The Linux kernel is developed under the open-source model, meaning its source code is freely available for modification and distribution, under the appropriate licenses.

It is continually developed and improved by a community of developers worldwide, who contribute to its codebase. This collaborative development model has led to the Linux kernel becoming a robust, stable, and highly customizable foundation for numerous Linux-based operating systems, ranging from servers and desktops to embedded systems and mobile devices.



## Kernel responsibilities

- process management
- I/O management
- memory management
- device management
- file management
- process scheduling
- tty subsystem
- resource allocation
- interrupt handling
- interprocess communication
- networking
- security




The kernel has 4 jobs:
- Memory management: keep track of how much memory is used to store what where
- Process management: which processes can use CPU, when, and for how long
- Device drivers: act as mediator/interpreter between hardware and processes

The Linux kernel is the central part of the Linux operating system. It is a monolithic, Unix-like operating system kernel that provides essential services and manages system resources. The kernel acts as an interface between the hardware and the software layers, enabling the operating system to communicate with and control the underlying hardware components.

## Functions of Linux Kernel

- Process Management: The kernel manages the execution of processes, allocating system resources such as CPU time, memory, and input/output (I/O) devices. It schedules processes, switches between them, and ensures fair and efficient resource utilization.
- Memory Management: The kernel handles memory management, including allocating and deallocating memory for processes and managing the virtual memory system. It provides mechanisms for memory protection, virtual memory mapping, and swapping data between physical memory and disk storage.
- Device Drivers: The kernel includes device drivers that enable communication between the operating system and hardware devices such as disk drives, network interfaces, graphics cards, and input devices. These drivers facilitate data transfer, device control, and interaction with the hardware.
- File System Management: The kernel manages file systems, providing the necessary interfaces and operations for creating, reading, writing, and deleting files. It handles file access permissions, file metadata, and directory structures.
- Networking: The kernel implements networking protocols, allowing communication over local area networks (LANs) and the internet. It manages network interfaces, routing tables, network protocols (such as TCP/IP), and socket communication.
- Security: The kernel includes security mechanisms to protect the system and user data. It enforces access control policies, handles user authentication, manages permissions, and provides isolation between processes.
- Interprocess Communication: The kernel facilitates communication and data exchange between processes through mechanisms such as pipes, sockets, shared memory, and signals.


https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
