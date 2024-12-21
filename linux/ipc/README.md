# Inter-process communication

A running Linux system consists of numerous processes, many of which operate independently of each other. Some processes, however, cooperate to achieve their intended purposes, and these processes need methods of communicating with one another and synchronizing their actions. One way for processes to communicate is by reading and writing information in disk files. However, for many applications, this is too slow and inflexible.

Linux provides a rich set of mechanisms for interprocess communication (IPC) including:
- *signals*, used to indicate that an event has occurred
- *pipes* and *FIFOs*, used to transfer data between processes
- *sockets*, used to transfer data from one process to another, either on the same computer or across the network
- *file locking*, allows a process to lock regions of a file in order to prevent other processes from reading or updating the file contents
- *message queues* used to exchange messages (packets of data) between processes
- *semaphores*, used to synchronize the actions of processes
- *shared memory*, allows two or more processes to share a piece of memory.

When one process changes the contents of the shared memory, other processes immediately see the update.

The wide variety of IPC mechanisms have some overlapping functionality as part of their evolution under different variants of the UNIX system and the requirements of various standards. For example, FIFOs and *UNIX domain sockets* essentially perform the same function of allowing unrelated processes on the same system to exchange data. Both exist in modern UNIX systems because FIFOs came from System V, while sockets came from BSD.
