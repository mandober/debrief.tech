# Linnux signals

About signals
- **Signal** is a mechanism that allows the kernel to communicate asynchronously with processes.
- Unlike exceptions, which cause imediately transfer of control, signals are only handled when the user-level process does a context switch, or when the context is switched from another process to yours, or when you do a context switch by going into the kernel mode (say, for a system call) and then back out of the kernel in order to end that system call when the kernel gives control back to the user-level code, that is, when the kernel decides to actually process that signal by calling the signal handling code.
- In other words, signals are received: (1) at some point of the execution of your code a context switch happens into the kernel mode, for example due to the system call; (2) when the process switches back to the user mode, the kernel checks for pending signals; (3) the kernel forces the process to receive any pending signals.
- There may be multiple *pending signals* that a process was sent but not yet received.

Signal bit vector
- the kernel sends a signals by setting a flag in target process' context.
- each process has a bit vec that represents signals.
- there are 62 signals, so the bit vec has length of 64-bits (probably)
- setting a bit to 1 means the signal corresponding to that slot is activated
- kernel maintains pending and blocked bit vectors in the context of each process. 'pending' vec represents the set of pending signals.
- kernel sets bit K in pending vec when a sig of type K is delivered
- kernel clears bit K in pending vec when a sig of type K is received
- 'blocked' vec represents the set of blocked signals.
- since a bit is either 0 or 1, the number of times some particular signal is received is not (cannot be) tracked.

System calls
- common system calls that deal with signals are 'wait', 'sleep', 'pause'
- `wait` allows us to block a process until we receive the SIGCHLD signal


Trappable and untrappable signals
- most signals can be trapped and then ignored
- only SIGSTOP and SIGKILL cannot be traped
- SIGKILL tells the process to die most urgently
- SIGSTOP tells the process to suspend itself most urgently
- bash builtin `kill` is used to emit a signal to a PID
- 'kill -l' lists the signals
- 'kill -sTSTP 123', 'kill -SIGTSTP 123', 'kill -n20 123' do the same thing
- 'kill -l 65 31' converts signumbers to signames

Signal properties
- each signal is identifed by a name (signame) and number (signumber)
- all signames have `SIG` prefix which may often be elided
- properties of signals: possible actions, default action, if trappable, etc.

Signal numbers
- signal numbers range from 1 to 64, but 32 and 33 are missing
- the gap left by them divides the 64 signals into 2 groups:
  - lower-number signals (1-31)
  - higher-number signals (34-64), aka POSIX real-time signals
- 31 signals of POSIX real-time group are further divided in 2 clusters:
  - 16 signals (34-49) with the first named `SIGMIN` and the remaining 15 named `SIGMIN+n` where n = 1..15. Synonym for these is `RTMIN`, i.e. `RTMIN+n`.
  - 15 signals (50-64) with the last named `SIGMAX` and the remaining 14 named `SIGMAX-m` where m = 1..14. Curiously the suffix `-m` is here in the descending order. Synonym for these is `RTMAX`, i.e. `RTMAX+m`.
- of the 31 lower-number signals (1-31) (all come before the gap), only a handful of signals is commonly used.

Delivering signals
- wherever they orignate from, the kernel delivers the signals to processes
- processes may install signal handlers for trappable signals
- while a signal is being handled in the user mode, we can receive other signals

Generating signals
- a signal is generated when an event occurs.
- later, a signal is delivered to process which takes an action in response
- between generation and delivery, a signal is said to be *pending*.
- we can *block (delay) delivery of specific signals* by adding them to process' *signal mask*. Signal mask equals a set of signals whose delivery is blocked. Pending signal is delivered only after it is unblocked.

Actions
- On delivery, process takes a default action if signal handler is not defined.
- Default action for each signal is signal-specific:
  - Ignore: signal is discarded by kernel, has no effect on process
  - Terminate: process is terminated ("killed")
  - Core dump + terminate: process produces a core dump and is terminated
  - Core dump file can be used to examine the state of program inside debugger
  - Stop: execution of process is suspended
  - Continue: execution of a stopped process is resumed

Process groups
- signals are not sent to individual processes, but to *process groups*.
- every process belongs to exactly one process group
- this is a part of implementing jobs
- there is 1 fg job, and any number of bg jobs
- only fg job can read from stdin and write to stdout/stderr
- bg job trying to read from terminal is sent SIGTTIN
- bg job trying to write to terminal is sent SIGTTOU
- Signal names are 3-6 char long (or 6-9 with SIG prefix). Signals with names that would fit into 6 chars (or 9 with SIG prefix) are nevertheless "copressed" to use less characters: HUP, ALRM, ABRT, USR1, USR2, CHLD, TTIN, TTOU, URG, PWR, SYS (perhaps to have distinctive names, in prose? Due to tradition and origin? Pomp and circumstance?)


