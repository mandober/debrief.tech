# Vim :: Key mappings :: Normal mode

## 2. Normal mode

Normal mode [normal-index]

Legend
- CHAR        any non-blank character
- WORD        a sequence of non-blank characters
- N           a number entered before the command
- {motion}    a cursor movement command
- Nmove       the text that is moved over with a {motion}
- SECTION     a section that possibly starts with `}` instead of `{`
note:
- 1           cursor movement command
- 2           can be undone/redone


### Ctrl+Alpha

```
tag             char          note action in NORMAL mode
------------------------------------------------------------------------------
                CTRL-@             not used
CTRL-A          CTRL-A          2  add N to number at/after cursor
CTRL-B          CTRL-B          1  scroll N screens Backwards
CTRL-C          CTRL-C             interrupt current (search) command
CTRL-D          CTRL-D             scroll Down N lines (default: half a screen)
CTRL-E          CTRL-E             scroll N lines upwards (N lines Extra)
CTRL-F          CTRL-F          1  scroll N screens Forward
CTRL-G          CTRL-G             display current file name and position
<BS>            <BS>            1  same as "h"
CTRL-H          CTRL-H          1  same as "h"
<Tab>           <Tab>           1  go to N newer entry in jump list
CTRL-I          CTRL-I          1  same as <Tab>
<NL>            <NL>            1  same as "j"
CTRL-J          CTRL-J          1  same as "j"
                CTRL-K             not used
CTRL-L          CTRL-L             redraw screen
<CR>            <CR>            1  cursor to the first CHAR N lines lower
CTRL-M          CTRL-M          1  same as <CR>
CTRL-N          CTRL-N          1  same as "j"
CTRL-O          CTRL-O          1  go to N older entry in jump list
CTRL-P          CTRL-P          1  same as "k"
                CTRL-Q             not used, or used for terminal control flow
CTRL-R          CTRL-R          2  redo changes which were undone with 'u'
                CTRL-S             not used, or used for terminal control flow
CTRL-T          CTRL-T             jump to N older Tag in tag list
CTRL-U          CTRL-U             scroll N lines Upwards, default: half screen
CTRL-V          CTRL-V             start blockwise Visual mode
CTRL-W          CTRL-W {char}      window commands, see CTRL-W
CTRL-X          CTRL-X          2  subtract N from number at/after cursor
CTRL-Y          CTRL-Y             scroll N lines downwards
CTRL-Z          CTRL-Z             suspend program (or start new shell)
                CTRL-[ <Esc>       not used
CTRL-\_CTRL-N   CTRL-\ CTRL-N      go to Normal mode (no-op)
CTRL-\_CTRL-G   CTRL-\ CTRL-G      go to mode specified with 'insertmode'
                CTRL-\ a - z       reserved for extensions
                CTRL-\ others      not used
CTRL-]          CTRL-]             :ta to ident under cursor
CTRL-^          CTRL-^             edit Nth alternate file (equivalent to
                                   ":e #N")
                CTRL-_             not used
```

### punctuation 1

