


Emacs Standard bindings


CTRL + key
VI Insert Mode functions
"C-a"  beginning-of-line
"C-b"  backward-char
"C-c"  stty: intr, INT signal
"C-d"  delete-char, stty: EOF
"C-e"  end-of-line
"C-f"  forward-char
"C-g"  abort
"C-h"  backward-delete-char
"C-i"  complete
"C-j"  accept-line (LF  LFD  LINE-FEED  NL)
"C-k"  kill-line, stty: kill
"C-l"  clear-screen
"C-m"  accept-line (CR  RET  RETURN  ENTER)
"C-n"  next-history
"C-o"  operate-and-get-next (stty: discard)
"C-p"  previous-history
"C-q"  quoted-insert (stty: start)
"C-r"  reverse-search-history (stty: rprnt)
"C-s"  forward-search-history (stty: stop)
"C-t"  transpose-chars
"C-u"  unix-line-discard
"C-v"  quoted-insert (stty: lnext)
"C-w"  unix-word-rubout (stty: werase)
"C-x"  <keyseq intro key>
"C-y"  yank
"C-z"  stty: susp
"C-@"  set-mark
"C-]"  character-search, stty: QUIT signal
"C-_"  undo
"C-?"  backward-delete-char, stty: erase

CTRL + Meta + key
"M-C-G"  abort
"M-C-H"  backward-kill-word
"M-C-I"  tab-insert
"M-C-J"  vi-editing-mode
"M-C-M"  vi-editing-mode
"M-C-R"  revert-line
"M-C-Y"  yank-nth-arg
"M-C-["  complete
"M-C-]"  character-search-backward
"M-C-?"  backward-kill-word

CTRL + X + CTRL + key
"C-XC-G"  abort
"C-XC-R"  re-read-init-file
"C-XC-U"  undo
"C-XC-X"  exchange-point-and-mark
"C-XC-?"  backward-kill-line

CTRL + X + key
"\C-x(": start-kbd-macro
"\C-x)": end-kbd-macro
"\C-xe": call-last-kbd-macro
"\C-xg": glob-list-expansions
"\C-x/": possible-filename-completions
"\C-x~": possible-username-completions
"\C-x!": possible-command-completions
"\C-x@": possible-hostname-completions
"\C-x$": possible-variable-completions
"\C-x*": glob-expand-word

Meta + key
"M-B"  backward-word
"M-C"  capitalize-word
"M-D"  kill-word
"M-F"  forward-word
"M-L"  downcase-word
"M-N"  non-incremental-forward-search-history
"M-P"  non-incremental-reverse-search-history
"M-R"  revert-line
"M-T"  transpose-words
"M-U"  upcase-word
"M-Y"  yank-pop

"M-#"  insert-comment
"M-&"  tilde-expand
"M-*"  insert-completions
"M--"  digit-argument
"M-."  yank-last-arg
"M-<"  beginning-of-history
"M->"  end-of-history
"M-="  possible-completions
"M-?"  possible-completions
"M-\"  delete-horizontal-space
"M-~"  tilde-expand
"M-_"  yank-last-arg
"M-space"  set-mark

"M-0"  digit-argument
"M-1"  digit-argument
"M-2"  digit-argument
"M-3"  digit-argument
"M-4"  digit-argument
"M-5"  digit-argument
"M-6"  digit-argument
"M-7"  digit-argument
"M-8"  digit-argument
"M-9"  digit-argument

self-insert
" " to "/"  self-insert
"0"  to "9"  self-insert
":"  to "~"  self-insert


"C-D"  delete-char vi-eof-maybe
"C-H"  backward-delete-char
"C-I"  complete
"C-J"  accept-line
"C-M"  accept-line
"C-R"  reverse-search-history
"C-S"  forward-search-history
"C-T"  transpose-chars
"C-U"  unix-line-discard
"C-V"  quoted-insert
"C-W"  unix-word-rubout
"C-Y"  yank

"C-["  vi-movement-mode
"C-_"  undo
"C-?"  backward-delete-char
" " to "~"  self-insert



