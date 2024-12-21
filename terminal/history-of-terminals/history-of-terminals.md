# History of terminals

Adapted from the article: "The TTY demystified" by Linus Akesson, 2008
https://www.linusakesson.net/programming/tty/index.php

Timeline
- 1869 the stock ticker
- ? command line interface
- ? UNIX
- 1970s video terminals (VT-100)


In `1869`, the stock ticker was invented. It was an electro-mechanical machine consisting of a *typewriter*, a long pair of wires and a ticker *tape printer*, and its purpose was to distribute stock prices over long distances in realtime. This concept gradually evolved into the faster, ASCII-based *teletype*. Teletypes were once connected across the world in a large network, called "Telex", which was used for transferring commercial telegrams, but the teletypes were not connected to any computers yet.

Meanwhile, however, the computers - still quite large and primitive, but able to multitask - were becoming powerful enough to be able to interact with users in realtime. When the *command line* eventually replaced the old *batch processing model*, teletypes were used as *input and output devices* because they were readily available on the market.

There was a plethora of teletype models around, all slightly different, so some kind of software compatibility layer was called for. In the UNIX world, the approach was to let the kernel handle all the low-level details, including
- word length
- baud rate
- flow control
- parity
- control codes for rudimentary line editing

Control codes for advanced features (colors and styles, cursor movement, etc.) were introduced in the late `1970s`, after the advent of *solid state video terminals* like VT-100; the jurisdiction over the advanced control codes was left to applications.

Today, physical teletypes and *video terminals* are practically extinct, but they do still exist in software as *terminal emulators*, i.e. programs aiming to faithfully simulate real devices, down to their idiosyncatic behavior.

## Mainframes and terminals

- UART
- UART driver
- Line discipline
- TTY driver

Physical video terminals were called dumb devices because they barely had any processing power on their own. Their purpose was to provide an interface to the mainframe computer. They would rely the user's input to the manframe which performed the computation, sending the result back to the terminal to be displayed to the user. The mainframe was the main protagonist, and the terminals were only there to convey input/output.

```
┌─────────────────┐
│    Terminal     │
│        ↕        │
│ Physical line   │ Hardware
│        ↕        │
│      UART       │
└────────↑────────┘
┌────────↓────────┐
│    UART driver  │
│        ↕        │
│ Line discipline │ kernel
│        ↕        │
│    TTY driver   │
└────────↓────────┘
         ↑          Software
   User process
   User process
   User process
```

Terminals were connected through a pair of wires to an **UART** (Universal Asynchronous Receiver and Transmitter) on the (mainframe) computer.

The OS kernel contains an **UART driver** which manages the physical transmission of bytes, including parity checks and flow control.

In a naïve approach, the UART driver would then deliver the incoming bytes directly to an application (user process), but such an approach would skip some essential features of terminals, such as line editing and session management.

### Line editing

- editing buffer collects characters enabling editing
- Backspace (BS), Delete (DEL) key
- methods for rudimentary command-line editing
- line disciplines
  - cooked (canonical) mode [default]
  - raw mode


The intended behaviour of the *backspace key* is to move the cursor one space to the left, erasing the cell's contents. This could be handled in the running application, but, in accordance with the UNIX design philosophy, an application should only concern itself with one thing - it should do that one thing correctly and not worry about other things.

Instead, as a convenience, the kernel provides an *editing buffer*, which collects the typed characters thus allowing for rudimentary edits of the command-line before it is submited; it also provides a set of methods for editing the command-line (moving the cursor, erasing characters or words or the entire line), which are enabled by default as part of the **cooked (canonical)** line discipline.

>A **line discipline** is a set of properties governing the behavior of a serial device (such as a terminal).

By default, the cooked mode is the active line discipline associated with terminals. It provides much more processing of the input compared to the raw mode - first of all, it buffers the input characters, which enables command-line editing and opens the doors to features like bash's programmable completions; the cooked mode also "cooks" characters, ironing the edge cases and canonicalizing the input. A line discipline also includes options for controlling keyboard feedback (i.e. *character echoing*) and *automatic conversion of line endings* (conversions between carriage returns and linefeeds).

Applications may disable these features by setting the terminal's line discipline to the **raw mode**. Many utilities (vim, emacs, mail agents, in general, programs relying on the `curses` or `readline` library) opt into the raw mode because they want total control over all aspects of terminal interaction.

