# NERDTree

https://github.com/preservim/nerdtree

==============================================================================
NERDTree.txt   A tree explorer plugin to rule the Vim world. Bwahahaha!!

                                    # #### ####
                                  ### \/#|### |/####
   d8   888                      ##\/#/ \||/##/_/##/_#
  d88   888 ee   ,e e,         ###  \/###|/ \/ # ###
 d88888 888 88b d88 88b      ##_\_#\_\## | #/###_/_####
  888   888 888 888   ,     ## #### # \ #| /  #### ##/##
  888   888 888  "YeeP"     __#_--###`. |{,###---###-~
                                     \ % @%
  Y88b Y88 888'Y88 888 88e  888 88e   \%@%  88P'888'Y88
   Y88b Y8 888 ,'Y 888 888D 888 888b   %o%  P'  888  'Y 888,8,  ,e e,   ,e e,
  b Y88b Y 888C8   888 88"  888 8888D  %@%      888     888 "  d88 88b d88 88b
  8b Y88b  888 ",d 888 b,   888 888P   %@%      888     888    888   , 888   ,
  88b Y88b 888,d88 888 88b, 888 88"    %@%      888     888     "YeeP"  "YeeP"
                                 , -=-%{@%-^- _
                                   ejm `}               Reference Manual
                                        {
==============================================================================

## NERDTree plugins

* Saves and restores the state of the NERDTree between sessions.
https://github.com/scrooloose/nerdtree-project-plugin

* vim-devicons
https://github.com/ryanoasis/vim-devicons


## Install

Installing NERDTree with Vim 8+ packages

For Vim8+, use the builtin package management. 
A plugin repo should be cloned in `~/.vim/pack/` dir.
Run this in terminal:

```bash
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree

# add help tags
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
```

## Getting Started

After installing NERDTree, the best way to learn it is to turn on the *Quick Help*: open NERDTree with `:NERDTree` command, and press `?` to turn on the Quick Help, which shows all mappings and commands available in NERDTree. But the most complete source of info is `:help NERDTree`.

## HOW-TOs

### Map a key to open NERDTree

NERDTree doesn't create any shortcuts outside of the NERDTree buffer, so as not to overwrite any of your other shortcuts.

Few examples:

```vim
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>f :NERDTreeFind<CR>


" Mirror the NERDTree before showing it.
" This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
" or
nnoremap <leader>t :NERDTreeMirror<CR>:NERDTreeFocus<CR>
```

### How do I open NERDTree automatically when Vim starts?
Each code block below is slightly different, as described in the comments.

```vim
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree, unless a file or session is specified,
" e.g. vim -S session_file.vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" Start NERDTree when Vim starts with a directory argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
  \ execute 'NERDTree' argv()[0] |
  \ wincmd p | enew | execute 'cd '.argv()[0] | endif
```

### How so I close Vim or tab automatically when NERDTree is the last window?

```vim
" Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
```

### How can I prevent other buffers replacing NERDTree in its window?

```vim
" If another buffer tries to replace NERDTree,
" put it in the other window, and bring back NERDTree
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
```

### Can I have the same NERDTree on every tab automatically?

```vim
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" or change your NERDTree-launching shortcut key like so:

" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
```
