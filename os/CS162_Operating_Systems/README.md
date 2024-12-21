# CS162 Operating Systems and System Programming

## Info

CS162 Operating Systems and System Programming
by John Kubiatowicz
University Of California, Berkeley, 2021

https://cs162.org/
https://cs162.org/resources/
https://github.com/Berkeley-CS162
https://www2.eecs.berkeley.edu/Courses/CS162/
https://hkn.eecs.berkeley.edu/exams/course/cs/162

[Playlias]
https://www.youtube.com/watch?v=pPzVV2kkGHc&list=UULFnhpOONF1c1FtipDF8LPdqQ&index=27


## Topics

- Hardware and Operating System Structures
- Concurrency: Processes and Threads
- Thread Dispatching
- Cooperating Threads
- Synchronization
- Implementing Mutual Exclusion
- Semaphores, Monitors, and Condition Variables
- Readers/Writers, Language Support for Synchronization
- Cooperating Processes and Deadlock
- CPU Scheduling
- Protection: Kernel and Address Spaces
- Address Translation, memory allocation, and segmentation
- Caching and TLBs
- Caching and Demand paging
- Survey of I/O systems and storage devices
- File system and disk management
- Naming and directories
- Inter-process communication
- Loading and linking
- Resource allocation
- Performance evaluation
- Basic networking and protocols
- Distributed file systems
- Security and privacy

## CS162 Lecture 1. What is an Operating System

https://www.youtube.com/watch?v=pPzVV2kkGHc

In this first lecture, we introduce CS162 by discussing 
- what an Operating System does
- kernel
- context in which it operates
- processes
- switching processes
- protection rings
- virtual memory

## CS162 Lecture 2: 4 Fundamental OS Concepts
https://www.youtube.com/watch?v=4FpG1DcvHzc&list=UULFnhpOONF1c1FtipDF8LPdqQ&index=26

We discuss 4 fundamental OS concepts behind virtualizing the processor
- Threads
- Address Spaces
- Processes
- Dual Mode Execution

## Brief history of OSs

### Early Operating Systems: Just Libraries

In the beginning, the operating system didn't do too much. Basically, it was just a set of libraries of commonly-used functions; for example, instead of having each programmer of the system write low-level I/O handling code, the "OS" would provide such APIs, and thus make life easier for the developer. Usually, on these old mainframe systems, one program ran at a time, as controlled by a human operator. Much of what you think a modern OS would do (e.g. deciding what order to run jobs in) was performed by this operator.

This mode of computing was known as **batch processing**, as a number of jobs were set up and then run in a "batch" by the operator. Computers, as of that point, were not used in an interactive manner, because of cost - it was simply too expensive to let a user sit in front of the computer and use it, as most of the time it would just sit idle.

### Beyond Libraries: Protection

In moving beyond being a simple library of commonly-used services, operating systems took on a more central role in managing machines.

One important aspect of this was the *realization that code run on behalf of the OS was special*; it had control of devices and thus should be treated differently than normal application code.

Thus, implementing a file system (to manage your files) as a library makes little sense. Instead, something else was needed.

Thus, the idea of a system call was invented, pioneered by the *Atlas computing system*. Instead of providing OS routines as a library (where you just make a procedure call to access them), the idea here was to *add a special pair of hardware instructions and hardware state* to make the transition into the OS a more formal, controlled process.

The key difference between a *system call* and a *procedure call* is that a *system call transfers control* (i.e. jumps) into the OS *while simultaneously raising the hardware privilege level*.

User applications run in what is referred to as *user mode* which means the hardware restricts what applications can do; e.g. an application running in user mode can't typically initiate an I/O request to the disk, access any physical memory page, or send a packet on the network.

When a system call is initiated, usually through a special hardware instruction called a *trap*, the hardware transfers control to a *pre-specified trap handler* (that the OS set up previously) and simultaneously raises the privilege level to kernel mode.

In *kernel mode*, the OS has full access to the hardware of the system and thus can do things like initiate an I/O request or make more memory available to a program. When the OS is done servicing the request, it passes control back to the user via a *special return-from-trap instruction*, which reverts to user mode while simultaneously passing control back to where the application left off.

### The Era of Multiprogramming

Where operating systems really took off was in the era of computing beyond the mainframe, that of the *minicomputer*. Classic machines like the PDP family from DEC made computers more affordable.

