# Index :: Keycodes

Arrow keys in keypad mode
- "\C-[OA"        previous-history
- "\C-[OB"        next-history
- "\C-[OC"        forward-char
- "\C-[OD"        backward-char

Arrow keys in ANSI mode
- "\C-[[A"        previous-history
- "\C-[[B"        next-history
- "\C-[[C"        forward-char
- "\C-[[D"        backward-char

Arrow keys in 8 bit keypad mode
- "\C-M-OA"       previous-history
- "\C-M-OB"       next-history
- "\C-M-OC"       forward-char
- "\C-M-OD"       backward-char

Arrow keys in 8 bit ANSI mode
- "\C-M-[A"       previous-history
- "\C-M-[B"       next-history
- "\C-M-[C"       forward-char
- "\C-M-[D"       backward-char


Arrow keys       | keypad mode | 8-bit keypad mode | ANSI mode | 8-bit ANSI mode
previous-history | "\C-[OA"    | "\C-M-OA"         | "\C-[[A"  | "\C-M-[A"
next-history     | "\C-[OB"    | "\C-M-OB"         | "\C-[[B"  | "\C-M-[B"
forward-char     | "\C-[OC"    | "\C-M-OC"         | "\C-[[C"  | "\C-M-[C"
backward-char    | "\C-[OD"    | "\C-M-OD"         | "\C-[[D"  | "\C-M-[D"


- keypad mode        \C-[Ox   What is "O" doing here?
- ANSI mode          \C-[[x
- 8-bit keypad mode  \C-M-Ox  (8-bit and meta key)
- 8-bit ANSI mode    \C-M-[x


                         tcms
01 s        1 shift      0001
02 m        2 meta       0010
03 m-s      3            0011
----------------------
04 c        4 ctrl       0100
05 c-s      5            0101
06 c-m      6            0110
07 c-m-s    7            0111
======================
08 t        8 super      1000
09 t-s      9            1001
10 t-m     10            1010
11 t-m-s   11            1011
12 t-c     12            1100
13 t-c-s   13            1101
14 t-c-m   14            1110
15 t-c-m-s 15            1111


↑ (A):   ^[[A
s-↑:     ^[[1;2A
m-↑:     ^[[1;3A
s-m-↑:   ^[[1;4A
c-↑:     ^[[1;5A
c-s-↑    ^[[1;6A




⸄a b c⸅
⸂a b c⸃
⸤abc⸥
⸢abc⸣
⸜a b c⸝
﹝a b﹞
｢x z｣
⸊x⸉
c⸍m⸌n
❱see❰
https://www.amp-what.com/unicode/search/bracket

❝dee❞
㉏㉈
𝄋 𝄡
𝄆 𝄇 𝄏 𝄞 𝄵 𝄴 𝄯 𝅘𝅥𝅯 𝅬
𝄸 𝄹 𝄷 𝄶 𝄈 𝄊 𝆚 𝆢
𝅝 𝅖 ♭
𝆑 𝆐 𝆏 𝆖 𝆌 𝆍 𝆎
𝇜 𝇚 𝇙
㉓
㊷ ⦿ ⏹ ⌗ ⛾ ⬚
🆐 ㋍ ㋎ ㋌
🞓🞒🞒🞑🞑
a🞎a🞐a🞐a🞏a🞏a
🆇
🆊
🆋 🆌 🆍 🆏
🅏 🅎 🅍 🅌 🅋 🅊

http://xahlee.info/comp/unicode_computing_symbols.html
