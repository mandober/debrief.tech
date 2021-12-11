# Key bindings


C-x 3     split window vertically

m-x       extended command functionality

c-x ...   first chord of execution commands
c-x       drops you to the command line, type another chord next or a command
c-x c-c   quit

c-g       abort (command, action, emacs if unresponsive, long action, num.arg)

c-h ...   first chord of help commands
c-h t     starts emacs tutorial

m-u {N}... numeric argument (e.g. m-7 m-f move forward 7 words)
  m-{N}... prefix argument (repeat count, flags, etc.)

c-a       move to BOL
c-e       move to EOL

m-v       scroll by screen ↑ (2 lines of overlap)
c-v       scroll by screen ↓

{N} m-v   move ↑ N lines
{N} c-v   move ↓ N lines

c-l       scroll: level cursor line
m-<       move to the beggining of buffer
m->       move to the end of buffer

c-p       move to ↑ (prev) line
c-n       move to ↓ (next) line

c-b       move ← back  by char
c-f       move → forth by char

m-b       move ← back  by word
m-f       move → forth by word


Directons
- `a` start, `e` end
- `p` prev,  `n` next
- `b` back,  `f` forward


Units:
* physical (ctrl)
  - char
  - line, BOL, EOL
  - screen/page
  - buffer, BOB, EOB
* logical (meta)
  - word: BOW, EOW, B2W (on space char)
  - sentence: BOS, EOS
  - paragraph: BOP, EOP