The kernel provides different line disciplines for different purposes, such as the one for managing packet switched data (ppp, IrDA, serial mice). Only a single line discipline can be active (associated to a serial device) at a time.

### Session management

The user can run several programs simultaneously, interacting with one of them at a time. The user should also be able to control processes: interrupt them, suspend them, send a process to run in the background; importantly, the user should be able to terminate (diverging) processes. Backgrounded process should run until it tries to write to the terminal, at which point it should be suspended (trap the `SIGTTOU` signal). Similarly, only the foreground process should receive input from the terminal. **TTY driver** implementes these features.

A process is *alive* if it has *execution context*, meaning it can perform actions. The TTY driver is not alive - in OO terminology, the TTY driver is what is called a *passive object* - it has some data fields and methods, but the only way it can actually do something is when its methods are called from the context of another process or via an interrupt handler. Line discipline is a passive entity as well.

A particular triplet of the *UART driver*, an instance of the *line discipline*, and the *TTY driver* are referred to as a **TTY device**, or just **TTY**.

A user process can affect the behaviour of any TTY device by manipulating its settings in `/dev`. Write permission to the device file is required, so when a user logs in on a particular TTY, that user must become the owner of the device file. This is traditionally done through the `login` program, which runs with root privileges.

The *physical line* connecting a terminal with a computer might be a long-distance phone line, so we need to add a *modem* to the hardware section of the previous diagram:

```
┌─────────────────┐
│    Terminal     │
│        ↕        │
│      Modem      │
│        ↕        │
│  Physical line  │ Hardware
│        ↕        │
│      Modem      │
│        ↕        │
│      UART       │
└─────────────────┘
```

This doesn't change the setup much, except we now need to handle the case of a modem hangup as well.

*Linux console* on a typical desktop system may be represented like so:

```
                                      hardware
 Keyboard              Display
┌───────⇅──────────────⇅ ───────────┐
│ Keyboard driver        VGA driver │ kernel
│         ⇅              ⇅          │
│         Terminal emulator         │
│                ⇅                   │
│          Line discipline          │
│                ⇅                   │
│            TTY driver             │
└───────⇅──────────────⇅ ───────────┘
user process       user process       software
        user processes…
```

The TTY driver and the line discipline behave just like before, but there is no UART or physical terminal involved anymore.

Instead, a *video terminal* (a complex state machine including a frame buffer of characters and graphical character attributes) is emulated in software, and rendered to a *VGA display*.

In the diagram above, keyboard and display are hardware devices that connect to the keyboard driver and VGA driver in the kernel, respectrively. In fact, besides the keyboard driver and VGA driver, the kernel also includes terminal emulator, line discipline and the TTY driver. User processes are also part of software, except they live outside kernel.

The *console subsystem* is somewhat rigid; things get more flexible (and more abstract) if we move the terminal emulation into the userland. This is how `xterm` and its clones work.

```
┌───────────────────────────────────┐
│ KERNEL          TTY driver   ←────────→ user process
│              (PTY slave side) ←────────→ user process
│            ↙                      │
│          ↗                        │
│    Line                           │
│ discipline                        │
│            ↘                      │
│              ↖                    │
│               PTY master side ←────→ xterm process
└───────────────────────────────────┘
SOFTWARE
```

To facilitate moving the terminal emulation into userland, while still keeping the TTY subsystem (session management and line discipline) intact, the **pseudo terminal (pty)** was invented.

Things get even more complicated when you start running pseudo terminals inside pseudo terminals, à la screen or ssh.

## Processes

How does all of this fit into a process model?

A process can be in one of the following states:
- R  Running or runnable (on run queue)
- D  Uninterruptible sleep (waiting for some event)
- S  Interruptible sleep (waiting for some event or signal)
- T  Stopped, due to signal or cos it is traced by debugger
- Z  Zombie, terminated but not yet reaped by its parent

By running `ps l`, you can see which processes are running, and which are sleeping. If a process is sleeping, the `WCHAN` (wait channel) column will tell you what kernel event the process is waiting for.

The "wait" wait queue corresponds to the wait(2) syscall, so these processes will be moved to the running state whenever there's a state change in one of their child processes.

There are 2 sleeping states:
- interruptible sleep
- uninterruptible sleep

*Interruptible sleep* (the common case) means that while the process is part of a wait queue, it may actually also be moved to the running state when a signal is sent to it.