## List of signals

SN| Name   | Expanded     | Desc                          | Default action
--|--------|--------------|-------------------------------|----------------
 1| HUP    | HangUp       | Hang up                       | Term
 2| INT    | Interrupt    | Interrupt from keyboard       | Term
 3| QUIT   | Quit         | Terminal quit                 | Core
 4| ILL    | Illegal      | Illegal Instruction           | Core
 5| TRAP   | Trap         | Trace/breakpoint trap         | Core
 6| ABRT   | Abort        | Abort process                 | Core
 7| BUS    | Bus          | Memory access error           | Core
 8| FPE    | FPE          | Floating-point error          | Core
 9| KILL   | Kill         | Death from above              | Term [untrappable]
10| USR1   | User1        | User-defined signal           | Term
11| SEGV   | Seg Violation| Segmentatation violation      | Core
12| USR2   | User2        | User-defined signal           | Term
13| PIPE   | Pipe         | No pipe readers               | Term
14| ALRM   | Alarm        | Real-time timer expiration    | Term
15| TERM   | Termination  | Terminate process             | Term
16| STKFLT | Stack Fault  | Stack fault on coprocessor    | Term
17| CHLD   | Child        | Death of a child              | Ignore
18| CONT   | Continue     | Continue after suspension     | Cont
19| STOP   | Stop         | Terminal hard stop            | Stop [untrappable]
20| TSTP   | TerminalStop | Terminal soft stop            | Stop
21| TTIN   | TTY In       | Bg job tries to read from tty | Stop
22| TTOU   | TTY Out      | Bg job tries to write to tty  | Stop
23| URG    | Urgent       | Urgent data on socket         | Ignore
24| XCPU   | ExceededCPU  | CPU time limit exceeded       | Core
25| XFSZ   | ExceededFSize| File size limit exceeded      | Core
26| VTALRM | VirtualAlarm | Virtual alarm expired         | Term
27| PROF   | Profiling    | Profiling timer expired       | Term
28| WINCH  | WindowChange | Terminal wind size changed    | Ignore
29| IO     | I/O          | Possible I/O                  | Term
30| PWR    | Power        | Power failure imminent        | Term
31| SYS    | System       | Invalid system call           | Core


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



## Sending signals

```bash
# send the signal SIGINT to the process with PID 123
kill -s INT 123
kill -s SIGINT 123
kill -n 2 123

# send the signal 0 to the process with PID 123
# this actually test whether there is such a PID
kill -n 0 123
```

## Signal descriptions

### SIGHUP
- Default action: Terminate
- Possible actions: Terminate, Ignore, Function call

SIGHUP is sent by the UART driver to the entire session when a hangup condition has been detected. Normally, this will kill all the processes. Some programs, such as nohup(1) and screen(1), detach from their session (and TTY), so that their child processes won't notice a (modem) hangup.

### SIGINT
- Default action: Terminate
- Possible actions: Terminate, Ignore, Function call

SIGINT is sent by the TTY driver to the current foreground job when the *interactive attention character* (typically `^C` which has ASCII code 0x03, aka ETX, End of Text) appears in the input stream, unless this behaviour has been turned off.

Anybody with access permissions to the TTY device can change the interactive attention character and toggle this feature. Additionally, the session manager keeps track of the TTY configuration of each job, and updates the TTY whenever there is a job switch.

### SIGQUIT
- Default action: Core dump
- Possible actions: Core dump, Ignore, Function call

