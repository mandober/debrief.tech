# ASCII Control Characters

## CC Overview Table

C0   | Bin (from-to)          | Hex (from-to) | Dec     | pow of 2  |
-----|------------------------|---------------|---------|-----------|
BLK0 | 0_000_0000 - 0000_1111 | 0x00 - 0x0f   |  0 - 15 | 0  - 2⁴-1 |
BLK1 | 0_001_0000 - 0001_1111 | 0x10 - 0x1f   | 16 - 31 | 2⁴ - 2⁵-1 |

Notes
- A₇₆₅₄ ₃₂₁₀
- ASCII,    bit-7 (8th bit) is unused (set to 0)
- ASCII C0, bit-6 (7th bit) is 0
- ASCII C0 is comprised of the first 32 chars in ASCII charset
- plus DEL (0x7f)
- A⁷⁶⁵⁴ ³²¹⁰

## CC Names

NULL
START OF HEADING
START OF TEXT
END OF TEXT

END OF TRANSMISSION
ENQUIRY
ACKNOWLEDGE
BELL

BACKSPACE
HORIZONTAL TABULATION
LINE FEED
VERTICAL TABULATION

FORM FEED
CARRIAGE RETURN
SHIFT OUT
SHIFT IN

DATA LINK ESCAPE
DEVICE CONTROL ONE
DEVICE CONTROL TWO
DEVICE CONTROL THREE

DEVICE CONTROL FOUR
NEGATIVE ACKNOWLEDGE
SYNCHRONOUS IDLE
END OF TRANSMISSION BLOCK

CANCEL
END OF MEDIUM
SUBSTITUTE
ESCAPE

FILE SEPARATOR
GROUP SEPARATOR
RECORD SEPARATOR
UNIT SEPARATOR

## CC Abbreviations

NUL SOH STX ETX EOT ENQ ACK BEL   
BS  HT  LF  VT  FF  CR  SO  SI    
DLE DC1 DC2 DC3 DC4 NAK SYN ETB   
CAN EM  SUB ESC FS  GS  RS  US    

## CC Table

binary     | oct | hex  | dec | CC  | Name
-----------|-----|------|-----|-----|---------
₇ ₆₅₄ ₃₂₁₀ |     |      |     |     | 
0_000_0000 | 000 | 0x00 |   0 | NUL | NULL
0_000_0001 | 001 | 0x01 |   1 | SOH | START OF HEADING
0_000_0010 | 002 | 0x02 |   2 | STX | START OF TEXT
0_000_0011 | 003 | 0x03 |   3 | EOT | END OF TEXT
0_000_0100 | 004 | 0x04 |   4 | EOX | END OF TRANSMISSION
0_000_0101 | 005 | 0x05 |   5 | ENQ | ENQUIRY
0_000_0110 | 006 | 0x06 |   6 | ACK | ACKNOWLEDGE
0_000_0111 | 007 | 0x07 |   7 | BEL | BELL
⁷ ⁶⁵⁴ ³²¹⁰ |     |      |     |     | 
0_000_1000 | 010 | 0x08 |   8 | BS  | BACKSPACE
0_000_1001 | 011 | 0x09 |   9 | HT  | HORIZONTAL TABULATION
0_000_1010 | 012 | 0x0a |  10 | LF  | LINE FEED
0_000_1011 | 013 | 0x0b |  11 | VT  | VERTICAL TABULATION
0_000_1100 | 014 | 0x0c |  12 | FF  | FORM FEED
0_000_1101 | 015 | 0x0d |  13 | CR  | CARRIAGE RETURN
0_000_1110 | 016 | 0x0e |  14 | SO  | SHIFT OUT
0_000_1111 | 017 | 0x0f |  15 | SI  | SHIFT IN
₇ ₆₅₄ ₃₂₁₀ |     |      |     |     | 
0_001_0000 | 020 | 0x10 |  16 | DLE | DATA LINK ESCAPE
0_001_0001 | 021 | 0x11 |  17 | DC1 | DEVICE CONTROL ONE
0_001_0010 | 022 | 0x12 |  18 | DC2 | DEVICE CONTROL TWO
0_001_0011 | 023 | 0x13 |  19 | DC3 | DEVICE CONTROL THREE
0_001_0100 | 024 | 0x14 |  20 | DC4 | DEVICE CONTROL FOUR
0_001_0101 | 025 | 0x15 |  21 | NAK | NEGATIVE ACKNOWLEDGE
0_001_0110 | 026 | 0x16 |  22 | SYN | SYNCHRONOUS IDLE
0_001_0111 | 027 | 0x17 |  23 | ETB | END OF TRANSMISSION BLOCK
₇ ₆₅₄ ₃₂₁₀ |     |      |     |     | 
0_001_1000 | 030 | 0x18 |  24 | CAN | CANCEL
0_001_1001 | 031 | 0x19 |  25 | EM  | END OF MEDIUM
0_001_1010 | 032 | 0x1a |  26 | SUB | SUBSTITUTE
0_001_1011 | 033 | 0x1b |  27 | ESC | ESCAPE
0_001_1100 | 034 | 0x1c |  28 | FS  | FILE SEPARATOR
0_001_1101 | 035 | 0x1d |  29 | GS  | GROUP SEPARATOR
0_001_1110 | 036 | 0x1e |  30 | RS  | RECORD SEPARATOR
0_001_1111 | 037 | 0x1f |  31 | US  | UNIT SEPARATOR



- NUL
- TC(1-6):
  - new abbr: SOH STX ETX EOT ENQ ACK
  - old abbr: TC1 TC2 TC3 TC4 TC5 TC6
  - ENQ = TC5 = WRU (for 'who are you?')
