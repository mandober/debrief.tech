# 8-bit clean software

An application (especially terminal emulators) or a tranmission channel is said to be 8-bit clean if actually reads and checks the 8th bit (the most significant bit in a byte) of ASCII codes without having its own use for it, and without assuming (without also checking) that it is set to 0 (as it "should be"). ASCII uses 7 bits, so 8th bit is undefined, but the "standard" says it should be set to 0 (although no standard is enforced). Some applications and technologies depend on it always being 0; that way ASCII is a proper subset of UTF-8 encoding; that is, all octets with a leading 0 are easily distinguish as encoding characters 0-127, the same as ASCII. UTF-8 also has 2-byte but those 

0cs4:3210
110x:xxxx 10yy:yyyy
1110:xxxx 10yy:yyyy 10yy:yyyy
1111:0xxx 10yy:yyyy 10yy:yyyy 10yy:yyyy

N| usage    | from  | to     | byte 1    | byte 2    | byte 3    | byte 4
-|----------|------:|-------:|-----------|-----------|-----------|--------
1|   7      |     0 |     7f | 0xxx.xxxx | -         | -         | -
2|11=5+6    |    80 |    7ff | 110x.xxxx | 10yy.yyyy | -         | -
3|16=4+6+6  |   800 |   ffff | 1110.xxxx | 10yy.yyyy | 10yy.yyyy | -
4|21=3+6+6+6| 10000 | 10ffff | 1111.0xxx | 10yy.yyyy | 10yy.yyyy | 10yy.yyyy


5 octets distiguishable by the leading bits 
- 0'asc:solo ASCII (1/1)
- 110'd:uals FIRST of 2
- 111'0:trip FIRST of 3
- 1111:0'qua FIRST of 4
- 10yy:cont Continuation (must backtrack until FIRST byte)


An OS (or other software) is 8-bit clean if it reads the 8th bit as part of the code value. In other words, the OS must not ignore or make its own interpretation of the value of the 8th bit. 

This pertains to the ASCII encoding which uses only 7 bits, leaving the 8th bit (most significant bit an a byte) undefined. Normally, it is assumed that this bit is set to 0.

Terminal emulators on Linux and the related utilities like `stty`, as well as `readline` library talk about meta bits and 8 bit cleanliness.

ASCII only uses 7 bits, so if a tranmission channel is designed to transport only ASCII-encoded data, it is free to use the high-order bit of each 8-bit byte for other purposes. Such a channel will not be able to properly transport data in which all 8 bits in a byte are significant. A channel that does not have this problem, and faithfully transports all 8 bits of each byte, is said to be 8-bit clean.

Many serial links offered 7-bit formats to reduce the size of the transmitted data. Alternately, you could tell the hardware to use the 8th bit to encode parity. Thus, when you look at old serial communication documentation, you might see specifications such as 7-E-1 and 8-N-1. 7-E-1 means "7 bits of data, 1 bit of even parity, and 1 stop bit." In contrast, 8-N-1 means "8 bits of data, no parity, 1 stop bit." Except in esoteric situations, the parity and stop bit were transparently handled by hardware and not visible to software.

8-bit mode is useful in *nix terminals because keys are sent via text / ESC sequences, 8-bit parser is able to differentiate ESC keypress from ALT+key combo, which is not possible for 7-bit parser.