```
tag             char          note action in NORMAL mode
------------------------------------------------------------------------------
<Space>         <Space>         1  same as "l"
!               !{motion}{filter}
                                2  filter Nmove text through the {filter}
                                   command
!!              !!{filter}      2  filter N lines through the {filter} command
quote           "{register}        use {register} for next delete, yank or put
                                   ({.%#:} only work with put)
#               #               1  search backward for the Nth occurrence of
                                   the ident under the cursor
$               $               1  cursor to the end of Nth next line
%               %               1  find the next (curly/square) bracket on
                                   this line and go to its match, or go to
                                   matching comment bracket, or go to matching
                                   preprocessor directive.
N%              {count}%        1  go to N percentage in the file
&               &               2  repeat last :s
'               '{a-zA-Z0-9}    1  cursor to the first CHAR on the line with
                                   mark {a-zA-Z0-9}
''              ''              1  cursor to the first CHAR of the line where
                                   the cursor was before the latest jump.
'(              '(              1  cursor to the first CHAR on the line of the
                                   start of the current sentence
')              ')              1  cursor to the first CHAR on the line of the
                                   end of the current sentence
'<              '<              1  cursor to the first CHAR of the line where
                                   highlighted area starts/started in the
                                   current buffer.
'>              '>              1  cursor to the first CHAR of the line where
                                   highlighted area ends/ended in the current
                                   buffer.
'[              '[              1  cursor to the first CHAR on the line of the
                                   start of last operated text or start of put
                                   text
']              ']              1  cursor to the first CHAR on the line of the
                                   end of last operated text or end of put
                                   text
'{              '{              1  cursor to the first CHAR on the line of the
                                   start of the current paragraph
'}              '}              1  cursor to the first CHAR on the line of the
                                   end of the current paragraph
(               (               1  cursor N sentences backward
)               )               1  cursor N sentences forward
star            *               1  search forward for the Nth occurrence of
                                   the ident under the cursor
+               +               1  same as <CR>
,               ,               1  repeat latest f, t, F or T in opposite
                                   direction N times
-               -               1  cursor to the first CHAR N lines higher
.               .               2  repeat last change with count replaced with
                                   N
/               /{pattern}<CR>  1  search forward for the Nth occurrence of
                                   {pattern}
/<CR>           /<CR>           1  search forward for {pattern} of last search
0               0               1  cursor to the first char of the line
count           1                  prepend to command to give a count
count           2                       "
count           3                       "
count           4                       "
count           5                       "
count           6                       "
count           7                       "
count           8                       "
count           9                       "
:               :               1  start entering an Ex command
N:              {count}:           start entering an Ex command with range
                                   from current line to N-1 lines down
;               ;               1  repeat latest f, t, F or T N times
<               <{motion}       2  shift Nmove lines one 'shiftwidth'
                                   leftwards
<<              <<              2  shift N lines one 'shiftwidth' leftwards
=               ={motion}       2  filter Nmove lines through "indent"
==              ==              2  filter N lines through "indent"
>               >{motion}       2  shift Nmove lines one 'shiftwidth'
                                   rightwards
>>              >>              2  shift N lines one 'shiftwidth' rightwards
?               ?{pattern}<CR>  1  search backward for the Nth previous
                                   occurrence of {pattern}
?<CR>           ?<CR>           1  search backward for {pattern} of last search
@               @{a-z}          2  execute the contents of register {a-z}
                                   N times
@:              @:                 repeat the previous ":" command N times
@@              @@              2  repeat the previous @{a-z} N times
```

### UPPERCASE

```
tag             char          note action in NORMAL mode
------------------------------------------------------------------------------
A               A               2  append text after the end of the line N times
B               B               1  cursor N WORDS backward
C               ["x]C           2  change from the cursor position to the end
                                   of the line, and N-1 more lines [into
                                   register x]; synonym for "c$"
D               ["x]D           2  delete the characters under the cursor
                                   until the end of the line and N-1 more
                                   lines [into register x]; synonym for "d$"
E               E               1  cursor forward to the end of WORD N
F               F{char}         1  cursor to the Nth occurrence of {char} to
                                   the left
G               G               1  cursor to line N, default last line
H               H               1  cursor to line N from top of screen
I               I               2  insert text before the first CHAR on the
                                   line N times
J               J               2  Join N lines; default is 2
K               K                  lookup Keyword under the cursor with
                                   'keywordprg'
L               L               1  cursor to line N from bottom of screen
M               M               1  cursor to middle line of screen
N               N               1  repeat the latest '/' or '?' N times in
                                   opposite direction
O               O               2  begin a new line above the cursor and
                                   insert text, repeat N times
P               ["x]P           2  put the text [from register x] before the
                                   cursor N times
Q               Q                  switch to "Ex" mode
R               R               2  enter replace mode: overtype existing
                                   characters, repeat the entered text N-1
                                   times
S               ["x]S           2  delete N lines [into register x] and start
                                   insert; synonym for "cc".
T               T{char}         1  cursor till after Nth occurrence of {char}
                                   to the left
U               U               2  undo all latest changes on one line
V               V                  start linewise Visual mode
W               W               1  cursor N WORDS forward
X               ["x]X           2  delete N characters before the cursor [into
                                   register x]
Y               ["x]Y              yank N lines [into register x]; synonym for
                                   "yy"
ZZ              ZZ                 write if buffer changed and close window
ZQ              ZQ                 close window without writing
```

