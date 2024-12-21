# Processes

The OS creates the illusion of concurrency by virtualizing the CPU. By running one process, then stopping it and running another, and so forth, the OS can promote the illusion that many virtual CPUs exist when in fact there is only one physical CPUs (with a few cores). This basic technique, known as *time sharing*, allows users to run many processes concurrently.

To implement virtualization of the CPU, and to implement it well, the OS will need both some low-level machinery and some high-level intelligence.

We call the low-level machinery mechanisms; **mechanisms** are low-level methods or protocols that implement a needed piece of functionality. *Context switch*, when OS stops running one process and starts running another is a mechanism in this sense, employed by all modern OSes.

On top of these mechanisms resides some of the intelligence in the OS, in the form of policies. **Policies** are algorithms for making decisions in the kernel. A *scheduling policy* will make the decision which process to run next likely based on historical information, workload knowledge, and performance metrics.

## 4.1 The Abstraction: A Process
(book: OSs - 3 easy pieces)

The abstraction provided by the OS of a running program is something we call a process. A process is simply a running program. At any instant in time, we can summarize a process by taking an inventory of the different pieces of the system it accesses and affects during the course of execution.

To understand what constitutes a process, we thus have to understand the *machine state*: what a program can read or update when it is running. At any given time, what parts of the machine are important to the execution of this program?

The memory that the process can address (called its address space) is part of the process. Also part of the process's machine state are registers. Programs often access persistent storage devices too; such I/O information might include a list of the files the process currently has open.

## 4.2 Process API

Creation, destruction, etc.

## 4.3 Process Creation: A Little More Detail

The first thing that the OS must do to run a program is to *load* its code and any static data (e.g. initialized variables) into memory, into the address space of the process. 

Programs initially reside on disk in some kind of *executable format*; thus, the process of loading a program and static data into memory requires the OS to read those bytes from disk and place them in memory somewhere.

In early (or simple) operating systems, the loading process is done eagerly, such that everything is loaded all at once before running the program. Modern OSs perform this process lazily, i.e. by loading pieces of code or data only as they are needed during the program's execution.

Once the code and static data are loaded into memory, the OS needs to setup the *call stack* for the process by allocating some memory for it. The OS will also likely initialize the stack with args; specifically, it will fill in the parameters to the `main()` function, i.e. `argc` and `argv` array.

The OS may also allocate some memory for the program's *heap*. The heap is explicitly requested dynamically-allocated memory; programs request such space by calling `malloc()` and release it with `free()`. The heap is used to store parts of data structures such as linked lists, hash tables, trees.

The OS also performs other initialization tasks, particularly those related to I/O. In UNIX-like systems, each process by default is given 3 file descriptors (which let the process read input and print output).

After finishing the setup tasks, the OS has one last task left: to start the program at its entry point, namely `main()`. By jumping to the program's main() routine (through a specialized mechanism), the OS transfers control of the CPU to the new process, and thus the program begins executing.

### Process Management

A process is the unit of execution.

A process is the dynamic execution context of an executing program.

Several processes may run the same program, but each is a distinct process with its own state. A process executes sequentially, one instruction at a time.

Process state consists of at least
- code for the running program
- static data for the running program
- space for dynamic data (the heap), the heap pointer (HP)
- Program Counter (PC), indicating the next instruction
- execution stack with program's call chain (the stack), SP, BP
- values of CPU registers
- set of OS resources in use (e.g. open files)
- process execution states ('ready', 'running', etc.)

## 4.4 Process States

* *Running*: In the running state, a process is running on a processor. This means it is executing instructions.
* *Ready*: In the ready state, a process is ready to run but for some reason the OS has chosen not to run it at this given moment
* *Blocked*: In the blocked state, a process has performed some kind of operation that makes it not ready to run until some other event takes place. A common example: when a process initiates an I/O request to a disk, it becomes blocked and thus some other process can use the processor.

A process can be moved between the *ready* and *running* states at the discretion of the OS. Being moved from *ready* to *running* means the process has been **scheduled**; being moved from *running* to *ready* means the process has been **descheduled**.

Once a process has become **blocked** (e.g. by initiating an I/O operation), the OS will keep it as such until some event occurs (e.g. I/O completion); at that point, the process moves to the *ready* state again (and potentially immediately to *running* again, if the OS so decides).


### Process Execution States

Execution state of a process indicates what it is doing
- new: the OS is setting up a new process
- running: executing instructions on the CPU
- ready: ready to run, but waiting for the CPU
- waiting: waiting for an event to complete
- terminated: the OS is destroying this process

Example state sequence: new → ready → running → waiting for IO → ready → running → terminated

As program executes, it moves from state to state as a result of
- program actions (e.g. system calls)
- OS actions (scheduling)
- external actions (interrupts)

The OS manages multiple active process using state queues.

## 4.5 Process Data Structures

To track the state of each process the OS likely will keep some kind of *process list* for all processes that are ready, and some additional information to track which process is currently *running*. The OS must also track *blocked* processes; when an I/O event completes, the OS should make sure to wake up the correct process and ready it to run again.

Operating system (kernel) uses **Process Control Block** (PCB) data structure to keep track of all processes.
- PCB tracks the execution state and location of each process
- OS allocates a new PCB on process creation and places it on a *process state queue*
- OS deallocates the PCB when the process terminates

