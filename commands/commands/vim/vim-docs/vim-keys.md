# Vim keys

https://vimhelp.org/quickref.txt.html

## Denotation

NOTE: In most commands, letters are case-insensitive; that is, a command like `Ctrl+W S` may be written `c-w s`, i.e. using either lowercase or uppercase letters 'W' and 'S' - even the casing of the modifier is case-insensitive. The official docs use uppercase, probably for readability.

>CTRL+{alpha} cannot be distiguished from CTRL+SHIFT+{alpha} in most terminals (unless the terminal sends a specific termcap code, which most do not do).

Lone modifers may be denoted in shortened form:
- `Ctrl+` as `c-` or `C-`
- `Shift+` as `s-` or `S-`
- `Alt+` (i.e. `Meta+`) as `m-` or `M-`

>Terminal utils can't tell if you have typed "ENTER" or CTRL+I.

Tab     ⇥
Control ⎈
Esc     ⎋

Combined modifers may also be denoted using the shortened forms:
- e.g. `Shift+Ctrl+` as `s-c-`, although when a letter follows, it is best to denote it lowercased, adding the explicit shift if the uppercase is needed. For example, a command `c-V` is normally the same as `c-s-v` (Ctrl with a shifted 'v'), but the latter form is better due to its explicitness; even if denoted by `c-s-V` it would remain unambiguous.
- Usually, combos with modifiers are Ctrl-based, with implied (and usually redundant) shift, e.g. `c-λ` is the same as `c-s-λ`.
- Alt-based modifers are denoted e.g. `m-<Left>`
- Ctrl+Alt are rarely seen, `c-m-λ` or `c-m-s-λ`
- Shift however becomes non-optional key when the characters are symbols and punctuations, e.g. `c-'` is not the same as `c-"`, but the latter is (probably) the same as `c-s-'`; `c-_` == `c-s--`; `c-=` == `c-s-+`.
- Win key (Super key) is denoted by `T`, e.g. `t-W` means `Win+W`
- In a command like `Ctrl+W S`, the Ctrl may be kept depressed, so the actual command becomes `Ctrl+W Ctrl+S` (i.e. `c-w c-s`). This is probably allowed because it is easier not to release the Control key when entering such combos; which is (probably) also the reason why Shift-ing is (usually) optional.

Summary
1. Usually, letters in commands are case-insensitive (use shift or not).
2. Ctrl can (usually) be kept depressed to enter the next symbol.

>When denoting most commands, using Shift is (mostly) optional, and using Ctrl on the next part of a command is (usually) optional.

## TOC
<!-- TOC -->