### punctuation 2

```
tag             char          note action in NORMAL mode
------------------------------------------------------------------------------
[               [{char}            square bracket command (see [ below)
                \                  not used
]               ]{char}            square bracket command (see ] below)
^               ^               1  cursor to the first CHAR of the line
_               _               1  cursor to the first CHAR N - 1 lines lower
`               `{a-zA-Z0-9}    1  cursor to the mark {a-zA-Z0-9}
`(              `(              1  cursor to the start of the current sentence
`)              `)              1  cursor to the end of the current sentence
`<              `<              1  cursor to the start of the highlighted area
`>              `>              1  cursor to the end of the highlighted area
`[              `[              1  cursor to the start of last operated text
                                   or start of putted text
`]              `]              1  cursor to the end of last operated text or
                                   end of putted text
``              ``              1  cursor to the position before latest jump
`{              `{              1  cursor to the start of the current paragraph
`}              `}              1  cursor to the end of the current paragraph
```

### lowercase

```
tag             char          note action in NORMAL mode
------------------------------------------------------------------------------
a               a               2  append text after the cursor N times
b               b               1  cursor N words backward
c               ["x]c{motion}   2  delete Nmove text [into register x] and
                                   start insert
cc              ["x]cc          2  delete N lines [into register x] and start
                                   insert
d               ["x]d{motion}   2  delete Nmove text [into register x]
dd              ["x]dd          2  delete N lines [into register x]
do              do              2  same as ":diffget"
dp              dp              2  same as ":diffput"
e               e               1  cursor forward to the end of word N
f               f{char}         1  cursor to Nth occurrence of {char} to the
                                   right
g               g{char}            extended commands, see g below
h               h               1  cursor N chars to the left
i               i               2  insert text before the cursor N times
j               j               1  cursor N lines downward
k               k               1  cursor N lines upward
l               l               1  cursor N chars to the right
m               m{A-Za-z}          set mark {A-Za-z} at cursor position
n               n               1  repeat the latest '/' or '?' N times
o               o               2  begin a new line below the cursor and
                                   insert text, repeat N times
p               ["x]p           2  put the text [from register x] after the
                                   cursor N times
q               q{0-9a-zA-Z"}      record typed characters into named register
                                   {0-9a-zA-Z"} (uppercase to append)
q               q                  (while recording) stops recording
q:              q:                 edit : command-line in command-line window
q/              q/                 edit / command-line in command-line window
q?              q?                 edit ? command-line in command-line window
r               r{char}         2  replace N chars with {char}
s               ["x]s           2  (substitute) delete N characters [into
                                   register x] and start insert
t               t{char}         1  cursor till before Nth occurrence of {char}
                                   to the right
u               u               2  undo changes
v               v                  start characterwise Visual mode
w               w               1  cursor N words forward
x               ["x]x           2  delete N characters under and after the
                                   cursor [into register x]
y               ["x]y{motion}      yank Nmove text [into register x]
yy              ["x]yy             yank N lines [into register x]
z               z{char}            commands starting with 'z', see z below
```

### punctuation 3

```
tag             char          note action in NORMAL mode
------------------------------------------------------------------------------
{               {               1  cursor N paragraphs backward
bar             |               1  cursor to column N
}               }               1  cursor N paragraphs forward
~               ~               2  'tildeop' off: switch case of N characters
                                   under cursor and move the cursor N
                                   characters to the right
~               ~{motion}          'tildeop' on: switch case of Nmove text
```


### Ctrl+Specials