The PCB contains at least
- Process state (running, waiting, etc.)
- Process identification (PID) number
- Program Counter (PC)
- Stack Pointer (SP)
- *register context*: general purpose registers
- Memory management information
- Username of owner, UID
- List of open files
- pointers to state queues
- Scheduling information (e.g. priority, nice)
- I/O status
- etc.

Processs states
- UNUSED
- EMBRYO
- SLEEPING
- RUNNABLE
- RUNNING
- ZOMBIE

Process info
- Start of process memory
- Size of process memory
- Bottom of kernel stack for this process
- Process state
- PID
- PPID
- void *chan; // If !zero, sleeping on chan
- int killed; // If !zero, has been killed
- Open files
- PWD
- switch here to run process
- Trap frame for the current interrupt

For a stopped process, *register context* holds the contents of the registers. When a process is stopped, its registers will be saved to this memory location; by restoring these registers (i.e. placing their values back into the actual physical registers), the OS can resume running the process.

There are some other states a process can be in, beyond running, ready, and blocked. Sometimes a system will have an *initial state* that the process is in when it is being created. Also, a process could be placed in a *final state* where it has exited but has not yet been cleaned up.

In UNIX-based systems, this is called the *zombie state*. This final state can be useful as it allows other processes (usually the parent that created the process) to examine the return code of the process and see if the just-finished process executed successfully. When finished, the parent will make one final call (e.g. `wait()`) to wait for the completion of the child, and to also indicate to the OS that it can clean up any relevant data structures that referred to the now-extinct process.

## Context switch

Context switch includes all the operations done in order to stop one process and resume the next. A lot of info needs to be saved: contents of registers, stack, open FDs, etc.

It is said that context switches occur 100 to 1000 every second. If the process scheduler gives each process about 100 μs to execute on the CPU,...



### Best overclock
https://hwbot.org/benchmark/cpu_frequency/halloffame

- Best overclock (as of Sep 2024): Intel Core i9 14900KS @ 6.2GHz, overclocked to *9117.75 MHz*, with Liquid Helium cooling, on ASUS ROG Maximus Z790 Apex Encore motherboard; Core voltage cranked to *1.85 V*.

- 114.6 ps is the time of 1 cycle at 8.5 GHz


```
---------------------------------------------------------------
hertz   | cycles per sec          | duration of 1 CPU cycle
---------------------------------------------------------------
1    Hz |             1 = 10⁰     | 1     s
1   KHz |         1,000 = 10³     | 1    ms
1   MHz |     1,000,000 = 10⁶     | 1    μs
1   GHz | 1,000,000,000 = 10⁹     | 1    ns = 1000ps = 1 cycle/ns
3.3 GHz | 3,300,000,000 = 3.3×10⁹ | 0.33 ns = 330 ps = 3 cycles/ns
4   GHz | 4,000,000,000 = 4×10⁹   | 0.25 ns = 250 ps = 4 cycles/ns
5   GHz | 5,000,000,000 = 5×10⁹   | 0.20 ns = 200 ps = 5 cycles/ns
10  GHz |10,000,000,000 =10×10⁹   | 0.10 ns = 100 ps = 10 cycles/ns
---------------------------------------------------------------
light travels 300 mm in 1 ns    = 1000 ps
light travels 100 mm in 0.33 ns =  330 ps
light travels  75 mm in 0.25 ns =  250 ps
light travels  60 mm in 0.2 ns  =  200 ps
light travels  30 mm in 0.1 ns  =  100 ps
light travels   3 mm in 0.01 ns =   10 ps
light travels   1 mm in 0.03 ns =    3 ps
-----------------------------------------------------
1 cycle @ 1  Hz lasts 10⁰   s = 1  s
1 cycle @ 1 KHz lasts 10⁻³  s = 1 ms
1 cycle @ 1 MHz lasts 10⁻⁶  s = 1 μs
1 cycle @ 1 GHz lasts 10⁻⁹  s = 1 ns
1 cycle @ 1 THz lasts 10⁻¹² s = 1 ps
-----------------------------------------------------
1 s = 10⁰  s  =                 1  s
1 s = 10³ ms  =             1,000 ms
1 s = 10⁶ μs  =         1,000,000 μs
1 s = 10⁹ ns  =     1,000,000,000 ns
1 s = 10¹² ps = 1,000,000,000,000 ps
-----------------------------------------------------
1 s = 10³ ms = 10⁶ μs = 10⁹ ns = 10¹² ps
-----------------------------------------------------
1 ms = 10⁻³ s = 0.001
1 μs = 10⁻⁶ s = 0.000001
1 ns = 10⁻⁹ s = 0.000000001
-----------------------------------------------------
  1 μs =   1,000 ns
100 μs = 100,000 ns
-----------------------------------------------------
execution time slice = 100 μs
1s = 10³ ms = 10⁶ μs = 10⁹ ns
1s = 1,000,000 μs
1 s / 100 μs = 10,000 slices in a second
-----------------------------------------------------
100-1000 context switches every second
1,000 - 10,000 context switches a second
```

## Process State Queues

- The OS maintains the PCBs of all the processes in state queues.
- The OS places the PCBs of all the processes in the same execution state in the same queue.
- When the OS changes the state of a process, the PCB is unlinked from its current queue and moved to its new state queue.
- The OS can use different policies to manage each queue.
- Each I/O device has its own wait queue.