If you look inside the kernel source code, you will find that any kernel code which is waiting for an event must check if a signal is pending after the call to `schedule()` returns, and abort the syscall in that case.

In the `ps` listing, the `STAT` column displays the current state of each process. The STAT column may contain one or more attributes, or flags:
- `s`  This process is a *session leader*
- `+`  This process is part of a *foreground process group*

These attributes are used for job control.

## Jobs and sessions

**Job control** is what happens when you press `^Z` to suspend a program, or when you start a program in the background byu appending `&`.

A *job* is the same thing as a *process group*.

Builtins (internal shell commands) `jobs`, `fg` and `bg` are used to manipulate jobs in a session.

Each *session* is managed by a **session leader** - the shell - which is cooperating with the kernel using a complex protocol of signals and system calls.

The following example illustrates the relationship between processes, jobs and sessions.

These shell interactions:

```bash
$ cat
suzuki
suzuki
^Z
[1]+ Stopped        cat
$ ls | sort
```

correspond to these processes:

```
Session | 100   |             101             |
Job     | 100   | 101   | 102  |      103     |
Name    | xterm | bash  | cat  | ls    | sort |
PID     | 100   | 101   | 102  | 103   | 104  |
stdin   | -     | pts0  | pts0 | pts0  | pts0 |
stdout  | -     | pts0  | pts0 | pts0  | pts0 |
stderr  | -     | pts0  | pts0 | pts0  | pts0 |
PPID    | ?     | 100   |      |       |      |
PGID    | 100   | 101   |      |       |      |
SID     | 100   | 101   |      |       |      |
TTY     | ?     | pts0  | pts0 |  pts0 | pts0 |
```

Note: pts0 in the table means /dev/pts/0

So, there are 2 sessions, 4 jobs, and 5 processes.


…and to these kernel structures:
- TTY Driver (/dev/pts/0)
  - Size: 45x13
  - *Controlling process group*: 101
  - *Foreground process group*: 103
  - *UART configuration* (ignored since xterm): 
    baud rate, parity, word length, etc.
  - *Line discipline configuration*: 
    cooked/raw mode, linefeed correction, meaning of interrupts, etc.
  - *Line discipline state*: 
    edit buffer (currently empty), cursor position within buffer, etc.
- pipe0
  - readable end (connected to PID 104 as FD 0)
  - writable end (connected to PID 103 as FD 1)
  - buffer


The basic idea is that *every pipeline is a job*, because every process in a pipeline should be manipulated (stopped, resumed, killed) simultaneously.

That is why kill(2) allows you to send signals to entire process groups.

By default, fork(2) places a newly created child process in the same process group as its parent, so that, e.g., `^C` from the keyboard affects both the parent and the child.

But the shell, as part of its session leader duties, creates a new process group for each assembled pipeline.

The TTY driver keeps track of the foreground process GROUP ID, but only in a passive way. The *session leader* has to update this information explicitly when necessary.

Similarly, the TTY driver keeps track of the size of the connected terminal, but this information has to be updated explicitly by the terminal emulator or even by the user.

As the diagram shows, several processes have `/dev/pts/0` attached to their standard input. But only the foreground job (the `ls | sort` pipeline above) will receive input from the TTY.

Likewise, only the foreground job will be allowed to write to the TTY device (in the default configuration). If the `cat` process were to attempt to write to the TTY, the kernel would suspend it using the SIGTTOU signal.

## Signals

Now let's take a closer look at how the TTY drivers, the line disciplines and the UART drivers in the kernel communicate with the userland processes.

UNIX files, including the TTY device file, can be read from and written to, and further manipulated by means of the magic `ioctl`(2) call (the Swiss army-knife of UNIX) for which lots of TTY related operations have been defined. Still, `ioctl` requests have to be initiated from processes, so they cannot be used when the kernel needs to communicate asynchronously with an application.

The Linux kernel communicates with processes by sending them paralyzing or deadly signals. Processes may catch (trap) some signals, but not all.

A **signal** is a crude mechanism that allows the kernel to communicate asynchronously with processes.

Signals in Linux are not clean or general; rather, each signal is unique, and must be studied individually. You can use the command `kill -l` to see which signals are available.

