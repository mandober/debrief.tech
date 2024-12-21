# ASCII table

```
      0       1         2     3       4     5        6      7
0|  0 NUL  16 DLE    32    48 0    64 @  80 P     96 `  112 p
1|  1 SOH  17 DC1    33 !  49 1    65 A  81 Q     97 a  113 q
2|  2 STX  18 DC2    34 "  50 2    66 B  82 R     98 b  114 r
3|  3 ETX  19 DC3    35 #  51 3    67 C  83 S     99 c  115 s
4|  4 EOT  20 DC4    36 $  52 4    68 D  84 T    100 d  116 t
5|  5 ENQ  21 NAK    37 %  53 5    69 E  85 U    101 e  117 u
6|  6 ACK  22 SYN    38 &  54 6    70 F  86 V    102 f  118 v
7|  7 BEL  23 ETB    39 '  55 7    71 G  87 W    103 g  119 w
8|  8 BS   24 CAN    40 (  56 8    72 H  88 X    104 h  120 x
9|  9 HT   25 EM     41 )  57 9    73 I  89 Y    105 i  121 y
A| 10 LF   26 SUB    42 *  58 :    74 J  90 Z    106 j  122 z
B| 11 VT   27 ESC    43 +  59 ;    75 K  91 [    107 k  123 {
C| 12 FF   28 FS     44 ,  60 <    76 L  92 \    108 l  124 |
D| 13 CR   29 GS     45 -  61 =    77 M  93 ]    109 m  125 }
E| 14 SO   30 RS     46 .  62 >    78 N  94 ^    110 n  126 ~
F| 15 SI   31 US     47 /  63 ?    79 O  95 _    111 o  127 DEL
```


## ASCII table - binary

```
0000000 NUL    0010000 DLE    0100000      0110000 0    1000000 @    1010000 P    1100000 `    1110000 p
0000001 SOH    0010001 DC1    0100001 !    0110001 1    1000001 A    1010001 Q    1100001 a    1110001 q
0000010 STX    0010010 DC2    0100010 "    0110010 2    1000010 B    1010010 R    1100010 b    1110010 r
0000011 ETX    0010011 DC3    0100011 #    0110011 3    1000011 C    1010011 S    1100011 c    1110011 s
0000100 EOT    0010100 DC4    0100100 $    0110100 4    1000100 D    1010100 T    1100100 d    1110100 t
0000101 ENQ    0010101 NAK    0100101 %    0110101 5    1000101 E    1010101 U    1100101 e    1110101 u
0000110 ACK    0010110 SYN    0100110 &    0110110 6    1000110 F    1010110 V    1100110 f    1110110 v
0000111 BEL    0010111 ETB    0100111 '    0110111 7    1000111 G    1010111 W    1100111 g    1110111 w
0001000 BS     0011000 CAN    0101000 (    0111000 8    1001000 H    1011000 X    1101000 h    1111000 x
0001001 HT     0011001 EM     0101001 )    0111001 9    1001001 I    1011001 Y    1101001 i    1111001 y
0001010 LF     0011010 SUB    0101010 *    0111010 :    1001010 J    1011010 Z    1101010 j    1111010 z
0001011 VT     0011011 ESC    0101011 +    0111011 ;    1001011 K    1011011 [    1101011 k    1111011 {
0001100 FF     0011100 FS     0101100 ,    0111100 <    1001100 L    1011100 \    1101100 l    1111100 |
0001101 CR     0011101 GS     0101101 -    0111101 =    1001101 M    1011101 ]    1101101 m    1111101 }
0001110 SO     0011110 RS     0101110 .    0111110 >    1001110 N    1011110 ^    1101110 n    1111110 ~
0001111 SI     0011111 US     0101111 /    0111111 ?    1001111 O    1011111 _    1101111 o    1111111 DEL
```

## ASCII table 2

