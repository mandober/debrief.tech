# ASCII codes in binary

ASCII table expressed in binary makes it much easier to see relations between characters, which particularly stand out when the characters are arranged in a 4×32 grid (see below).

ASCII characters are labelled from left to right, using 0-based indexing:

```
bit 7 is always 0
│    bit 6 (ctrl)
│    │   bit 5 (shift)
│    │   │
│    │   │    bits 0-4
┴    ┴   ┴   ┌────┴──┐
0    c   s   4 3 2 1 0   bit-pattern
⁷    ⁶   ⁵   ⁴ ³ ² ¹ ⁰   index
```

The ASCII set has 128 (2⁷) characters since the eighth bit (bit 7) is not used, but it is always set to 0, which is important in Unicode.


the first 5 bits (bits 0-4) identify a char's row from 0x00000 to 0x11111, and each rows groups 4 chars in a related subset.


Binary codes clearly show that small and capital letters differ only in one bit, the 5th bit, thus the shift bit.




and its subset - each of the 32 subsets consists of the 4 related characters.


regarding the caret notation and the correposndences between subsets of characters.

First, ASCII uses only 7 of the 8 bits (in a byte). 
The bit 8 is unused but always set to 0 (which matters in Unicode). 


are of crucial since they are sufficient to identify each ASCII character. The remaining two bits are used to signal


The letters case is determined by the  
small and capital letters, 'A' vs 'a' differ only in the 
1100001

```
00-00000 NUL   01-00000      10-00000 @    11-00000 `
00-00001 SOH   01-00001 !    10-00001 A    11-00001 a
00-00010 STX   01-00010 "    10-00010 B    11-00010 b
00-00011 ETX   01-00011 #    10-00011 C    11-00011 c
00-00100 EOT   01-00100 $    10-00100 D    11-00100 d
00-00101 ENQ   01-00101 %    10-00101 E    11-00101 e
00-00110 ACK   01-00110 &    10-00110 F    11-00110 f
00-00111 BEL   01-00111 '    10-00111 G    11-00111 g
00-01000 BS    01-01000 (    10-01000 H    11-01000 h
00-01001 HT    01-01001 )    10-01001 I    11-01001 i
00-01010 LF    01-01010 *    10-01010 J    11-01010 j
00-01011 VT    01-01011 +    10-01011 K    11-01011 k
00-01100 FF    01-01100 ,    10-01100 L    11-01100 l
00-01101 CR    01-01101 -    10-01101 M    11-01101 m
00-01110 SO    01-01110 .    10-01110 N    11-01110 n
00-01111 SI    01-01111 /    10-01111 O    11-01111 o
00-10000 DLE   01-10000 0    10-10000 P    11-10000 p
00-10001 DC1   01-10001 1    10-10001 Q    11-10001 q
00-10010 DC2   01-10010 2    10-10010 R    11-10010 r
00-10011 DC3   01-10011 3    10-10011 S    11-10011 s
00-10100 DC4   01-10100 4    10-10100 T    11-10100 t
00-10101 NAK   01-10101 5    10-10101 U    11-10101 u
00-10110 SYN   01-10110 6    10-10110 V    11-10110 v
00-10111 ETB   01-10111 7    10-10111 W    11-10111 w
00-11000 CAN   01-11000 8    10-11000 X    11-11000 x
00-11001 EM    01-11001 9    10-11001 Y    11-11001 y
00-11010 SUB   01-11010 :    10-11010 Z    11-11010 z
00-11011 ESC   01-11011 ;    10-11011 [    11-11011 {
00-11100 FS    01-11100 <    10-11100 \    11-11100 |
00-11101 GS    01-11101 =    10-11101 ]    11-11101 }
00-11110 RS    01-11110 >    10-11110 ^    11-11110 ~
00-11111 US    01-11111 ?    10-11111 _    11-11111 DEL
```