```bash
$ kill -l

 1) SIGHUP        2) SIGINT        3) SIGQUIT       4) SIGILL
 5) SIGTRAP       6) SIGABRT       7) SIGBUS        8) SIGFPE
 9) SIGKILL      10) SIGUSR1      11) SIGSEGV      12) SIGUSR2
13) SIGPIPE      14) SIGALRM      15) SIGTERM      16) SIGSTKFLT
17) SIGCHLD      18) SIGCONT      19) SIGSTOP      20) SIGTSTP
21) SIGTTIN      22) SIGTTOU      23) SIGURG       24) SIGXCPU
25) SIGXFSZ      26) SIGVTALRM    27) SIGPROF      28) SIGWINCH
29) SIGIO        30) SIGPWR       31) SIGSYS       34) SIGRTMIN
35) SIGRTMIN+1   36) SIGRTMIN+2   37) SIGRTMIN+3   38) SIGRTMIN+4
39) SIGRTMIN+5   40) SIGRTMIN+6   41) SIGRTMIN+7   42) SIGRTMIN+8
43) SIGRTMIN+9   44) SIGRTMIN+10  45) SIGRTMIN+11  46) SIGRTMIN+12
47) SIGRTMIN+13  48) SIGRTMIN+14  49) SIGRTMIN+15  50) SIGRTMAX-14
51) SIGRTMAX-13  52) SIGRTMAX-12  53) SIGRTMAX-11  54) SIGRTMAX-10
55) SIGRTMAX-9   56) SIGRTMAX-8   57) SIGRTMAX-7   58) SIGRTMAX-6
59) SIGRTMAX-5   60) SIGRTMAX-4   61) SIGRTMAX-3   62) SIGRTMAX-2
63) SIGRTMAX-1   64) SIGRTMAX
```

Signals are numbered starting with 1. However, when they are used in a bitmask (e.g. in output of `ps s`), the least significant bit corresponds to signal 1.

This article focuses on these signals:
- HUP
- INT
- QUIT
- PIPE
- CHLD
- STOP
- CONT
- TSTP
- TTIN
- TTOU
- WINCH

### SIGHUP
- Default action: Terminate
- Possible actions: Terminate, Ignore, Function call
SIGHUP is sent by the UART driver to the entire session when a hangup condition has been detected. Normally, this will kill all the processes. Some programs, such as nohup(1) and screen(1), detach from their session (and TTY), so that their child processes won't notice a hangup.

### SIGINT
- Default action: Terminate
- Possible actions: Terminate, Ignore, Function call
SIGINT is sent by the TTY driver to the current foreground job when the *interactive attention character* (typically `^C`, which has ASCII code 0x03, aka ETX, End of Text) appears in the input stream, unless this behaviour has been turned off. Anybody with access permissions to the TTY device can change the interactive attention character and toggle this feature; additionally, the session manager keeps track of the TTY configuration of each job, and updates the TTY whenever there is a job switch.

