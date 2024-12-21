# Vim Modes

Vim modes
- Normal mode                    N
- Insert mode                    I
- Command-line mode
  - Search forward                        /
  - Search backward              N        ?
  - Expression                   N        =
- Insert-Normal mode                      c-o
- Replace mode                   R        R
- Paste mode                     Ξ        :paste
  - Paste-Normal mode            N^^Ξ
  - Paste-Insert mode            I^^Ξ
  - Paste-Replace mode           R^^Ξ
  - Paste-Visual mode            V^^Ξ
  - Paste-Visual-Block mode      V-B^^Ξ
  - Paste-Visual-Line mode       V-L^^Ξ
- SELECT mode                    S
  - S-LINE                       S-L
  - S-BLOCK                      S-B
- VISUAL mode                    V        v
  - VISUAL-LINE mode             V-L      V
  - VISUAL-BLOCK mode            V-B      c-v

Quasi modes
- terminal window
  - terminal-Job mode
- operator-pending mode
- edit commands
  - list, edit and execute ex commands
- change mode                             c
- enter digraph mode                      c-k
- enter verbatim char                     c-v
- quick fix window
- preview window
- help mode
- List mode


mode      s     key                   status line
--------------------------------------------------------------------------
normal        N
insert        I       i                     -- INSERT --
ins-norm      I-N     c-o                   -- (insert) --
ex                    :
replace       R       r                     -- REPLACE --
visual        V       v                     -- VISUAL --
visual        V-B     v                     -- VISUAL BLOCK --
visual        V-L     v                     -- VISUAL LINE --
paste         N^^Ξ    :set paste            -- PASTE --
p-ins-paste   I^^Ξ    i (in paste mode)     -- INSERT (paste) --
p-vis-paste   V^^Ξ    v (in paste mode)     -- VISUAL --
p-vis-line    V-L^^Ξ  V  (in paste mode)    -- VISUAL LINE --
p-vis-block   V-B^^Ξ  c-v  (in paste mode)  -- VISUAL BLOCK --
p-replace     R^^Ξ    r (in paste mode)     -- REPLACE (paste) --
V-REPLACE     V^REPLACE



*Insert Normal mode* - in INSERT mode press `c-o` to do a single command and stay in insert mode thereafter. By default, `- (insert) -` is shown in the status bar.


normal mode
- `x` delete character under cursor
- `.` repeat the last operation
- `dd` delete current line
- `yy` yank current line
- `cc` or `S` delete (subst) current line and drop into insert mode
- `u` undo
- `C-r` redo
- `zz` center current line on screen


Tab
- `:tabe example.txt` edit file ex.txt in a new tab
- `:vimgrep /0$/ example.txt` search for lines ending with 0 in file ex.txt

window
- `:cwin` open quickfix window
- `c-W w` move cursor to other window
- `:vsp` split window vertically


Move
- `gg` move to first line
- `G` move to last line, `100G` move to line 100
- `k` move up, `8k` move 8 lines up
- `j` move down, `5j` move 5 lines down
- `l` move right, `4l` move 4 chars right
- `h` move left, `23h` move 23 char left
- `w/b` forward/backward by "word"
- `W/B` forward/backward by word

Searching
- `/regex` search forward
- `?regex` search backward
- `n` for next match, `N` for previous match
- `y/)` will yank everything to NEXT parens (or whatever you search for)


insert mode
- `i` insert at current location
- `a` insert after current location (append)
- `I` insert AT START of current line
- `A` insert AFTER END of current line
- `o` insert line below current line (open new line)
- `O` insert line ABOVE current line
- `s` delete char under cursor and start inserting in place (substitute text)
- `S` delete all text on line and start inserting in its place (substitute line)
- `cc` same as S (change line)
- `C` delete from cursor to EOL and start inserting at the cursor position
- `cw` delete to end of current word and start inserting in its place (any movement command can be substituted for `w`)

- `ci<char>` in char pairs (quotes, parens, …) change
- `di<char>` in char pairs delete
- `yi<char>` in char pairs yank
