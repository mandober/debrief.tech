# Process

- process properties
  - session ID
  - job ID
  - process name
  - PID
  - stdin
  - stdout
  - stderr
  - PPID
  - PGID
  - SID
  - TTY
- parent process
- child process
- session leader
- process group leader
- nohup
- disown
- controlling process group
- foreground process group
- file descriptor
- job
- pipeline
- session manager
- session leader (usually the shell)
- /dev/pts/0
- TTY driver
- foreground job
- background job
- bg
- fg
- `^Z` SIGTSTP
- `^C` SIGINT
- `^D` EOF
- process groups
- interactive attention character (typically `^C`)

SIGINT is sent by the TTY driver to the current foreground job when the *interactive attention character* (typically `^C` with ASCII code 0x03, aka ETX or "End of Text") appears in the input stream.

A process can be in one of the following states:
- R  Running or runnable (on run queue)
- D  Uninterruptible sleep (waiting for some event)
- S  Interruptible sleep (waiting for some event or signal)
- T  Stopped, due to signal or cos it is traced by debugger
- Z  Zombie, terminated but not yet reaped by its parent

Each process is given some amount of time (called a quantum) on a CPU to execute (about 100 ms, ballpark) before the kernel preempts it, and switches the execution context with another process.

File I/O
System Call Tracing with strace
Processes
Signals
Process lifecycle
Process context
Process descriptors
Process attributes - key elements
  state
  PID
  TGID
  thread info
  flags
  exit code, exit signal
  comm
  ptrace
Process relations - key elements
  real parent and parent
  children
  sibling
  group leader
Scheduling attributes - key elements
  prio, static_prio
  se, rt, dl
  policy
  cpus_allowed
  rt_priority
Process limits - key elements
File descriptor table - key elements
  fs
  files
Signal descriptor - key elements
  signal
  sighand
  sigset_t blocked, real_blocked
  pendingsas_ss_sp
  sas_ss_size
Kernel stack
Process creation
  fork()
  Copy-on-write (COW)
  exec
  vfork()
  Linux support for threads
  clone()
Kernel threads
  do_fork()
  copy_process()
Process status and termination
  wait
  exit
Namespaces and cgroups
  Mount namespaces
  UTS namespaces
  IPC namespaces
  PID namespaces
  Network namespaces
  User namespaces
  Cgroup namespaces
  Control groups (cgroups)

Low-level file I/O
Processes
Files, directories, and links
Signals
Process lifecycle: creation, termination, and waiting on child processes
Creating processes and executing programs
POSIX threads
Interprocess communication (pipes, FIFOs, semaphores, shared memory)
Network programming (sockets)
Alternative I/O models (poll(), select(), signal-driven I/O, epoll)

## The Linux Programming Interface
1   History and Standards
2   Fundamental Concepts
3   System Programming Concepts
4   File I/O: The Universal I/O Model
5   File I/O: Further Details
6   Processes
7   Memory Allocation
8   Users and Groups
9   Process Credentials
10   Times and Dates
11   System Limits and Options
12   Retrieving System and Process Information
13   File I/O Buffering
14   File Systems
15   File Attributes
16   Extended Attributes
17   Access Control Lists
18   Directories and Links
19   Monitoring File Events with inotify
20   Signals: Fundamental Concepts
21   Signals: Signal Handlers
22   Signals: Advanced Features
23   Timers and Sleeping
24   Process Creation
25   Process Termination
26   Monitoring Child Processes
27   Program Execution
28   Process Creation and Program Execution in More Detail
29   Threads: Introduction
30   Threads: Thread Synchronization
31   Threads: Thread Safety and Per-thread Storage
32   Threads: Thread Cancellation
33   Threads: Further Details
34   Process Groups, Sessions, and Job Control
35   Process Priorities and Scheduling
36   Process Resources
37   Daemons
38   Writing Secure Privileged Programs
39   Capabilities
40   Login Accounting
41   Fundamentals of Shared Libraries
42   Advanced Features of Shared Libraries
43   Interprocess Communication Overview
44   Pipes and FIFOs
45   Introduction to System V IPC
46   System V Message Queues
47   System V Semaphores
48   System V Shared Memory
49   Memory Mappings
50   Virtual Memory Operations
51   Introduction to POSIX IPC
52   POSIX Message Queues
53   POSIX Semaphores
54   POSIX Shared Memory
55   File Locking
56   Sockets: Introduction
57   Sockets: Unix Domain
58   Sockets: Fundamentals of TCP/IP Networks
59   Sockets: Internet Domains
60   Sockets: Server Design
61   Sockets: Advanced Topics
62   Terminals
63   Alternative I/O Models
64   Pseudoterminals
A   Tracing System Calls
B   Parsing Command-Line Options
C   Casting the NULL Pointer
D   Kernel Configuration
E   Further Sources of Information
F   Solutions to Selected Exercises