## VI Command Mode functions

 "C-D"  vi-eof-maybe
             "C-E"  emacs-editing-mode
             "C-G"  abort
             "C-H"  backward-char
             "C-J"  accept-line
             "C-K"  kill-line
             "C-L"  clear-screen
             "C-M"  accept-line
             "C-N"  next-history
             "C-P"  previous-history
             "C-Q"  quoted-insert
             "C-R"  reverse-search-history
             "C-S"  forward-search-history
             "C-T"  transpose-chars
             "C-U"  unix-line-discard
             "C-V"  quoted-insert
             "C-W"  unix-word-rubout
             "C-Y"  yank
             "C-_"  vi-undo
             " "  forward-char
             "#"  insert-comment
             "$"  end-of-line
             "%"  vi-match
             "&"  vi-tilde-expand
             "*"  vi-complete
             "+"  next-history
             ","  vi-char-search
             "-"  previous-history
             "."  vi-redo
             "/"  vi-search
             "0"  beginning-of-line
             "1" to "9"  vi-arg-digit
             ";"  vi-char-search
             "="  vi-complete
             "?"  vi-search
             "A"  vi-append-eol
             "B"  vi-prev-word
             "C"  vi-change-to
             "D"  vi-delete-to
             "E"  vi-end-word
             "F"  vi-char-search
             "G"  vi-fetch-history
             "I"  vi-insert-beg
             "N"  vi-search-again
             "P"  vi-put
             "R"  vi-replace
             "S"  vi-subst
             "T"  vi-char-search
             "U"  revert-line
             "W"  vi-next-word
             "X"  backward-delete-char
             "Y"  vi-yank-to
             "\"  vi-complete
             "^"  vi-first-print
             "_"  vi-yank-arg
             "`"  vi-goto-mark
             "a"  vi-append-mode
             "b"  vi-prev-word
             "c"  vi-change-to
             "d"  vi-delete-to
             "e"  vi-end-word
             "f"  vi-char-search
             "h"  backward-char
             "i"  vi-insertion-mode
             "j"  next-history
             "k"  prev-history
             "l"  forward-char
             "m"  vi-set-mark
             "n"  vi-search-again
             "p"  vi-put
             "r"  vi-change-char
             "s"  vi-subst
             "t"  vi-char-search
             "u"  vi-undo
             "w"  vi-next-word
             "x"  vi-delete
             "t"  vi-char-search
             "u"  vi-undo
             "w"  vi-next-word
             "x"  vi-delete
             "y"  vi-yank-to
             "|"  vi-column
             "~"  vi-change-case


Emacs Standard bindings
             "C-@"  set-mark
             "C-A"  beginning-of-line
             "C-B"  backward-char
             "C-D"  delete-char
             "C-E"  end-of-line
             "C-F"  forward-char
             "C-G"  abort
             "C-H"  backward-delete-char
             "C-I"  complete
             "C-J"  accept-line
             "C-K"  kill-line
             "C-L"  clear-screen
             "C-M"  accept-line
             "C-N"  next-history
             "C-P"  previous-history
             "C-Q"  quoted-insert
             "C-R"  reverse-search-history
             "C-S"  forward-search-history
             "C-T"  transpose-chars
             "C-U"  unix-line-discard
             "C-V"  quoted-insert
             "C-W"  unix-word-rubout
             "C-Y"  yank
             "C-]"  character-search
             "C-_"  undo
             " " to "/"  self-insert
             "0"  to "9"  self-insert
             ":"  to "~"  self-insert
             "C-?"  backward-delete-char

Emacs Meta bindings
             "M-C-G"  abort
             "M-C-H"  backward-kill-word
		  "M-C-I"  tab-insert
             "M-C-J"  vi-editing-mode
             "M-C-M"  vi-editing-mode
             "M-C-R"  revert-line
             "M-C-Y"  yank-nth-arg
             "M-C-["  complete
             "M-C-]"  character-search-backward
             "M-space"  set-mark
             "M-#"  insert-comment
             "M-&"  tilde-expand
             "M-*"  insert-completions
             "M--"  digit-argument
             "M-."  yank-last-arg
             "M-0"  digit-argument
             "M-1"  digit-argument
             "M-2"  digit-argument
             "M-3"  digit-argument
             "M-4"  digit-argument
             "M-5"  digit-argument
             "M-6"  digit-argument
             "M-7"  digit-argument
             "M-8"  digit-argument
             "M-9"  digit-argument
             "M-<"  beginning-of-history
             "M-="  possible-completions
             "M->"  end-of-history
             "M-?"  possible-completions
             "M-B"  backward-word
             "M-C"  capitalize-word
             "M-D"  kill-word
             "M-F"  forward-word
             "M-L"  downcase-word
             "M-N"  non-incremental-forward-search-history
             "M-P"  non-incremental-reverse-search-history
             "M-R"  revert-line
             "M-T"  transpose-words
             "M-U"  upcase-word
             "M-Y"  yank-pop
             "M-\"  delete-horizontal-space
             "M-~"  tilde-expand
             "M-C-?"  backward-kill-word
             "M-_"  yank-last-arg

