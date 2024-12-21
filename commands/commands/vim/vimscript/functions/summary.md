# Summary

All this pertains to the legacy vimscript functions.

- function definition starts with `function` keyword, ends with `endfunction`.
- use a bang, `function!`, to overwrite it on re-sourcing.
- user functions start with a capital letter.
- functions can be defined in global and script scope.
- global scope uses `g:` perfix.
- global scope is default: bare function names or prefixed with `g:` are global
- script-scoped functions use `s:` prefix.
- functions in different scopes can have the same name.
- function args (params) are in `a:` scope.
- function locals are in `l:` scope.
- last param `...` (i.e. 'rest' operator) collects variadic args in a list
- refer to the args list by `a:000`
- refer to the first arg by `a:1` (or by the name of param).
- `:call` command calls a function, discarding its return value
- `call()` function calls a function, passing it args in a list
