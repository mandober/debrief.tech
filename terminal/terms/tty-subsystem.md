# TTY subsystem

Adapted from the article: "The TTY demystified" by Linus Akesson
https://www.linusakesson.net/programming/tty/index.php

The *TTY subsystem*, one of the central components of Linux, and UNIX in general, may seem functional from user's perspective, but under the hood it is a twisted mess of special cases.

## History

When the command line eventually replaced the old batch processing model, teletypes were used as input and output devices, because they were readily available on the market.


## Terminal I/O

Terminal I/O has 2 modes:
1. Canonical mode input processing (default).
   In this mode, terminal input is processed as lines. 
   The terminal driver returns at most one line per read request.
2. Non-canonical mode input processing.
   The input characters are not assembled into lines.

If we don't do anything special, canonical mode is the default. For example, if the shell redirects standard input to the terminal and we use read and write to copy standard input to standard output, the terminal is in canonical mode, and each read returns at most one line. Programs that manipulate the entire screen use non-canonical mode since they want full control.

Terminal driver supports 3 modes for terminal input
- *cooked mode*: input is collected into lines, special characters processed
- *raw mode*:    input not assembled into lines, no processing of special chars
- *cbreak mode*: input not assembled into lines, some special chars processed

We can think of a *terminal device* as being controlled by a *terminal driver*, usually within the kernel. Each terminal device has an *input queue* and an *output queue*.

UNIX systems implement all the canonical processing in a module called the **terminal line discipline**. We can think of this module as a box that sits between the kernel's generic read and write functions and the actual device driver.

```
user process
↑↓

read and write functions    \
↑↓
terminal line discipline     |- kernel
↑↓
terminal  device  driver    /

↑↓
actual device
```

All the terminal device characteristics that we can examine and change are contained in a `termios` structure defined in the header <termios.h>

```c
struct termios {
  tcflag_t c_iflag; /*   input flags */
  tcflag_t c_oflag; /*  output flags */
  tcflag_t c_cflag; /* control flags */
  tcflag_t c_lflag; /*   local flags */
  cc_t c_cc[NCCS];  /* control characters */
};
```