Emacs Control-X bindings
             "C-xC-G"  abort
             "C-xC-R"  re-read-init-file
             "C-xC-U"  undo
             "C-xC-X"  exchange-point-and-mark
             "C-x("    start-kbd-macro
             "C-x)"    end-kbd-macro
             "C-xE"    call-last-kbd-macro
             "C-xC-?"  backward-kill-line


VI Mode bindings

VI Insert Mode functions
             "C-D"  vi-eof-maybe
             "C-H"  backward-delete-char
             "C-I"  complete
             "C-J"  accept-line
             "C-M"  accept-line
             "C-R"  reverse-search-history
             "C-S"  forward-search-history
             "C-T"  transpose-chars
             "C-U"  unix-line-discard
             "C-V"  quoted-insert
             "C-W"  unix-word-rubout
             "C-Y"  yank
             "C-["  vi-movement-mode
             "C-_"  undo
             " " to "~"  self-insert
             "C-?"  backward-delete-char

VI Command Mode functions
              "C-D"  vi-eof-maybe
             "C-E"  emacs-editing-mode
             "C-G"  abort
             "C-H"  backward-char
             "C-J"  accept-line
             "C-K"  kill-line
             "C-L"  clear-screen
             "C-M"  accept-line
             "C-N"  next-history
             "C-P"  previous-history
             "C-Q"  quoted-insert
             "C-R"  reverse-search-history
             "C-S"  forward-search-history
             "C-T"  transpose-chars
             "C-U"  unix-line-discard
             "C-V"  quoted-insert
             "C-W"  unix-word-rubout
             "C-Y"  yank
             "C-_"  vi-undo
             " "  forward-char
             "#"  insert-comment
             "$"  end-of-line
             "%"  vi-match
             "&"  vi-tilde-expand
             "*"  vi-complete
             "+"  next-history
             ","  vi-char-search
             "-"  previous-history
             "."  vi-redo
             "/"  vi-search
             "0"  beginning-of-line
             "1" to "9"  vi-arg-digit
             ";"  vi-char-search
             "="  vi-complete
             "?"  vi-search
             "A"  vi-append-eol
             "B"  vi-prev-word
             "C"  vi-change-to
             "D"  vi-delete-to
             "E"  vi-end-word
             "F"  vi-char-search
             "G"  vi-fetch-history
             "I"  vi-insert-beg
             "N"  vi-search-again
             "P"  vi-put
             "R"  vi-replace
             "S"  vi-subst
             "T"  vi-char-search
             "U"  revert-line
             "W"  vi-next-word
             "X"  backward-delete-char
             "Y"  vi-yank-to
             "\"  vi-complete
             "^"  vi-first-print
             "_"  vi-yank-arg
             "`"  vi-goto-mark
             "a"  vi-append-mode
             "b"  vi-prev-word
             "c"  vi-change-to
             "d"  vi-delete-to
             "e"  vi-end-word
             "f"  vi-char-search
             "h"  backward-char
             "i"  vi-insertion-mode
             "j"  next-history
             "k"  prev-history
             "l"  forward-char
             "m"  vi-set-mark
             "n"  vi-search-again
             "p"  vi-put
             "r"  vi-change-char
             "s"  vi-subst
             "t"  vi-char-search
             "u"  vi-undo
             "w"  vi-next-word
             "x"  vi-delete
             "t"  vi-char-search
             "u"  vi-undo
             "w"  vi-next-word
             "x"  vi-delete
             "y"  vi-yank-to
             "|"  vi-column
             "~"  vi-change-case
