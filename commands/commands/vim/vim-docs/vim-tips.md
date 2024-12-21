# vim :: tips

## Save file despite forgetting sudo

https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work

The command that allows you to save the file that needs root permission but you forgot to open it with `sudo`:

>:w !sudo tee %

command :W
  :execute ':silent w !sudo tee % > /dev/null'     | :edit!
  :execute ':silent w !sudo tee   > /dev/null "%"' | :edit!


- `%`    is replaced with the current file name
- `"%"`  wrap it in quotes if the current file name contains spaces
- `:w !cmd` pipes the contents of the current buffer to the command `cmd`

What tee does is copy standard input to one or more files, and also to standard output. Therefore, `:w !sudo tee % > /dev/null` effectively writes the contents of the current buffer to the current file while being root.

Another command that can be used for this is 'dd':
`:w !sudo dd of=% > /dev/null`

As a shortcut, you can add this mapping to your `.vimrc`

```vim
" Force-save a file that requires root permission but was opened w/o sudo
cnoremap w!! w !sudo tee > /dev/null %
```

With the above you can type `:w!!<RET>` to save the file as root.

* Multi-line manipulation
Use `V` visual block mode to make a selection (select first chars on each line), then do `I#<esc>` to insert `#` on each of those lines.

Marks
- `m` prefix to mark a location
- {tick} to go to a location
- `mq` store the current location in mark 'q'
- ``q` return to the location of mark 'q'


* `\<esc>` is a string escape sequence which resolves to a press of ESC key

## Configuring the cursor

This works ok:

```vim
" Cursor IBeam shape in insert mode
let &t_SI = "\<Esc>[6 q"
" Cursor block shape in normal mode
let &t_SR = "\<Esc>[4 q"
" Cursor underline shape in replace mode
let &t_EI = "\<Esc>[2 q"
```

Using gvim with the defaults, the cursor shape is a block when in *n-v-c modes* (normal, visual and command mode), and the shape changes to a vertical bar when in insert mode. The color and blink rates do not change. Example for gvim on how to customize cursor properties (see :h 'guicursor')

```vim
1 highlight  Cursor guifg=yellow guibg=black
2 highlight iCursor guifg=green guibg=steelblue
3 set guicursor=n-v-c:block-Cursor
4 set guicursor+=i:ver100-iCursor
5 set guicursor+=n-v-c:blinkon0
6 set guicursor+=i:blinkwait10
```

Line 1 defines the color highlighting used for n-v-c modes (set in line 3).
Line 2 defines a different color for insert mode (set in line 4).
Line 5 disables blinking ('blinkon' value 0) for n-v-c modes. 
Line 6 increases the default blink rate for insert mode. 
Line 4 also sets the cursor shape to a 100% sized vertical bar for insert mode 
(the default is 'ver25', a 25% vertical bar. When using 'ver100' vim doesn't take the 'guifg' parameter. It is better to use block instead).

https://vim.fandom.com/wiki/Configuring_the_cursor


- t_SI    start insert mode (bar cursor shape)
- t_SR    start replace mode (underline cursor shape)
- t_EI    end insert or replace mode (block cursor shape)
xterm-bracketed-paste
- t_SC    set cursor color start
- t_EC    set cursor color end
- t_SH    set cursor shape

Some codes have a start, middle and end part. The start and end are defined by the termcap option, the middle part is text.

set cursor color: `t_SC {color_name} t_EC`

`t_SH` must take one argument:
- 0  blinking block
- 1  blinking block
- 2  solid block
- 3  blinking underscore
- 4  solid underscore
- 5  blinking IBeam
- 6  solid IBeam




Change cursor color:

```vim
if &term =~ "xterm\\|rxvt"
  " use orange cursor in insert mode (works!)
  let &t_SI = "\<Esc>]12;orange\x7"

  " use red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"

  silent !echo -ne "\033]12;red\007"

  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif
```

0x07 (\x7 hex or \007 octal) is BEL
0x1b (\x1b hex or \033 octal) is ESC


Change cursor shape:

```vim
if &term =~ '^xterm\\|rxvt'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"

  " solid block
  let &t_EI .= "\<Esc>[2 q"

endif
```

Cursor appearance summary

```vim
" - entered insert mode
"   blinking bar (Ss) in magenta (Cs)
let &t_SI = "\<Esc>[5 q\<Esc>]12;Magenta\007"

" - entered replace mode
"   blinking block (Ss) in red (Cs)
let &t_SR = "\<Esc>[0 q\<Esc>]12;Red\007"

" - leaving insert/replace mode
"   terminal power-on style (Se) and colour (Cr)
let &t_EI = "\<Esc>[2 q\<Esc>]112\007"
```


- https://vim.fandom.com/wiki/Configuring_the_cursor

- https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim

- https://stackoverflow.com/questions/6488683/how-to-change-the-cursor-between-normal-and-insert-modes-in-vim

- https://unix.stackexchange.com/questions/594270/how-can-i-make-a-custom-terminal-cursor-shape

* ANSI Control Functions Summary
https://www.vt100.net/docs/vt510-rm/chapter4.html

* DECSCUSR
https://invisible-island.net/xterm/ctlseqs/ctlseqs.html

* xterm+tmux entry in terminfo.src
https://raw.githubusercontent.com/mirror/ncurses/master/misc/terminfo.src

* TERM, COLORTERM, XTERM_VERSION, VTE_VERSION - terminal type environment vars
http://jdebp.uk./Softwares/nosh/guide/TERM.html

* terminal type descriptions source file - terminfo/infocap source entries
https://www.invisible-island.net/ncurses/terminfo.src.html
https://www.invisible-island.net/ncurses/terminfo.src-entries.html
This file describes the capabilities of various character-cell terminals

* FAQ ncurses
https://www.invisible-island.net/ncurses/ncurses.faq.html