```
tag             char          note action in NORMAL mode
------------------------------------------------------------------------------
<C-End>         <C-End>         1  same as "G"
<C-Home>        <C-Home>        1  same as "gg"
<C-Left>        <C-Left>        1  same as "b"
<C-LeftMouse>   <C-LeftMouse>      ":ta" to the keyword at the mouse click
<C-Right>       <C-Right>       1  same as "w"
<C-RightMouse> <C-RightMouse>      same as "CTRL-T"
<C-Tab>         <C-Tab>            same as "g<Tab>"
<Del>           ["x]<Del>       2  same as "x"
N<Del>          {count}<Del>       remove the last digit from {count}
<Down>          <Down>          1  same as "j"
<End>           <End>           1  same as "$"
<F1>            <F1>               same as <Help>
<Help>          <Help>             open a help window
<Home>          <Home>          1  same as "0"
<Insert>        <Insert>        2  same as "i"
<Left>          <Left>          1  same as "h"
<LeftMouse>     <LeftMouse>     1  move cursor to the mouse click position
<MiddleMouse>   <MiddleMouse>   2  same as "gP" at the mouse click position
<PageDown>      <PageDown>         same as CTRL-F
<PageUp>        <PageUp>           same as CTRL-B
<Right>         <Right>         1  same as "l"
<RightMouse>    <RightMouse>       start Visual mode, move cursor to the mouse
                                   click position
<S-Down>        <S-Down>        1  same as CTRL-F
<S-Left>        <S-Left>        1  same as "b"
<S-LeftMouse>   <S-LeftMouse>      same as "*" at the mouse click position
<S-Right>       <S-Right>       1  same as "w"
<S-RightMouse> <S-RightMouse>      same as "#" at the mouse click position
<S-Up>          <S-Up>          1  same as CTRL-B
<Undo>          <Undo>          2  same as "u"
<Up>            <Up>            1  same as "k"
<ScrollWheelDown>       <ScrollWheelDown>       move window three lines down
<S-ScrollWheelDown>     <S-ScrollWheelDown>     move window one page down
<ScrollWheelUp>         <ScrollWheelUp>         move window three lines up
<S-ScrollWheelUp>       <S-ScrollWheelUp>       move window one page up
<ScrollWheelLeft>       <ScrollWheelLeft>       move window six columns left
<S-ScrollWheelLeft>     <S-ScrollWheelLeft>     move window one page left
<ScrollWheelRight>      <ScrollWheelRight>      move window six columns right
<S-ScrollWheelRight>    <S-ScrollWheelRight>    move window one page right
```



## 2.1. Text objects

Text objects [objects]

These can be used after an operator or in Visual mode to select an object.

```
tag             command            action in op-pending and Visual mode
------------------------------------------------------------------------------
v_aquote        a"                 double quoted string
v_a'            a'                 single quoted string
v_a(            a(                 same as ab
v_a)            a)                 same as ab
v_a<            a<                 "a <>" from '<' to the matching '>'
v_a>            a>                 same as a<
v_aB            aB                 "a Block" from "[{" to "]}" (with brackets)
v_aW            aW                 "a WORD" (with white space)
v_a[            a[                 "a []" from '[' to the matching ']'
v_a]            a]                 same as a[
v_a`            a`                 string in backticks
v_ab            ab                 "a block" from "[(" to "])" (with braces)
v_ap            ap                 "a paragraph" (with white space)
v_as            as                 "a sentence" (with white space)
v_at            at                 "a tag block" (with white space)
v_aw            aw                 "a word" (with white space)
v_a{            a{                 same as aB
v_a}            a}                 same as aB
v_iquote        i"                 double quoted string without the quotes
v_i'            i'                 single quoted string without the quotes
v_i(            i(                 same as ib
v_i)            i)                 same as ib
v_i<            i<                 "inner <>" from '<' to the matching '>'
v_i>            i>                 same as i<
v_iB            iB                 "inner Block" from "[{" and "]}"
v_iW            iW                 "inner WORD"
v_i[            i[                 "inner []" from '[' to the matching ']'
v_i]            i]                 same as i[
v_i`            i`                 string in backticks without the backticks
v_ib            ib                 "inner block" from "[(" to "])"
v_ip            ip                 "inner paragraph"
v_is            is                 "inner sentence"
v_it            it                 "inner tag block"
v_iw            iw                 "inner word"
v_i{            i{                 same as iB
v_i}            i}                 same as iB
```

