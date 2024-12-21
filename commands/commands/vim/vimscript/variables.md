# Vim :: Vimscript :: Variables

Scope of variables:
- function-argument  a:     Function arg (only in legacy functions)
- buffer-variable    b:     Local to current buffer
- global-variable    g:     Global
- local-variable     l:     Local to function (only in legacy functions)
- script-variable    s:     Local to script
- tabpage-variable   t:     Local to current tab
- vim-variable       v:     Global, built-in Vim variable
- window-variable    w:     Local to current window

Builtin variables
- v:false   v:true
- v:none    v:null
- v:key     v:val
- v:lang

Vim treats any non-0 integer as truthy Boolean value.

Setting an option with `set` consumes a single literal value; use `let` instead to set the value using expressions.

```vim
" ampersand in front of a name refers to an option
" (not to a var that happens to have the same name)
:echo &textwidth

" set options as vars using let
:let &textwidth = 100
:set textwidth?

" using exps
:let &textwidth = &textwidth + 10

" setting local options
:let &l:number = 1

" read and set registers as vars
" to paste it, in normal mode type ‹"ap›
:let @a = "hello!"

" read register ⟨a⟩
:echo @a

" Select a word and yank it ‹y› - it is stored in the unnamed register ⟨"⟩
:echo @"

" search something with ‹/term›, then echo the search pattern with:
:echo @/

" scoped to the current buffer
:let b:hello = "world"

" scope name by itself can be used as a dict.
" e.g. to delete all script-local variables:
for k in keys(s:)
  unlet s:[k]
endfor
```

The `"` register is the "unnamed" register, which is where text yanked without specifying a destination goes.

Vim can also access the last search pattern. This lets you programmatically read and modify the current search pattern, which can be very useful at times.
