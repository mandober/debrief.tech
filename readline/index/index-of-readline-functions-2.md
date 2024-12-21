# Readline :: Function names

`bind -l` List names of functions
`bind -P` List function names and bindings
`bind -p` List functions and bindings in the reusable format

`bind -q FNAME` Query about which keys invoke function FNAME.
`bind -u FNAME` Unbind all keys which are bound to function FNAME.


## List function names and bindings

```bash
$ bind -P

# history
history-search-backward can be found on "\e[A".
history-search-forward can be found on "\e[B".
dynamic-complete-history can be found on "\e\C-i".
forward-search-history can be found on "\C-s".
history-expand-line can be found on "\e^".
history-and-alias-expand-line is not bound to any keys
history-substring-search-backward is not bound to any keys
history-substring-search-forward is not bound to any keys
next-screen-line is not bound to any keys
non-incremental-forward-search-history can be found on "\en".
non-incremental-reverse-search-history can be found on "\ep".
non-incremental-forward-search-history-again is not bound to any keys
non-incremental-reverse-search-history-again is not bound to any keys
next-history can be found on "\C-n", "\eOB".
previous-history can be found on "\C-p", "\eOA"
reverse-search-history can be found on "\C-r"
beginning-of-history can be found on "\e<"
end-of-history can be found on "\e>"

# complete
complete can be found on "\e\e".
complete-command can be found on "\e!".
complete-filename can be found on "\e/".
complete-hostname can be found on "\e@".
complete-into-braces can be found on "\e{".
complete-username can be found on "\e~".
complete-variable can be found on "\e$".
possible-completions can be found on "\e=", "\e?".
possible-command-completions can be found on "\C-x!".
possible-filename-completions can be found on "\C-x/".
possible-hostname-completions can be found on "\C-x@".
possible-username-completions can be found on "\C-x~".
possible-variable-completions can be found on "\C-x$".
insert-completions can be found on "\e*".
menu-complete can be found on "\C-i".
menu-complete-backward can be found on "\e[Z".
old-menu-complete is not bound to any keys
glob-complete-word can be found on "\eg".

abort can be found on "\C-g", "\C-x\C-g", "\e\C-g".
accept-line can be found on "\C-j", "\C-m".
alias-expand-line is not bound to any keys
arrow-key-prefix is not bound to any keys
backward-byte is not bound to any keys
backward-char can be found on "\C-b", "\eOD", "\e[D".
backward-delete-char can be found on "\C-h", "\C-?".
backward-kill-line can be found on "\C-x\C-?".
backward-kill-word can be found on "\e\C-h", "\e\C-?".
backward-word can be found on "\e[1;3D", "\e[1;5D", "\eb".
beginning-of-line can be found on "\C-a", "\eOH", "\e[H".
bracketed-paste-begin can be found on "\e[200~".
call-last-kbd-macro can be found on "\C-xe".
capitalize-word can be found on "\ec".
character-search can be found on "\C-]".
character-search-backward can be found on "\e\C-]".
clear-display can be found on "\e\C-l".
clear-screen can be found on "\C-l".
copy-backward-word is not bound to any keys
copy-forward-word is not bound to any keys
copy-region-as-kill is not bound to any keys
dabbrev-expand is not bound to any keys
delete-char can be found on "\C-d", "\e[3~".
delete-char-or-list is not bound to any keys
delete-horizontal-space can be found on "\e\\".
digit-argument can be found on "\e-", "\e0", "\e1", "\e2", "\e3", ...
display-shell-version can be found on "\C-x\C-v".
downcase-word can be found on "\el".
do-lowercase-version can be found on "\C-xA", "\C-xB", "\C-xC", "\C-xD", "\C-xE", ...
dump-functions is not bound to any keys
dump-macros    is not bound to any keys
dump-variables is not bound to any keys
edit-and-execute-command can be found on "\C-x\C-e".
emacs-editing-mode is not bound to any keys
end-kbd-macro can be found on "\C-x)".
end-of-line can be found on "\C-e", "\eOF", "\e[F".
exchange-point-and-mark can be found on "\C-x\C-x".
forward-backward-delete-char is not bound to any keys
forward-byte is not bound to any keys
forward-char can be found on "\C-f", "\eOC", "\e[C".
forward-word can be found on "\e[1;3C", "\e[1;5C", "\ef".
glob-expand-word can be found on "\C-x*".
glob-list-expansions can be found on "\C-xg".
insert-comment can be found on "\e#".
insert-last-argument can be found on "\e.", "\e_".
kill-line can be found on "\C-k".
kill-region is not bound to any keys
kill-whole-line is not bound to any keys
kill-word can be found on "\e[3;5~", "\ed".
magic-space is not bound to any keys
operate-and-get-next can be found on "\C-o".
overwrite-mode can be found on "\e[2~".
previous-screen-line is not bound to any keys
print-last-kbd-macro is not bound to any keys
quoted-insert can be found on "\C-q", "\C-v".
re-read-init-file can be found on "\C-x\C-r", "\C-xr".
redraw-current-line is not bound to any keys
revert-line can be found on "\e\C-r", "\er".
self-insert can be found on " ", "!", "\"", "#", "$", ...
set-mark can be found on "\C-@", "\e ".
shell-backward-kill-word is not bound to any keys
shell-backward-word can be found on "\e\C-b".
shell-expand-line can be found on "\e\C-e".
shell-forward-word can be found on "\e\C-f".
shell-kill-word can be found on "\e\C-d".
shell-transpose-words can be found on "\e\C-t".
skip-csi-sequence is not bound to any keys
start-kbd-macro can be found on "\C-x(".
tab-insert is not bound to any keys
tilde-expand can be found on "\e&".
transpose-chars can be found on "\C-t".
transpose-words can be found on "\et".
tty-status is not bound to any keys
undo can be found on "\C-x\C-u", "\C-_".
universal-argument is not bound to any keys
unix-filename-rubout is not bound to any keys
unix-line-discard can be found on "\C-u".
unix-word-rubout can be found on "\C-w".
upcase-word can be found on "\eu".
yank can be found on "\C-y".
yank-last-arg can be found on "\e.", "\e_".
yank-nth-arg can be found on "\e\C-y".
yank-pop can be found on "\ey".



vi-append-eol is not bound to any keys
vi-append-mode is not bound to any keys
vi-arg-digit is not bound to any keys
vi-bWord is not bound to any keys
vi-back-to-indent is not bound to any keys
vi-backward-bigword is not bound to any keys
vi-backward-word is not bound to any keys
vi-bword is not bound to any keys
vi-change-case is not bound to any keys
vi-change-char is not bound to any keys
vi-change-to is not bound to any keys
vi-char-search is not bound to any keys
vi-column is not bound to any keys
vi-complete is not bound to any keys
vi-delete is not bound to any keys
vi-delete-to is not bound to any keys
vi-eWord is not bound to any keys
vi-editing-mode is not bound to any keys
vi-end-bigword is not bound to any keys
vi-end-word is not bound to any keys
vi-eof-maybe is not bound to any keys
vi-eword is not bound to any keys
vi-fWord is not bound to any keys
vi-fetch-history is not bound to any keys
vi-first-print is not bound to any keys
vi-forward-bigword is not bound to any keys
vi-forward-word is not bound to any keys
vi-fword is not bound to any keys
vi-goto-mark is not bound to any keys
vi-insert-beg is not bound to any keys
vi-insertion-mode is not bound to any keys
vi-match is not bound to any keys
vi-movement-mode is not bound to any keys
vi-next-word is not bound to any keys
vi-overstrike is not bound to any keys
vi-overstrike-delete is not bound to any keys
vi-prev-word is not bound to any keys
vi-put is not bound to any keys
vi-redo is not bound to any keys
vi-replace is not bound to any keys
vi-rubout is not bound to any keys
vi-search is not bound to any keys
vi-search-again is not bound to any keys
vi-set-mark is not bound to any keys
vi-subst is not bound to any keys
vi-tilde-expand is not bound to any keys
vi-unix-word-rubout is not bound to any keys
vi-yank-arg is not bound to any keys
vi-yank-pop is not bound to any keys
vi-yank-to is not bound to any keys
```


