# Emacs :: KEYS

Emacs commands generally involve the Control and Meta (or Alt) keys. The Shift key is implicit in the notation, and usually not explicitly denoted, but `X` is `S-x` actually. The explicit notation for the Shift key is uppercase `S` - the lowercase `s` is the Super key.

- `C` (or `c`)    Control (or `^`)
- `M` (or `m`)    Meta (Alt, AltGr)
- `e` (or `E`)    ESC
- `H` (or `h`)    Hyper
- `s`             Super (sometimes also as `T` or `t`)
- `S`             Shift
- `\s`            SPACE
- `\ `            SPACE


* `C-x` (or `\C-x`) or `^X` (or `^x`)
* `M-x` or `\M-x` or `\ex` or `ESCx` or `<ESC>x`


`C-<chr>` means Control + <chr>, e.g. `C-f` is <Control+f>.

`M-<chr>` means Alt + <chr>, e.g. `M-f` is <Alt+f>. Alternativelly, type it as ESC, then <chr>. We write <ESC> for the ESC key.

`M-<chr>` is fine as long as <chr> is a key in the unshifted state, so `M-x` is fine. However, `M-X` is actually `M-S-x` (`S-x` is Shift + x, while `s-x` is Super + x) which must be typed in using ESC, i.e. as `\eS-x`.

`M-C-<chr>`: when both Ctrl and Alt are involved, such key combos must usually be entered with <ESC>, e.g. `M-C-x` is `\e\C-x`.

`M-C-S-<chr>`: usually must be entered with <ESC>.




Metafied keys, like `M-x`, are the same as `\ex` i.e. `ESC x`. The key combos like `c-x` are the same as `C-X`. Control is writen `c-` or `C-`, same thing. When Control is pressed, terminals cannot tell whether Shift is also pressed. So `c-x` = `c-X` = `c-S-X`. Shift is denoted by uppercase `S`! Because `s` denotes the super key when used in key notations as e.g. `\s-x` is Super + x, but `\S-x` is `Shift + x`. The backspace is sometimes required but never hurts, so `\C-\s-x` should probably be written. `\s ` is space actually.

There is casual notation for keybindigs used in prose, and there is official notation since keybindings are *characters* (Lisp type). Weirdly, emacs uses extended charset to accomodate all Unicode characters plus shifted states of characters. 

`?x` is notation for literal character, returns: 120 (#o170, #x78, ?x).

`?\^[`
27 (#o33, #x1b, ?\C-\[)

If there is no META or ALT key, instead press and release the

C-key
- c-g       abort

C-x key
- `C-x k`   stop the emacs tutorial

C-key C-key
- c-x c-c   exit
- c-x c-s   save
- c-x c-f   visit file

M-key
- m-x       main command prefix

M-C-key
- This must be typed with ESC, `M-C-x` is `\e\C-x`
