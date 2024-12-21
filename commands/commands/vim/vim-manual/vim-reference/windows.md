# Vim :: Window


## Keys

- c-⟨wW⟩ [c-]⟨sS⟩, :sp[lit]
- c-⟨wW⟩ [c-]⟨vV⟩, :vs[plit]



## TOC

1.  Introduction                              [windows-intro]
2.  Starting Vim                              [windows-starting]
3.  Opening and closing a window              [opening-window]
4.  Moving cursor to other windows            [window-move-cursor]
5.  Moving windows around                     [window-moving]
6.  Window resizing                           [window-resize]
7.  Argument and buffer list commands         [buffer-list]
8.  Do a command in all buffers or windows    [list-repeat]
9.  Tag or file name under the cursor         [window-tag]
10. The preview window                        [preview-window]
11. Using hidden buffers                      [buffer-hidden]
12. Special kinds of buffers                  [special-buffers]


## 1. Introduction

Summary:
- buffer is the in-memory text of a file
- window is a viewport on a buffer
- tab page is a collection of windows

A **window** is a viewport onto a buffer. You can use multiple windows on one buffer, or several windows on different buffers.

A **buffer** is a file loaded into memory for editing. The original file remains unchanged until you write the buffer to the file.

A buffer can be in one of 3 states:
1. *active*
   The buffer is displayed in a window. If there is a file for this buffer, it has been read into the buffer. The buffer may have been modified since then and thus be different from the file.
2. *hidden*
   The buffer is not displayed. If there is a file for this buffer, it has been read into the buffer.  Otherwise it's the same as an active buffer, you just can't see it.
3. *inactive*
   The buffer is not displayed and does not contain anything. Options for the buffer are remembered if the file was once loaded. It can contain marks from the viminfo file. But the buffer doesn't contain text.

state    | displayed | loaded | :buffers shows
---------|-----------|--------|---------------
active   | yes       | yes    | 'a'
hidden   | no        | yes    | 'h'
inactive | no        | no     | ' '

>All `CTRL-W` commands can also be executed with `:wincmd`, for those places where a Normal mode command cannot be used or is inconvenient.

**window ID**    
Each window has a unique window identifier called the window ID. The window ID is valid across tabs. This identifier will not change within a Vim session. The `win_getid()` and `win_id2tabwin()` functions can be used to convert between the window/tab number and the identifier.

**window number**   
There is also the window number, which may change whenever windows are opened or closed, see `winnr()`. The window number is only valid in one specific tab.


**buffer name** and **buffer number**    
Each buffer has a unique number and the number will not change within a Vim session. The `bufnr()` and `bufname()` functions can be used to convert between a buffer name and the buffer number.

## 2. Starting Vim

By default, Vim starts with one window. The `-o` (hsplit) and `-O` (vsplit) args can be used to open a window for each file in the list.

Configure `winheight` and `winwidth` options.

*Buf/Win Enter/Leave* autocommands are not executed when opening the new windows and reading the files, that's only done when they are really entered.

If no highlighting is used for the status line ("sn"), the `^` is used for the current window, and `=` for other windows. If the mouse enabled, a status line can be dragged to resize it. Window borders also.

The lines after the last buffer line in a window are called *filler lines*. By default, these lines start with a tilde. The `eob` item in the `fillchars` option can be used to change this character. By default, these chars are highlighted as NonText (hl-NonText). The EndOfBuffer highlight group (hl-EndOfBuffer) can be used to change the highlighting of filler chars.

## 3. Opening and closing a window
https://vimhelp.org/windows.txt.html#opening-window

### Case of hotkeys

Window-related keys are prefixed with `c-w`. This is followed by an action-specific key (e.g. `v` for vsplit). These action-specific keys can be entered bare (just `v`) or as Ctrl combos (e.g. `c-v`). Moreover, both window-specific key (`w`) and action-specific keys may be typed lowercase or uppercase.

For example, the action-specific key `s` (vsplit) can be entered as:
- c-w s      c-W s
- c-w S      c-W S
- c-w c-s    c-W c-s
- c-w c-S    c-W c-S

### HSplit current window

The result is two viewports on the same file.
keys:
- <c-[wW]>[sS]        (w and s are case-insensitive)
- <c-[wW]><c-[sS]>
commands:
- :[N]sp[lit] [++opt] [+cmd] [file]
desc:
- [N]: Make new window [N] high (default: use half height of current window)
- [++opt]: see https://vimhelp.org/editing.txt.html#%2B%2Bopt
  Used to used to force the value of 'fileformat', 'fileencoding' or 'binary' to a value for one command, specify the behavior for bad characters…
- [+cmd] : see https://vimhelp.org/editing.txt.html#%2Bcmd
  Used to position the cursor in the newly opened file, or execute any other command…




### VSplit current window
- CTRL-W CTRL-V
- CTRL-W v
- :vs[plit]
- :[N]vs[plit] [++opt] [+cmd] [file]

Like :split, but vertically. The windows will be spread out horizontally if
1. width was not specified
2. `equalalways` is set
3. `eadirection` is not "ver"
4. one of the other windows is wider than the current or new window.

If [N] was given make the new window N columns wide, if possible.
>Note: In other places CTRL-Q does the same as CTRL-V, but here it doesn't!

### Create new window

Create a new window and start editing an empty file in it.
- c-n
:[N]new [++opt] [+cmd]

### Create new window with file
Create a new window and start editing file {file} in it.
- :[N]new [++opt] [+cmd] {file}
- :[N]sp[lit] [++opt] [+cmd] {file}

### Create new vsplit with file

- :[N]vne[w] [++opt] [+cmd] [file]    :vne :vnew
Like :new, but split vertically.

### Create new vsplit with file

- :[N]sv[iew] [++opt] [+cmd] [file]      :sv :sview splitview
Same as ":split", but set 'readonly' option for this buffer.

### Create new vsplit with file

- :[N]sf[ind] [++opt] [+cmd] {file}     :sf :sfi :sfind splitfind

Same as ":split", but search for {file} in 'path' like in :find. 
Doesn't split if {file} is not found.

### Create new vsplit with file

- CTRL-W CTRL-^
- CTRL-W ^

Split the current window in two and edit the alternate file. When a count N is given, split the current window and edit buffer N. Similar to ":sp #" and ":sp #N", but it allows the other buffer to be unnamed. This command matches the behavior of CTRL-^, except that it splits a window first.

### Create new vsplit with file

- `c-w :`
Does the same as typing `:`, i.e. enters command line. Useful in a terminal window, where all Vim commands must be preceded with c-w or `termwinkey`.


>`splitbelow` and `splitright` options influence where a (v)split appears.
