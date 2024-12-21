# Index :: Signals

SN| SIG NAME  | SIG desc                   | Default action
--|-----------|----------------------------|----------------
 1| SIGHUP    | Hang up                    | Term
 2| SIGINT    | Interrupt from keyboard    | Term
 3| SIGQUIT   | Terminal quit              | Core
 4| SIGILL    | Illegal Instruction        | Core
 5| SIGTRAP   | Trace/breakpoint trap      | Core
 6| SIGABRT   | Abort process              | Core
 7| SIGBUS    | Memory access error        | Core
 8| SIGFPE    | Floating-point error       | Core
 9| SIGKILL   | Death from above           | Term [untrappable]
10| SIGUSR1   | User-defined signal        | Term
11| SIGSEGV   | Segmentatation fault       | Core
12| SIGUSR2   | User-defined signal        | Term
13| SIGPIPE   | No pipe readers            | Term
14| SIGALRM   | Real-time timer expiration | Term
15| SIGTERM   | Terminate process          | Term
16| SIGSTKFLT | Stack fault on coprocessor | Term
17| SIGCHLD   | Death of a child           | Ignore
18| SIGCONT   | Continue after suspension  | Cont
19| SIGSTOP   | Terminal hard stop         | Stop [untrappable]
20| SIGTSTP   | Terminal soft stop         | Stop
21| SIGTTIN   | Bg job tries read from tty | Stop
22| SIGTTOU   | Bg job tries write to tty  | Stop
23| SIGURG    | Urgent data on socket      | Ignore
24| SIGXCPU   | CPU time limit exceeded    | Core
25| SIGXFSZ   | File size limit exceeded   | Core
26| SIGVTALRM | virtual alarm expired      | Term
27| SIGPROF   | Profiling timer expired    | Term
28| SIGWINCH  | Terminal wind size changed | Ignore
29| SIGIO     | I/O Possible               | Term
30| SIGPWR    | Power failure imminent     | Term
31| SIGSYS    | Invalid system call        | Core

Actions
- Term: terminate the process
- Core: produce core dump and terminate the process
- Ignore: ignore the signal
- Stop: stop (suspend) the process
- Cont: resume process (if stopped)

__SIGKILL__ and __SIGSTOP__ cannot be trapped (blocked or ignored).




```bash
34) SIGRTMIN    (RTMIN)        50) SIGRTMAX-14 (RTMAX-14)
35) SIGRTMIN+1  (RTMIN+1)      51) SIGRTMAX-13 (RTMAX-13)
36) SIGRTMIN+2  (RTMIN+2)      52) SIGRTMAX-12 (RTMAX-12)
37) SIGRTMIN+3  (RTMIN+3)      53) SIGRTMAX-11 (RTMAX-11)
38) SIGRTMIN+4  (RTMIN+4)      54) SIGRTMAX-10 (RTMAX-10)
39) SIGRTMIN+5  (RTMIN+5)      55) SIGRTMAX-9  (RTMAX-9)
40) SIGRTMIN+6  (RTMIN+6)      56) SIGRTMAX-8  (RTMAX-8)
41) SIGRTMIN+7  (RTMIN+7)      57) SIGRTMAX-7  (RTMAX-7)
42) SIGRTMIN+8  (RTMIN+8)      58) SIGRTMAX-6  (RTMAX-6)
43) SIGRTMIN+9  (RTMIN+9)      59) SIGRTMAX-5  (RTMAX-5)
44) SIGRTMIN+10 (RTMIN+10)     60) SIGRTMAX-4  (RTMAX-4)
45) SIGRTMIN+11 (RTMIN+11)     61) SIGRTMAX-3  (RTMAX-3)
46) SIGRTMIN+12 (RTMIN+12)     62) SIGRTMAX-2  (RTMAX-2)
47) SIGRTMIN+13 (RTMIN+13)     63) SIGRTMAX-1  (RTMAX-1)
48) SIGRTMIN+14 (RTMIN+14)     64) SIGRTMAX    (RTMAX)
49) SIGRTMIN+15 (RTMIN+15)
```
