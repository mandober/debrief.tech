# Emacs Standard bindings for CTRL+KEY

C-{letter} is all taken by default

"C-a"  beginning-of-line
"C-b"  backward-char
"C-c"  (`stty`: intr)
"C-d"  delete-char (`stty` EOF)
"C-e"  end-of-line
"C-f"  forward-char
"C-g"  abort
"C-h"  backward-delete-char
"C-i"  complete
"C-j"  accept-line (LF LFD LINEFEED NL)
"C-k"  kill-line (`stty`: kill)
"C-l"  clear-screen
"C-m"  accept-line (CR RET RETURN ENTER)
"C-n"  next-history
"C-o"  operate-and-get-next (`stty`: discard)
"C-p"  previous-history
"C-q"  quoted-insert (`stty`: start)
"C-r"  reverse-search-history (`stty`: rprnt)
"C-s"  forward-search-history (`stty`: stop)
"C-t"  transpose-chars
"C-u"  unix-line-discard
"C-v"  quoted-insert (`stty`: lnext)
"C-w"  unix-word-rubout (`stty`: werase)
"C-x"  (keyseq leader key)
"C-y"  yank
"C-z"  (`stty`: susp)

"C-@"  set-mark
"C-]"  character-search, stty: QUIT signal
"C-_"  undo [backward-kill-word]
"C-?"  backward-delete-char, stty: erase