## List names of functions

```bash
$ bind -l

abort
accept-line
alias-expand-line
arrow-key-prefix
backward-byte
backward-char
backward-delete-char
backward-kill-line
backward-kill-word
backward-word
beginning-of-history
beginning-of-line
bracketed-paste-begin
call-last-kbd-macro
capitalize-word
character-search
character-search-backward
clear-display
clear-screen
complete
complete-command
complete-filename
complete-hostname
complete-into-braces
complete-username
complete-variable
copy-backward-word
copy-forward-word
copy-region-as-kill
dabbrev-expand
delete-char
delete-char-or-list
delete-horizontal-space
digit-argument
display-shell-version
do-lowercase-version
downcase-word
dump-functions
dump-macros
dump-variables
dynamic-complete-history
edit-and-execute-command
emacs-editing-mode
end-kbd-macro
end-of-history
end-of-line
exchange-point-and-mark
forward-backward-delete-char
forward-byte
forward-char
forward-search-history
forward-word
glob-complete-word
glob-expand-word
glob-list-expansions
history-and-alias-expand-line
history-expand-line
history-search-backward
history-search-forward
history-substring-search-backward
history-substring-search-forward
insert-comment
insert-completions
insert-last-argument
kill-line
kill-region
kill-whole-line
kill-word
magic-space
menu-complete
menu-complete-backward
next-history
next-screen-line
non-incremental-forward-search-history
non-incremental-forward-search-history-again
non-incremental-reverse-search-history
non-incremental-reverse-search-history-again
old-menu-complete
operate-and-get-next
overwrite-mode
possible-command-completions
possible-completions
possible-filename-completions
possible-hostname-completions
possible-username-completions
possible-variable-completions
previous-history
previous-screen-line
print-last-kbd-macro
quoted-insert
re-read-init-file
redraw-current-line
reverse-search-history
revert-line
self-insert
set-mark
shell-backward-kill-word
shell-backward-word
shell-expand-line
shell-forward-word
shell-kill-word
shell-transpose-words
skip-csi-sequence
start-kbd-macro
tab-insert
tilde-expand
transpose-chars
transpose-words
tty-status
undo
universal-argument
unix-filename-rubout
unix-line-discard
unix-word-rubout
upcase-word
vi-append-eol
vi-append-mode
vi-arg-digit
vi-bWord
vi-back-to-indent
vi-backward-bigword
vi-backward-word
vi-bword
vi-change-case
vi-change-char
vi-change-to
vi-char-search
vi-column
vi-complete
vi-delete
vi-delete-to
vi-eWord
vi-editing-mode
vi-end-bigword
vi-end-word
vi-eof-maybe
vi-eword
vi-fWord
vi-fetch-history
vi-first-print
vi-forward-bigword
vi-forward-word
vi-fword
vi-goto-mark
vi-insert-beg
vi-insertion-mode
vi-match
vi-movement-mode
vi-next-word
vi-overstrike
vi-overstrike-delete
vi-prev-word
vi-put
vi-redo
vi-replace
vi-rubout
vi-search
vi-search-again
vi-set-mark
vi-subst
vi-tilde-expand
vi-unix-word-rubout
vi-yank-arg
vi-yank-pop
vi-yank-to
yank
yank-last-arg
yank-nth-arg
yank-pop
```
