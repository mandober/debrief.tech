# Vim :: Key mappings :: Insert mode

## 1. Insert mode
[insert-index]

- kc   key category
- sp   special keys
- cc   CTRL combos
  - cs CTRL + special key
  - cp CTRL + punctuation
  - cn CTRL + number
  - ca CTRL + alpha
  - cu CTRL + uppercase letter
  - cl CTRL + lowercase letter


KC| KEY               | VC  | DESC
--|-------------------|-----|--------------------------------------------------
cp| c-^               |wtf  | toggle use of **:lmap mappings**
cp| c-\ c-n           |mode | goto NORMAL mode
cp| c-\ c-g           |wtf  | goto mode specified with 'insertmode'
cp| c-\ ‹others›      |free | not used
cp| c-\ ‹a..z›        |free | reserved for extensions
cp| c-@               |inser| insert previously inserted text and stop insert
cp| c-]               |abbr | trigger abbreviation
cp| c-[               |dup  | same as <Esc>
cp| c-_               |wtf  | change lang (Hebrew, Farsi), only w/ 'allowrevins'
oo| 0 c-d             |del  | delete indent in current line
oo| ^ c-d             |del  | delete indent in current line, restore it in next
oo| ‹meta chars›      |free | High-ASCII (0x80 to 0xff, 128-255) not unused
sp| <Tab>             |inser| insert <Tab> char
sp| <Space> to ~      |free | not used, except `0 c-d` and `^ c-d`
sp| <Esc>             |mode | end insert mode (unless 'insertmode' set)
sp| <Del>             |del  | delete char under cursor
sp| <CR>              |inser| begin new line
sp| <BS>              |del  | delete char before cursor
sp| {ch1}<BS>{ch2}    |digra| enter digraph (only if 'digraph' option set)



## All

KC| KEY               | VC  | DESC
--|-------------------|-----|--------------------------------------------------
sp| {ch1}<BS>{ch2}    |     | enter digraph (only when `digraph` option set)
sp| <BS>              |     | delete char before cursor
sp| <Tab>             |     | insert <Tab> char
sp| <CR>              |     | begin new line
sp| <Esc>             |     | end insert mode (unless `insertmode` set)
sp| <Del>             |     | delete character under the cursor
  | 0 c-d             |     | delete indent in current line
  | ^ c-d             |     | delete indent in current line, restore it in next
sp| <Space> to ~      | free| not used, except `0 c-d` and `^ c-d`
  | Meta chars        | free| (0x80 to 0xff, 128 to 255): not used
KC|=KEY===============|=VC==|=DESC==============================================
cp| c-@               |     | insert previously inserted text and stop insert
cp| c-[               | dup | same as <Esc>
cp| c-]               |     | trigger abbreviation
cp| c-\ c-n           |     | goto NORMAL mode
cp| c-\ c-g           | wtf | goto mode specified with `insertmode`
cp| c-\ a-z           | free| reserved for extensions
cp| c-\ others        | free| not used
cp| c-^               | wtf | toggle use of **:lmap mappings**
cp| c-_               | wtf | change lang (Hebrew, Farsi) (only w 'allowrevins')
KC|=KEY===============|=VC==|=DESC==============================================
ca| c-A               |     | insert previously inserted text
ca| c-B               | free| not used [i_CTRL-B-gone]
ca| c-C               |     | quit INSERT wo check for abbr unless 'insertmode'
ca| c-D               |     | delete 1 shiftwidth of indent in current line
ca| c-E               |     | insert char below cursor
ca| c-F               | free| not used (in 'cinkeys' by deflt to reindent line)
ca| c-G c-J           |     | line down, to column where inserting started
ca| c-G j             |     | line down, to column where inserting started
ca| c-G <Down>        |     | line down, to column where inserting started
ca| c-G c-K           |     | line up, to column where inserting started
ca| c-G k             |     | line up, to column where inserting started
ca| c-G <Up>          |     | line up, to column where inserting started
ca| c-G u             |     | start new undoable edit
ca| c-G U             |     | don't break undo with next cursor movement
ca| c-H               | dup | same as <BS>
ca| c-I               | dup | same as <Tab>
ca| c-J               | dup | same as <CR>
ca| c-K {ch1} {ch2}   |     | enter digraph
ca| c-L               |     | Leave Insert mode (when 'insertmode' set)
ca| c-M               | dup | same as <CR>
ca| c-N               |     | find next match for keyword in front of the cursor
ca| c-O               |     | execute a single command and return to insert mode
ca| c-P               |     | find previous match for keyword in front of cursor
ca| c-q               |     | same as CTRL-V (unless bound to tty control flow)
ca| c-S-q {ch}        |     | like CTRL-Q unless *modifyOtherKeys* is active
ca| c-R {reg}         |     | insert the contents of a reg
ca| c-R c-R {reg}     |     | insert contents of reg literally
ca| c-R c-O {reg}     |     | insert contents of reg literally, no autoindent
ca| c-R c-P {reg}     |     | insert contents of reg literally, fix indent
ca| c-S               |     | not used or used for terminal control flow
ca| c-T               |     | insert one *shiftwidth* of indent in current line
ca| c-U               |     | delete all entered chars in the current line
ca| c-V {char}        |     | insert next non-digit literally
ca| c-S-V {ch}        |     | like CTRL-V unless *modifyOtherKeys* is active
ca| c-V {nr}          |     | insert 3 digit decimal number as a single byte
ca| c-W               |     | delete word before the cursor
ca| c-X {mode}        |     | enter CTRL-X sub mode, see i_CTRL-X_index
ca| c-Y               |     | insert char above cursor
ca| c-Z               |     | suspend Vim (when `insertmode` set)


- <Left>          cursor one character left
- <S-Left>        cursor one word left
- <C-Left>        cursor one word left

- <Right>         cursor one character right
- <S-Right>       cursor one word right
- <C-Right>       cursor one word right

- <Up>            cursor one line up
- <S-Up>          same as <PageUp>

- <Down>          cursor one line down
- <S-Down>        same as <PageDown>

- <Home>          cursor to start of line
- <C-Home>        cursor to start of file

- <End>           cursor past end of line
- <C-End>         cursor past end of file

- <PageUp>        one screenful backward
- <PageDown>      one screenful forward

- <Insert>        toggle Insert/Replace mode
- <F1>            stop insert mode and display help window

- <LeftMouse>             cursor at mouse click

- <ScrollWheelUp>         move window 3 lines up
- <ScrollWheelDown>       move window 3 lines down
- <S-ScrollWheelUp>       move window 1 page up
- <S-ScrollWheelDown>     move window 1 page down


## Commands in CTRL-X submode
[i_CTRL-X_index]


- CTRL-X s        spell: spelling suggestions

- CTRL-X CTRL-D   completion: complete defined identifiers
- CTRL-X CTRL-E   scroll: up
- CTRL-X CTRL-F   completion: complete file names
- CTRL-X CTRL-I   completion: complete identifiers
- CTRL-X CTRL-K   completion: complete identifiers from dictionary
- CTRL-X CTRL-L   completion: complete whole lines
- CTRL-X CTRL-N   completion: next completion
- CTRL-X CTRL-O   completion: omni completion
- CTRL-X CTRL-P   completion: previous completion
- CTRL-X CTRL-S   spell: spelling suggestions
- CTRL-X CTRL-T   completion: complete identifiers from thesaurus
- CTRL-X CTRL-Y   scroll: down
- CTRL-X CTRL-U   completion: complete with `completefunc`
- CTRL-X CTRL-V   completion: complete like in `:` command line
- CTRL-X CTRL-Z   completion: stop completion, keeping the text as-is

- CTRL-X CTRL-]   completion: complete tags



## Commands in completion mode
see [popupmenu-keys]

- CTRL-E          stop completion and go back to original text
- CTRL-H          same as <BS>

- CTRL-L          insert one char from current match
- CTRL-Y          accept selected match and stop completion

- <CR>            insert currently selected match
- <BS>            delete one char and redo search

- <Up>            select prev match
- <Down>          select next match

- <PageUp>        select a match several entries back
- <PageDown>      select a match several entries forward

- other           stop completion and insert the typed character
