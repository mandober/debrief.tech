# Vim modeline

`:set modeline`
Turn on the option 'modeline' to let Vim look for modelines, 5 lines at BOF and 5 lines at EOF.

Examples:

Markdown files
```md
<!-- vim: fold foldmethod=marker -->
```

Bash scripts
```bash
# vim: fold foldmethod=marker
```

Vim files
```vim
" vim: tw=77
```

Lua files
```lua
-- vim: set ai tw=75:
-- Vim: set ai tw=75:
```

JS files

```js
/* vim: set ai tw=75: */
/* Vim: set ai tw=75: */
```
