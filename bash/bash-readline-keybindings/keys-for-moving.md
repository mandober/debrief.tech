# Bash :: Readline :: Commands for Moving


- `C-a` beginning-of-line
- `C-e` end-of-line

- `C-f` forward-char
- `C-b` backward-char

- `M-f` forward-word
- `M-b` backward-word        Move back to start of current or previous word

-       shell-forward-word   Move forward to end of next WORD
-       shell-backward-word  Move back to start of current or previous WORD

- `C-l` clear-screen
-       redraw-current-line


Notes:
- *words* are composed of alphanumeric characters (letters and digits)
- *WORDS* are delimited by non-quoted shell metacharacters


- previous-screen-line ()
Attempt to move point to the same physical screen column on the previous physical screen line. This will not have the desired effect if the current Readline line does not take up more than one physical line or if point is not greater than the length of the prompt plus the screen width.

- next-screen-line ()
Attempt to move point to the same physical screen column on the next physical screen line. This will not have the desired effect if the current Readline line does not take up more than one physical line or if the length of the current Readline line is not greater than the length of the prompt plus the screen width.


- clear-display (M-C-l)
Clear the screen and, if possible, the terminal's scrollback buffer, then redraw the current line, leaving the current line at the top of the screen.

- clear-screen (C-l)
Clear the screen, then redraw the current line, leaving the current line at the top of the screen.

- redraw-current-line ()
Refresh the current line. By default, this is unbound.
