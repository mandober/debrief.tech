# vim events

Autocommands are fired on events.

General events
- VimEnter     on vim start

Buffer-related events
- BufWinEnter  on buffer in window focused
- BufNewEnter  on new buffer focused
- BufNewFile   on new file/buffer created
- BufEnter     on buffer focused
- BufRead      on buffer read
- BufWrite     on before write
- BufWritePre  on before buffer write

FileType events
- FileType javascript
- FileType python

Misc events
- EncodingChanged



A common idiom in Vim scripting is to pair the `BufRead` and `BufNewFile` events together to run a command whenever you open a certain kind of file, regardless of whether the file exist (BufRead) or not (BufNewFile):

```vim
" Turns wrapping off for HTML files
:autocmd BufNewFile,BufRead *.html setlocal nowrap
```
