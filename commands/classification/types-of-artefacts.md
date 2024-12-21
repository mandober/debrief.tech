# Types of shartefacts

## Shartefacts

* FS items
  - item, fs_item
  - file-like fs_item
    - file
    - path
    - path component
    - path separator
    - path separator in lists (:) or (;)
    - dir, folder
    - dir hierarchy
    - subdir, subfolder
  + filename
    - filename prefix
    - filename stem
    - filename suffix
    - file extension
  + directories and paths
    - root dir
    - prefix dir
    - base dir
    - installation dir
      - program binaries
      - installed executables
      - executable
  + data and data files
    - configuration files
    - read-only files
      - binary files
      - executables
    + data ownership
      - system files
        - temporary
        - root files
      - user-owned files
        - group-owned files
        - su'ed files
        - public
        - private
      - data files
      - data installation dir
  + libraries
    - dynamic libs
    - static libs
    - sourceable libs
    - libdir, Installation dir for libraries
    - libs are installed
    - library
    - vanilla library
  + docs
    - documentation
    - HTML documentation
    - haddock interfaces
    - build files
  + dotfiles
    - project artefacts 


+ custom files
  + files by purpose
    - includer file
    - included dir, include.d
    - includable files
    - configuration files
    - scriptables, script files
    - sourceable, sourceable files
    - fixtures
    - temporary data dump, `.tdd`

  + src
    - bin
    - lib
    - conf
    - info
  + doc
    - popis, index, enum
    - index, list, enum
    - help
    - man


## Classification of GNU/Linux commands

command
executable
binary
program
application
utility
tool
cli
cli tool
shell tool
script
bash alias
shell keyword
bash reserved word
bash function
bash builtin
sourceables
sourceable script
sourceable function
executable script

```bash
type [
# [ is a shell builtin

type {
# { is a shell keyword

type for
# for is a shell keyword

type w
# w is aliased to `type -ap'

type bash
# bash is /usr/bin/bash

type e
# e is a function
```

## Man and info pages - Sections

- NAME
- SYNOPSIS
- DESCRIPTION
- COMMAND-LINE OPTIONS
- ENVIRONMENT
- FILES
- SEE ALSO

## Types of shell words

word
pattern
glob
name
alias
function name
program name
command
command name
token
line
shell word
shell alias
shell function
shell keyword
shell builtin
shell operator
shell metacharacter

## List of Unix filter programs

- awk
- cat
- bat
- comm
- cut
- expand
- compress
- fold
- fzf
- grep
- head
- nl
- perl
- paste
- pr
- sed
- sh
- sort
- split
- strings
- tail
- tac
- tee
- tr
- uniq
- wc
- zcat
