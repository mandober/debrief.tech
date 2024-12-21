# A Brief Introduction to termios

https://blog.nelhage.com/2009/12/a-brief-introduction-to-termios/

If you press ^C or ^Z it kills or stops the foreground program - unless the program handles all keystrokes like emacs and vim. When you ssh to a remote host, these keys go to the processes on the other end, not to the local ssh process. Bash uses readline for rich line editing and history. However, at the bottom of it all is the unix terminal emulation layer and the termios interface for interacting with asynchronous communication devices (such as serial ports connected to terminals, or their virtual equivalents). That way even `cat` enjoys some rudimentary line editing.

## The terminal device

The primary abstraction that governs any interaction with a terminal in Linux is a terminal device or tty for short.

Since physical terminals are exinct, software called *pseudo-terminal* or pty(7) for short was created to replace them. It is basically realized as a *pair of endpoints* (implemented as *character devices* in `/dev`) that provide a bidirectional communication channel. Whatever is written into one endpoint can be read out the other endpoint, and vice versa. These two endpoints are called *master* and *slave*. But what makes terminal devices special is the layer that sits between the master and slave endpoints, which can filter and transforms the streams going in any direction.

Usually the *master pty* is connected to a terminal emulator and the *slave pty* to the shell. Input flows from the user into the master pty and out the slave, and output flows from the shell into the slave and then out the master.

The basic diagram:

```
        --------------- input ------------->
console == master-pty == termios == slave-pty == shell
        <-------------- output -------------
```

Termios is responsible for
- line buffering
- echoing
- line editing
- newline translation
- signal generation


As characters come in (from the left), the *line buffer* collects them until it receives a newline, at which point they are all emitted (to the right) at once. The incoming characters, in addition to being buffered are also sent back to the console to be *echoed* on the screen, providing a feedback.

Buffering also give us a chance to do some rudiemntary *line editing*. When the ERASE character (`^?` i.e. ASCII 0x7f DEL) comes in, the last character in the buffer is deleted, and the sequence `\b \b` is sent back. `\b` (i.e. ASCII 0x08 BS) tells the terminal to move the cursor one cell back, then space, overwrites the character there blanking it, and then the cursor moves back (again?).

Key sequences for line editing (see `stty -a`)
- discard = ^O   ASCII 0x0F SI  (discard entire line)
- rprnt   = ^R   ASCII 0x12 DC2 (repaint the line; duplicate the line)
- kill    = ^U   ASCII 0x15 NAK (erase from to BOL)
- lnext   = ^V   ASCII 0x16 SYN (print next keyseq literally)
- werase  = ^W   ASCII 0x17 ETB (erase one shell-word to the left)
- erase   = ^?   ASCII 0x7F DEL (erase one char to the left)

*Newline translation* is the process of converting incomming newlines, `\n` (ASCII 0x0A LF) into carriage-return/line-feed combinations (CRLF, `\r\n`, ASCII 0x0D 0x0A), which is sent back to the screen. Although Linux line ending is just `\n`, the terminal, like Windows and classical type writers, needs both: CR (carriage return) tells it to return the cursor (carriage) to the first column, then LF (line feed) tells it to move to the next line.

*Signal generation* happens when particular character sequences are encountered in the input stream.

Key sequences that generate the corresponding signals (see `stty -a`)
- intr  = ^C   ASCII 0x03 ETX         → SIGINT (2)
- eof   = ^D   ASCII 0x04 EOT         → 
- quit  = ^\   ASCII 0x0C FS          → SIGQUIT (3)
- start = ^Q   ASCII 0x11 DC1/XON     → 
- stop  = ^S   ASCII 0x13 DC3/XOFF    → 
- susp  = ^Z   ASCII 0x1A SUB         → SIGTSTP (20)

`^C` i.e. `INTR` (ASCII 0x03 `ETX`) in input stream is discarded and *SIGINT* signal is sent to the shell (to the right).

`^Z` i.e. `SUSP` (ASCII 0x1A `SUB`) in input stream is discarded and and *SIGTSTP (20)* signal is sent to the shell (to the right). SIGTSTP, by default, politely suspends the process; it can be caught and handled. The process can be resumed in the foreground with `fg` or in the background with `bg`. A harder version is *SIGSTOP (19)* which cannot be trapped.
