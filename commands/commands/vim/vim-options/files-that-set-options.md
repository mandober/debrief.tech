# Files that set Vim options

Vim options are set
- by default
- by conditional default depending on the compatibility flag ('cp')
- by a file shipped with VIm
- by user vimrc file(s)

Files that set Vim options are collectively called *vimrc* files.

`defaults.vim`
- /usr/share/vim/vim90/defaults.vim
This is loaded if no *vimrc* file was found. 
Unless Vim is started with `vim -u NONE` or `vim -C`. 
Individual options can be reverted to default with `:set option&`. 


Vim can be started as
- vim
- vi
- view
- ex


```bash
# vim
update-alternatives --display vim
vim - auto mode
  link best version is /usr/bin/vim.nox
  link currently points to /usr/bin/vim.nox
  link vim is /usr/bin/vim
/usr/bin/vim.basic - priority 30
/usr/bin/vim.nox - priority 40

# vi
update-alternatives --display vi
vi - auto mode
  link best version is /usr/bin/vim.nox
  link currently points to /usr/bin/vim.nox
  link vi is /usr/bin/vi
/usr/bin/vim.basic - priority 30
/usr/bin/vim.nox - priority 40
/usr/bin/vim.tiny - priority 15

# ex
update-alternatives --display ex
ex - auto mode
  link best version is /usr/bin/vim.nox
  link currently points to /usr/bin/vim.nox
  link ex is /usr/bin/ex
/usr/bin/vim.basic - priority 30
/usr/bin/vim.nox - priority 40
/usr/bin/vim.tiny - priority 15

# view
update-alternatives --display view
view - auto mode
  link best version is /usr/bin/vim.nox
  link currently points to /usr/bin/vim.nox
  link view is /usr/bin/view
/usr/bin/mcview - priority 25
/usr/bin/vim.basic - priority 30
/usr/bin/vim.nox - priority 40
/usr/bin/vim.tiny - priority 15
```