```
   ₀              ₂             ₄            ₆
0  000 0000 NUL    010 0000      100 0000 @    110 0000 `  Null
1  000 0001 SOH    010 0001 !    100 0001 A    110 0001 a  Start of Header
2  000 0010 STX    010 0010 "    100 0010 B    110 0010 b  Start of Text
3  000 0011 ETX    010 0011 #    100 0011 C    110 0011 c  End of Text         ^C
4  000 0100 EOT    010 0100 $    100 0100 D    110 0100 d  End of Transmission ^D
5  000 0101 ENQ    010 0101 %    100 0101 E    110 0101 e  Enquiry
6  000 0110 ACK    010 0110 &    100 0110 F    110 0110 f  Acknowledge
7  000 0111 BEL    010 0111 '    100 0111 G    110 0111 g  Alert
8  000 1000 BS     010 1000 (    100 1000 H    110 1000 h  
9  000 1001 HT     010 1001 )    100 1001 I    110 1001 i  
A  000 1010 LF     010 1010 *    100 1010 J    110 1010 j  
B  000 1011 VT     010 1011 +    100 1011 K    110 1011 k  
C  000 1100 FF     010 1100 ,    100 1100 L    110 1100 l  
D  000 1101 CR     010 1101 -    100 1101 M    110 1101 m  
E  000 1110 SO     010 1110 .    100 1110 N    110 1110 n  
F  000 1111 SI     010 1111 /    100 1111 O    110 1111 o  
     ₁            ₃             ₅            ₇
0  001 0000 DLE    011 0000 0    101 0000 P    111 0000 p   
1  001 0001 DC1    011 0001 1    101 0001 Q    111 0001 q   
2  001 0010 DC2    011 0010 2    101 0010 R    111 0010 r   
3  001 0011 DC3    011 0011 3    101 0011 S    111 0011 s   
4  001 0100 DC4    011 0100 4    101 0100 T    111 0100 t   
5  001 0101 NAK    011 0101 5    101 0101 U    111 0101 u   
6  001 0110 SYN    011 0110 6    101 0110 V    111 0110 v   
7  001 0111 ETB    011 0111 7    101 0111 W    111 0111 w   
8  001 1000 CAN    011 1000 8    101 1000 X    111 1000 x   
9  001 1001 EM     011 1001 9    101 1001 Y    111 1001 y   
A  001 1010 SUB    011 1010 :    101 1010 Z    111 1010 z   Substitute         ^Z
B  001 1011 ESC    011 1011 ;    101 1011 [    111 1011 {   Escape             ^[
C  001 1100 FS     011 1100 <    101 1100 \    111 1100 |   Field separator    ^\
D  001 1101 GS     011 1101 =    101 1101 ]    111 1101 }   Group separator
E  001 1110 RS     011 1110 >    101 1110 ^    111 1110 ~   Record separator
F  001 1111 US     011 1111 ?    101 1111 _    111 1111 DEL Unnit separator
```

bit 7 (meta bit)
- 8th, msb, bit in 8-bit ASCII
- bit 7 is (arbitrarily) set to 1

bit 6 (ctrl bit)
- 0--xxxx CC1, CC2, PUNCT, DIG
- 1--xxxx LC, UC

bit 5 (shift bit)
- -C-xxxx 
- -c-xxxx 
- uppercase vs lowercase

low nibble (bits 0-3)
high nibble (bits 4-6)

654 3210
100 0001 A
110 0001 a
101 1010 Z
111 1010 z

101 1011 [  ] 101 1101
111 1100 |  \ 101 1100
111 1011 {  } 111 1101

Shiftable (Alt glyph) keys
- 0 row: (16) ESC, 12 Function keys, PrintScreen/SysRq, Scroll Lock, Pause/Break
- 1 row: (17) 13  
- 2 row: (17)  3  TAB, 13 (q-p()/), Ins, Home, PgUp
- 3 row: (13)  2  Caps, a-l:', RET,
- 4 row: ()    2  LeftShift (z-m,.\) RightShift
- 5 row: () LeftCtrl, LeftWin, LeftAlt, SPACE, RightAlt, RightCtrl



shifted ` is ~
shifted 1 is !
shifted 2 is @
shifted 3 is #
shifted 4 is $
shifted 5 is %
shifted 6 is ^
shifted 7 is &
shifted 8 is *
shifted 9 is (
shifted 0 is )
shifted _ is -
shifted = is +
shifted [ is {
shifted ] is }
shifted / is |
shifted : is ;
shifted ' is "
shifted , is <
shifted . is >
shifted \ is ?



COL
0  000'cccc Control Codes Lo
1  001'cccc Control Codes Hi
2  010'xxxx Punct1
3  111'xxxx Digits
4  100'yyyy Letters Hi
5  101'yyyy Letters Hi
6  110'zzzz Letters Lo
7  111'zzzz Letters Lo


bit 6
| bit 5 (shift)
| | bit 4
↓ ↓ ↓
6 5 4 3 2 1 0
b c d e f g h
0 0 0 x x x x
0 0 1 x x x x
0 1 0 x x x x
0 1 1 x x x x
1 0 0 x x x x
1 0 1 x x x x
1 1 0 x x x x
1 1 1 x x x x
