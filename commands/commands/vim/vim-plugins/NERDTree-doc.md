# NERDTree

## TOC

<!-- TOC -->

- [TOC](#toc)
- [Contents](#contents)
- [1. Intro](#1-intro)
- [2. Functionality provided](#2-functionality-provided)
  - [2.1 Global Commands](#21-global-commands)
    - [:NERDTree](#nerdtree)
    - [:NERDTreeVCS](#nerdtreevcs)
    - [:NERDTreeFromBookmark](#nerdtreefrombookmark)
    - [:NERDTreeToggle](#nerdtreetoggle)
    - [:NERDTreeToggleVCS](#nerdtreetogglevcs)
    - [:NERDTreeFocus](#nerdtreefocus)
    - [:NERDTreeMirror](#nerdtreemirror)
    - [:NERDTreeClose](#nerdtreeclose)
    - [:NERDTreeFind](#nerdtreefind)
    - [:NERDTreeCWD](#nerdtreecwd)
    - [:NERDTreeRefreshRoot](#nerdtreerefreshroot)
  - [2.2 Bookmarks](#22-bookmarks)
    - [2.2.1. NERDTreeBookmarkTable](#221-nerdtreebookmarktable)
    - [2.2.2. NERDTreeBookmarkCommands](#222-nerdtreebookmarkcommands)
    - [2.2.3. NERDTreeInvalidBookmarks](#223-nerdtreeinvalidbookmarks)
  - [2.3 NERDTreeMappings](#23-nerdtreemappings)
  - [2.4 The NERDTree menu](#24-the-nerdtree-menu)
- [3. Customisation](#3-customisation)
  - [3.1. Customisation summary](#31-customisation-summary)
  - [3.2. Customisation details](#32-customisation-details)
- [4. The NERDTree API](#4-the-nerdtree-api)
  - [4.1. Key map API](#41-key-map-api)
  - [4.2. Menu API](#42-menu-api)
  - [4.3 Menu API](#43-menu-api)
  - [4.4 Path Listener API](#44-path-listener-api)

<!-- /TOC -->

## Contents

1. Intro
2. Functionality provided
  2.1. Global commands
  2.2. Bookmarks
    2.2.1. The bookmark table
    2.2.2. Bookmark commands
    2.2.3. Invalid bookmarks
  2.3. NERDTree mappings
  2.4. The NERDTree menu
3. Settings
  3.1. Settings summary
  3.2. Settings details
4. NERDTree API
  4.1. Key map API
  4.2. Menu API
  4.3. Menu API
  4.4. Path Listener API
5. About


## 1. Intro

The NERDTree presents the filesystem in the form of a tree so you can explore it with keyboard and/or mouse and perform simple operations.

Features and functionality:
* hierarchical tree structure
* highlighting for these types of nodes
  * files
  * dirs
  * sym-links
  * windows .lnk files
  * read-only files
  * executable files
* customisable mappings
  * to open/close/explore dir nodes
  * to open files in new/existing windows/tabs
  * to change the current root of the tree
  * to navigate around the tree
* Items (dirs and files) can be bookmarked
* Most NERDTree navigation can also be done with the mouse
* Filtering of tree content (can be toggled at runtime)
  * custom file filters to prevent (e.g. vim backup files being displayed)
  * optional displaying of hidden files
  * files can be "turned off" so that only dirs are shown
* The position and size of the NERDTree window can be customised
* The order in which the nodes in the tree are listed can be customised
* A model of fs is maintained as you explore it. This has several advantages:
  * fs info is cached and is only re-read on demand
  * on revisiting, everything is as it was left
* remembers cursor and window position so you can toggle it off (or just close the tree window) and then reopen it (with `NERDTreeToggle`) the NERDTree window will appear exactly as you left it
* have separate NERDTree for each tab, share trees across tabs
* By default the script overrides the default file browser (netrw), so if you `:edit` a dir a (slightly modified) NERDTree will appear in the current window
* programmable menu system is provided (simulates right clicking on a node)
  * one default menu plugin is provided to perform basic fs ops (create/delete/move/copy files/dirs)
* API for adding your own keymappings

## 2. Functionality provided

### 2.1 Global Commands

:NERDTree
:NERDTreeVCS
:NERDTreeFromBookmark
:NERDTreeToggle
:NERDTreeToggleVCS
:NERDTreeFocus
:NERDTreeMirror
:NERDTreeClose
:NERDTreeFind
:NERDTreeCWD
:NERDTreeRefreshRoot

#### :NERDTree

:NERDTree [<start-dir> | <bookmark>]

Opens a fresh NERDTree. 
The root of the tree depends on the arg. 
There are 3 cases:
- if no arg, CWD is used
- if dir given, it is used
- if bookmark name given, the corresponding dir is used

:NERDTree /home/marty/vim7/src
:NERDTree foo   (foo is bookmark name)

#### :NERDTreeVCS

:NERDTreeVCS [<start-dir> | <bookmark>]

Like :NERDTree but searches up the dir tree to find the top of VCS repo, and roots NERDTree there (Git, Subversion, Mercurial, Bazaar, Darcs).

:NERDTreeVCS /home/marty/nerdtree/doc  (opens /home/marty/nerdtree)
:NERDTreeVCS              (opens root of repository containing CWD)

#### :NERDTreeFromBookmark

:NERDTreeFromBookmark <bookmark>

Opens a fresh NERDTree with the root initialized to the dir for <bookmark>. The only reason to use this command over :NERDTree is for the completion (which is for bookmarks rather than dirs).

#### :NERDTreeToggle

:NERDTreeToggle [<start-dir> | <bookmark>]

If a NERDTree already exists for this tab, it is reopened and rendered again. If <start-dir> or <bookmark> is given, the root of NERDTree is set to that path. If no NERDTree exists for this tab then this command acts the same as the :NERDTree command.

#### :NERDTreeToggleVCS

:NERDTreeToggleVCS [<start-dir> | <bookmark>]

Like :NERDTreeToggle, but searches up the dir tree to find the top of the VCS repo, and roots the NERDTree there (Git, Subversion, Mercurial, Bazaar, Darcs)
:NERDTreeToggleVCS /home/marty/nerdtree/doc  (opens /home/marty/nerdtree)
:NERDTreeToggleVCS              (opens root of repository containing CWD)

#### :NERDTreeFocus

Opens (or reopens) the NERDTree if it is not currently visible; 
otherwise, the cursor is moved to the already-open NERDTree.

#### :NERDTreeMirror

Shares an existing NERDTree, from another tab, in the current tab. Changes made to one tree are reflected in both as they are actually the same buffer.
- If only one other NERDTree exists, that tree is automatically mirrored.
- If more than one exists, the script will ask which tree to mirror.

#### :NERDTreeClose

Close the NERDTree in this tab.

#### :NERDTreeFind

:NERDTreeFind [<path>]

Without the optional arg, find and reveal the file for the active buffer in the NERDTree window. With the <path> arg, find and reveal the specified path.

Focus will be shifted to the NERDTree window, and the cursor will be placed on the tree node for the determined path.

If a NERDTree for the current tab does not exist, a new one will be initialized.

#### :NERDTreeCWD

Change the NERDTree root to the cwd. 
If no NERDTree exists for this tab, a new one is opened.

#### :NERDTreeRefreshRoot

Refreshes the NERDTree root node.



### 2.2 Bookmarks

Bookmarks in the NERDTree are a way to tag files or dirs of interest.
For example, you could use bookmarks to tag all of your project dirs.

#### 2.2.1. NERDTreeBookmarkTable

If the bookmark table is active (see |NERDTree-B| and
|NERDTreeShowBookmarks|), it will be rendered above the tree. You can double
click bookmarks or use the |NERDTree-o| mapping to activate them. See also,
|NERDTree-t| and |NERDTree-T|

#### 2.2.2. NERDTreeBookmarkCommands

Note: The following commands are only available within the NERDTree buffer.

:Bookmark [<name>]
    Bookmark the current node as <name>. If there is already a <name>
    bookmark, it is overwritten. <name> must not contain spaces.
    If <name> is not provided, it defaults to the file or dir name.
    For dirs, a trailing slash is present.

:BookmarkToRoot <bookmark>
    Make the dir corresponding to <bookmark> the new root. If a treenode
    corresponding to <bookmark> is already cached somewhere in the tree then
    the current tree will be used, otherwise a fresh tree will be opened.
    Note that if <bookmark> points to a file then its parent will be used
    instead.

:RevealBookmark <bookmark>
    If the node is cached under the current root then it will be revealed
    (i.e. dir nodes above it will be opened) and the cursor will be
    placed on it.

:OpenBookmark <name>
    The Bookmark named <name> is opened as if |NERDTree-o| was applied to
    its entry in the Bookmark table. If the Bookmark points to a dir,
    it is made the new root of the current NERDTree. If the Bookmark points
    to a file, that file is opened for editing in another window.

:ClearBookmarks [<bookmarks>]
    Remove all the given bookmarks. If no bookmarks are given then remove all
    bookmarks on the current node.

:ClearAllBookmarks
    Remove all bookmarks.

:EditBookmarks
    Opens the bookmarks file for manual editing, e.g. for removing invalid
    bookmarks.

:ReadBookmarks
    Re-read the bookmarks in the |NERDTreeBookmarksFile|.

See also |:NERDTree| and |:NERDTreeFromBookmark|.

#### 2.2.3. NERDTreeInvalidBookmarks

If invalid bookmarks are detected, the script will issue an error message and
the invalid bookmarks will become unavailable for use.

These bookmarks will still be stored in the bookmarks file (see
|NERDTreeBookmarksFile|), down at the bottom. There will always be a blank line
after the valid bookmarks but before the invalid ones.

Each line in the bookmarks file represents one bookmark. The proper format is:
<bookmark name><space><full path to the bookmark location>

You can use the :EditBookmarks command to open the bookmarks file for editing.
After you have corrected any invalid bookmarks, either restart vim, or run
:ReadBookmarks from the NERDTree window.

### 2.3 NERDTreeMappings

Help-tags are formed as `NERDTree-{key}`.
- NERDTree-o for help on key 'o'
- NERDTree-go for 'go'
- NERDTree-<CR> for <CR>
- NERDTree-C-J for <C-J>


DEFAULT-KEY, DESC, HELP-TAG

o      Open file, dir, bookmark
O      Recursively open selected dir (or double-click)
go     Open selected file, but leave cursor in NERDTree

t      Open selected node/bookmark in new tab
T      Same as 't' but keep focus in current tab

i      Open selected file in split window (or middle-click)
gi     Same as 'i', but leave the cursor in NERDTree

s      Open selected file in new vsplit
gs     Same as 's', but leave the cursor in NERDTree

<CR>   User-definable custom open action

D      Delete current bookmark
go     Find selected bookmark dir in current NERDTree

e      Edit current dir (or middle-click)

x      Close current node's parent
X      Close recursively all children of current node

K      Jump up inside dirs at current tree depth
J      Jump down inside dirs at current tree depth
p      Jump to current nodes parent
<C-J>  Jump down to next sibling of current dir
<C-K>  Jump up to previous sibling of current dir

P      Jump to root
u      Move root up one dir
U      Same as 'u' except old root is left open
C      Change root to selected dir
CD     Change root to CWD
cd     Change CWD to dir of selected node

r      Recursively REFRESH current dir
R      Recursively REFRESH current root

m      Display NERDTree menu
?      Show quick help

I      Toggle hidden files
f      Toggle file filters
F      Toggle files
B      Toggle bookmark table (or L)

q      Close NERDTree window
A      Zoom NERDTree window (maximize/minimize)


*NERDTree-o*
- Default key: `o`
- Map setting: `NERDTreeMapActivateNode`
- Applies to: files and dirs
item selected:
- file: file opened in prev window
- file bookmark: open in prev window
- dir: toggle it
- dir bookmark: dir becomes new root

*NERDTree-go*
Default key: go
Map setting: NERDTreeMapPreview
Applies to: files.
If a file node or a bookmark that links to a file is selected, it is opened in
the previous window, but the cursor does not move.
If a bookmark that links to a dir is selected then that dir
becomes the new root.
The default key combo for this mapping is "g" + NERDTreeMapActivateNode (see
|NERDTree-o|).

*NERDTree-t*
Default key: t
Map setting: *NERDTreeMapOpenInTab*
Applies to: files and dirs.
Opens the selected file in a new tab. If a dir is selected, a fresh
NERDTree for that dir is opened in a new tab.
If a bookmark which points to a dir is selected, open a NERDTree for
that dir in a new tab. If the bookmark points to a file, open that file
in a new tab.

*NERDTree-T*
Default key: T
Map setting: *NERDTreeMapOpenInTabSilent*
Applies to: files and dirs.
The same as |NERDTree-t| except that the focus is kept in the current tab.

*NERDTree-i*
Default key: i
Map setting: *NERDTreeMapOpenSplit*
Applies to: files, and bookmarks pointing to files.
Opens the selected file in a new split window and puts the cursor in the new
window.

*NERDTree-gi*
Default key: gi
Map setting: *NERDTreeMapPreviewSplit*
Applies to: files, and bookmarks pointing to files.
The same as |NERDTree-i| except that the cursor is not moved.
The default key combo for this mapping is "g" + NERDTreeMapOpenSplit (see
|NERDTree-i|).

*NERDTree-s*
Default key: s
Map setting: *NERDTreeMapOpenVSplit*
Applies to: files, and bookmarks pointing to files.
Opens the selected file in a new vertically split window and puts the cursor
in the new window.

*NERDTree-gs*
Default key: gs
Map setting: *NERDTreeMapPreviewVSplit*
Applies to: files, and bookmarks pointing to files.
The same as |NERDTree-s| except that the cursor is not moved.
The default key combo for this mapping is "g" + NERDTreeMapOpenVSplit (see
|NERDTree-s|).

*NERDTree-<CR>*
Default key: <CR>
Map setting: *NERDTreeMapCustomOpen*
Applies to: files, dirs, and bookmarks
Performs a customized open action on the selected node. This allows the user
to define an action that behaves differently from any of the standard
keys. See |NERDTreeCustomOpenArgs| for more details.

*NERDTree-O*
Default key: O
Map setting: *NERDTreeMapOpenRecursively*
Applies to: dirs.
Recursively opens the selected dir.
All files and dirs are cached, but if a dir would not be
displayed due to file filters (see |NERDTreeIgnore| |NERDTree-f|) or the
hidden file filter (see |NERDTreeShowHidden|) then its contents are not
cached. This is handy, especially if you have .svn dirs.

*NERDTree-x*
Default key: x
Map setting: *NERDTreeMapCloseDir*
Applies to: files and dirs.
Closes the parent of the selected node.

*NERDTree-X*
Default key: X
Map setting: *NERDTreeMapCloseChildren*
Applies to: dirs.
Recursively closes all children of the selected dir.
Tip: To quickly "reset" the tree, use |NERDTree-P| with this mapping.

*NERDTree-e*
Default key: e
Map setting: *NERDTreeMapOpenExpl*
Applies to: files and dirs.
|:edit|s the selected dir, or the selected file's dir. This could
result in a NERDTree or a netrw being opened, depending on
|NERDTreeHijackNetrw|.

*NERDTree-D*
Default key: D
Map setting: *NERDTreeMapDeleteBookmark*
Applies to: lines in the bookmarks table
Deletes the currently selected bookmark.

*NERDTree-P*
Default key: P
Map setting: *NERDTreeMapJumpRoot*
Applies to: no restrictions.
Jump to the tree root.

*NERDTree-p*
Default key: p
Map setting: *NERDTreeMapJumpParent*
Applies to: files and dirs.
Jump to the parent node of the selected node.

*NERDTree-K*
Default key: K
Map setting: *NERDTreeMapJumpFirstChild*
Applies to: files and dirs.
Jump to the first child of the current nodes parent.
If the cursor is already on the first node then do the following:
    * loop back thru the siblings of the current nodes parent until we find an
      open dir with children
    * go to the first child of that node

*NERDTree-J*
Default key: J
Map setting: *NERDTreeMapJumpLastChild*
Applies to: files and dirs.
Jump to the last child of the current nodes parent.
If the cursor is already on the last node then do the following:
    * loop forward thru the siblings of the current nodes parent until we find
      an open dir with children
    * go to the last child of that node

*NERDTree-C-J*
Default key: <C-J>
Map setting: *NERDTreeMapJumpNextSibling*
Applies to: files and dirs.
Jump to the next sibling of the selected node.

*NERDTree-C-K*
Default key: <C-K>
Map setting: *NERDTreeMapJumpPrevSibling*
Applies to: files and dirs.
Jump to the previous sibling of the selected node.

*NERDTree-C*
Default key: C
Map setting: *NERDTreeMapChangeRoot*
Applies to: files and dirs.
Make the selected dir node the new tree root. If a file is selected, its
parent is used.

*NERDTree-u*
Default key: u
Map setting: *NERDTreeMapUpdir*
Applies to: no restrictions.
Move the tree root up a dir (like doing a "cd ..").

*NERDTree-U*
Default key: U
Map setting: *NERDTreeMapUpdirKeepOpen*
Applies to: no restrictions.
Like |NERDTree-u| except that the old tree root is kept open.

*NERDTree-r*
Default key: r
Map setting: *NERDTreeMapRefresh*
Applies to: files and dirs.
If a dir is selected, recursively refresh that dir, i.e. scan the
filesystem for changes and represent them in the tree.
If a file node is selected then the above is done on it's parent.

*NERDTree-R*
Default key: R
Map setting: *NERDTreeMapRefreshRoot*
Applies to: no restrictions.
Recursively refresh the tree root.

*NERDTree-m*
Default key: m
Map setting: *NERDTreeMapMenu*
Applies to: files and dirs.
Display the NERDTree menu. See |NERDTreeMenu| for details.

*NERDTree-cd*
Default key: cd
Map setting: *NERDTreeMapChdir*
Applies to: files and dirs.
Change Vim's current working dir to that of the selected node.

*NERDTree-CD*
Default key: CD
Map setting: *NERDTreeMapCWD*
Applies to: no restrictions.
Change the NERDTree root to Vim's current working dir.

*NERDTree-I*
Default key: I
Map setting: *NERDTreeMapToggleHidden*
Applies to: no restrictions.
Toggles whether hidden files (i.e. "dot files") are displayed.

*NERDTree-f*
Default key: f
Map setting: *NERDTreeMapToggleFilters*
Applies to: no restrictions.
Toggles whether file filters are used. See |NERDTreeIgnore| for details.

*NERDTree-F*
Default key: F
Map setting: *NERDTreeMapToggleFiles*
Applies to: no restrictions.
Toggles whether file nodes are displayed.

*NERDTree-B*
Default key: B
Map setting: *NERDTreeMapToggleBookmarks*
Applies to: no restrictions.
Toggles whether the bookmarks table is displayed.

*NERDTree-L*
Default key: L
Map setting: *NERDTreeMapToggleFileLiness*
Applies to: no restrictions.
Toggles whether the number of lines in files is displayed.

*NERDTree-q*
Default key: q
Map setting: *NERDTreeMapQuit*
Applies to: no restrictions.
Closes the NERDTree window.

*NERDTree-A*
Default key: A
Map setting: *NERDTreeMapToggleZoom*
Applies to: no restrictions.
Maximize (zoom) and minimize the NERDTree window.

*NERDTree-?*
Default key: ?
Map setting: *NERDTreeMapHelp*
Applies to: no restrictions.
Toggles whether the quickhelp is displayed.


### 2.4 The NERDTree menu

*NERDTreeMenu*
NERDTree has a menu that can be programmed via the an API. The idea is to simulate the "right click" menus that most file explorers have. The script comes with two default menu plugins: exec_menuitem.vim and fs_menu.vim.
- `fs_menu.vim` adds some basic fs ops to the menu for creating/deleting/moving/copying files and dirs.
- `exec_menuitem.vim` provides a menu item to execute executable files.
Related tags: |NERDTree-m| |NERDTreeApi|

*NERDTreeMenu-j*
- Default key: j
- Map option: *NERDTreeMenuDown*
- Applies to: The NERDTree menu.
Moves the cursor down.

*NERDTreeMenu-k*
- Default key: k
- Map option: *NERDTreeMenuUp*
- Applies to: The NERDTree menu.
Moves the cursor up.

## 3. Customisation

*NERDTreeSettings*

### 3.1. Customisation summary

These settings should be set in your vimrc, using `:let`.


loaded_nerd_tree
  Disables NERDTree plugin.

NERDTreeAutoCenter
  Controls whether the NERDTree window centers when the cursor moves within a specified distance to the top/bottom of the window.

NERDTreeAutoCenterThreshold
  Controls the sensitivity of autocentering.

NERDTreeCaseSensitiveFS
  Tells NERDTree if it is running in on a case sensitive file system.

NERDTreeCaseSensitiveSort
  Tells the NERDTree whether to be case sensitive or not when sorting nodes.

NERDTreeNaturalSort
  Tells NERDTree whether to use natural sort order or not when sorting nodes.

NERDTreeSortHiddenFirst
  Tells NERDTree whether to take the dot at the beginning of hidden file names into account when sorting nodes.

NERDTreeChDirMode
  Tells the NERDTree if/when it should change vim's current working dir.

NERDTreeHighlightCursorline
  Tell the NERDTree whether to highlight the current cursor line.

NERDTreeHijackNetrw
  Tell the NERDTree whether to replace the netrw autocommands for exploring local dirs.

NERDTreeIgnore
  Tells the NERDTree which files to ignore.

NERDTreeRespectWildIgnore
  Tells the NERDTree to respect 'wildignore'.

NERDTreeBookmarksFile
  Where the bookmarks are stored.

NERDTreeBookmarksSort
  Control how the Bookmark table is sorted.

NERDTreeMarkBookmarks
  Render bookmarked nodes with markers.

NERDTreeMouseMode
  Manage the interpretation of mouse clicks.

NERDTreeQuitOnOpen
  Closes the tree window or bookmark table after opening a file.

NERDTreeShowBookmarks
  Tells the NERDTree whether to display the bookmarks table on startup.

NERDTreeShowFiles
  Tells the NERDTree whether to display files in the tree on startup.

NERDTreeShowHidden
  Tells the NERDTree whether to display hidden files on startup.

NERDTreeShowLineNumbers
  Tells the NERDTree whether to display line numbers in the tree window.

NERDTreeSortOrder
  Tell the NERDTree how to sort the nodes in the tree.

NERDTreeStatusline
  Set a statusline for NERDTree windows.

NERDTreeWinPos
  Tells the script where to put the NERDTree window.

NERDTreeWinSize
  Sets the window size when the NERDTree is opened.

NERDTreeWinSizeMax
  Sets the maximum window size when the NERDTree is zoomed.

NERDTreeMinimalUI
  Disables display of the 'Bookmarks' label and 'Press ? for help' text.

NERDTreeMinimalMenu
  Use a compact menu that fits on a single line for adding, copying, deleting, etc

NERDTreeCascadeSingleChildDir
  Collapses on the same line dirs that have only one child dir.

NERDTreeCascadeOpenSingleChildDir
  Cascade open while selected dir has only one child that also is a dir.

NERDTreeAutoDeleteBuffer
  Tells the NERDTree to automatically remove a buffer when a file is being deleted or renamed via a context menu command.

NERDTreeCreatePrefix
  Specify a prefix to be used when creating the NERDTree window.

NERDTreeRemoveFileCmd
  Specify a custom shell command to be used when deleting files. Note that it should include one space character at the end of the command and it applies only to files.

NERDTreeRemoveDirCmd
  Specify a custom shell command to be used when deleting dirs. Note that it should include one space character at the end of the command and it applies only to dirs.

NERDTreeDirArrowCollapsible
  These characters indicate when a dir is

NERDTreeDirArrowExpandable
  either collapsible or expandable.

NERDTreeNodeDelimiter
  A single character that is used to separate the file or dir name from the rest of the characters on the line of text.

NERDTreeCustomOpenArgs
  A dictionary with values that control how a node is opened with the NERDTree-<CR> key.

### 3.2. Customisation details

To enable any of the below settings you should put an appropriate 
`let <setting>=<value>` line in your `~/.vimrc`.

*loaded_nerd_tree*
Diable this plugin: let loaded_nerd_tree=1

*NERDTreeAutoCenter*
- Values: 0 or 1.
- Default: 1
If set to 1, NERDTree window is centered around cursor if it moves to within NERDTreeAutoCenterThreshold lines of top/bottom of window. Centering is done with `zz`. This is ONLY done in response to tree navigation mappings (NERDTree-J, NERDTree-K, NERDTree-C-J, NERDTree-C-K, NERDTree-p, NERDTree-P)

*NERDTreeAutoCenterThreshold*
- Values: Any natural number.
- Default: 3
This setting controls the "sensitivity" of the NERDTree auto centering. 
See NERDTreeAutoCenter for details.

*NERDTreeCaseSensitiveFS*
- Values: 0, 1, 2 or 3.
- Default: 2.
If set to 0, the NERDTree will interact with the file system without case
sensitivity.

If set to 1, the NERDTree will interact with the file system in a case-sensitive
manner.

If set to 2, the NERDTree assumes its case sensitivity from the OS it is
running on. It Will default to case-insensitive on Windows and macOS
machines and case-sensitive on everything else. Since it's not a foolproof
way of detection, NERDTree won't proceed with any write actions when
the destination is ambiguous.

Setting it to 3 will perform just like 2, but without suppressing write
actions.


*NERDTreeCaseSensitiveSort*
Values: 0 or 1.
Default: 0.

By default the NERDTree does not sort nodes case sensitively, i.e. nodes
could appear like this: >
    bar.c
    Baz.c
    blarg.c
    boner.c
    Foo.c

But, if you set this setting to 1 then the case of the nodes will be taken
into account. The above nodes would then be sorted like this: >
    Baz.c
    Foo.c
    bar.c
    blarg.c
    boner.c


*NERDTreeNaturalSort*
Values: 0 or 1.
Default: 0.

By default the NERDTree does not sort nodes in natural sort order, i.e. nodes
could appear like this: >
    z1.txt
    z10.txt
    z100.txt
    z11.txt
    z110.txt
    z2.txt
    z20.txt
    z3.txt

But if you set this setting to 1 then the natural sort order will be used. The
above nodes would then be sorted like this: >
    z1.txt
    z2.txt
    z3.txt
    z10.txt
    z11.txt
    z20.txt
    z100.txt
    z110.txt


*NERDTreeUseTCD*
Values: 0 or 1.
Default: 0.

By default, NERDTree will use the `:cd` command to change the current working
dir. If this setting is turned on, and the `:tcd` command is available, it
will be used instead.


*NERDTreeChDirMode*
Values: 0, 1, 2, or 3.
Default: 0.

Use this setting to tell the script when (if at all) to change the current
working dir (CWD) for vim.

If it is set to 0 then the CWD is never changed by the NERDTree.

If set to 1 then the CWD is changed when the NERDTree is first loaded to the
dir it is initialized in. For example, if you start the NERDTree with >
    :NERDTree /home/marty/foobar

then the CWD will be changed to /home/marty/foobar and will not be changed
again unless you init another NERDTree with a similar command.

If the setting is set to 2 then it behaves the same as if set to 1 except that
the CWD is changed whenever the tree root is changed. For example, if the CWD
is /home/marty/foobar and you make the node for /home/marty/foobar/baz the new
root then the CWD will become /home/marty/foobar/baz.

If the set to 3, then it behaves the same as if set to 2, and the CWD is
changed whenever changing tabs to whatever the tree root is on that tab.


*NERDTreeHighlightCursorline*
Values: 0 or 1.
Default: 1.

If set to 1, the current cursor line in the NERDTree buffer will be
highlighted. This is done using the `'cursorline'` Vim option.

*NERDTreeHijackNetrw*
Values: 0 or 1.
Default: 1.

If set to 1, doing a >
    :edit <some dir>

will open up a window level NERDTree instead of a netrw in the target window.

Window level trees behaves slightly different from a regular trees in the
following respects:
    1. 'o' will open the selected file in the same window as the tree,
       replacing it.
    2. you can have one tree per window - instead of per tab.

*NERDTreeIgnore*
Values: a list of regular expressions.
Default: ['\~$'].

This setting is used to specify which files the NERDTree should ignore.  It
must be a list of regular expressions. When the NERDTree is rendered, any
files/dirs that match any of the regex's in NERDTreeIgnore won't be
displayed.

For example if you put the following line in your vimrc: >
    let NERDTreeIgnore=['\.vim$', '\~$']

then all files ending in .vim or ~ will be ignored.

There are 3 magic flags that can be appended to the end of each regular
expression to specify that the regex should match only filenames, only lowest
level dirs, or a full path. These flags are "[[dir]]", "[[file]]", and
"[[path]]". Example: >
    let NERDTreeIgnore=['\.d$[[dir]]', '\.o$[[file]]', 'tmp/cache$[[path]]']

This will cause all dirs ending in ".d" to be ignored, all files ending
in ".o" to be ignored, and the "cache" subdir of any "tmp" dir to
be ignored. All other "cache" dirs will be displayed.

When using the "[[path]]" tag on Windows, make sure you use escaped
backslashes for the separators in the regex, eg. 'Temp\\cache$[[path]]'

Note: to tell the NERDTree not to ignore any files you must use the following
line: >
    let NERDTreeIgnore=[]
<
The file filters can be turned on and off dynamically with the |NERDTree-f|
mapping.


*NERDTreeRespectWildIgnore*
Values: 0 or 1.
Default: 0.

If set to 1, the `'wildignore'` setting is respected.

*NERDTreeBookmarksFile*
Values: a path
Default: $HOME/.NERDTreeBookmarks

This is where bookmarks are saved. See |NERDTreeBookmarkCommands|.

*NERDTreeBookmarksSort*
Values: 0, 1, or 2
Default: 1

This setting controls the method by which the list of user bookmarks is
sorted. When sorted, bookmarks will render in alphabetical order by name.

If set to 0, the bookmarks list is not sorted.
If set to 1, the bookmarks list is sorted in a case-insensitive manner.
If set to 2, the bookmarks list is sorted in a case-sensitive manner.

*NERDTreeMarkBookmarks*
Values: 0 or 1
Default: 1

If set to 1, Bookmarks will be specially marked whenever the NERDTree is
rendered. Users of the |NERDTreeMinimalUI| setting may prefer to disable
this setting for even less visual clutter.

*NERDTreeMouseMode*
Values: 1, 2 or 3.
Default: 1.

If set to 1 then a double click on a node is required to open it.
If set to 2 then a single click will open dir nodes, while a double
click will still be required for file nodes.
If set to 3 then a single click will open any node.

Note: a double click anywhere on a line that a tree node is on will
activate it, but all single-click activations must be done on name of the node
itself. For example, if you have the following node: >
    | | |-application.rb
<
then (to single click activate it) you must click somewhere in
'application.rb'.

*NERDTreeQuitOnOpen*
Values: 0,1,2 or 3.
Default: 0

This setting governs whether the NERDTree window or the bookmarks table closes
after opening a file with the |NERDTree-o|, |NERDTree-i|, |NERDTree-t| and
|NERDTree-T| mappings.

 Value  | NERDTree Window Behavior
 -------+-------------------------------------------------------
 0      | No change
 1      | Closes after opening a file
 2      | Closes the bookmark table after opening a bookmark
 3(1+2) | Same as both 1 and 2

*NERDTreeShowBookmarks*
Values: 0 or 1.
Default: 0.

If this setting is set to 1 then the bookmarks table will be displayed.

This setting can be toggled dynamically, per tree, with the |NERDTree-B|
mapping.

*NERDTreeShowFiles*
Values: 0 or 1.
Default: 1.

If this setting is set to 1 then files are displayed in the NERDTree. If it
is set to 0 then only dirs are displayed.

This setting can be toggled dynamically, per tree, with the |NERDTree-F|
mapping and is useful for drastically shrinking the tree when you are
navigating to a different part of the tree.

*NERDTreeShowFilesLines*
Values: 0 or 1.
Default: 0.

If this setting is set to 1 then the NERDTree shows number of lines for each
file.

This setting can be toggled dynamically, per tree, with the |NERDTree-L|
mapping.
Use one of the follow lines for this setting: >
    let NERDTreeShowFilesLines=0
    let NERDTreeShowFilesLines=1

*NERDTreeShowHidden*
Values: 0 or 1.
Default: 0.

This setting tells vim whether to display hidden files by default. This
setting can be dynamically toggled, per tree, with the |NERDTree-I| mapping.
Use one of the follow lines for this setting: >
    let NERDTreeShowHidden=0
    let NERDTreeShowHidden=1

*NERDTreeShowLineNumbers*
Values: 0 or 1.
Default: 0.

This setting tells vim whether to display line numbers for the NERDTree
window.  Use one of the follow lines for this setting: >
    let NERDTreeShowLineNumbers=0
    let NERDTreeShowLineNumbers=1

*NERDTreeSortOrder*
Values: a list of regular expressions.
Default: ['\/$', '*', '\.swp$',  '\.bak$', '\~$']

This setting is a list of regular expressions which are used to group or sort
the nodes under their parent.

For example, if the setting is: >
    ['\.vim$', '\.c$', '\.h$', '*', 'foobar']

then all .vim files will be grouped at the top, followed by all .c files then
all .h files. All files containing the string 'foobar' will be placed at the
end.  The star is a special flag: it tells the script that every node that
doesn't match any of the other regexps should be placed here.

If no star is present in NERDTreeSortOrder, then one is automatically
appended to the end of the list.

The regex '\/$' should be used to match dir nodes.

Files can also be sorted by 1) the modification timestamp, 2) the size, or 3)
the extension. dirs are always sorted by name. To accomplish this, the
following special flags are used:
  [[timestamp]]   [[-timestamp]]   [[size]]   [[-size]]   [[extension]]
The hyphen specifies a descending sort; extensions are sorted in ascending
order only. If placed at the beginning of the list, files are sorted according
to these flags first, and then grouped by the remaining items in the list. If
the flags are in any other position of the list, this special sorting is done
secondarily. See examples 4, 5, and 6 below.

After this sorting is done, the files in each group are sorted alphabetically.

Examples: >
    (1) ['*', '\/$']
    (2) []
    (3) ['\/$', '\.rb$', '\.php$', '*', '\.swp$',  '\.bak$', '\~$']
    (4) ['[[-size]]']
    (5) ['\/$', '*', '[[timestamp]]']
    (6) ['foo','\/$','[[extension]]']
<
1. dirs will appear last, everything else will appear above.
2. Everything will simply appear in alphabetical order.
3. dirs will appear first, then ruby and php. Swap files, bak files
   and vim backup files will appear last with everything else preceding them.
4. Everything is sorted by size, largest to smallest, with dirs
   considered to have size 0 bytes.
5. dirs will appear first alphabetically, followed by files, sorted by
   timestamp, oldest first.
6. Files and dirs matching 'foo' first, followed by other dirs,
   then all other files. Each section of files is sorted by file extension.

*NERDTreeStatusline*
Values: Any valid `'statusline'` setting.
Default: %{exists('b:NERDTree')?b:NERDTree.root.path.str():''}

Defines the value for the `'statusline'` setting in NERDTree windows.

Note: The setting is actually applied using |:let-&|, not |:set|, so
escaping spaces is not necessary.

Setting this to -1 will deactivate it so that your global `'statusline'`
setting is used.

*NERDTreeWinPos*
Values: "left", "right", "top" or "bottom"
Default: "left".

This setting is used to determine where NERDTree window is placed on the
screen.

This setting makes it possible to use two different explorer plugins
simultaneously. For example, you could have the taglist plugin on the left of
the window and the NERDTree on the right.

When setting this variable to "top" or "bottom" make sure to also change the
|NERDTreeWinSize| to a more reasonable size.

For example:
    let g:NERDTreeWinSize = 15

*NERDTreeWinSize*
Values: a positive integer.
Default: 31.

This setting is used to change the size of the NERDTree when it is loaded.

*NERDTreeMinimalUI*
Values: 0 or 1
Default: 0

This setting disables the 'Bookmarks' label 'Press ? for help' text. Use one
of the following lines for this setting: >
    let NERDTreeMinimalUI=0
    let NERDTreeMinimalUI=1

*NERDTreeMinimalMenu*
Values: 0 or 1
Default: 0

This setting makes NERDTree use a smaller, more compact menu for adding,
copying, deleting nodes. This menu fits on a single line so Vim doesn't need to
scroll down to present it. This setting is recommended for users already
familiar with the menu items. It will look similar to this:

  Menu: [ (a)dd ,m,d,r,o,q,c,l] (Use j/k/enter or shortcut):

An action can be selected with its shortcut key or with the NERDTreeMenuUp and
NERDTreeMenuDown keys, then pressing enter.

Use one of the following lines for this setting: >
    let NERDTreeMinimalMenu=0
    let NERDTreeMinimalMenu=1

*NERDTreeCascadeSingleChildDir*
Values: 0 or 1
Default: 1.

When displaying dir nodes, this setting tells NERDTree to collapse
dirs that have only one child. Use one of the following lines for this
setting: >
    let NERDTreeCascadeSingleChildDir=0
    let NERDTreeCascadeSingleChildDir=1

*NERDTreeCascadeOpenSingleChildDir*
Values: 0 or 1
Default: 1.

When opening dir nodes, this setting tells NERDTree to recursively open
dirs that have only one child which is also a dir. NERDTree will
stop when it finds a dir that contains anything but another single
dir. This setting also causes the |NERDTree-x| mapping to close
dirs in the same manner. This setting may be useful for Java projects.
Use one of the following lines for this setting: >
    let NERDTreeCascadeOpenSingleChildDir=0
    let NERDTreeCascadeOpenSingleChildDir=1

*NERDTreeAutoDeleteBuffer*
Values: 0 or 1
Default: 0.

When using a context menu to delete or rename a file you may also want to
delete the buffer which is no more valid. If the setting is not set you will
see a confirmation if you really want to delete an old buffer. If you always
press 'y' then it's worth it to set this setting to 1. Use one of the
following lines for this setting: >
    let NERDTreeAutoDeleteBuffer=0
    let NERDTreeAutoDeleteBuffer=1

*NERDTreeCreatePrefix*
Values: Any valid command prefix.
Default: "silent".

Internally, NERDTree uses the |:edit| command to create a buffer in which to
display its tree view. You can augment this behavior by specifying a prefix
string such as "keepalt" or similar. For example, to have NERDTree create its
tree window using `silent keepalt keepjumps edit`: >
    let NERDTreeCreatePrefix='silent keepalt keepjumps'


*NERDTreeDirArrowCollapsible* *NERDTreeDirArrowExpandable*
Values: Any single character.
Defaults:   Windows: ~ and +    Others: ▾ and ▸

These characters indicate whether a dir is collapsible or expandable.
Example: >
    let NERDTreeDirArrowExpandable=">"
    let NERDTreeDirArrowCollapsible="v"
<
They can be set to "\u00a0" to replace the arrows with a non-breaking space.
If you do this you may need to change the node delimiter. See
|NERDTreeNodeDelimiter|. You cannot use the same character for both the arrows
and the delimiter.

Alternatively, they can be set to '' (an empty string). This removes the
arrows and the single space that follows them, shifting the entire tree two
character positions to the left.

*NERDTreeNodeDelimiter*
Values: Any single character.
Default: varies (see below)

This character is used to separate the file or dir name from the rest of
the characters in the line of text. It allows filenames to contain special
characters that are otherwise used in the NERDTree, such as square brackets,
braces, trailing asterisk, and leading space. For more details, see the
responsible pull request: https://github.com/preservim/nerdtree/pull/868.

The default value of this variable depends on the features compiled into your
vim and the values of |NERDTreeDirArrowCollapsible| and
|NERDTreeDirArrowExpandable|.
  * If your vim is compiled with the +conceal feature, it is the "\x07"
    (BEL) character, and it is hidden by setting 'conceallevel' to 2. If you
    use autocommands, make sure none of them change that setting in the
    NERD_Tree_* buffers.
  * If your vim does NOT have the +conceal feature and you're using "\u00a0"
    (non-breaking space) to hide the dir arrows, "\u00b7" (middle dot)
    is used as the default delimiter.
  * If neither condition above applies, NERDTree uses "\u00a0" (non-breaking
    space) as the default delimiter.

In the 2nd and 3rd cases, NERDTree will use the Ignore highlight group to
"hide" the delimiter. It should appear as an empty space.

Other plugins can interfere with these defaults, so if you need to change the
delimiter, be sure to choose a character that won't appear in your filenames
or any of the flags set by your installed NERDTree plugins. The suggestions
below are but a few of the many possibilities. Remember to use double quotes
when specifying by hex or Unicode. >
    let NERDTreeNodeDelimiter="\x07"     "bell
    let NERDTreeNodeDelimiter="\u00b7"   "middle dot
    let NERDTreeNodeDelimiter="\u00a0"   "non-breaking space
    let NERDTreeNodeDelimiter="😀"       "smiley face

*NERDTreeCustomOpenArgs*
Values: A nested dictionary, as described below
Default: {'file': {'reuse': 'all', 'where': 'p'}, 'dir': {}}

This dictionary contains two keys, 'file' and 'dir', whose values each are
another dictionary. The inner dictionary is a set of parameters used by
|NERDTree-<CR>| to open a file or dir. Setting these parameters allows you
to customize the way the node is opened. The default value matches what
|NERDTree-o| does. To change that behavior, use these keys and
values in the inner dictionaries:

'where':    specifies whether the node should be opened in a new split ("h" or
            "v"), in a new tab ("t") or, in the last window ("p").
'reuse':    if file is already shown in a window, jump there; takes values
            "all", "currenttab", or empty
'keepopen': boolean (0 or 1); if true, the tree window will not be closed
'stay':     boolean (0 or 1); if true, remain in tree window after opening

For example:
To open files and dirs (creating a new NERDTree) in a new tab, >
    {'file':{'where': 't'}, 'dir':{'where':'t'}}

To open a file always in the current tab, and expand dirs in place, >
    {'file': {'reuse':'currenttab', 'where':'p', 'keepopen':1, 'stay':1}}


## 4. The NERDTree API

*NERDTreeAPI*

The NERDTree script allows you to add custom key mappings and menu items via
a set of API calls. Any scripts that use this API should be placed in
~/.vim/nerdtree_plugin/ (*nix) or ~/vimfiles/nerdtree_plugin (windows).

The script exposes some prototype objects that can be used to manipulate the
tree and/or get information from it: >
    g:NERDTreePath
    g:NERDTreeDirNode
    g:NERDTreeFileNode
    g:NERDTreeBookmark
<
See the code/comments in NERD_tree.vim to find how to use these objects. The
following code conventions are used:
    * class members start with a capital letter
    * instance members start with a lower case letter
    * private members start with an underscore

See this blog post for more details:
 http://got-ravings.blogspot.com/2008/09/vim-pr0n-prototype-based-objects.html

A number of API functions take a callback arg to call. The callback can
be either a string with the name of a function to call, or a |Funcref| object
which will be called directly.

### 4.1. Key map API

*NERDTreeKeymapAPI*


NERDTreeAddKeyMap({options})                               *NERDTreeAddKeyMap()*
    Adds a new keymapping for all NERDTree buffers.
    {options} must be a dictionary, and must contain the following keys:
    "key" - the trigger key for the new mapping
    "callback" - the function the new mapping will be bound to
    "quickhelpText" - the text that will appear in the quickhelp (see
    |NERDTree-?|)
    "override" - if 1 then this new mapping will override whatever previous
    mapping was defined for the key/scope combo. Useful for overriding the
    default mappings.

    Additionally, a "scope" arg may be supplied. This constrains the
    mapping so that it is only activated if the cursor is on a certain object.
    That object is then passed into the handling method. Possible values are:

      "FileNode" .... a file node
      "DirNode" ..... a dir node
      "Node" ........ a file node OR a dir node
      "Bookmark" .... a bookmark
      "all" ......... global scope; handler receives no args (default)

    Example: >
        call NERDTreeAddKeyMap({
               \ 'key': 'foo',
               \ 'callback': 'NERDTreeEchoPathHandler',
               \ 'quickhelpText': 'echo full path of current node',
               \ 'scope': 'DirNode' })

        function! NERDTreeEchoPathHandler(dirnode)
            echo a:dirnode.path.str()
        endfunction
<
    This code should sit in a file like ~/.vim/nerdtree_plugin/mymapping.vim.
    It adds a (redundant) mapping on 'foo' which changes vim's CWD to that of
    the current dir node. Note this mapping will only fire when the
    cursor is on a dir node.

### 4.2. Menu API

*NERDTreeMenuAPI*

NERDTreeAddSubmenu({options})                             *NERDTreeAddSubmenu()*
    Creates and returns a new submenu.

    {options} must be a dictionary and must contain the following keys:
    "text" - the text of the submenu that the user will see
    "shortcut" - a shortcut key for the submenu (need not be unique)

    The following keys are optional:
    "isActiveCallback" - a function that will be called to determine whether
    this submenu item will be displayed or not. The callback function must
    return 0 or 1.
    "parent" - the parent submenu of the new submenu (returned from a previous
    invocation of NERDTreeAddSubmenu()). If this key is left out then the new
    submenu will sit under the top level menu.

    See below for an example.

NERDTreeAddMenuItem({options})                           *NERDTreeAddMenuItem()*
    Adds a new menu item to the NERDTree menu (see |NERDTreeMenu|).

    {options} must be a dictionary and must contain the
    following keys:
    "text" - the text of the menu item which the user will see
    "shortcut" - a shortcut key for the menu item (need not be unique)
    "callback" - the function that will be called when the user activates the
    menu item.

    The following keys are optional:
    "isActiveCallback" - a function that will be called to determine whether
    this menu item will be displayed or not. The callback function must return
    0 or 1.
    "parent" - if the menu item belongs under a submenu then this key must be
    specified. This value for this key will be the object that
    was returned when the submenu was created with |NERDTreeAddSubmenu()|.

    See below for an example.

NERDTreeAddMenuSeparator([{options}])               *NERDTreeAddMenuSeparator()*
    Adds a menu separator (a row of dashes).

    {options} is an optional dictionary that may contain the following keys:
    "isActiveCallback" - see description in |NERDTreeAddMenuItem()|.

Below is an example of the menu API in action. >
    call NERDTreeAddMenuSeparator()

    call NERDTreeAddMenuItem({
                \ 'text': 'a (t)op level menu item',
                \ 'shortcut': 't',
                \ 'callback': 'SomeFunction' })

    let submenu = NERDTreeAddSubmenu({
                \ 'text': 'a (s)ub menu',
                \ 'shortcut': 's' })

    call NERDTreeAddMenuItem({
                \ 'text': '(n)ested item 1',
                \ 'shortcut': 'n',
                \ 'callback': 'SomeFunction',
                \ 'parent': submenu })

    call NERDTreeAddMenuItem({
                \ 'text': '(n)ested item 2',
                \ 'shortcut': 'n',
                \ 'callback': 'SomeFunction',
                \ 'parent': submenu })

This will create the following menu:
    --------------------
    a (t)op level menu item
    a (s)ub menu

Where selecting "a (s)ub menu" will lead to a second menu: >
  (n)ested item 1
  (n)ested item 2

When any of the 3 concrete menu items are selected the function "SomeFunction"
will be called.


### 4.3 Menu API

NERDTreeAddPathFilter(callback)

*NERDTreeAddPathFilter()*

Path filters are essentially a more powerful version of  |NERDTreeIgnore|.
If the simple regex matching in |NERDTreeIgnore| is not enough then use
|NERDTreeAddPathFilter()| to add a callback function that paths will be
checked against when the decision to ignore them is made. Example >

    call NERDTreeAddPathFilter('MyFilter')

    function! MyFilter(params)
        "params is a dict containing keys: 'nerdtree' and 'path' which are
        "g:NERDTree and g:NERDTreePath objects

        "return 1 to ignore params['path'] or 0 otherwise
    endfunction


### 4.4 Path Listener API

*NERDTreePathListenerAPI*

Use this API if you want to run a callback for events on Path objects. E.G >

    call g:NERDTreePathNotifier.AddListener("init", "MyListener")

    "....

    function! MyListener(event)
        "This function will be called whenever a Path object is created.

        "a:event is an object that contains a bunch of relevant info -
        "including the affected path. See lib/nerdtree/event.vim for details.
    endfunction

Current events supported:
  init ~
  refresh ~
  refreshFlags ~


NERDTreeRender()
*NERDTreeRender()*

Re-renders the NERDTree buffer. Useful if you change the state of the tree and you want to it to be reflected in the UI.