- BEL
- ESC
- Format Effectors       (FEn): BS TAB LF VT FF CR
- Information Separators (ISn): FS GS RS US


The `C0` and `C1` *control codes* (or control character sets) define control codes for use in text by computer systems that use ASCII and derivatives of ASCII.

The codes represent additional information about the text, such as the position of a cursor, an instruction to start a new line, or a message that the text has been received.

`C0` codes are the range `0x00 - 0x1F` and the default C0 set was originally defined in ISO 646 (ASCII).

`C1` codes are the range `0x80 - 0x9F` and the default C1 set was originally defined in ECMA-48 (harmonized later with ISO 6429).

The ISO/IEC 2022 system of specifying control and graphic characters allows other C0 and C1 sets to be available for specialized applications, but they are rarely used.

## C0 controls

ASCII defined 32 control characters, plus a necessary extra character for the `DEL` character, `0x7F` or `0b01111111` (needed to punch out all the holes on a paper tape and erase it - 8th, leftmost, bit is unused in ASCII).

This large number of codes was desirable at the time, as multi-byte controls would require implementation of a state machine in the terminal, which was very difficult with contemporary electronics and mechanical terminals.

Only a few codes have maintained their use: `BEL`, `ESC`, and the *Format Effector* (FEn) characters: `BS, TAB, LF, VT, FF, CR`.

Others are unused or have acquired different meanings such as `NUL` being the C string terminator.

Some data transfer protocols such as ANPA-1312, Kermit, and XMODEM do make extensive use of `SOH, STX, ETX, EOT, ACK, NAK, SYN` for purposes approximating their original definitions.

Some file formats use the *Information Separators (ISn)*: `FS GS RS US`

The names of some codes were changed in ISO 6429:1992 (or ECMA-48:1991) to be neutral with respect to writing direction.

The abbreviations used were not changed, as the standard had already specified that those would remain unchanged when the standard is translated to other languages.

(In this table both new and old names are shown for the renamed controls - old name is the one matching the abbreviation).


---

## Control Pictures

NUL SOH STX ETX EOT ENQ ACK BEL BS  HT  LF  VT  FF CR SO SI
DLE DC1 DC2 DC3 DC4 NAK SYN ETB CAN EM  SUB ESC FS GS RS US

␀ ␁ ␂ ␃ ␄ ␅ ␆ ␇ ␈ ␉ ␊ ␋ ␌ ␍ ␎ ␏
␐ ␑ ␒ ␓ ␔ ␕ ␖ ␗ ␘ ␙ ␚ ␛ ␜ ␝ ␞ ␟
␠ ␡ ␣ ␤ ␥ ␦


2400 ␀ SYMBOL FOR NULL
2401 ␁ SYMBOL FOR START OF HEADING
2402 ␂ SYMBOL FOR START OF TEXT
2403 ␃ SYMBOL FOR END OF TEXT
2404 ␄ SYMBOL FOR END OF TRANSMISSION
2405 ␅ SYMBOL FOR ENQUIRY
2406 ␆ SYMBOL FOR ACKNOWLEDGE
2407 ␇ SYMBOL FOR BELL
2408 ␈ SYMBOL FOR BACKSPACE
2409 ␉ SYMBOL FOR HORIZONTAL TABULATION
240A ␊ SYMBOL FOR LINE FEED
240B ␋ SYMBOL FOR VERTICAL TABULATION
240C ␌ SYMBOL FOR FORM FEED
240D ␍ SYMBOL FOR CARRIAGE RETURN
240E ␎ SYMBOL FOR SHIFT OUT
240F ␏ SYMBOL FOR SHIFT IN
2410 ␐ SYMBOL FOR DATA LINK ESCAPE
2411 ␑ SYMBOL FOR DEVICE CONTROL ONE
2412 ␒ SYMBOL FOR DEVICE CONTROL TWO
2413 ␓ SYMBOL FOR DEVICE CONTROL THREE
2414 ␔ SYMBOL FOR DEVICE CONTROL FOUR
2415 ␕ SYMBOL FOR NEGATIVE ACKNOWLEDGE
2416 ␖ SYMBOL FOR SYNCHRONOUS IDLE
2417 ␗ SYMBOL FOR END OF TRANSMISSION BLOCK
2418 ␘ SYMBOL FOR CANCEL
2419 ␙ SYMBOL FOR END OF MEDIUM
241A ␚ SYMBOL FOR SUBSTITUTE
241B ␛ SYMBOL FOR ESCAPE
241C ␜ SYMBOL FOR FILE SEPARATOR
241D ␝ SYMBOL FOR GROUP SEPARATOR
241E ␞ SYMBOL FOR RECORD SEPARATOR
241F ␟ SYMBOL FOR UNIT SEPARATOR
2420 ␠ SYMBOL FOR SPACE
2421 ␡ SYMBOL FOR DELETE

* Specific symbols for space

  2422 `␢` BLANK SYMBOL
    - graphic for space
    - 0180 ƀ  LATIN SMALL LETTER B WITH STROKE

  2423 ␣ OPEN BOX
    - graphic for space
    - 2334 ⌴  COUNTERBORE

* Graphic picture for control code

  2424 ␤ SYMBOL FOR NEWLINE
    - Keyboard symbol

  2425 ␥ SYMBOL FOR DELETE FORM TWO
    - keyboard symbol for undoable delete
    - from ISO 9995-7

* Specific symbol for control code

  2426 ␦ SYMBOL FOR SUBSTITUTE FORM TWO
    - 061F ؟  ARABIC QUESTION MARK
    - from ISO 2047
