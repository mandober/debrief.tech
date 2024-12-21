# Key bindings

Custom key binding in bash may be defined using `readline`. But there is a primitive set of predefined bindings independent of the shell or console application. This set is controlled by the `stty` utility, and the current configuration may be inspected with `stty -a`.

C-c INTR      = ^C
C-z SUSP      = ^Z
C-\ QUIT      = ^\
C-d EOF       = ^D
C-? ERASE     = ^?
C-w WERASE    = ^W
C-r RPRNT     = ^R
C-v LNEXT     = ^V
C-o DISCARD   = ^O
C-u KILL      = ^U
C-q START     = ^Q
C-s STOP      = ^S
EOL           = <undef>
EOL2          = <undef>
SWTCH         = <undef>

# Formats for key bindings

Modifiers
- S Shift
- M Alt (Meta)
- C Control
- T Windows key

In most apps, `ESC` can be used to the same effect as Alt. `Alt` is used like any other modifier. Fopr example, to move the cursor backwards by a word, use `M-b`; that is, press and hold `Alt`, then press `b`, then release `Alt`. To achieve the same with ESC: hit (press and release) `ESC`, then hit `b`. This method has a *timeout*: the amount of time in which you need to hit `x` before the keyseq is discarded (seems it is not set by default - another key can be hit after much time has passed).




But unlike Alt, where a keyseq is produced by holding Alt and then pressing another key (releasing both). With ESC the procedure is different: ESC is pressed and released and then another key is pressed (and released).


Keybinding formats
- emacs
  - modifiers: C (Ctrl), M (Alt), S (Shift), T (Win)
  - modifiers may be written in lower or uppercase
  - when letter-keys are written in uppercase they still repr lowercase
  - e.g. `C-X` means `C-x` (NO_SHIFT)
  - if Shift is to be used it will be mentioned, e.g. `X` never means `S-x`
  - lettercase of symbols in denotations is immaterial
  - these all mean the same thing: `C-x`, `c-x`, `C-X`, `c-X`
  - i.e. they all signify `C-x` in canonical format
  - `C-X` never means to press Ctrl and (Shift with x to get X)
  - if that is wanted it must be denoted as `C-S-x`
  - examples: `C-M-a`, `C-S-M-a`, `RET`


- readline: 
- stty:    ^x
- Windows: Ctrl+x
