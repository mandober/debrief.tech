# ASCII

```
 0  00:00000 NUL    01:00000 SP   10:00000 @    11:00000 `   \0
 1  00:00001 SOH    01:00001 !    10:00001 A    11:00001 a   
 2  00:00010 STX    01:00010 "    10:00010 B    11:00010 b   
>3  00:00011 ETX    01:00011 #    10:00011 C    11:00011 c   ^C intr
>4  00:00100 EOT    01:00100 $    10:00100 D    11:00100 d   ^D eof
 5  00:00101 ENQ    01:00101 %    10:00101 E    11:00101 e   
 6  00:00110 ACK    01:00110 &    10:00110 F    11:00110 f   
 7  00:00111 BEL    01:00111 '    10:00111 G    11:00111 g   \a
 8  00:01000 BS     01:01000 (    10:01000 H    11:01000 h   \b
 9  00:01001 HT     01:01001 )    10:01001 I    11:01001 i   \t
 A  00:01010 LF     01:01010 *    10:01010 J    11:01010 j   \n
 B  00:01011 VT     01:01011 +    10:01011 K    11:01011 k   \v
 C  00:01100 FF     01:01100 ,    10:01100 L    11:01100 l   \f
 D  00:01101 CR     01:01101 -    10:01101 M    11:01101 m   \r
 E  00:01110 SO     01:01110 .    10:01110 N    11:01110 n   
 F  00:01111 SI     01:01111 /    10:01111 O    11:01111 o   ^O discard

 0  00:10000 DLE    01:10000 0    10:10000 P    11:10000 p   
>1  00:10001 DC1    01:10001 1    10:10001 Q    11:10001 q   ^Q start/XON
>2  00:10010 DC2    01:10010 2    10:10010 R    11:10010 r   ^R rprnt
 3  00:10011 DC3    01:10011 3    10:10011 S    11:10011 s   ^S stop/XOFF
 4  00:10100 DC4    01:10100 4    10:10100 T    11:10100 t   
 5  00:10101 NAK    01:10101 5    10:10101 U    11:10101 u   ^U kill
 6  00:10110 SYN    01:10110 6    10:10110 V    11:10110 v   ^V lnext
 7  00:10111 ETB    01:10111 7    10:10111 W    11:10111 w   ^W werase
 8  00:11000 CAN    01:11000 8    10:11000 X    11:11000 x   
 9  00:11001 EM     01:11001 9    10:11001 Y    11:11001 y   
>A  00:11010 SUB    01:11010 :    10:11010 Z    11:11010 z   ^Z susp
>B  00:11011 ESC    01:11011 ;    10:11011 [    11:11011 {   ^[
>C  00:11100 FS     01:11100 <    10:11100 \    11:11100 |   ^\ quit
 D  00:11101 GS     01:11101 =    10:11101 ]    11:11101 }
 E  00:11110 RS     01:11110 >    10:11110 ^    11:11110 ~
>F  00:11111 US     01:11111 ?    10:11111 _    11:11111 DEL ^? erase
```

- col 00 are untypable CC
- col 01:0 shifted excpet `, . / '` direct
- col 01:1 digits are direct and also `; =`
- col 10 are capitals, keys shifted except `[ ] \ _` which are direct
- col 11 are small letters, direct keypresses except `{ | } ~`


Shift flips bit₅
Ctrl strips bit₆ (and bit₅)

Holding Shift or not while Ctrl is pressed cannot be registered in the terminal, i.e. while Ctrl is used Shift has no effect.








32 CC           32 PUNCT+NUM     32 CAP         32 SMALL
00:00000 NUL    01:00000 SP      10:00000 @     11:00000 `
00:00001        01:00001         10:00001       11:00001


00 NUL   10 DCE     20 SP   30 0     40 @   50 P     60 `   70 p
01 SOH   11 DC1     21 !    31 1     41 A   51 Q     61 a   71 q
02 STX   12 DC2     22 "    32 2     42 B   52 R     62 b   72 r
03 ETX   13 DC3     23 #    33 3     43 C   53 S     63 c   73 s
04 EOT   14 DC4     24 $    34 4     44 D   54 T     64 d   74 t
05 ENQ   15 NAK     25 %    35 5     45 E   55 U     65 e   75 u
06 ACK   16 SYN     26 &    36 6     46 F   56 V     66 f   76 v
07 BEL   17 ETB     27 '    37 7     47 G   57 W     67 g   77 w
08 BS    18 CAN     28 (    38 8     48 H   58 X     68 h   78 x
09 TAB   19 EM      29 )    39 9     49 I   59 Y     69 i   79 y
0a LF    1a SUB     2a *    3a :     4a J   5a Z     6a j   7a z
0b VT    1b ESC     2b +    3b ;     4b K   5b [     6b k   7b {
0c FF    1c FS      2c ,    3c <     4c L   5c \     6c l   7c |
0d CR    1d GS      2d -    3d =     4d M   5d ]     6d m   7d }
0e SO    1e RS      2e .    3e >     4e N   5e ^     6e n   7e ~
0f SI    1f US      2f /    3f ?     4f O   5f _     6f o   7f DEL



00 NUL   ^@  \0   Null
   SOH   ^A       Start Of Header
   STX   ^B       Start Of Text
   ETX   ^C       End Of Text
   EOT   ^D       End Of Transmission
   ENQ   ^E       Enquiry
   ACK   ^F       Acknowledge
06 BEL   ^G  \a   Bell
   BS    ^H  \b   Backspace
   TAB   ^I  \t   Character Tabulation (Horizontal Tab)
   LF    ^J  \n   Line Feed (Newline)
   VT    ^K  \v   Vertical Tab
   FF    ^L  \f   Form Feed
   CR    ^M  \r   Carriage Return
   SO    ^N  \    Shift Out (Locking Shift 1)
   SI    ^O  \    Shift In (Locking Shift 0)
   DLE   ^P       Data Link Escape
   DC1   ^Q       Device Control 1
   DC2   ^R       Device Control 2
   DC3   ^S       Device Control 3
   DC4   ^T       Device Control 4
   NAK   ^U       Negative Acknowledge
   SYN   ^V       Synchronous Idle
   ETB   ^W       End of Transmission Block
   CAN   ^X       Cancel
   EM    ^Y       End of Medium
   SUB   ^Z       Substitute
   ESC   ^[       Escape
   FS    ^\       File Separator
   GS    ^]       Group Separator
   RS    ^^       Record Separator
   US    ^_       Unit Separator