### SIGQUIT
- Default action: Core dump
- Possible actions: Core dump, Ignore, Function call
SIGQUIT works just like SIGINT, but the quit character is typically `^\` and the default action is different.

### SIGPIPE
- Default action: Terminate
- Possible actions: Terminate, Ignore, Function call
The kernel sends SIGPIPE to any process which tries to write to a pipe with no readers. This is useful, because otherwise jobs like `yes | head` would never terminate.

### SIGCHLD
- Default action: Ignore
- Possible actions: Ignore, Function call
When a process dies or changes state (stop/continue), the kernel sends a SIGCHLD to its parent process. The SIGCHLD signal carries additional information, namely the process id, the user id, the exit status (or termination signal) of the terminated process and some execution time statistics. The session leader (shell) keeps track of its jobs using this signal.

### SIGSTOP
- Default action: Suspend
- Possible actions: Suspend
This signal will unconditionally suspend the recipient, i.e. its signal action can't be reconfigured. However, SIGSTOP is not sent by the kernel during job control. Instead, `^Z` typically triggers a SIGTSTP, which can be intercepted by the application. The application may then, e.g., move the cursor to the bottom of the screen or otherwise put the terminal in a known state, and subsequently put itself to sleep using SIGSTOP.

### SIGCONT
- Default action: Wake up
- Possible actions: Wake up, Wake up + Function call
SIGCONT will un-suspend a stopped process. It is sent explicitly by the shell when the user invokes the `fg` command. Since SIGSTOP cannot be trapped, an unexpected SIGCONT signal might indicate that the process was suspended some time ago, and then un-suspended.

### SIGTSTP
- Default action: Suspend
- Possible actions: Suspend, Ignore, Function call
SIGTSTP works just like SIGINT and SIGQUIT, but the magic character is typically `^Z` and the default action is to suspend the process.

### SIGTTIN
- Default action: Suspend
- Possible actions: Suspend, Ignore, Function call
If a backgrounded process tries to read from a TTY device, the TTY sends the SIGTTIN signal to the entire job. Normally, this suspends the job.

### SIGTTOU
- Default action: Suspend
- Possible actions: Suspend, Ignore, Function call
If a backgrounded process tries to write to a TTY device, the TTY sends a SIGTTOU signal to the entire job. This will normally suspend the job. It is possible to turn off this feature on a per-TTY basis.

### SIGWINCH
- Default action: Ignore
- Possible actions: Ignore, Function call
As mentioned, the TTY device keeps track of the *terminal size* (row × cols), but this information needs to be updated manually. Whenever that happens, the TTY device sends SIGWINCH (window changed) to the foreground job. Well-behaving interactive applications, such as editors, react upon this, fetching the new terminal size from the TTY device, and redrawing themselves (the screen) accordingly.

## An example

Suppose you are editing a file in the terminal, in some text editor. The cursor is somewhere in the middle of the screen, and the editor is busy executing some processor-intensive task, such as a search-and-replace operation on a large file.

Now you press `^Z`. Since the line discipline has been configured to intercept this character (`^Z` is a single byte with ASCII dec code 26 or 0x1a hex), you do not have to wait for the editor to complete its task and start reading from the TTY device. Instead, the line discipline subsystem instantly sends `SIGTSTP` to the foreground process group. This process group contains the editor, as well as any child processes created by it.

The editor has installed a signal handler for `SIGTSTP`, so the kernel diverts the process into executing the signal handler code. This code moves the cursor to the last line on the screen, by writing the corresponding control sequences to the TTY device. Since the editor is still in the foreground, the control sequences are transmitted as requested. But then the editor sends a `SIGSTOP` to its own process group.

The editor has now been stopped. This fact is reported to the session leader using a `SIGCHLD` signal, which includes the PID of the suspended process. When all processes in the foreground job have been suspended, the session leader reads the current configuration from the TTY device, and stores it for later retrieval. The session leader goes on to install itself as the current foreground process group for the TTY using an `ioctl` call. Then, it prints something like "[1]+ Stopped" to inform the user that a job was just suspended.

At this point, `ps`(1) will tell you that the editor process is in the stopped state (state `T`). If we try to wake it up, either by using the `bg` builtin or using `kill` to send `SIGCONT` to the process(es), the editor will start executing its `SIGCONT` signal handler. This signal handler will probably attempt to redraw the editor TUI by writing to the TTY device. But since the editor is now a background job, the TTY device will not allow it. Instead, the TTY will send `SIGTTOU` to the editor, stopping it again. This fact will be communicated to the session leader using `SIGCHLD`, and the shell will once again write "[1]+ Stopped" to the terminal.

When we type `fg`, however, the shell first restores the line discipline configuration that was saved earlier. It informs the TTY driver that the editor job should be treated as the foreground job from now on. And finally, it sends a `SIGCONT` signal to the process group. The editor process attempts to redraw its TUI, and this time it won't be interrupted by `SIGTTOU` since it is now a part of the foreground job.

## Flow control and blocking I/O

Run `yes` in `xterm`, and you will see a lot of "y" lines swooshing past your eyes. Naturally, the 'yes' process is able to generate "y" lines much faster than the xterm application is able to parse them, update its frame buffer, communicate with the X server in order to scroll the window, and so on. How is it possible for these programs to cooperate?

The answer lies in *blocking I/O*. The *pseudo terminal* can only keep a certain amount of data inside its *kernel buffer*, and when that buffer is full and 'yes' tries to call `write`(2), then write(2) will block, moving the 'yes' process into the *interruptible sleep state* where it remains until the xterm process has had a chance to read off some of the buffered bytes.

The same thing happens if the TTY is connected to a serial port. 'yes' would be able to transmit data at a much higher rate than, say, 9600 baud, but if the serial port is limited to that speed, the kernel buffer soon fills up and any subsequent write(2) calls block the process (or fail with the error code `EAGAIN` if the process has requested non-blocking I/O).

However, it is possible to explicitly put the TTY in a blocking state even though there is space left in the kernel buffer. Then, until further notice, every process trying to write(2) to the TTY automatically blocks.

The use case of such a feature is when an application floods the screen with data, so the user can press `^S` to "freeze" the screen, then `^Q` to unfreeze it.


Suppose we're talking to some old VT-100 hardware at 9600 baud. We just sent a complex control sequence asking the terminal to scroll the display. At this point, the terminal gets so bogged down with the scrolling operation, that it's unable to receive new data at the full rate of 9600 baud. Well, physically, the terminal UART still runs at 9600 baud, but there won't be enough buffer space in the terminal to keep a backlog of received characters. This is when it would be a good time to put the TTY in a blocking state. But how do we do that from the terminal?

We have already seen that a TTY device may be configured to give certain data bytes a special treatment. In the default configuration, for instance, a received `^C` byte won't be handed off to the application through read(2), but will instead cause a `SIGINT` to be delivered to the foreground job. 

In a similar way, it is possible to configure the TTY to react to a *stop flow byte* (`^S`, ASCII code 19) and a *start flow byte* (`^Q`, ASCII code 17).

Old hardware terminals transmit these bytes automatically, and expect the operating system to regulate its flow of data accordingly. This is called **flow control**, and it's the reason why your xterm sometimes appears to freeze up when you accidentally press `^S`.

There's an important difference here: writing to a TTY which is stopped due to flow control or due to lack of kernel buffer space will block your process, whereas writing to a TTY from a background job will cause a `SIGTTOU` to suspend the entire process group.

I don't know why the designers of UNIX had to go all the way to invent `SIGTTOU` and `SIGTTIN` instead of relying on blocking I/O, but my best guess is that the TTY driver, being in charge of job control, was designed to monitor and manipulate whole jobs; never the individual processes within them.

## Configuring the TTY device

To find out what the controlling TTY for your shell is called, you could refer to the `ps l` listing as described earlier, or you could simply run the `tty`(1) command.

A process may read or modify the configuration of an open TTY device using `ioctl`(2). The API is described in `tty_ioctl`(4). Since it's part of the ABI between Linux applications and the kernel, it will remain stable across Linux versions. However, the interface is non-portable, and applications should rather use the POSIX wrappers described in the `termios`(3) man page (if you're writing a C program and would like to intercept `^C` before it becomes a `SIGINT`, or to disable line editing or character echoing, to change the baud rate of a serial port, to turn off flow control, etc., then you will find what you need in the aforementioned man page).

There is also a command line tool, called `stty`(1), to manipulate TTY devices. It uses the `termios`(3) API.

```bash
$ stty -a

