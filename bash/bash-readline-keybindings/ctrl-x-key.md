# Emacs Standard bindings for CTRL+x+KEY

"\C-xe": call-last-kbd-macro
"\C-xg": glob-list-expansions

"\C-x(": start-kbd-macro
"\C-x)": end-kbd-macro
"\C-x*": glob-expand-word
"\C-x$": possible-variable-completions
"\C-x~": possible-username-completions
"\C-x@": possible-hostname-completions
"\C-x/": possible-filename-completions
"\C-x!": possible-command-completions




remove all `do-lowercase-version` bindings:

```bash
# remove all "do-lowercase-version" bindings
for c in {A..Z}; do
  bind -r "\C-x$c"
  bind -r "\e$c"
done
```