- [Denotation](#denotation)
- [TOC](#toc)
- [Buffers](#buffers)
- [Change](#change)
- [Completion](#completion)
- [Delete](#delete)
- [Digraphs](#digraphs)
- [Edits](#edits)
- [Ex commands](#ex-commands)
- [Filter text](#filter-text)
- [Format](#format)
- [Folds](#folds)
- [Go](#go)
- [Help system](#help-system)
- [Info](#info)
- [Indent](#indent)
- [INSERT mode](#insert-mode)
- [Jumps](#jumps)
- [Letter case](#letter-case)
- [Marks](#marks)
- [Move](#move)
- [Macros](#macros)
- [Motions](#motions)
- [NORMAL mode](#normal-mode)
- [Operators](#operators)
- [Paste](#paste)
- [Quickfix](#quickfix)
- [Quickfix/Location list](#quickfixlocation-list)
- [Quit](#quit)
- [Redo](#redo)
- [Replace mode](#replace-mode)
- [Registers](#registers)
- [Substitute](#substitute)
- [Scroll](#scroll)
- [Search](#search)
- [Search and replace](#search-and-replace)
- [Sort](#sort)
- [Spell check](#spell-check)
- [SELECT mode](#select-mode)
- [Tabs](#tabs)
- [Text objects](#text-objects)
- [Text modifiers](#text-modifiers)
- [VISUAL modes](#visual-modes)
- [Undo](#undo)
- [Window](#window)
- [Yank](#yank)
- [Legend](#legend)

<!-- /TOC -->

## Buffers

- :buffers          List buffers
- :files            List buffers
- :bd               Delete buffer - remove it from the buffer list
- :bd 3             Delete buffer #3
- :bd {file}        Delete buffer attached to file

- :bn               Jump to next buffer
- :bp               Jump to prev buffer

- :buffer {file}    Jump to buffer of file
- :buffer N         Jump to buffer number N
- :buffer 2         Jump to buffer #2

- c-^               Jump to the prev edited buffer
- c-O               Jump to the older position in the jump list
- c-I               Jump to the newer position in the jump list

- :ball             place each buffer in its own window
- :vert ball        place each buffer in its own window in vsplit


## Change

Change operator, *c [n] {motion}*, deletes text object then enters INSERT mode.

- C           change from cursor to EOL
- ce          change from cursor to end of word (like `dei`)
- cc          change line (like `S` or `ddi`)
- c$          change to EOL (like `d$i`)
- cw          change word, i.e. del from cursor to EOW (like `dwi`)
- ciw         change in-word (no matter where cursor is on the word)
- ci'         change (text) in (inside) squotes
- ci"         change in dquotes
- ci(         change in parens
- ci{         change in braces
- ci[         change in brackets
- cip         change in paragraph (grouped lines in source code)
- cit         change in tag (in HTML code)

## Completion

- <TAB>      command-line completion (C)
- c-d        show completions (I, C)
- c-p        complete names (I, C)


## Delete

- x           delete char at/after cursor
- X           delete char before cursor
- dd          delete line
- diw         delete in-word
- dt{c}       delete till next char 'c'
- d/{word}    delete till next {word}
- D           delete from cursor to EOL

Command-line mode (C) and Insert mode (I)
- c-u         (C) (I) delete from cursor to BOL
- c-w         (C) (I) delete the word before cursor
- c-v         (C) (I) input next char literally (`c-q` unless flow control)
- c-V         (C) (I) input next char literally (`c-Q` unless flow control)

## Digraphs

In INSERT mode
- c-k {char1} {char2}     enter a digraph
- c-k o:                  gives ö
- c-k a'                  gives á

## Edits
- g;          jump to last (recent) edits (repeat to go to prev edit spots)
- g,          jump to last (recent) edits (in reverse order)
- :changes    list all changes made to a buffer

## Ex commands

- :3copy5       copy line 3 to line 5
- :3t5          copy line 3 to line 5
- :3m5          move line 3 to line 5
- :3d           delete line nr. 3
- :3,5m8        move (range of) lines 3-5 to line 8
- :-2,+1d       delete lines using relative ranges (with rnu)
- :'<,'>sort    sort selection ASC
- :'<,'>sort!   sort selection DESC
- :'<,'>d       delete text making up the most recent selection

- '< and '>     are special selection marks
- '{ and '}     are paragraphs marks
- '( and ')     are sentence marks

- :2,5normal A,     Append `,` to each line in range
- @:                Repeat the last Ex command

 

## Filter text

- :v/{term}/{flags}       filter text

flags:
- d       hide other text


```vim
" filter for the second column of a plaintext
" table for all rows that contain string 'term'

" (must escape + and parens)
:v/term/d                     " show only lines with term
:v/^\s*\S\+\s\+\(\S\+\).*/d   " capture group
:%s//\1/                      " reference the first captured group, \1
```

## Format

- gq        reformat selection. justifies text, useful with :set tw=70

## Folds

- za      toggle fold
- zi      toggle all folds
- zA      toggle fold wrg zO and zC
- zN      toggle prev fold situation
- zn      open all folds
- zR      open all folds
- zo      open fold
- zO      open all nested folds
- zc      close fold
- zC      close nested folds recursively
- zM      close all folds
- zd      delete a fold (with cursor on the fold line)
- zE      eliminate (delete) all folds
- zf      create a fold from VISUAL selection
- zfa{    create a fold by folding within braces
- zm      fold level 1
- zM      fold all levels

- zj      go to next fold
- zk      go to prev fold
- [z      top line of current fold
- ]z      bottom line of current fold

- VG      select all
- VGzf    select all and apply fold (zf)

- :10,50 foldopen     Open folds on lines 10 and 50
- :10,50 foldclose    Close folds on lines 10 and 50
- :%foldclose         Close all folds

## Go

- ga      get info for char under cursor
          e.g. `<→> 8594, Hex 2192, Oct 20622, Digr ->4` for `→`
          To enter '→' as a digraph, type ⟨c-k - >⟩
- gb      (netrw) change permission
- ge      goto end of prev word
- gf      goto filename under cursor
- gq      reformat selection (re :tw=80)
- gu      Convert selection to lowercase

- gU      Convert selection to uppercase

- g8      get UTF-8 encoding of char under cursor, e.g. `e2 86 92` for `→`
- g8g     Find an illegal UTF-8 byte sequence at or after cursor



## Help system
- c-s-0       help: go to topic under cursor (or `c-]`)
- c-t         help: jump back (or `c-o`)

## Info

- c-g     show file info
- ga      show character info
- g8      shows UTF8 encoding
- K       lookup word under cursor in man
- 2K      lookup word under cursor in man in section 2


## Indent

    >> indent (N)
    << outdent (N)

    c-T indent (I)
    c-D outdent (I)

## INSERT mode

Insert as operator
- *[n] i {text} <ESC>*   insert {text} [n] times

- i           enter INSERT mode (insert) at cursor
- I           enter INSERT mode (insert) at BOL

- A           enter INSERT mode (append) after EOL
- a           enter INSERT mode (append) after current char

- o           open new line after current line
- O           open new line before current line

To prepend text to multiple lines:
  - enter VISUAL mode (V-L)
  - select lines
  - press `I`
  - type in the text
  - then press ESC (to update the other lines)
  The thing is, while we are typing the text, only the current line changes (not all lines as expected), but as soon as we press ESC (thereby also returning to NORMAL mode), the other lines will be updated (e.g. all lines will be prefixed with the typed chars).

To append text to multiple lines: same but use `A` (append) instead of `I`.


## Jumps

In Vim, you can "jump" to a different file or different part of a file with some motions. Not all motions count as a jump, though. Going down with j does not count as a jump. Going to line 10 with 10G counts as a jump. A good rule of thumb is, any motion that moves farther than a word and current line navigation is probably a jump. Vim keeps track of where you've been when you move around and you can see this list inside `:jumps`. For more, check out `:h jump-motions`. 

These are mostly used in c source files:
(the search considers open and `#include`d files)
- [c-i    jump to definition of var whose name is under the cursor.
- ]c-i    jump to definition of var whose name is under the cursor.
- [c-d    jump to first definition of preprocessor directive under cursor.
- [c-d    jump to next definition of preprocessor directive under cursor.
- `[d`, `]d`, `[D`, `]D` cpp preprocessor directives (macros)


- gd      jump to local declaration of var under cursor
- gD      jump to global definition of var under cursor

- '       jump to marker (beginning of line)
- `       jump to marker (exact position)

- nG      jump to line n
- :n      jump to line n

- /{term} Search forward
- ?{term} Search backward

- n       Repeat last search, same direction
- N       Repeat last search, opposite direction

- `%`     jumps to the matching pair of parens, braces, brackets, quotes

- (       jump to last sentence
- )       jump to next sentence

- {       jump to last paragraph
- }       jump to next paragraph

- H       jump to top    of window
- M       jump to middle of window
- L       jump to bottom of window

- [[      jump to previous section
- ]]      jump to next section

- :tag    jump to tag definition
- :tselect {name} List of the tags
- g]      does a :tselect on the identifier under the cursor
- c-w]    splits the current window and jumps to the tag under the cursor
          in the upper window. If given count N, new window is N lines high.
- :tjump  Like :tselect, except if the selection results in only one item, it 
          is automatically selected.
- g CTRL-] does a :tjump on the word under the cursor.

- :jumps  Display list of jumps

- c-o     jump list: move up
- c-i     jump list: move down

Tag selection list
- :count tnext      Go to the next tag
- :count tprev      Go to the previous tag
- :count tNext      Go to the next tag
- :count trewind    Go to the first tag
- :count tlast      Go to the last tag

- :stselect   Same as :tselect except with split
- :stjump     Same as :split and :tjump

mkvimrc mkvimrc.vim

⏎ » ↲ ◌ ⦁ • ◦ ° ↩ ↪ ⋙ ≫ ↹ ⨞ ◀ ▶ ▹◃ ▸ ◂ ‣


## Letter case
- u           (V) downcase selection
- U           (V) uppercase selection
- ~           toggle case of a char
- g~          swap case
- gu          make lowercase
- gU          make uppercase, `gUiw`, `gUa}`

## Marks

There are 2 types of marks:
- *Local marks* use lowercase single letters (a-z), and they exists only as long as the buffer (where they are defined) exists.
- *Global marks* use uppercase single letters (A-Z), but they are saved, so they can be invoked across Vim sessions.

Jumping to a mark has 2 modes:
- jumping to the exact location with: <tick>{mark}
- jumping to the BOL with the mark: <squote>{mark}

```vim
" Create marks
mm              mark position locally with 'm'
mM              mark position globally with 'M'

" Invoke marks
'm              jump to mark 'm' (same line)
`m              jump to mark 'm' (exact spot)

" Jumps
['              prev marked line
[`              prev marked spot

]'              next marked line
]`              next marked spot

`[    Jump to beginning of previously changed / yanked text
`]    Jump to the ending of previously changed / yanked text

''    Jump back to the last line in current buffer before jump
``    Jump back to the last position in current buffer before jump
''    Return to prev marked line
``    Return to prev marked spot

`<    Jump to the beginning of last visual selection
`>    Jump to the ending of last visual selection

`0    Jump back to the last edited file (after exiting vim)
```

Mark commands
- :marks       List all marks
- :delmarks    Remove marks

- :delmarks a       Remove mark `a`
- :delmarks a-c     Remove marks `a`, `b`, `c`
- :delmarks aAbc    Remove marks `a`, `A`, `b`, `c`
- :delmarks!        Remove all lowercase marks



## Move

* Word Navigation

    w     Move forward to the beginning of the next word
    W     Move forward to the beginning of the next WORD
    e     Move forward one word to the end of the next word
    E     Move forward one word to the end of the next WORD
    b     Move backward to beginning of the previous word
    B     Move backward to beginning of the previous WORD
    ge    Move backward to end of the previous word
    gE    Move backward to end of the previous WORD

Both word and WORD are separated by blank characters. A word is a sequence of characters containing only `a-zA-Z0-9_`. A WORD is a sequence of all characters except whitespace (space, tab, NL). See `:h word` and `:h WORD`.

* Current Line Navigation

    0     Go to the first character in the current line
    ^     Go to the first nonblank char in the current line
    g_    Go to the last non-blank char in the current line
    $     Go to the last char in the current line
    n|    Go the column n in the current line

* Current Line Navigation by searching

    f    Search forward for a match in the same line
    F    Search backward for a match in the same line
    t    Search forward for a match in the same line, stopping before match
    T    Search backward for a match in the same line, stopping before match
    ;    Repeat the last search in the same line using the same direction
    ,    Repeat the last search in the same line using the opposite direction

* Sentence and Paragraph Navigation

    (    Jump to the previous sentence
    )    Jump to the next sentence
    {    Jump to the previous paragraph
    }    Jump to the next paragraph
    %    Navigate to another match, usually works for (), [], {}

A *sentence* ends with either [. ! ?] followed by an [EOL, space, tab].

A *paragraph* begins after each empty line and also at each set of a paragraph macro specified by the pairs of characters in paragraphs option.

* Line Number Navigation

    gg    Go to the first line
    G     Go to the last line
    nG    Go to line n
    n%    Go to n% in file

* Sreen Navigation

    H     Go to top of screen
    M     Go to medium screen
    L     Go to bottom of screen
    nH    Go n line from top
    nL    Go n line from bottom




- f{char}     move to next occurrence of the {char}
- F{char}     move to prev occurrence of the {char}

- t{char}     move one place before the next occurrence of the {char}
- T{char}     move one place after the prev occurrence of the {char}

- ;           repeat "move to char" going forward
- ,           repeat "move to char" going backward

- :{ln}       go to line number
- gf          go to file under cursor
- c-G         show location in the file and file status

- gj          Down in a soft-wrapped line
- gk          Up in a soft-wrapped line



## Macros
- qa      macro: start recording in register 'a'
- q       macro: stop recording
- @a      macro: play 'a'
- @@      macro: play last

## Motions
- h           <LEFT>
- j           <DOWN>
- k           <UP>
- l           <RIGHT>

- w           BOW next, or `c- <LEFT>` or `s- <LEFT>`
- b           BOW prev (current)
- e           EOW next (current)
- $           EOL
- _           EOL (last non-whitespace char on line)
- 0           BOL
- ^           BOL (first non-whitespace chars on line)

- gg          BOF
- G           EOF

## NORMAL mode

- <ESC>       escape to NORMAL mode
- `C-c`       escape to NORMAL mode, esp. from VISUAL modes

## Operators
- d           delete
- c           change
- r           replace
- f           jump to next occurence
- t           jump to prev occurence

## Paste
- P           paste before
- p           paste after
- :paste      turn on paste mode

The last 9 cuts with `x` or `d` or `y` are placed in registers
- "Np        paste from register where N = 1-9, e.g. `"0p`

## Quickfix

Results of many commands (e.g. of :vim[grep] for searching patterns across files) are displayed in quickfix window.

- :copen             open quickfix window
- :cprev             go to prev error
- :cnext             go to next error
- :col[der]          go to older error
- :cnew[er]          go to newer error
- :ccl[ose]          close quickfix

## Quickfix/Location list

- :col[der]          show prev quickfix results
- :cnew[er]          show next quickfix results
- :ccl[ose]          close quickfix window

- :lol[der]          show prev in location list
- :lnew[er]          show next in location list
- :lcl[ose]          close location list

- `<c-w><CR>`        open quickfix entry in a horizontal split
- `<c-r>w`           paste word currently under cursor
- `<c-r>{register}`  paste text from register to cmdline
                     (e.g. `<C-r>"` pastes the last-yanked text)

## Quit

- zz                Quit (if all buffers written)
- :wq               Write then quit
- :qall             Quit even if multiple buffers open
- :qall!
- :wqall

## Redo
- c-r         redo

## Replace mode
- r{char}     replace a char under cursor with {char}
- R           enter REPLACE (overstroke) mode

## Registers

If Vim compiled w `+clipboard`, use `"+` register to access system clipboard

- `"`…       prefix for register-related actions (`""p`, `"+p`)

register names
- a-z        lowercase registers
- A-Z        uppercase reg appends content to corresp. lowercase reg
- `"`        unnamed register (`""p` paste from unnamed reg)
- `-`        ??? register
- `:`        last cmd register
- `%`        filename register
- `/`        last search backward term (register)
- `#`        last search forward term (register)

- `+`        system clipboard (`"+p` paste from sys cb)

examples
- "ayy       yank line into register 'a'
- "bdd       delete line yanking it into register 'b'
- "ap        paste register 'a'
- "0p        paste register '0'
- ""p        paste from unnamed register
- "+p        paste from system clipboard

## Substitute

- s           subst, then INSERT
- S           subst line, then INSERT mode (⎀)

## Scroll

- c-b         scroll page up   (PageUp)
- c-f         scroll page down (PageDown)
- c-u         scroll half page up
- c-d         scroll half page down
- c-e         scroll 1 line up
- c-y         scroll 1 line down

- gg          jump to top
- G           jump to bottom
- 45G         jump to line 45
- 75%         jump to 75% of content

+/- scrolloff offset (:set scrolloff=3)
- z<CR>       position the current line as the top    screen line
- zt          position the current line as the top    screen line
- zz          position the current line as the middle screen line
- z.          position the current line as the middle screen line
- z-          position the current line as the bottom screen line

- H           move cursor to highest line on screen
- M           move cursor to middle  line on screen
- L           move cursor to lowest  line on screen

## Search

- /{term}     search for {term} in forward direction
- ?{term}     search for {term} in backward direction

search options
- :set hlsearch,   :set hls, :hls     highlight matching terms
- :set incsearch,  :set is,  :is      search as you type
- :set ignorecase, :set ic,  :ic      case-insensitive search

TIP: To ignore case for just one search command, use `\c` in the term.

- /\c{term}   search for term, case-insensitive, or `/{term}\c`
- /\C{term}   search for term, case-sensitive, or `/{term}\C`
- `/\/\*\*`   search for pattern `/**`
- /\<term\>   search for term as a bounded word


- //        latest forward search
- ??        latest backward search

- q/        list, edit, execute again search-forward history
- q?        list, edit, execute again search-backward history

- n         next match
- N         prev match

- c-o       takes you backward to older positions
- c-i       takes you forward to newer positions

- `*`       move to the next occurence of the word under the cursor
- `#`       move to the prev occurence of the word under the cursor


    g*    Search for word under cursor forward
    g#    Search for word under cursor backward


Both \< and \> in /\<one\> mean whole word search. It does not match "one" if it is a part of a bigger word. It will match for the word "one" but not "onetwo". If your cursor is over "one" and you want to search forward to match whole or partial words like "one" and "onetwo", you need to use g* instead of *.

## Search and replace

- :[range]s/needle/repl/{flags}
- :10,50/needle/repl/{flags}
- :%s/needle/repl/{flags}

```vim
" filter for the second column of a plaintext
" table for all rows that contain string 'tcp'

" using awk
:%!awk '/tcp/{print $2}'

" or with vim alone (must escape plus and parens)
:v/tcp/d
:v/^\s*\S\+\s\+\(\S\+\).*/d   " capture group
:%s//\1/                      " reference the first captured group, \1
```

s-a-r flags
- g   global
- i   case-insensitive
- I   case-sensitive
- c   confirm
       y      yes for this occurrence (continues)
       n      no for this occurrence (continues)
       a      yes to all from here on out
       q      quit
       l      last change (short for 'yes' then 'quit')
      ^E      scroll up by 1 line
      ^Y      scroll down by 1 line


## Sort

  [range]sort        sort range of lines ASC
  [range]sort!       sort range of lines DESC
  :!sort             sort using external program `sort`
  :!uniq             run through `uniq` filter (external program)

## Spell check

- :set spell    Turn on spell checker
- [s, [S        jump to prev spelling error
- ]s, ]S        jump to next spelling error
- z=            show spelling corrections menu (when on a spelling error)
- 1z=           replace a spelling error with the first suggested correction


## SELECT mode

https://vimhelp.org/visual.txt.html#Select-mode

Select mode looks like Visual mode, but the commands accepted are quite
different. Status shows "-- SELECT --".

Entering Select mode:
- Using the mouse to select an area, and 'selectmode' contains "mouse".
  'mouse' must also contain a flag for the current mode.
- Using a non-printable movement command, with the Shift key pressed,
  and 'selectmode' contains "key". For example: <S-Left> and <S-End>.
  'keymodel' must also contain "startsel".
- Using `v`, `V` or CTRL-V command, and 'selectmode' contains `cmd`.
- Using `gh`, `gH` or `g_CTRL-H` command in Normal mode.
- From Visual mode, press `c-g`.

Commands in Select mode:
- Printable characters, <NL> and <CR> cause the selection to be deleted, and
  Vim enters Insert mode. The typed character is inserted.
- Non-printable movement commands, with the Shift key pressed, extend the
  selection. 'keymodel' must include "startsel".
- Non-printable movement commands, with Shift NOT pressed, stop Select mode.
  'keymodel' must include "stopsel".
- ESC stops Select mode.
- `c-O` switches to Visual mode for the duration of one command.
- `c-G` switches to Visual mode.
- `c-R {register}` selects the register to be used for the text that is deleted when typing text. Unless you specify the "_" (black hole) register, the unnamed register is also overwritten.

Otherwise, typed characters are handled as in Visual mode.

When using an operator in Select mode, and the selection is linewise, the selected lines are operated upon, but like in characterwise selection. For example, when a whole line is deleted, it can later be pasted halfway a line.


## Tabs

- gT                  tab prev
- gt                  tab next
- :tabprevious        tab prev
- :tabnext            tab next
- :tablast            tab last
- :tabfirst           tab first
- :tabnew {file}      tab open file in new tab
- :tabclose           tab close

## Text objects

  
    w         word
    "         dquotes
    '         squotes
    (         parens
    {         braces
    [         brackets
    p         paragraph
    s         sentence
    t         tag (pair of < >)
    t         XML tags
    $         EOL
    0         BOL
    `         A pair of ticks

see `:h text-objects`

## Text modifiers

The first dash stands for an opertor (d/c/y):
  -i-   *in* excluding whitespace and target object, `diw`, `yi)`
  -a-   *around*

  -o-   outside?

  -iw    in-word
  -i"    in-dquotes
  -it    in-tags
  -ip    in-paragraph

## VISUAL modes

- v           enter VISUAL mode
- V           enter VISUAL LINE mode
- c-V         enter VISUAL BLOCK mode
- viw         select in-word
- vip         select in-paragraph
- '<,'>       visual selector range
- o           jump to opposite end of selection
- gv          reselect last selection
- gV          reselect last selection and …?
- c-G         (in VISUAL) enter SELECT mode
- c-O         (in SELECT) switches to Visual mode for one command
- c-G         (in SELECT) switches to Visual mode


Visual selector range continues to operate on the previous visual selection, even when that range is no longer selected.


## Undo
- u           undo last change
- U           undo line (as it were before editing it)

## Window

- :new                window: new
- :new {file}         window: open file in new window

Window split
- c-w s             window: split current buffer, c-w S, c-w c-S, c-w c-s
- c-w v             window: vsplit current buffer
- :sp[lit]          window: hsplit current buffer
- :vs[plit]         window: vsplit current buffer
- :vs[plit] {file}  window: vsplit with file open


Focus window
- c-w h               focus left   ←
- c-w l               focus right  →
- c-w k               focus above  ↑
- c-w j               focus below  ↓

Move current split (window)
- c-w H               move split left
- c-w J               move split bottom
- c-w K               move split top
- c-w L               move split right

- c-w o               close others windows
- c-w c               window close (or `:q`) - its buffer is still alive


## Yank
- y           yank
- yw          yank word
- yiw         yank in-word
- d           deletes are cuts


## Legend

modes
- N  normal mode (assumed as default mode)
- I  insert mode
- R  replace mode
- V  visual mode
- C  ex (command) mode

modifier keys
- Shift  +1   s-   <s-λ>
- Alt    +2   m-   <m-λ>
- Ctrl   +4   c-   <c-λ>
- Win    +8   t-   <t-λ>


Special key names
- <s-λ>, <m-λ>, <c-λ>, <t-λ>
- <F1> .. <F12>
- <ESC>, <TAB>, <BS>
- <CR>, <NL>
- <SPACE>
- <Ins>, <Del>
- <Home>, <End>
- <PageUp>, <PageDown>
- <Left>, <Down>, <Up>, <Right>
- <bar> (pipe)
