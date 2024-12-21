# Emacs Standard bindings

```bash
bind -p

"\C-g"    : abort
"\C-x\C-g": abort
"\e\C-g"  : abort

"\C-j": accept-line
"\C-m": accept-line

# alias-expand-line (not bound)
# arrow-key-prefix (not bound)
# backward-byte (not bound)

"\C-b": backward-char
"\eOD": backward-char
"\e[D": backward-char # ^[[D

"\C-h": backward-delete-char
"\C-?": backward-delete-char

"\C-x\C-?": backward-kill-line

"\e\C-h": backward-kill-word
"\e\C-?": backward-kill-word

"\e[1;3D": backward-word
"\e[1;5D": backward-word

"\eb": backward-word

"\e<": beginning-of-history

"\C-a": beginning-of-line
"\eOH": beginning-of-line
"\e[H": beginning-of-line

"\e[200~": bracketed-paste-begin
"\C-xe": call-last-kbd-macro
"\ec": capitalize-word
"\C-]": character-search
"\e\C-]": character-search-backward
"\e\C-l": clear-display
"\C-l": clear-screen

"\e\e": complete
"\e!": complete-command
"\e/": complete-filename
"\e@": complete-hostname
"\e{": complete-into-braces
"\e~": complete-username
"\e$": complete-variable
# copy-backward-word (not bound)
# copy-forward-word (not bound)
# copy-region-as-kill (not bound)
# dabbrev-expand (not bound)

"\C-d" : delete-char
"\e[3~": delete-char

# delete-char-or-list (not bound)
"\e\\": delete-horizontal-space

"\e-": digit-argument
"\e0": digit-argument
"\e1": digit-argument
"\e2": digit-argument
"\e3": digit-argument
"\e4": digit-argument
"\e5": digit-argument
"\e6": digit-argument
"\e7": digit-argument
"\e8": digit-argument
"\e9": digit-argument

"\C-x\C-v": display-shell-version

"\el": downcase-word
# dump-functions (not bound)
# dump-macros (not bound)
# dump-variables (not bound)
"\e\C-i": dynamic-complete-history
"\C-x\C-e": edit-and-execute-command
# emacs-editing-mode (not bound)
"\C-x)": end-kbd-macro
"\e>"  : end-of-history

"\C-e": end-of-line
"\eOF": end-of-line
"\e[F": end-of-line

"\C-x\C-x": exchange-point-and-mark
# forward-backward-delete-char (not bound)
# forward-byte (not bound)

"\C-f": forward-char
"\eOC": forward-char
"\e[C": forward-char

"\C-s": forward-search-history

"\e[1;3C": forward-word
"\e[1;5C": forward-word
"\ef"    : forward-word

"\eg"  : glob-complete-word
"\C-x*": glob-expand-word
"\C-xg": glob-list-expansions
# history-and-alias-expand-line (not bound)
"\e^" : history-expand-line
"\e[A": history-search-backward
"\e[B": history-search-forward
# history-substring-search-backward (not bound)
# history-substring-search-forward (not bound)
"\e#": insert-comment
"\e*": insert-completions

"\e.": insert-last-argument
"\e_": insert-last-argument

"\C-k": kill-line
# kill-region (not bound)
# kill-whole-line (not bound)

"\e[3;5~": kill-word
"\ed"    : kill-word

# magic-space (not bound)
"\C-i": menu-complete
"\e[Z": menu-complete-backward

"\C-n": next-history
"\eOB": next-history

# next-screen-line (not bound)

"\en": non-incremental-forward-search-history
# non-incremental-forward-search-history-again (not bound)
"\ep": non-incremental-reverse-search-history
# non-incremental-reverse-search-history-again (not bound)

# old-menu-complete (not bound)

"\C-o": operate-and-get-next

"\e[2~": overwrite-mode


"\e=": possible-completions
"\e?": possible-completions

"\C-x!": possible-command-completions
"\C-x/": possible-filename-completions
"\C-x@": possible-hostname-completions
"\C-x~": possible-username-completions
"\C-x$": possible-variable-completions

"\C-p": previous-history
"\eOA": previous-history

# previous-screen-line (not bound)
# print-last-kbd-macro (not bound)

"\C-q": quoted-insert
"\C-v": quoted-insert

"\C-x\C-r": re-read-init-file

# redraw-current-line (not bound)
"\C-r": reverse-search-history

"\e\C-r": revert-line
"\er": revert-line

"\C-@": set-mark
"\e " : set-mark

"\e\C-b": shell-backward-word
# shell-backward-kill-word (not bound)
"\e\C-f": shell-forward-word
"\e\C-d": shell-kill-word
"\e\C-e": shell-expand-line
"\e\C-t": shell-transpose-words

# skip-csi-sequence (not bound)
"\C-x(": start-kbd-macro
# tab-insert (not bound)
"\e&": tilde-expand
"\C-t": transpose-chars
"\et": transpose-words
# tty-status (not bound)

"\C-x\C-u": undo
"\C-_": undo

# universal-argument (not bound)
# unix-filename-rubout (not bound)
"\C-u": unix-line-discard
"\C-w": unix-word-rubout

"\eu": upcase-word
"\C-y": yank

"\e.": yank-last-arg
"\e_": yank-last-arg

"\e\C-y": yank-nth-arg
"\ey": yank-pop
```


self-insert
" "  to "/"  self-insert
"0"  to "9"  self-insert
":"  to "~"  self-insert
" "  to "~"  self-insert


## vi command mode functions

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


### Emacs Standard bindings

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

### Emacs Meta bindings

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

### Emacs Control-X bindings
"C-xC-G"  abort
"C-xC-R"  re-read-init-file
"C-xC-U"  undo
"C-xC-X"  exchange-point-and-mark
"C-x("    start-kbd-macro
"C-x)"    end-kbd-macro
"C-xE"    call-last-kbd-macro
"C-xC-?"  backward-kill-line


## vi mode bindings

### vi insert mode functions

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

### vi command mode functions

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
