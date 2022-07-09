# ASCII Control Characters

*ASCII charset* defines 32 control characters, 0x00 - 0x1f. Some of them have a special notational form, originating from the C language, that bash inherits.

The notation consist is a pair made of backslash, followed by a single letter from the special set.

When an element from the special letter set is escaped using backslash, this pair is removed and the *control character* is produced.

The instances that are frequently encountered are the newline (ASCII 0x0a), denoted by `\n`, and the tab (ASCII 0x09), denoted by `\t`. These two, along with the space character (ASCII 0x20), are known as the *blank characters*. They make up the contents of `IFS` env variable, which is consulted to see what characters a command line is split by. By default, or if unset, the `IFS` contains, in this order: <space>, <tab> and <newline>.

The blank characters, along with the form feed (ASCII 0x0c) and carriage return (ASCII 0x0d), are called *whitespace characters*.

The special set of letters = { a b c e E f n r t v }


Control characters
- `\a` Bell, <bel>
- `\b` Backspace, <bs>
- `\c` Suppress further output *no ASCII repr*
- `\e` Escape, ESC, <esc>
- `\E` Escape, ESC, <esc>
- `\f` Form Feed, FF, <ff>
- `\n` New Line, NL, Line-feed, LF, <lf>, <enter>
- `\r` Carriage Return, CR, <cr>, <return>
- `\t` Tab, <tab>
- `\v` Vertical tab, <vtab>



## ASCII CONTROL CHARACTER SET 0-32

Dec | Oct | Hex  | Sym | ^-esc | quote | Desc
----|-----|------|-----|-------|-------|--------------------------
00  | 000 | 0x00 | NUL | ^@    |`\0`   | Null
01  | 001 | 0x01 | SOH | ^A    |       | Start of Header
02  | 002 | 0x02 | STX | ^B    |       | Start of Text
03  | 003 | 0x03 | ETX | ^C    |       | End of Text
04  | 004 | 0x04 | EOT | ^D    |       | End of transmission
05  | 005 | 0x05 | ENQ | ^E    |       | Enquiry
06  | 006 | 0x06 | ACK | ^F    |       | Acknowledge
07  | 007 | 0x07 |`BEL`| ^G    |`\a`   | Bell, Alert
08  | 010 | 0x08 |`BS` | ^H    |`\b`   | Backspace
09  | 011 | 0x09 |`HT` | ^I    |`\t`   | TAB, Character Tabulation
10  | 012 | 0x0A |`LF` | ^J    |`\n`   | Line Feed, Newline, NL
11  | 013 | 0x0B |`VT` | ^K    |`\v`   | Vertical Tab, VTAB, Line Tabulation
12  | 014 | 0x0C |`FF` | ^L    |`\f`   | Form Feed
13  | 015 | 0x0D |`CR` | ^M    |`\r`   | Carriage Return
14  | 016 | 0x0E | SO  | ^N    |       | Shift Out, Locking Shift 1, LS1
15  | 017 | 0x0F | SI  | ^O    |       | Shift In, Locking Shift 0, LS0
16  | 020 | 0x10 | DLE | ^P    |       | Data Link Escape
17  | 021 | 0x11 | DC1 | ^Q    |       | Device Control 1
18  | 022 | 0x12 | DC2 | ^R    |       | Device Control 2
19  | 023 | 0x13 | DC3 | ^S    |       | Device Control 3
20  | 024 | 0x14 | DC4 | ^T    |       | Device Control 4
21  | 025 | 0x15 | NAK | ^U    |       | Negative Acknowledge
22  | 026 | 0x16 | SYN | ^V    |       | Synchronous Idle
23  | 027 | 0x17 | ETB | ^W    |       | End of Transmission Block
24  | 030 | 0x18 | CAN | ^X    |       | Cancel
25  | 031 | 0x19 | EM  | ^Y    |       | End of Medium
26  | 032 | 0x1A | SUB | ^Z    |       | Substitute
27  | 033 | 0x1B |`ESC`| ^     |`\e \E`| Escape
28  | 034 | 0x1C | FS  | ^     |       | File Separator
29  | 035 | 0x1D | GS  | ^     |       | Group Separator
30  | 036 | 0x1E | RS  | ^     |       | Record Separator
31  | 037 | 0x1F | US  | ^     |       | Unit Separator
32  | 040 | 0x20 | SPC |       |       | Space, Blank


## Special Chars

Dec | Oct | Hex  | Sym | ^-escape | C-escape | Desc
----|-----|------|-----|-------|-------|--------------------------
00  | 000 | 0x00 | NUL | ^@    |`\0`   | Null
07  | 007 | 0x07 |`BEL`| ^G    |`\a`   | Bell, Alert
08  | 010 | 0x08 |`BS` | ^H    |`\b`   | Backspace
09  | 011 | 0x09 |`HT` | ^I    |`\t`   | TAB, Character Tabulation
10  | 012 | 0x0A |`LF` | ^J    |`\n`   | Line Feed, Newline, NL
11  | 013 | 0x0B |`VT` | ^K    |`\v`   | Vertical Tab, VTAB, Line Tabulation
12  | 014 | 0x0C |`FF` | ^L    |`\f`   | Form Feed
13  | 015 | 0x0D |`CR` | ^M    |`\r`   | Carriage Return
27  | 033 | 0x1B |`ESC`| ^[    |`\e \E`| Escape
32  | 040 | 0x20 | SPC |       |       | Space, Blank
127 | 177 | 0x7f | DEL | ^?    |       | Delete