speed 38400 baud;
rows 44;
columns 183;
line = 0;
intr = ^C;
quit = ^\;
erase = ^?;
kill = ^U;
eof = ^D;
eol = <undef>;
eol2 = <undef>;
swtch = <undef>;
start = ^Q;
stop = ^S;
susp = ^Z;
rprnt = ^R;
werase = ^W;
lnext = ^V;
discard = ^O;
min = 1;
time = 0;
-parenb
-parodd
-cmspar
cs8
-hupcl
-cstopb
cread
-clocal
-crtscts
-ignbrk
-brkint
-ignpar
-parmrk
-inpck
-istrip
-inlcr
-igncr
icrnl
ixon
-ixoff
-iuclc
-ixany
-imaxbel
-iutf8
opost
-olcuc
-ocrnl
onlcr
-onocr
-onlret
-ofill
-ofdel
nl0
cr0
tab0
bs0
vt0
ff0
isig
icanon
iexten
echo
echoe
echok
-echonl
-noflsh
-xcase
-tostop
-echoprt
echoctl
echoke
-flusho
-extproc
```

Some of these settings refer to UART parameters, some affect the line discipline and some are for job control.

```bash
speed 38400 baud; rows 73; columns 238; line = 0;

intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>; eol2 = <undef>; swtch = <undef>; start = ^Q; stop = ^S; susp = ^Z; rprnt = ^R; werase = ^W; lnext = ^V; flush = ^O; min = 1; time = 0;