## 2.2. Window commands

Window commands [CTRL-W]

- CTRL-W CTRL-B   same as "CTRL-W b"
- CTRL-W CTRL-C   same as "CTRL-W c"
- CTRL-W CTRL-D   same as "CTRL-W d"
- CTRL-W CTRL-F   same as "CTRL-W f"
- CTRL-W CTRL-G   same as "CTRL-W g .."
- CTRL-W CTRL-H   same as "CTRL-W h"
- CTRL-W CTRL-I   same as "CTRL-W i"
- CTRL-W CTRL-J   same as "CTRL-W j"
- CTRL-W CTRL-K   same as "CTRL-W k"
- CTRL-W CTRL-L   same as "CTRL-W l"
- CTRL-W CTRL-N   same as "CTRL-W n"
- CTRL-W CTRL-O   same as "CTRL-W o"
- CTRL-W CTRL-P   same as "CTRL-W p"
- CTRL-W CTRL-Q   same as "CTRL-W q"
- CTRL-W CTRL-R   same as "CTRL-W r"
- CTRL-W CTRL-S   same as "CTRL-W s"
- CTRL-W CTRL-T   same as "CTRL-W t"
- CTRL-W CTRL-V   same as "CTRL-W v"
- CTRL-W CTRL-W   same as "CTRL-W w"
- CTRL-W CTRL-X   same as "CTRL-W x"
- CTRL-W CTRL-Z   same as "CTRL-W z"
- CTRL-W CTRL-]   same as "CTRL-W ]"
- CTRL-W CTRL-^   same as "CTRL-W ^"
- CTRL-W CTRL-_   same as "CTRL-W _"
- CTRL-W ↓        same as "CTRL-W j"
- CTRL-W ↑        same as "CTRL-W k"
- CTRL-W ←        same as "CTRL-W h"
- CTRL-W →        same as "CTRL-W l"

- CTRL-W +        increase current window height N lines
- CTRL-W -        decrease current window height N lines
- CTRL-W :        same as :, edit a command line
- CTRL-W <        decrease current window width N columns
- CTRL-W =        make all windows the same height & width
- CTRL-W >        increase current window width N columns
- CTRL-W ]        split window and jump to tag under cursor
- CTRL-W ^        split current window and edit alt file N
- CTRL-W _        set window height to N (default: very high)
- CTRL-W |        set window width to N columns
- CTRL-W }        show tag under cursor in preview window

- CTRL-W F        split, edit filename on cursor, jump to line nr after fname
- CTRL-W H        move current window to the far left
- CTRL-W J        move current window to the very bottom
- CTRL-W K        move current window to the very top
- CTRL-W L        move current window to the far right
- CTRL-W P        go to preview window
- CTRL-W R        rotate windows upwards N times
- CTRL-W S        same as "CTRL-W s"
- CTRL-W T        move current window to a new tab page
- CTRL-W W        go to N previous window (wrap around)

