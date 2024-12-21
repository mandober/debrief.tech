# Vim Commands Cheat Sheet

## Exiting
- :q                    Quit Vim (unless buffer dirty)
- :q!                   Quit without writing
- :cq                   Quit forcefully without writing
- :wq                   Write the current file and exit
- :wq!                  Write the current file and force exit
- :wq {file}            Write to {file}. Exit if not editing the last
- :wq! {file}           Write to {file} and exit always
- :[range]wq[!] [file]  Same as above, but only write the [range]
- ZZ                    Write current file, if modified, then quit
- ZQ                    Quit current file and exit (same as `:q!`)

## Editing
- `gf`        Edit the file under or after cursor Mnemonic: GOTO FILE
- :e  {file}  Edit {file}
- :e! {file}  Edit {file} always. Discard any changes to the current buffer
- :e          Edit current file. Re-edit file when changed externally
- :e!         Edit current file always. Discard changes to buffer and start over

## Insert text
- i   Insert text before cursor; [count] times
- I   Insert text before true BOL; [count] times
- a   Append text after the cursor; [count] times
- A   Append text at EOL; [count] times
- gI  Insert text in column 1; [count] times
- o   Open new line after cursor and insert; repeat [count] times
- O   Open new line before cursor and insert; repeat [count] times

## Insert file/cmd contents
- `:r {name}` Insert the file {name} below the cursor
- `:r !{cmd}` Execute {cmd} and insert its stdout below cursor
- `"=:scriptnames<CR>p` In normal mode
- `"=strftime('%c')<C-M>p` In normal mode
- `<C-R>={cmd}<C-M>` In insert mode
- `<C-R>=strftime('%c')<C-M>` In insert mode

## Deleting
- x         Delete [count] chars under and after cursor
- X         Delete [count] chars before cursor
- d{motion} Delete text that {motion} moves over
- dd        Delete [count] lines
- D         Delete chars under the cursor until EOL

- {Visual}x or {Visual}d      Delete the highlighted text (for {Visual} see Selecting Text)
- {Visual}CTRL-H or {Visual}  When in Select mode: Delete the highlighted text
- {Visual}X or {Visual}D      Delete the highlighted lines

- :[range]d            Delete [range] lines (default: current line)
- :[range]d {count}    Delete {count} lines, starting with [range]

## Change and replace

- `r{char}`   Replace char under cursor with {char}
- `R Enter`   Insert mode with overwrite
- `~`         Switch case of the char under the cursor and move the cursor to the right. If a [count] is given, do that many characters.
- `~{motion}` Switch case of {motion} text.
- `{Visual}~` Switch case of highlighted text

## Substituting
:[range]s[ubstitute]/{pattern}/{string}/[c][e][g][p][r][i][I] [count] For each line in [range] replace a match of {pattern} with {string}.

:[range]s[ubstitute] [c][e][g][r][i][I] [count] :[range]&[c][e][g][r][i][I] [count] Repeat last :substitute with same search pattern and substitute string, but without the same flags. You may add extra flags

The arguments that you can use for the substitute commands:
[c]  Confirm each substitution.  Vim positions the cursor on the matching
  string.  You can type:
      'y'      to substitute this match
      'n'      to skip this match
         to skip this match
      'a'      to substitute this and all remaining matches {not in Vi}
      'q'      to quit substituting {not in Vi}
      CTRL-E  to scroll the screen up {not in Vi}
      CTRL-Y  to scroll the screen down {not in Vi}.
[e]     When the search pattern fails, do not issue an error message and, in
  particular, continue in maps as if no error occurred.
[g]  Replace all occurrences in the line.  Without this argument,
  replacement occurs only for the first occurrence in each line.
[i]  Ignore case for the pattern.
[I]  Don't ignore case for the pattern.
[p]  Print the line containing the last substitute.


## Copy and Move

"{a-zA-Z0-9.%#:-"} Use register {a-zA-Z0-9.%#:-"} for next delete, yank or put (use uppercase character to append with delete and yank) ({.%#:} only work with put).

:reg[isters] Display the contents of all numbered and named registers.

:reg[isters] {arg} Display the contents of the numbered and named registers that are mentioned in {arg}.

:di[splay] [arg] Same as :registers.

["x]y{motion} Yank {motion} text [into register x].

["x]yy Yank [count] lines [into register x]

["x]Y yank [count] lines [into register x] (synonym for yy).

{Visual}["x]y Yank the highlighted text [into register x] (for {Visual} see Selecting Text).

{Visual}["x]Y Yank the highlighted lines [into register x]

:[range]y[ank] [x] Yank [range] lines [into register x].

:[range]y[ank] [x] {count} Yank {count} lines, starting with last line number in [range] (default: current line), [into register x].

["x]p Put the text [from register x] after the cursor [count] times.

["x]P Put the text [from register x] before the cursor [count] times.

["x]gp Just like "p", but leave the cursor just after the new text.

["x]gP Just like "P", but leave the cursor just after the new text.

:[line]pu[t] [x] Put the text [from register x] after [line] (default current line).

:[line]pu[t]! [x] Put the text [from register x] before [line] (default current line).

## Undo/Redo/Repeat
u Undo [count] changes.

:u[ndo] Undo one change.

CTRL-R Redo [count] changes which were undone.

:red[o] Redo one change which was undone.

U Undo all latest changes on one line. {Vi: while not moved off of it}

. Repeat last change, with count replaced with [count].

## Moving

Basic motion commands:

        k
      h   l
        j
h or

[count] characters to the left (exclusive).

l or or

[count] characters to the right (exclusive).

k or or CTRL-P [count] lines upward

j or or CTRL-J or or CTRL-N [count] lines downward (linewise).

0 To the first character of the line (exclusive).

To the first character of the line (exclusive).

^ To the first non-blank character of the line

$ or

To the end of the line and [count - 1] lines downward

g0 or g When lines wrap ('wrap on): To the first character of the screen line (exclusive). Differs from "0" when a line is wider than the screen. When lines don't wrap ('wrap' off): To the leftmost character of the current line that is on the screen. Differs from "0" when the first character of the line is not on the screen.

g^ When lines wrap ('wrap' on): To the first non-blank character of the screen line (exclusive). Differs from "^" when a line is wider than the screen. When lines don't wrap ('wrap' off): To the leftmost non-blank character of the current line that is on the screen. Differs from "^" when the first non-blank character of the line is not on the screen.

g$ or g shift right

v start Visual mode per character.

V start Visual mode linewise.

exit Visual mode without making any changes

## Suspend vim

`c-z` Suspend Vim, like `:stop`. Works in Normal and Visual mode. In Insert and Ex mode, `c-z` is inserted as a normal character.

:sus[pend][!] or :st[op][!] Suspend Vim. If the '!' is not given and 'autowrite' is set, every buffer with changes and a file name is written out. If the '!' is given or 'autowrite' is not set, changed buffers are not written, don't forget to bring Vim back to the foreground later!
