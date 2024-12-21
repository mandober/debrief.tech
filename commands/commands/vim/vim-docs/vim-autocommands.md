# Autocommands

Autocommands are triggered in response to events.

```vim
:autocmd BufNewFile * :write
         ↑          ↑ ↑
         │          │ cmd
         │          pattern
         event


" complete syntax
:autocmd [group] {event} {aupat} [++once] [++nested] {cmd}
```

Group
- <buffer>

Patterns are used to filter the event.
- `*`
- `*.txt`


A common idiom in Vim scripting is to pair the `BufRead` and `BufNewFile` events together to run a command whenever you open a certain kind of file, regardless of whether the file exist (BufRead) or not (BufNewFile):

```vim
" Turns wrapping off for HTML files
:autocmd BufNewFile,BufRead *.html setlocal nowrap
```

## FileType Events

One of the most useful events is the FileType event. 
This event is fired whenever Vim sets a buffer's `filetype`.

FileType Events
- FileType javascript
- FileType python

Link file types with particular mappings and local settings (`:setlocal`).


```vim
" write to disk on new buffer
:autocmd BufNewFile * :write
" write to disk on new buffer (just for text files)
:autocmd BufNewFile *.txt :write

" reindent the current file
:autocmd BufWritePre *.html :normal gg=G
" reindent the current file (existing or not)
:autocmd BufWritePre,BufRead *.html :normal gg=G

" setlocal option for html files only
:autocmd BufNewFile,BufRead *.html setlocal nowrap

" file-specific comments
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
```

## Autocommand Groups

Two identical autocommands are executed twice. Vim creates two separate autocommands that each happen to do the same thing. The problem is that re-sourcing `~/.vimrc` re-reads the entire file, duplicating autocommands!

```vim
" sleepy time autocmd that is a disaster if re-sourced
:autocmd BufWrite * :sleep 200m
```

The solution is to group related autocommands into *named groups*.

```vim
:augroup testgroup
:  autocmd BufWrite * :echom "Foo"
:  autocmd BufWrite * :echom "Bar"
:augroup END
```

When you use `augroup` multiple times Vim will combine the groups each time.

To clear a group use `autocmd!` inside the group.

```vim
:augroup testgroup
:  autocmd!
:  autocmd BufWrite * :echom "Cats"
:augroup END
```

We enter the `filetype_htm`l group, immediately clear it, define an autocommand, and leave the group. If we source `~/.vimrc` again the clearing will prevent Vim from adding duplicate autocommands.

```vim
augroup filetype_html
  autocmd!
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
```
