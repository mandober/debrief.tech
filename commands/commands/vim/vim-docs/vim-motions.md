# Vim :: Motions and operators


by char
  h   left: to prev char    ←
  l   right: to next char   →

by word
  W   Beginning of (next) WORD forward            →
  w   Beginning of (next) word forward            →
  e   End of (prev/current) word forward          →
  b   Beginning of (prev/current) word backward       ←
 ge   End of (prev/current) word backward             ←

```vim
0   ^       e    w      e    w     e w  e           →
    Beginning of previous or current word.
    b       g    b      g    b     g     $          ←
    _       e           e          e
```

by line
  k   up: to the line above      ↑
  j   down: to the line below    ↓
  $   EOL                                →
  0   BOL: Beginning of current line     ←
  _   EOL: Last non-whitespace char on the curent line     →
  ^   BOL: First non-whitespace char on the curent line    ←

by blocks
  gg  BOF: Beginning of file      ↑↑
  G   EOF: end of file            ↓↓
  )    Jump to the next sentence       →
  }    Jump to the next paragraph        →

## Motions and operators

The motion commands can be used after an operator command, to have the command operate on the text that was moved over. That is the text between the cursor position before and after the motion. Operators are generally used to delete or change text.

The following operators are available:
- c       change
- d       delete
- y       yank into register (does not change the text)
- ~       swap case (only if 'tildeop' is set)
- g~      swap case
- gu      make lowercase
- gU      make uppercase
- !       filter through an external program
- =       filter through 'equalprg' or C-indenting if empty
- gq      text formatting
- gw      text formatting with no cursor movement
- g?      ROT13 encoding
- >       shift right
- <       shift left
- zf      define a fold
- g@      call function set with the 'operatorfunc' option
