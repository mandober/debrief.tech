# Typing control codes

* Unprintable ASCII characters and TTYs
https://www.in-ulm.de/~mascheck/various/ascii-tty/

This view of the ASCII table explains so many things the best.

**Contol codes (CC)** are the first 32 ASCII characters (0x00 - 0x1f), making the column one below, along with DEL (7f). They can be typed by holding the Control key (`^`), and most combinations are evident, e.g. `^A` is SOH, `^B` is STX. The case of these letters cannot be discern so `^C` and `^c` for ETX are the same.

All the printable representations for CCs are easily obtained by the terminal driver - it just needs to XOR the ASCII (hex) value of the letter with 0x40, which is the ASSCII value for `@`; so, `CHAR` ⊕ `@` = corresponding CC. In fact, this works with uppercase letters only, i.e. third and first columns are associated on one hand (`I ⊕ @ = HT`, `I ⊕ HT = @`, `@ ⊕ HT = I`), and fourth and second associated on the other.

```
100 1001  0x49  I
100 0000  0x40  @
-------- ⊕
000 1001  0x09  HT
```

But lowercase letters also give the CC in the same row (of the table below) because pressing Control annihilates the Shift bit, so Shifted states cannot be recognized. Moreover, using any of the 3 characters in the same row produces the CC in that row.

```
110 1001  0x49  i
100 0000  0x40  @
-------- ⊕
010 1001  0x29  )
```

`^1` gives `^[[1;5q` and the reason `q` is there is because `1` char shares the row with it.

`^2` is exception - instead of `DC2` it gives `NUL`, as does `^SP` and `^@` (shifted 2) and `^BACKTICK` (BACKTICK is 0x60).

Another exception is `DEL` (0x7f), which being the last ASCII character must be reproduced some some other way, namly with `^?` (0x3f). Thus, in this case the value goes up, from 0x3f to 0x7f, not down.

DEL is ASCII-127 cos all 7 bits are set (x1111111), which nicely corresponds to DEL being used on punctured cards to mark a byte as "deleted".

Lastly, combinations of CONTROL with characters from ASCII-40 (`(` 0x28) to ASCII-46 (`.` 0x2e) just produce the literal character itself.

The behaviour about not recognizing the use of SHIFT may depend on a terminal emulator - when used under X all shifted states are properly recognized; otherwise, the use of SHIFT cannot be discern when CTRL is also used due to some fuckup in the terminal driver trying too hard to mimick the physical devices.

Q: WTF does it mean for a terminal to not run "under X"? Ok, something like Linux console maybe? Sure, Linux console doesn't run under X, but all the common terminal emulators do - they are graphical apps running in a graphical environment provided by X.org display management and what not. However, they still cannot discern the use of SHIFT. For many CLI apps, it is understandable; there is `emacs -nw` CLI that runs in a teminal - so not "under the X" - and there is `emacs` that runs "under the X" as a GUI. When they run as GUI, programs can recognize all the shifted states, no problem.



```
ascii -ax

00 NUL    20      40 @    60 `
01 SOH    21 !    41 A    61 a
02 STX    22 "    42 B    62 b
03 ETX    23 #    43 C    63 c
04 EOT    24 $    44 D    64 d
05 ENQ    25 %    45 E    65 e
06 ACK    26 &    46 F    66 f
07 BEL    27 '    47 G    67 g
08 BS     28 (    48 H    68 h
09 HT     29 )    49 I    69 i
0A LF     2A *    4A J    6A j
0B VT     2B +    4B K    6B k
0C FF     2C ,    4C L    6C l
0D CR     2D -    4D M    6D m
0E SO     2E .    4E N    6E n
0F SI     2F /    4F O    6F o
10 DLE    30 0    50 P    70 p
11 DC1    31 1    51 Q    71 q
12 DC2    32 2    52 R    72 r
13 DC3    33 3    53 S    73 s
14 DC4    34 4    54 T    74 t
15 NAK    35 5    55 U    75 u
16 SYN    36 6    56 V    76 v
17 ETB    37 7    57 W    77 w
18 CAN    38 8    58 X    78 x
19 EM     39 9    59 Y    79 y
1A SUB    3A :    5A Z    7A z
1B ESC    3B ;    5B [    7B {
1C FS     3C <    5C \    7C |
1D GS     3D =    5D ]    7D }
1E RS     3E >    5E ^    7E ~
1F US     3F ?    5F _    7F DEL
```
