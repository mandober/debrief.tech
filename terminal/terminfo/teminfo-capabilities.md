# teminfo capabilities

https://pubs.opengroup.org/onlinepubs/7990989775/xcurses/terminfo.html
https://man7.org/linux/man-pages/man5/terminfo.5.html
https://en.wikipedia.org/wiki/Terminfo
https://www.ibm.com/docs/de/aix/7.1?topic=formats-terminfo-directory

- `cols#80` terminal has 80 columns
- `lines#24` terminal has 24 columns
- `80×24` is the most common screen size (80 characters by 24 lines). 80 chars was originally chosen because it is the width of a punch card.

- `am` auto margins; when a line reaches the right edge of the screen, the terminal automatically continues on the next line.
- `xenl` terminal does not perform newlines as expected, suffering from the "newline glitch"

- bce   background color erase
- bw    Terminal has backwards wrap
- am    Terminal does automatic margin
- ul    Terminal can underline

- cuu1  = ${CSI}A               # cursor up 1
- cud1  = \n                    # cursor down 1
- cuf1  = ${CSI}C               # cursor forward 1
- cub1  = ^H                    # cursor back 1 erasing the cell
- cul1  =                       # cursor left (without erasing)
- cuu   = ${CSI}%p1%dA          # cursor up
- cud   = ${CSI}%p1%dB          # cursor down
- cuf   = ${CSI}%p1%dC          # cursor forward
- cub   = ${CSI}%p1%dD          # cursor back erasing cells
- cup   = ${CSI}%i%p1%d;%p2%dH  # cursor abs pos
- csr   = ${CSI}%i%p1%d;%p2%dr  # cursor

bel=^G   C-g gives the audio bell
cr=\r    Return is the carriage return
cud1=\n  Newline brings cursor down one row
cub1=\b  Backspace brings cursor back one column
kbs=\b   Backspace key sends backspace
kcud1=\n Down arrow key sends newline
kcub1=\b Left arrow key sends backspace
nel=\r\n Newline is carriage return and newline
ind=\n   Scroll forward with newline

xmc#1    Magic cookie glitch is one character
cbt=\EI  ESC-I gives a back tab

clear=*Z Clear screen with C-Z
el=\ET   Clear to end of line with ESC-T
ed=\EY   Clear to end of display with ESC-Y

home=^^  C-^ sends cursor to home (upper left)

cup   = ${CSI} %i %p1 %d ; %p2 % d H  # cursor absolute position
cup   = ${ESC} = %p1 %'' %+ %c %p2 %'' %+ %c
  Send ESC-= followed by ASCII sums of a space and desired row and column

smso   Start standout (bold) mode sequence
rmso   End standout (bold) mode sequence

hc     Hard copy terminal
