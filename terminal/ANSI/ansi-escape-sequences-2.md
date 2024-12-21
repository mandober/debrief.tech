# 

## OSC (Operating System Command)

https://en.wikipedia.org/wiki/ANSI_escape_code#OSC_(Operating_System_Command)_sequences

CSI (Control Sequence Introducer) is `ESC + [`, i.e. `^[[`, also as `\e[`.

ESC code appears as `^[` which is a single character. ESC code may be obtained as `C-[` (Ctrl+Shift+9)

ESC=$'\x1b'
ESC=$'^['
CSI=$'\x1b['
CSI=$ESC[

DCS is the 8-bit control code Device Control Sequence, which can be represented by the 7-bit sequence ESC P. ST is the 8-bit control code String Terminator, which can be represented by the 7-bit sequence ESC \.


ASCII asynchronous video terminals
local editing
block mode transmission
bit-mapped graphics capabilities
local echo
printer port
advanced video capabilities: bold, blink, underline, reverse video, and 132-character condensed readout
monochrome graphics VT240
full color graphics VT241
menu-driven set-up

The VT200s have 15 programmable function keys that store 256 bytes, allowing one keystroke to do the work of many. And they offer either 7- or 8-bit character support, for adaptability to many languages, while keyboards are available in at least 15 different languages.

Both the VT240 and the VT241 generate full bit-map graphics in both ReGIS and Tektronix™ 4010/4014 emulation, supporting industry standards. The Tektronix 4010/4014 protocols will support a wide range of graphics software available on both Digital's systems as well as others, such as Tektronix PLOT-10 software. With these capabilities, you can generate vectors and curves simply and automatically, quickly transforming complex data into easily understood diagrams, charts, and graphs.
