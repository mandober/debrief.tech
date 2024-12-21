# Linux/Unix :: Terminals

- terminal: piece of hardware, a physical device, teletype and teleprinter
- terminal emulator: software based replacement for hardware terminals
- pty: pseudo terminal
- tty: teletype
- console: 
- line discipline
- slave, master
- conpty
- terminal emulators


pseudo terminal, tty, pty
xterm
vty
virtual terminal
dumb terminal
termcap, terminfi, ncurses
ssh

* pseudo terminal - a device that functions like a physical terminal emulated in software. Created by terminal emulators such as xterm. More details in `manpage pty(7)`.

Pseudo-terminals are emulators for serial lines. They provide endpoints for telnet, ssh, and xterm shells.

UNIX has a concept of a *controlling terminal* for a *group of processes*, and many I/O functions are built with terminals in mind. Pseudoterminals handle, for example, some control characters like `^C`.

A **teleprinter** (teletypewriter, teletype or TTY) is an electromechanical device that can be used to send and receive typed messages through various communications channels, in both point-to-point and point-to-multipoint configurations. Initially they were used in telegraphy, which developed in the late 1830s and 1840s as the first use of electrical engineering, though teleprinters were not used for telegraphy until 1887 at the earliest