In particular, multiprogramming became commonplace due to the desire to make better use of machine resources. Instead of just running one job at a time, the OS would load a number of jobs into memory and switch rapidly between them, thus improving CPU utilization. This switching was particularly important because I/O devices were slow; having a program wait on the CPU while its I/O was being serviced was a waste of CPU time. Instead, why not switch to another job and run it for a while.

The desire to support multiprogramming and overlap in the presence of *I/O* and *interrupts* forced innovation in the conceptual development of operating systems along a number of directions. Issues such as *memory protection* became important (we wouldn't want one program to be able to access the memory of another program). Understanding how to deal with the *concurrency issues* introduced by multiprogramming was also critical; making sure the OS was behaving correctly despite the presence of interrupts is a great challenge.

One of the major practical advances of the time was the introduction of the *UNIX* operating system, primarily thanks to Ken Thompson and Dennis Ritchie at Bell Labs. UNIX took many
good ideas from different OSs - particularly from MIT's *Multics*, and some from *TENEX* and the *Berkeley Time-Sharing System* - but made them simpler and easier to use.

### The Modern Era

After minicomputers, IBM revealed a new type of machine - cheaper and faster personal computer or PC. Their low-cost enabled having one machine per desktop instead of a shared minicomputer per workgroup.

At first, the OSs on PC represented a great leap backwards as early systems forgot (or never knew of) the lessons learned in the era of minicomputers. Early OSs like DOS had no memory protection. The first generations of the Mac OS (v9 and earlier) had *cooperative  job scheduling*, so a stuck thread would bring down the entire system with it.



## CS 377 Spring 2014 - Operating Systems, UMass

23 videos, 402,117 views, Last updated on Jun 4, 2014
https://www.youtube.com/playlist?list=PLacuG5pysFbDQU8kKxbUh4K5c1iL5_k7k

Lecture 2: OS and Architecture
https://www.youtube.com/watch?v=Nc6KKSv_Ljc&list=PLacuG5pysFbDQU8kKxbUh4K5c1iL5_k7k&index=2

More general protection that forbids general processes to execute instructions willy-nilly comes in the form of protection rings: kernel mode (ring 0) and user mode (ring 3). This prevents process to directly access IO, use instructions that manipulate memory (TLB laods, page table pointers), mess with the mode bits themselves, mess with interrupts, halt the machine, etc. However, the kernel can do all these things. Protection instructions can only be executed in kernel mode. User process must use system calls to get kernel to proxy the request on their behalf.

**System calls** are procedures exposed by the kernel, that in the end exceute protected instructions. System calls are the API that the kernel exposes for user for programs to use. Syscalls are invoked by processes but to get the attention of the CPU, interrupts are generated. The system call triggers a *trap*, which means the execution jumps from wherever it was in the user program to the kernel. Once this happens, the *mode bit* (which is specifying the current mode) will be flipped from user to kernel mode. Now, in the kernel mode, the execution jumps to a piece of kernel code that represents that syscall. But kernel will check that the action requested (e.g. writing to a file) is valid; it's not going to let you write, e.g. to a file you don't have access to.

However, before all this happens, the kernel needs to save the current execution context so it can resume where it left off when the interrupt occurred. Things like the program counter (PC), the mode bit (which is saying that you were in user mode), etc. all need to saved to memory. And once the system call is finished, the kernel will restore the saved state and resume where it left.

## Memory protection

Early OSs shared physical memory among process. Too dangerous even for non-adversary setting.

A basic memory protection sceme is *base and bound*, i.e. bounding a range of accessible addresses, with the start and end addresses stored in registers. The cpu then checks each memory access and prevents out of bounds attempts. But implementing this through syscalls would be terribly inefficient with all the interrupting it'd generated.

Traps are an array placed at known position in memory. Each event is associated with a particular index in the trap table.

## I/O Control

IO control: every device talks to the cpu via interrupts. Interrupts are just part of the normal operation, they happen all the time.

IO Methods: there are 3 principle ways to do IO:
- synchronous (blocking, although other cores will take over)
- asynchronous (non-blocking uses callbacks/interrupts)
- memory mapped IO

## Memory-mapped I/O

Direct access to IO controller of the device (vs being required to move the IO code into memory). A part of (physical) memory is reserved for the device's manager code (e.g. all bits for a video frame for a video controller). Access to device is then as fast and convenient as writing data directly to memory.

The idea is that rather than the CPU essentially going to the IO device to fetch the data and then bring it into the main memory, the device IO controller will talk to the main memory directly without actually involving the CPU.

If we want to read a 100 MB file using memory-mapped IO, what the CPU does is send a signal to the IO controller instructing it to read the file. Then, rather than sending interrupts to the cpu for every byte read, it will write to the specific block of memory. Once the file reading is done, the IO controller will then send an interrupt to inform the CPU know that the requested data from the file is available in the memory.

The architecture (ISA) must provide support for mmIO.

## Timer

Timer sends interrupts every ~100 μs or so, so CPU cannot be hogged by a process - *preemptive execution*. Then the CPU can schedule another process to execute. Processes that do math computations (or have diverged) need to be interrupted by the timer; processes that do IO will be interrupted either way when the IO is attempted.

## Synchronization and atomic instructions

Interrupts intefere with executing processes. Kernel must be able to sync cooperating, conccurent processes. Arch must provide for atomic instructions. It must guarantee that short sequences of instructions (e.g. read-modify write) will be atomically executed.

Two solutions
- arch mechnism to disable interrupts before such sequences; then execute the sequence, then reebable interrupts.
- A special instruction that executes atomically (e.g. test and set)

## Virtual memory

 VM allows running processes without loading the entire program into memory. Instead pieces are loaded as needed. The kernel keeps track of the pieces, their location in memory, and which ones are still paged on the disk. The TLB is provided to do hardware lookup and translation from virtual to physical memory addresses.

## Lecture 3: Operating System Structures

CS 377 Spring 2014 - Operating Systems, UMass
https://www.youtube.com/watch?v=UxCiuctkKYo&list=PLacuG5pysFbDQU8kKxbUh4K5c1iL5_k7k&index=3

Computer architecture support

OS service:         Hardware support:
- Protection        Kernel and user mode (protection rings)
- Protection        protection instructions
- Protection        bounds in registers (base and limit address)
- Interrupts        Interrupt vectors
- Syscalls          Trap instructions and trap vectors
- I/O               Interrupts and memory mapping
- Scheduling        Timer
- error recovery    Timer
- accounting        Timer
- Synchronization   Atomic instructions
- VM                TLB

## Syscalls

Syscalls are API to the kernel services. Typically written in C/C++.

Syscalls are usually accessed via another high-level API, a library, rather then directly (although it is possible).

These libraries (high-level APIs) are wrappers around syscalls that provide convenience as they simplify the inteface, additional safety, increase portability.

Common APIs
- Win32 API for Windows
- POSIX API for Unix-likes
- Linux API
- Java API

The `prinf` from the *standard C library*, like `glibc`, is a library call which relies on the `write` syscall.

Example of Standard API

Consider the `ReadFile()` function in the Win32 API, a function for reading from a file.

```c
BOOL ReadFile c (HANDLE file,
                 LPVOID buffer,
                 DWORD bytesToRead,
                 LPDWORD bytesRead,
                 LPOVERLAPPED ovl);
```

Parameters passed to `ReadFile()`
- `HANDLE file` file-the file to be read
- `LPVOID buf` buffer where data will be read into, written from
- `DWORD bytesToRead` the number of bytes to be read into the buffer
- `LPDWORD bytesRead` the number of bytes read during the last read
- `LPOVERLAPPED ovl` indicates if overlapped I/O is being used

## System Call Implementation

- Typically, a number associated with each system call
- System-call interface maintains a table indexed according to these numbers
- The *system call interface* invokes intended system call in the kernel and returns status of the system call and any return values
- The caller need know nothing about how the syscall is implemented
- Just needs to respect the API and understand what the kernel will do as the result of a syscall
- Most details of the interface are hidden from programmer behind the API
- Managed by run-time support library - set of functions built into libraries included with compiler (e.g. glibc).

## System Call Parameter Passing

Often, more information is required than simply identity of the desired system call. Exact type and amount of information vary according to OS and a particular syscall.

Three general methods used to pass parameters to the OS:
- Simplest: pass the parameters in registers. But sometimes, there may be more parameters than registers
- Parameters stored in a block or table in memory. Then the address of the block is passed as a parameter in a register. This approach is taken by Linux and Solaris. This method does not limit the number or length of parameters being passed.
- Parameters pushed onto the stack by the program and popped off  by the OS. This method does not limit the number or length of parameters being passed.