-parenb -parodd cs8 -hupcl -cstopb cread -clocal -crtscts
-ignbrk brkint ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon -ixoff -iuclc -ixany imaxbel -iutf8
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0
isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop -echoprt echoctl echoke
```

- speed 38400 baud (UART) The baud rate. Ignored for pseudo terminals.
- rows, columns (TTY driver) the size, in characters, of the terminal attached to this TTY device. Basically, it is just a pair of variables within kernel space, that you may freely set and get. Setting them will cause the TTY driver to dispatch a SIGWINCH to the foreground job.
- line (Line discipline) The line discipline attached to the TTY device. 0 is `N_TTY`. All valid numbers are listed in `/proc/tty/ldiscs` (unlisted numbers appear to be aliases for `N_TTY` but don't rely on it).


Try the following: Start xterm. Make a note of its TTY device (as reported by `tty`) and its size (as reported by `stty -a`). Start vim (or some other full-screen terminal application) in the xterm. The editor queries the TTY device for the current terminal size in order to fill the entire window. Now, from a different shell window, type:

    stty -F X rows Y

where `X` is the TTY device, and `Y` is half the terminal height. This will update the TTY data structure in kernel memory, and send a SIGWINCH to the editor, which will promptly redraw itself using only the upper half of the available window area.


The second line of `stty -a` output lists all the special characters. 

Start a new xterm and try this:

    stty intr o

Now "o", rather than ^C, will send a SIGINT to the foreground job. Try starting something, such as `cat`, and verify that you can't kill it using `^C`. Then, try typing "hello" into it.

Occasionally, you may come across a UNIX system where the backspace key doesn't work. This happens when the terminal emulator transmits a **backspace code** (either ASCII 8 or ASCII 127) which doesn't match the *erase setting* in the TTY device. To remedy the problem, one usually types `stty erase ^H` (for ASCII 8) or `stty erase ^?` (for ASCII 127). But note that many terminal applications use `readline`, which puts the line discipline in raw mode. Those applications are not affected.


Finally, `stty -a` lists a bunch of switches in no particular order. Some of them are UART-related, some affect the line discipline behaviour, some are for flow control and some are for job control.

Prefix `-` indicates that the switch is off; `+` that it is on. 
All the switches are explained in the `stty`(1) man page.

* `icanon` toggles the canonical (line-based) mode. 
Try this in a new xterm:

  stty -icanon; cat

Note how all the line editing characters, such as backspace and `^U`, have stopped working. Also note that `cat` is receiving (and consequently outputting) one character at a time, rather than one line at a time.


* `echo` enables character echoing, and is on by default. 
Re-enable canonical mode (stty icanon), and then try:

  stty -echo; cat

As you type, your terminal emulator transmits information to the kernel. Usually, the kernel echoes the same information back to the terminal emulator, allowing you to see what you type. Without character echoing, you can't see what you type, but we're in cooked mode so the line editing facilities are still working. Once you press enter, the line discipline will transmit the edit buffer to cat, which will reveal what your wrote.

* `tostop` controls whether background jobs are allowed to write to the terminal. First try this:

  stty tostop; (sleep 5; echo "from the background") &

After five seconds, the job will attempt to write to the TTY and the TTY driver will suspend it using SIGTTOU; the shell will probably report this fact, either immediately, or when it is about to issue a new prompt. Now try this instead:

  stty -tostop; (sleep 5; echo "from the background") &

You will get your prompt back, but after five seconds the background job will print to the terminal in the middle of whatever you were typing.

* `stty sane` restores the TTY device configuration to something reasonable.

## Conclusion

I hope this article has provided you with enough information to get to terms with TTY drivers and line disciplines, and how they are related to terminals, line editing and job control.

Further details can be found in the various man pages I've mentioned, as well as in the glibc manual (`info libc`, "Job Control").


## Comments

https://stackoverflow.com/questions/37413917/what-is-the-tty-subsystem-for?rq=3

`stty -icanon` still interprets control characters such as ^C whereas `stty raw` disables even this and is the real raw mode.


`printf()` writes to stdout, which is a `FILE *` that wraps file descriptor 1. File descriptors are either inherited from parent or opened explicitely. If you follow the process hierarchy upwards in a typical system you'll finally arrive at a `login` process, which is usually spawned by a `*getty` process. A getty process connects to a terminal with the appropriate settings (line speed, parity, etc., on serial lines), and usually spawns login on first key or ENTER key. gettys are usually launched directly from `/etc/inittab` on traditional `init` systems.
