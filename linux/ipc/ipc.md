# IPC

IPC types
- signals
- anonymous pipes
- named pipes
- sockets
- proc (bash)
- fds

IPC methods
- via files
- via signals
- memory-mapped file
- shared memory
  - semaphores
- message passing
  - message queue and mailbox
- pipes
  - anonymous pipe
  - named pipe
- sockets
  - network sockets
  - unix sockets


## Showing IPC information

Before experimenting with IPC, you should know what IPC facilities are already on your system: `lsipc` command provides that information.

```
RESOURCE DESCRIPTION                                           LIMIT USED  USE%
MSGMNI   Number of message queues                              32000    0 0.00%
MSGMAX   Max size of message (bytes)                              8K    -     -
MSGMNB   Default max size of queue (bytes)                       16K    -     -
SHMMNI   Shared memory segments                                 4096    0 0.00%
SHMALL   Shared memory pages                    18446744073692774399    0 0.00%
SHMMAX   Max size of shared memory segment (bytes)               16E    -     -
SHMMIN   Min size of shared memory segment (bytes)                1B    -     -
SEMMNI   Number of semaphore identifiers                       32000    0 0.00%
SEMMNS   Total number of semaphores                       1024000000    0 0.00%
SEMMSL   Max semaphores per semaphore set.                     32000    -     -
SEMOPM   Max number of operations per semop(2)                   500    -     -
SEMVMX   Semaphore max value                                   32767    -     -
```

You may notice that this sample listing includes 3 different types of IPC mechanisms, each available in the Linux kernel:
- messages (MSG)
- shared memory (SHM)
- semaphores (SEM)

You can view current activity in each of those subsystems with `ipcs`.


## Links

* IPC on Linux
https://opensource.com/article/20/1/inter-process-communication-linux

* Interprocess Communication in Operating System
https://data-flair.training/blogs/interprocess-communication-in-operating-system/