SIGQUIT works just like SIGINT, but the quit character is `^\`, and the default action is to dump the core.

### SIGPIPE
- Default action: Terminate
- Possible actions: Terminate, Ignore, Function call

The kernel sends SIGPIPE to any process which tries to write to a pipe with no readers. This is useful, because otherwise jobs like `yes | head` would never terminate.

### SIGCHLD
- Default action: Ignore
- Possible actions: Ignore, Function call

When a child process dies or changes state (stop/continue), the kernel sends a SIGCHLD to its parent process.

The SIGCHLD signal carries additional information, namely the process id, the user id, the exit status (or termination signal) of the terminated process, and some execution-time statistics. The session leader (shell) keeps track of its jobs using this signal.

### SIGSTOP
- Default action: Suspend
- Possible actions: Suspend
- paired with: SIGCONT
- related to: SIGTSTP

This signal will unconditionally suspend the target process. The signal action cannot be reconfigured, i.e. the signal is not trappable.

However, SIGSTOP is not sent by the kernel during job control. Instead, `^Z` typically triggers a `SIGTSTP`, which can be intercepted by the application. The application may then, e.g., move the cursor to the bottom of the screen or otherwise put the terminal in a known state, and subsequently put itself to sleep using SIGSTOP.

The suspended process can be brought back to life with SIGCONT.

### SIGCONT
- Default action: Wake up
- Possible actions: Wake up, Wake up + Function call
- paired with: SIGSTOP

SIGCONT will un-suspend a stopped process. It is sent explicitly by the shell when the user invokes the `fg` command.

Since `SIGSTOP` cannot be trapped, an unexpected SIGCONT signal might indicate that the process was suspended some time ago, and then un-suspended.

### SIGTSTP
- Default action: Suspend
- Possible actions: Suspend, Ignore, Function call

SIGTSTP works just like SIGINT and SIGQUIT, but the magic character is typically `^Z`, and the default action is to suspend the process.

When a process is suspended, it stops running (its life hangs in the balance); it can be instructed to continue running in the foreground with `fg`, or to continue running but the background with `bg`.

`^Z followed by bg`: if you start a process that keeps on running, far longer then expected, you can first send it `^Z` to suspend it, and then do `bg` to have it continue running in the background, freeing the terminal.

### SIGTTIN
- Default action: Suspend
- Possible actions: Suspend, Ignore, Function call
- related: SIGTTOU

If a backgrounded process *tries to read from terminal* (from a TTY device), the TTY sends the SIGTTIN signal to the entire job. Normally, this suspends the job.

### SIGTTOU
- Default action: Suspend
- Possible actions: Suspend, Ignore, Function call
- related: SIGTTIN
- scope: per tty behaviour

If a backgrounded process *tries to write to terminal* (to a TTY device), the TTY sends a SIGTTOU signal to the entire job. Normally, this suspends the job. It is possible to turn off this feature on a per TTY basis.

### SIGWINCH
- Default action: Ignore
- Possible actions: Ignore, Function call
- on: terminal (window) size changed (col×row)

As mentioned, the TTY device keeps track of the *terminal size* (row × cols), but this information needs to be updated manually. Whenever that happens, the TTY device sends SIGWINCH (aka window changed) to the foreground job. Well-behaving interactive applications, such as editors, react upon this, fetching the new terminal size from the TTY device, and redrawing themselves to the screen accordingly.

### SIGSEGV
Attempt to access a nonexistent memory address

### SIGXCPU
Process CPU time limit exceeded






## Example study case

Suppose you are editing a file in the terminal, in some text editor. The cursor is somewhere in the middle of the screen, and the editor is busy executing some processor-intensive task, such as a search-and-replace operation on a large file.

Now you press `^Z`. Since the line discipline has been configured to intercept this character (`^Z` is a single byte with ASCII dec code 26 or 0x1a hex), you do not have to wait for the editor to complete its task and start reading from the TTY device. Instead, the line discipline subsystem instantly sends `SIGTSTP` to the foreground process group. This process group contains the editor, as well as any child processes created by it.

The editor has installed a signal handler for `SIGTSTP`, so the kernel diverts the process into executing the signal handler code. This code moves the cursor to the last line on the screen, by writing the corresponding control sequences to the TTY device. Since the editor is still in the foreground, the control sequences are transmitted as requested. But then the editor sends a `SIGSTOP` to its own process group.

The editor has now been stopped. This fact is reported to the session leader using a `SIGCHLD` signal, which includes the PID of the suspended process. When all processes in the foreground job have been suspended, the session leader reads the current configuration from the TTY device, and stores it for later retrieval. The session leader goes on to install itself as the current foreground process group for the TTY using an `ioctl` call. Then, it prints something like "[1]+ Stopped" to inform the user that a job was just suspended.

At this point, `ps`(1) will tell you that the editor process is in the stopped state (state `T`). If we try to wake it up, either by using the `bg` builtin or using `kill` to send `SIGCONT` to the process(es), the editor will start executing its `SIGCONT` signal handler. This signal handler will probably attempt to redraw the editor TUI by writing to the TTY device. But since the editor is now a background job, the TTY device will not allow it. Instead, the TTY will send `SIGTTOU` to the editor, stopping it again. This fact will be communicated to the session leader using `SIGCHLD`, and the shell will once again write "[1]+ Stopped" to the terminal.

When we type `fg`, however, the shell first restores the line discipline configuration that was saved earlier. It informs the TTY driver that the editor job should be treated as the foreground job from now on. And finally, it sends a `SIGCONT` signal to the process group. The editor process attempts to redraw its TUI, and this time it won't be interrupted by `SIGTTOU` since it is now a part of the foreground job.
