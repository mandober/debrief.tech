# netrw

https://vimhelp.org/pi_netrw.txt.html

netrw is the file browser that comes as a builtin plugin in Vim. To open it:
- Explore     Open
- Sex         Open in vsplit
- Lex         Open in hsplit

## TOC

- Starting With Netrw
- Netrw Reference
  - external applications and protocols
  - reading
  - writing
  - sourcing
  - directory listing
  - changing the userid and password
  - variables and settings
  - paths
- Network-Oriented File Transfer
  - netrc
  - password
- Activation

6.  Transparent Remote File Editing.......................netrw-transparent
7.  Ex Commands...........................................netrw-ex
8.  Variables and Options.................................netrw-variables
9.  Browsing..............................................netrw-browse
      Introduction To Browsing............................netrw-intro-browse
      Quick Reference: Maps...............................netrw-browse-maps
      Quick Reference: Commands...........................netrw-browse-cmds
      Banner Display......................................netrw-I
      Bookmarking A Directory.............................netrw-mb
      Browsing............................................netrw-cr
      Squeezing the Current Tree-Listing Directory........netrw-s-cr
      Browsing With A Horizontally Split Window...........netrw-o
      Browsing With A New Tab.............................netrw-t
      Browsing With A Vertically Split Window.............netrw-v
      Change File Permission..............................netrw-gp
      Change Listing Style.(thin wide long tree)..........netrw-i
      Changing To A Bookmarked Directory..................netrw-gb
      Changing To A Predecessor Directory.................netrw-u
      Changing To A Successor Directory...................netrw-U
      Customizing Browsing With A Special Handler.........netrw-x
      Deleting Bookmarks..................................netrw-mB
      Deleting Files Or Directories.......................netrw-D
      Directory Exploring Commands........................netrw-explore
      Exploring With Stars and Patterns...................netrw-star
      Displaying Information About File...................netrw-qf
      Edit File Or Directory Hiding List..................netrw-ctrl-h
      Editing The Sorting Sequence........................netrw-S
      Forcing treatment as a file or directory............netrw-gd netrw-gf
      Going Up............................................netrw--
      Hiding Files Or Directories.........................netrw-a
      Improving Browsing..................................netrw-ssh-hack
      Listing Bookmarks And History.......................netrw-qb
      Making A New Directory..............................netrw-d
      Making The Browsing Directory The Current Directory.netrw-cd
      Marking Files.......................................netrw-mf
      Unmarking Files.....................................netrw-mF
      Marking Files By Location List......................netrw-qL
      Marking Files By QuickFix List......................netrw-qF
      Marking Files By Regular Expression.................netrw-mr
      Marked Files: Arbitrary Shell Command...............netrw-mx
      Marked Files: Arbitrary Shell Command, En Bloc......netrw-mX
      Marked Files: Arbitrary Vim Command.................netrw-mv
      Marked Files: Argument List.........................netrw-ma netrw-mA
      Marked Files: Buffer List...........................netrw-cb netrw-cB
      Marked Files: Compression And Decompression.........netrw-mz
      Marked Files: Copying...............................netrw-mc
      Marked Files: Diff..................................netrw-md
      Marked Files: Editing...............................netrw-me
      Marked Files: Grep..................................netrw-mg
      Marked Files: Hiding and Unhiding by Suffix.........netrw-mh
      Marked Files: Moving................................netrw-mm
      Marked Files: Printing..............................netrw-mp
      Marked Files: Sourcing..............................netrw-ms
      Marked Files: Setting the Target Directory..........netrw-mt
      Marked Files: Tagging...............................netrw-mT
      Marked Files: Target Directory Using Bookmarks......netrw-Tb
      Marked Files: Target Directory Using History........netrw-Th
      Marked Files: Unmarking.............................netrw-mu
      Netrw Browser Variables.............................netrw-browser-var
      Netrw Browsing And Option Incompatibilities.........netrw-incompatible
      Netrw Settings Window...............................netrw-settings-window
      Obtaining A File....................................netrw-O
      Preview Window......................................netrw-p
      Previous Window.....................................netrw-P
      Refreshing The Listing..............................netrw-ctrl-l
      Reversing Sorting Order.............................netrw-r
      Renaming Files Or Directories.......................netrw-R
      Selecting Sorting Style.............................netrw-s
      Setting Editing Window..............................netrw-C
10. Problems and Fixes....................................netrw-problems
11. Debugging Netrw Itself................................netrw-debug
12. History...............................................netrw-history
13. Todo..................................................netrw-todo
14. Credits...............................................netrw-credits


## Starting with netrw

First, make sure that you have plugins enabled, so you'll need to have at least the following in your .vimrc:

    set nocp                    " compatible is not set
    filetype plugin on          " plugins are enabled

*Prevent loading of netrw*: if you want to use plugins, but don't wish to use netrw, then you need to avoid loading both the plugin and the autoload portions of netrw by placing the following two lines in .vimrc: 

    :let g:loaded_netrw       = 1
    :let g:loaded_netrwPlugin = 1

## Netrw Reference

Netrw supports several protocols in addition to `scp` and `ftp`, including `dav`, `fetch`, `http`, see [netrw-externapp]. Each protocol is associated with a variable which holds the default command supporting that protocol.

Command `:NetrwSettings` displays your current netrw settings.
