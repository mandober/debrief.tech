# stty and termios

https://blog.nelhage.com/2009/12/a-brief-introduction-to-termios/

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

Key sequences for generating signals (see `stty -a`)
- intr  = ^C   ASCII 0x03 ETX
- eof   = ^D   ASCII 0x04 EOT
- quit  = ^\   ASCII 0x0C FS
- start = ^Q   ASCII 0x11 DC1/XON
- stop  = ^S   ASCII 0x13 DC3/XOFF
- susp  = ^Z   ASCII 0x1A SUB

*INTR* (`^C`, ASCII 0x03 ETX) comes in the left, it is discarded and a SIGINT is sent to the program on the far right. 

*SUSP* (`^Z`, ASCII 0x1A SUB) comes in the left, it is discarded and a SIGTSTP is sent to the program on the far right. (SIGTSTP, by default, stops a process. It differs from SIGSTOP primarily in that it can be caught and handled by a program, whereas SIGSTOP's effect is unconditional)
