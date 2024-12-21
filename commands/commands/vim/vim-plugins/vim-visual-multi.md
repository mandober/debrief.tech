# vim-visual-multi

Multi-cursors for vim
https://github.com/mg979/vim-visual-multi
https://github.com/mg979/vim-visual-multi/wiki

## Install

Using native Vim packages

```bash
mkdir -p ~/.vim/pack/plugins/start

git clone https://github.com/mg979/vim-visual-multi ~/.vim/pack/plugins/start/vim-visual-multi

# generate help
:helptags ~/.vim/pack/plugins/start/vim-visual-multi/doc
```

## Keys

- c-n     VM mode
- n       next match
- q       skip this match

then press i/c/r and edit, finishing with <ESC>, and <ESC> once more to exit VM