- CTRL-W b        go to bottom window
- CTRL-W c        close current window (like :close)
- CTRL-W d        split window and jump to def under cursor
- CTRL-W f        split window and edit file name under cursor
- CTRL-W g CTRL-] split window and do :tjump to tag under curs
- CTRL-W g ]      split window, do :tselect for tag under curs
- CTRL-W g }      do a :ptjump to the tag under the cursor
- CTRL-W g f      edit file name under the cursor in new tab
- CTRL-W g F      edit filename on cursor in tab, jump to line nr after fname
- CTRL-W g t      same as gt: go to next tab page
- CTRL-W g T      same as gT: go to previous tab page
- CTRL-W g <Tab>  same as g<Tab>: go to last accessed tab
- CTRL-W h        go to Nth left window (stop at first window)
- CTRL-W i        split and jump to decl of ident under cursor
- CTRL-W j        go N windows down (stop at last window)
- CTRL-W k        go N windows up (stop at first window)
- CTRL-W l        go to Nth right window (stop at last window)
- CTRL-W n        open new window, N lines high
- CTRL-W o        close all but current window (like :only)
- CTRL-W p        go to previous (last accessed) window
- CTRL-W q        quit current window (like :quit)
- CTRL-W r        rotate windows downwards N times
- CTRL-W s        split window in 2 parts, new win N lines high
- CTRL-W t        go to top window
- CTRL-W v        vsplit window, new window N columns wide
- CTRL-W w        go to N next window (wrap around)
- CTRL-W x        exchange current with window N, default: next
- CTRL-W z        close preview window


## 2.3. Square bracket commands

```
tag             char          note action in Normal mode
------------------------------------------------------------------------------
[_CTRL-D        [ CTRL-D           jump to first #define found in current and included files matching the word under the cursor, start searching at beginning of current file
[_CTRL-I        [ CTRL-I           jump to first line in current and included files that contains the word under the cursor, start searching at beginning of current file

[#              [#              1  cursor to N previous unmatched #if, #else or #ifdef
['              ['              1  cursor to previous lowercase mark, on first non-blank
[(              [(              1  cursor N times back to unmatched '('
[star           [*              1  same as "[/"
[`              [`              1  cursor to previous lowercase mark
[/              [/              1  cursor to N previous start of a C comment

[D              [D                 list all defines found in current and included files matching the word under the cursor, start searching at beginning of current file
[I              [I                 list all lines found in current and included files that contain the word under the cursor, start searching at beginning of current file
[P              [P              2  same as "[p"

[[              [[              1  cursor N sections backward
[]              []              1  cursor N SECTIONS backward

[c              [c              1  cursor N times backwards to start of change
[d              [d                 show first #define found in current and included files matching the word under the cursor, start searching at beginning of current file
[f              [f                 same as "gf"
[i              [i                 show first line found in current and included files that contains the word under the cursor, start searching at beginning of current file
[m              [m              1  cursor N times back to start of member function
[p              [p              2  like "P", but adjust indent to current line
[s              [s              1  move to the previous misspelled word
[z              [z              1  move to start of open fold

[{              [{              1  cursor N times back to unmatched '{'
[<MiddleMouse> [<MiddleMouse>   2  same as "[p"

]_CTRL-D        ] CTRL-D           jump to first #define found in current and included files matching the word under the cursor, start searching at cursor position
]_CTRL-I        ] CTRL-I           jump to first line in current and included files that contains the word under the cursor, start searching at cursor position

]#              ]#              1  cursor to N next unmatched #endif or #else
]'              ]'              1  cursor to next lowercase mark, on first non-blank
])              ])              1  cursor N times forward to unmatched ')'
]star           ]*              1  same as "]/"
]`              ]`              1  cursor to next lowercase mark
]/              ]/              1  cursor to N next end of a C comment

]D              ]D                 list all #defines found in current and included files matching the word under the cursor, start searching at cursor position
]I              ]I                 list all lines found in current and included files that contain the word under the cursor, start searching at cursor position
]P              ]P              2  same as "[p"

][              ][              1  cursor N SECTIONS forward
]]              ]]              1  cursor N sections forward

]c              ]c              1  cursor N times forward to start of change
]d              ]d                 show first #define found in current and included files matching the word under the cursor, start searching at cursor position
]f              ]f                 same as "gf"
]i              ]i                 show first line found in current and included files that contains the word under the cursor, start searching at cursor position
]m              ]m              1  cursor N times forward to end of member function
]p              ]p              2  like "p", but adjust indent to current line
]s              ]s              1  move to next misspelled word
]z              ]z              1  move to end of open fold

]}              ]}              1  cursor N times forward to unmatched '}'
]<MiddleMouse> ]<MiddleMouse>   2  same as "]p"
```

