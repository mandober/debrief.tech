# Vim :: Abbreviations

https://learnvimscriptthehardway.stevelosh.com/chapters/13.html

An abbreviation is only recognized and expanded when it is followed by a non-keyword character (see `is-keyword`) like <Esc> (ends insert mode), <CR> (ends a command), <Space> or punctuations.

The non-keyword char which ends the abbreviation is inserted after the expanded abbreviation. To prevent it, use `<C-]>` which expands an abbreviation without inserting an extra char.

To prevent an abbreviation `p` use `[p` or `@p`.

Abbreviation can only be defined for INSERT and COMMAND modes, although they are most useful for INSERT mode.

Be careful that an abbreviation does not expand into a mapping, or use non recursive abbreviations (`noreabbr`).

List all abbreviations: `:ab[breviate]`

```vim
" Insert mode abbreviations
:iabbrev teh the
:inoreabbrev teh the

" buffer-local abbreviations
:inoreabbrev <buffer> --- &mdash;

" Expands @a to this
inoreabbrev @a always @()<CR>begin<CR>end<Esc>2k$
```

## Autocommands and Abbreviations

Buffer-local abbreviations can be paired with autocommands to make a snippet system.

```vim
:autocmd FileType python     :iabbrev <buffer> iff if:<left>
:autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
```

Open a JS file and 'iff' abbreviation should expand into this snippet. Vim will perform the appropriate abbreviation depending on the type of the current file.
