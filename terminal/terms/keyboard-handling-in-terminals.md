# Keyboard handling in terminals

https://sw.kovidgoyal.net/kitty/keyboard-protocol/
https://github.com/wez/wezterm/blob/main/docs/config/key-encoding.md


## Control, Escape, and Meta Tricks
https://susam.net/control-escape-meta-tricks.html
By Susam Pal on 16 Jun 2023

Open a Linux terminal emulator. Type `foo bar baz`, then press `M-b` (Alt+b). This should make the cursor move backward by one word. The same can be achieved with `ESC b` and `C-[ b` (since `C-[` is ESC). Why is this the case? Running `cat` then typing these sequences yields gives `^[b` in all 3 cases. `^[` is the ESC control character, which has ASCII code 0x1b or `00:11011`. The ASCII binary code for `[` is `10:11011` which explains its appearance.

The 5 low bits (bits 0-4) are the same for `ESC`, `;`, `[` and `{`:
- 00:11011 ESC
- 01:11011 ;
- 10:11011 [
- 11:11011 {