## 2.4. Commands starting with g

```
tag             char          note action in Normal mode
------------------------------------------------------------------------------
g_CTRL-A        g CTRL-A           only when compiled with MEM_PROFILE defined: dump a memory profile
g_CTRL-G        g CTRL-G           show information about current cursor position
g_CTRL-H        g CTRL-H           start Select block mode
g_CTRL-]        g CTRL-]           :tjump to the tag under the cursor

g#              g#              1  like "#", but without using "\<" and "\>"
g$              g$              1  when 'wrap' off go to rightmost character of the current line that is on the screen; when 'wrap' on go to the rightmost character of the current screen line
g&              g&              2  repeat last ":s" on all lines
g'              g'{mark}        1  like ' but without changing the jumplist
g`              g`{mark}        1  like ` but without changing the jumplist
gstar           g*              1  like "*", but without using "\<" and "\>"
g+              g+                 go to newer text state N times
g,              g,              1  go to N newer position in change list
g-              g-                 go to older text state N times

g0              g0              1  when 'wrap' off go to leftmost character of the current line that is on the screen; when 'wrap' on go to the leftmost character of the current screen line 
g8              g8                 print hex value of bytes used in UTF-8 character under the cursor

g;              g;              1  go to N older position in change list
g<              g<                 display previous command output
g?              g?              2  Rot13 encoding operator
g?g?            g??             2  Rot13 encode current line
g?g?            g?g?            2  Rot13 encode current line

gD              gD              1  go to definition of word under the cursor in current file
gE              gE              1  go backwards to the end of the previous WORD
gH              gH                 start Select line mode
gI              gI              2  like "I", but always start in column 1
gJ              gJ              2  join lines without inserting space
gN              gN            1,2  find the previous match with the last used search pattern and Visually select it
gP              ["x]gP          2  put the text [from register x] before the cursor N times, leave the cursor after it
gQ              gQ                  switch to "Ex" mode with Vim editing
gR              gR              2  enter Virtual Replace mode
gT              gT                 go to the previous tab page
gU              gU{motion}      2  make Nmove text uppercase
gV              gV                 don't reselect the previous Visual area when executing a mapping or menu in Select mode

g]              g]                 :tselect on the tag under the cursor
g^              g^              1  when 'wrap' off go to leftmost non-white character of the current line that is on the screen; when 'wrap' on go to the leftmost non-white character of the current screen line
g_              g_              1  cursor to the last CHAR N - 1 lines lower

