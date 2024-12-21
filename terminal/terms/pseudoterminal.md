# Pseudoterminal


* What are the responsibilities of each Pseudo-Terminal (PTY) component (software, master side, slave side)
https://unix.stackexchange.com/questions/117981/


https://unix.stackexchange.com/questions/485156/what-is-dev-console-used-for

/dev/tty      Current TTY device
/dev/tty0     Current virtual console
/dev/console  System console

In the good old days /dev/console was System Administrator console. And TTYs were users' serial devices attached to a server. Now /dev/console and /dev/tty0 represent current display and usually are the same. You can override it for example by adding console=ttyS0 to grub.conf. After that your /dev/tty0 is a monitor and /dev/console is /dev/ttyS0.

https://en.wikipedia.org/wiki/System_console

By "System console", /dev/console seems like the device file of a text physical terminal, just like /dev/tty{1..63} are device files for the virtual consoles.

By "/dev/console and /dev/tty0 represent current display and usually are the same", /dev/console seems to me that it can also be the device file of a virtual console.

/dev/console seems more like /dev/tty0 than like /dev/tty{1..63}

`/dev/tty0` is the currently active virtual console, and can be any of /dev/tty{1..63}.

What is /dev/console? What is it used for?

Does /dev/console play the same role for Linux kernel as /dev/tty for a process? `/dev/tty` is the *controlling terminal* of the *process session* of the process, and can be a pts, /dev/ttyN where N is 1-63.

The kernel documentation specifies /dev/console as a character device numbered 5:1. Opening this character device opens the "main" console, which is the last tty in the list of consoles.

http://jdebp.eu./Proposals/linux-kvt-manual-pages.html

https://unix.stackexchange.com/questions/60641/linux-difference-between-dev-console-dev-tty-and-dev-tty0/384792#384792

https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/serial-console.rst

https://en.wikipedia.org/wiki/System_console
