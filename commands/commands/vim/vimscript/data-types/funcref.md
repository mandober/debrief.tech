# Vimscript :: Data types :: Funcref

A *Funcref* is the type of variable that refers to a function.

Since Vim lacks first class functions, we pass around functions, not directly (using their bare names), but as funcrefs.

Like user functions, a funcref var also needs to start with an uppercase letter when it refers to a user function; it can also reference a builtin function.

To assign a function to a funcref variable, use `function()` or `funcref()`, wrapping the function's name in quotes (as a string).

Without a prefix, functions are global by default - the same as if their name is prefixed with `g:`. To define a script-scoped function, prefix it sname with `s:`. Functions living in different scopes can have the same name.

```vim
" define a global function (no prefix = global)
func! Succ(x)
  " l: scope for locals
  let l:local = 1
  " a: scope for args
  return a:x + l:local
endfunc

" make a funcref
let Suc = function('Succ')

" call a function
echo Suc(5)

" call a function, discarding the return value
call Suc(5)

" define a script-local function
func! s:Succ(x)
  " l: scope for locals
  let l:local = 1
  " a: scope for args
  return a:x + l:local
endfunc

echo s:Suc(5)
call s:Suc(5)
```