ga              ga                 print ascii value of character under the cursor
gd              gd              1  go to definition of word under the cursor in current function
ge              ge              1  go backwards to the end of the previous word
gf              gf                 start editing the file whose name is under the cursor
gF              gF                 start editing the file whose name is under the cursor and jump to the line number following the filename.
gg              gg              1  cursor to line N, default first line
gh              gh                 start Select mode
gi              gi              2  like "i", but first move to the '^ mark
gj              gj              1  like "j", but when 'wrap' on go N screen lines down
gk              gk              1  like "k", but when 'wrap' on go N screen lines up
gm              gm              1  go to character at middle of the screenline
gM              gM              1  go to character at middle of the text line
gn              gn            1,2  find the next match with the last used search pattern and Visually select it
go              go              1  cursor to byte N in the buffer
gp              ["x]gp          2  put the text [from register x] after the cursor N times, leave the cursor after it
gq              gq{motion}      2  format Nmove text
gr              gr{char}        2  virtual replace N chars with {char}
gs              gs                 go to sleep for N seconds (default 1)
gt              gt                 go to the next tab page
gu              gu{motion}      2  make Nmove text lowercase
gv              gv                 reselect the previous Visual area
gw              gw{motion}      2  format Nmove text and keep cursor

netrw-gx        gx                 execute application for file name under the cursor (only with netrw plugin)

g@              g@{motion}         call 'operatorfunc'
g~              g~{motion}      2  swap case for Nmove text
g<Down>         g<Down>         1  same as "gj"
g<End>          g<End>          1  same as "g$"
g<Home>         g<Home>         1  same as "g0"
g<LeftMouse>    g<LeftMouse>       same as <C-LeftMouse>
                g<MiddleMouse>     same as <C-MiddleMouse>
g<RightMouse>   g<RightMouse>      same as <C-RightMouse>
g<Tab>          g<Tab>             go to the last accessed tab page.
g<Up>           g<Up>           1  same as "gk"
```

## 2.5. Commands starting with z

* z{h}<CR> redraw: make window {h} lines high
* z<CR>    redraw: cursor line to win top; cursor on first non-blank

* z+       cursor on line N (default line below window); else like z<CR>
* z-       redraw: cursor line at win bot; cursor on first non-blank
* z^       cursor on line N (default line above window), else like "z-"
* z.       redraw: cursor line to win mid; cursor on first non-blank
- z=       spell: show spelling corrections

- zA       fold: open a closed fold or close an open fold recursively
- zB       <nop>
- zC       fold: close folds recursively
- zD       fold: delete folds recursively
- zE       fold: eliminate all folds
- zF       fold: create a fold for N lines
- zG       spell: temporarily mark word as correctly spelled (undo: `zuG`)
- zH       scroll: when 'wrap' off scroll half a screenwidth to the right
- zI       <nop>
- zJ       <nop>
- zK       <nop>
- zL       scroll: when 'wrap' off scroll half a screenwidth to the left
- zM       fold: set 'foldlevel' to zero
- zN       fold: set 'foldenable'
- zO       fold: open folds recursively
- zP       paste in block-mode without trailing spaces
- zQ       <nop>
- zR       fold: set 'foldlevel' to the deepest fold
- zS       <nop>
- zT       <nop>
- zU       <nop>
- zV       <nop>
- zW       spell: temporarily mark word as incorrectly spelled (undo: `zuW`)
- zX       fold: re-apply 'foldlevel'
- zY       <nop>
- zZ       <nop>

- za       fold: open a closed fold, close an open fold
* zb       redraw: cursor line at bottom of window
- zc       fold: close a fold
- zd       fold: delete a fold
- ze       scroll: when 'wrap' off, h-scroll to cursor at EOScr (right side)
- zf{mot}  fold: create a fold for Nmove text
- zg       spell: permanently mark word as correctly spelled (undo: `zug`)
- zh       scroll: when 'wrap' off, scroll screen N chars to right
- zi       fold: toggle 'foldenable'
- zj 1     fold: move to start of next fold (cursor movement cmd)
- zk 1     fold: move to end of prev fold (cursor movement cmd)
- zl       scroll: when 'wrap' off, scroll screen N characters to the left
- zm       fold: subtract one from 'foldlevel'
- zn       fold: reset 'foldenable'
- zo       fold: open fold
+ zp       paste in block-mode without trailing spaces
- zq       <nop>
- zr       fold: add one to 'foldlevel'
- zs       scroll: when 'wrap' off, h-scroll to curs at left side of screen
* zt       redraw: cursor line at top of window
- zuw      spell: undo zw
- zuW      spell: undo zW
- zug      spell: undo zg
- zuG      spell: undo zG
- zv       fold: open enough folds to view the cursor line
- zw       spell: permanently mark word as incorrectly spelled (undo: `zuw`)
- zx       fold: re-apply 'foldlevel' and do "zv"
+ zy       yank without trailing spaces
* zz       redraw: cursor line at center of window

- z→       scroll: same as "zh"
- z←       scroll: same as "zl"
- z↑       <nop>
- z↓       <nop>


## 2.6. Operator-pending mode

Operator-pending mode [operator-pending-index]

These can be used after an operator, but before a {motion} has been entered.

```
tag             char            action in Operator-pending mode
-----------------------------------------------------------------------
o_v             v               force operator to work character-wise
o_V             V               force operator to work line-wise
o_CTRL-V        CTRL-V          force operator to work block-wise
```
