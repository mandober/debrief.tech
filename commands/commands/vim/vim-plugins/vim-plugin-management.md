# vim :: plugin management

- Dein
- Pathogen
- package, now lazy.nvim (Neovim only)
- Vundle
- Vim-Plug
- Vim 8 builtin packages
- neobundle

## Features
- activelly developed
- plugin add
- plugin update
- plugin remove
- plugin disable
- plugin cleanup
- plugin search - search plugins index
- manage runtimepath
- generate and update helptags automatically
- lazy loading
- per plugin settings
- post-update hooks
- extendable (with plugins)
- cross-platform
- parallel update procedure
- fast
- dependency support
- creates shallow git clones (to minimize disk space usage and download time)
- plugin source management (github, what else?)


## What are the differences between the Vim plugin managers?
https://vi.stackexchange.com/questions/388/what-are-the-differences-between-the-vim-plugin-managers

https://stackoverflow.com/questions/2458398/packageplugin-management-for-vim

## vim-pi
Plugin index (previously vim-addon-manager-known-repositories)
https://bitbucket.org/vimcommunity/vim-pi/src/master/

## vim-flavor
a tool to manage your favorite Vim plugins
https://github.com/kana/vim-flavor

## vim-addon-manager
https://github.com/MarcWeber/vim-addon-manager
manage and install vim plugins (including their dependencies) in a sane way. If you have any trouble contact me. Usually I reply within 24 hours

## Vundle
https://github.com/VundleVim/Vundle.vim

Vundle is an excellent plugin manager built on the same principles as Pathogen, but with an integrated plugin management system that is Git and Github aware. Vundle also ensures that the latest versions of your plugins are installed and makes it easy to keep them up to date.

Vundle is more complex. It is a package manager à la apt.
- search a plugin index
- update plugins
- generate helptags automatically
- keep, but not use, plugins in the autoload folder
- clean out such unused plugins
- cross-platform

## vim-plug
https://github.com/junegunn/vim-plug

vim-plug is a nice alternative to Vundle, it does things a bit different from a technical point of view which should make it faster (see this). It has most (or all?) of the features of Vundle.
- Parallel update procedure for Vim with any of +ruby, +python, or Neovim
- Falls back to sequential mode using Vimscript if none is available
- Lazy loading
- Install plugins
- Update plugins
- Review / rollback updates
- cross-platform
- Post-update hooks (e.g. automatically recompile YCM)
- `:PlugInstall` after adding a new plugin

https://github.com/junegunn/vim-plug/issues/379
`plug#end()` should only add the plugins to `&runtimepath`, but it also includes commands `filetype plugin indent on` and `syntax enable`. Calling `plug#end` seems to enable `indentexpr`, `indentkeys`, `suffixesadd`, `include`, `includeexpr`, `formatoptions`, `comments`, `commentstring` and `balloonexpr`. Are you telling me I really need to unset all those if I want to use plug? And yes, all those problems dissapear when I comment out that `filetype plugin indent on` from `plug.vim`. (fix: `filetype indent off` right after call `plug#end`)


https://github.com/junegunn/vim-plug
https://github.com/junegunn/vim-plug/issues/
https://github.com/junegunn/vim-plug/wiki/faq
https://github.com/junegunn/vim-plug/wiki/tips
https://github.com/junegunn/vim-plug/wiki/tutorial
https://github.com/junegunn/vim-plug/wiki/requirements



## Pathogen
https://github.com/tpope/vim-pathogen

Pathogen is more of a runtime path manager than a plugin manager. You must clone the plugins' repositories yourself to a specific location, and Pathogen makes sure they are available in Vim.
- autoload plugins from a folder
- generate help tags for these plugins
- minimalist
- everything else done manually (installing, updating, removing, etc.)
- no lazy loading


## Dein
https://github.com/Shougo/dein.vim

- Active developement has stopped
- Fast - Faster than NeoBundle.
- Simple - Function API and familiar patterns, without commands or dependency hell.
- Async - Clean asynchronous installation supported.
- Extendable - Supports plugins from local or remote sources, and also Non-Github plugins.
- Consistent - Go-like directory structure (eg. github.com/{author}/{repository})
- Practical - Automatically merge plugins directories to avoid long runtimepath

## neobundle
https://github.com/Shougo/neobundle.vim

- Active developement on NeoBundle has stopped.

## volt
https://github.com/vim-volt/volt
A meta-level vim package manager

## Vim8 native package management
- https://vimhelp.org/repeat.txt.html#packages
- https://medium.com/@paulodiovani/installing-vim-8-plugins-with-the-native-pack-system-39b71c351fea
- https://dev.to/iggredible/how-to-use-vim-packages-3gil
- http://vimhelp.appspot.com/repeat.txt.html#packages
- https://shapeshed.com/vim-packages/
- https://vi.stackexchange.com/questions/9522/what-is-the-vim8-package-feature-and-how-should-i-use-it

Just defines a new plugin directory structure, and the user can decide how to fetch and update plugins.

>A **Vim package** is a directory that contains one or more **plugins**.

The advantages over normal plugins:
- A package can be downloaded as an archive and unpacked in its own directory. Thus the files are not mixed with files of other plugins. That makes it easy to update and remove.
- A package can be a git, mercurial, etc. repository. That makes it really easy to update.
- A *package* can contain *multiple plugins* that depend on each other.
- A package can contain plugins that are automatically loaded on startup and ones that are only loaded when needed with `:packadd`.

The emplacement of the folder is defined by the option packpath (See :h 'packpath').


Any directory under `~/.vim/pack` is considered a package. A package can hold plugins in two different directories, `start` and `opt`. The plugins under `start/` folder are loaded on startup, while the plugins under `opt/` folder are loaded manually with `:packadd {name}`.

- `~/.vim/pack/*/start/{name}` Plugin auto loaded on startup
- `~/.vim/pack/*/opt/{name}`   Plugin loaded manually, with `:packadd {name}`

When using Vim packages, you can unpack or git clone your desired packages directly into these directories. Or even use git submodules to keep them all in sync among several machines.

Here is a recap of the folders:

```
~/.vim/pack/…/start/foobar/plugin/foo.vim     " always loaded, defines cmds
~/.vim/pack/…/start/foobar/plugin/bar.vim     " always loaded, defines cmds
~/.vim/pack/…/start/foobar/autoload/foo.vim   " loaded when 'foo' cmd used
~/.vim/pack/…/start/foobar/doc/foo.txt        " help for foo.vim
~/.vim/pack/…/start/foobar/doc/tags           " help tags

~/.vim/pack/…/opt/fooextra/plugin/extra.vim   " optional plugin, defines cmds
~/.vim/pack/…/opt/fooextra/autoload/extra.vim " loaded when 'extra' cmd used
~/.vim/pack/…/opt/fooextra/doc/extra.txt      " help for extra.vim
~/.vim/pack/…/opt/fooextra/doc/tags           " help tags
```

Out of the box, the package manager doesn't provide features to update your plugins one-by-one, to fetch them automatically from a Github address or to select the plugins you want to enable/disable.

https://github.com/k-takata/minpac
minpac is a new package manager for Vim 8 (and NeoVim). It builds on top of Vim 8's packages, providing commands to update your plugins or clean them (removing unused plugins).


## vim-packager
https://github.com/kristijanhusak/vim-packager
Vim plugin manager that utilizes "jobs" and "pack" features.

## pack
https://github.com/maralla/pack

The missing vim8 package manager (written in Rust)

## minpac
https://github.com/k-takata/minpac

## vim-pck
https://github.com/nicodebo/vim-pck

## vimapt
https://github.com/howl-anderson/vimapt
