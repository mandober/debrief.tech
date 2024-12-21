readline


Event 			Sequence 	Description
<WheelDown> 		\e[62~ 	toward the user
<WheelUp> 			\e[63~ 	away from the user
<Shift><WheelDown> 	\e[64~ 	toward the user
<Shift><WheelUp> 		\e[65~ 	away from the user

# Makes PgUp, PgDn search history
"\e[5~": history-search-backward
"\e[6~": history-search-forward

"\e[B": history-search-forward
"\e[A": history-search-backward



;5A = up
;5B = down
;5C = ^f = move cursor right
;5D = ^b = move cursor left

C-d		Delete the character underneath the cursor

"\e[1;5C": forward-word		# Ctrl+Right = move forward by a word
"\e[1;5D": backward-word	# Ctrl+Left  = move backward by a word


C-_		Undo the last editing command
C-x C-u	Undo the last editing command
C-a		Move to the start of the line
C-e		Move to the end of the line

M-f    	Move forward a word, where a word is composed of letters and digits
M-b    	Move backward a word

C-l    	Clear the screen, reprinting the current line at the top


C-k    Kill the text from the current position to the end of the line.
M-d    Kill from the cursor to the end of the current word, or, if between words, to the end of the next word. Word boundaries are the same as those used by M-f.

M-DEL  Kill from the cursor the start of the current word, or, if between words, to the start of the previous word. Word boundaries are the same as those used by M-b.
C-w    Kill from the cursor to the previous whitespace. This is different than M-DEL because the word boundaries differ.

Here is how to yank the text back into the line. Yanking means to copy the most-recently-killed text from the kill buffer.
C-y    Yank the most recently killed text back into the buffer at the cursor.
M-y    Rotate the kill-ring, and yank the new top. You can only do this if the prior command is C-y or M-y. 









# Emacs Standard bindings
#              "C-@"  set-mark
#              "C-A"  beginning-of-line
#              "C-B"  backward-char
#              "C-D"  delete-char
#              "C-E"  end-of-line
#              "C-F"  forward-char
#              "C-G"  abort
#              "C-H"  backward-delete-char
#              "C-I"  complete
#              "C-J"  accept-line
#              "C-K"  kill-line
#              "C-L"  clear-screen
#              "C-M"  accept-line
#              "C-N"  next-history
#              "C-P"  previous-history
#              "C-Q"  quoted-insert
#              "C-R"  reverse-search-history
#              "C-S"  forward-search-history
#              "C-T"  transpose-chars
#              "C-U"  unix-line-discard
#              "C-V"  quoted-insert
#              "C-W"  unix-word-rubout
#              "C-Y"  yank
#              "C-]"  character-search
#              "C-_"  undo
#              " " to "/"  self-insert
#              "0"  to "9"  self-insert
#              ":"  to "~"  self-insert
#              "C-?"  backward-delete-char

# Emacs Meta bindings
#              "M-C-G"  abort
#              "M-C-H"  backward-kill-word
# 		         "M-C-I"  tab-insert
#              "M-C-J"  vi-editing-mode
#              "M-C-M"  vi-editing-mode
#              "M-C-R"  revert-line
#              "M-C-Y"  yank-nth-arg
#              "M-C-["  complete
#              "M-C-]"  character-search-backward
#              "M-space"  set-mark
#              "M-#"  insert-comment
#              "M-&"  tilde-expand
#              "M-*"  insert-completions
#              "M--"  digit-argument
#              "M-."  yank-last-arg
#              "M-0"  digit-argument
#              "M-1"  digit-argument
#              "M-2"  digit-argument
#              "M-3"  digit-argument
#              "M-4"  digit-argument
#              "M-5"  digit-argument
#              "M-6"  digit-argument
#              "M-7"  digit-argument
#              "M-8"  digit-argument
#              "M-9"  digit-argument
#              "M-<"  beginning-of-history
#              "M-="  possible-completions
#              "M->"  end-of-history
#              "M-?"  possible-completions
#              "M-B"  backward-word
#              "M-C"  capitalize-word
#              "M-D"  kill-word
#              "M-F"  forward-word
#              "M-L"  downcase-word
#              "M-N"  non-incremental-forward-search-history
#              "M-P"  non-incremental-reverse-search-history
#              "M-R"  revert-line
#              "M-T"  transpose-words
#              "M-U"  upcase-word
#              "M-Y"  yank-pop
#              "M-\"  delete-horizontal-space
#              "M-~"  tilde-expand
#              "M-C-?"  backward-kill-word
#              "M-_"  yank-last-arg

# Emacs Control-X bindings
#              "C-XC-G"  abort
#              "C-XC-R"  re-read-init-file
#              "C-XC-U"  undo
#              "C-XC-X"  exchange-point-and-mark
#              "C-X("    start-kbd-macro
#              "C-X)"    end-kbd-macro
#              "C-XE"    call-last-kbd-macro
#              "C-XC-?"  backward-kill-line





# VI Mode bindings

# VI Insert Mode functions
#              "C-D"  vi-eof-maybe
#              "C-H"  backward-delete-char
#              "C-I"  complete
#              "C-J"  accept-line
#              "C-M"  accept-line
#              "C-R"  reverse-search-history
#              "C-S"  forward-search-history
#              "C-T"  transpose-chars
#              "C-U"  unix-line-discard
#              "C-V"  quoted-insert
#              "C-W"  unix-word-rubout
#              "C-Y"  yank
#              "C-["  vi-movement-mode
#              "C-_"  undo
#              " " to "~"  self-insert
#              "C-?"  backward-delete-char

# VI Command Mode functions
#               "C-D"  vi-eof-maybe
#              "C-E"  emacs-editing-mode
#              "C-G"  abort
#              "C-H"  backward-char
#              "C-J"  accept-line
#              "C-K"  kill-line
#              "C-L"  clear-screen
#              "C-M"  accept-line
#              "C-N"  next-history
#              "C-P"  previous-history
#              "C-Q"  quoted-insert
#              "C-R"  reverse-search-history
#              "C-S"  forward-search-history
#              "C-T"  transpose-chars
#              "C-U"  unix-line-discard
#              "C-V"  quoted-insert
#              "C-W"  unix-word-rubout
#              "C-Y"  yank
#              "C-_"  vi-undo
#              " "  forward-char
#              "#"  insert-comment
#              "$"  end-of-line
#              "%"  vi-match
#              "&"  vi-tilde-expand
#              "*"  vi-complete
#              "+"  next-history
#              ","  vi-char-search
#              "-"  previous-history
#              "."  vi-redo
#              "/"  vi-search
#              "0"  beginning-of-line
#              "1" to "9"  vi-arg-digit
#              ";"  vi-char-search
#              "="  vi-complete
#              "?"  vi-search
#              "A"  vi-append-eol
#              "B"  vi-prev-word
#              "C"  vi-change-to
#              "D"  vi-delete-to
#              "E"  vi-end-word
#              "F"  vi-char-search
#              "G"  vi-fetch-history
#              "I"  vi-insert-beg
#              "N"  vi-search-again
#              "P"  vi-put
#              "R"  vi-replace
#              "S"  vi-subst
#              "T"  vi-char-search
#              "U"  revert-line
#              "W"  vi-next-word
#              "X"  backward-delete-char
#              "Y"  vi-yank-to
#              "\"  vi-complete
#              "^"  vi-first-print
#              "_"  vi-yank-arg
#              "`"  vi-goto-mark
#              "a"  vi-append-mode
#              "b"  vi-prev-word
#              "c"  vi-change-to
#              "d"  vi-delete-to
#              "e"  vi-end-word
#              "f"  vi-char-search
#              "h"  backward-char
#              "i"  vi-insertion-mode
#              "j"  next-history
#              "k"  prev-history
#              "l"  forward-char
#              "m"  vi-set-mark
#              "n"  vi-search-again
#              "p"  vi-put
#              "r"  vi-change-char
#              "s"  vi-subst
#              "t"  vi-char-search
#              "u"  vi-undo
#              "w"  vi-next-word
#              "x"  vi-delete
#              "t"  vi-char-search
#              "u"  vi-undo
#              "w"  vi-next-word
#              "x"  vi-delete
#              "y"  vi-yank-to
#              "|"  vi-column
#              "~"  vi-change-case





