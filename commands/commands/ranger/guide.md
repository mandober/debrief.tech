# ranger :: Official User Guide


Contents
* [User interface](#User-interface-)
* [Basic navigation](#Basic-navigation-)
* [Key bindings and hints](#key-bindings-and-hints-)
* [Configuration](#configuration-)
* [Previews](#Previews-)
* [Tabs, Bookmarks, Travelling](#Tabs-Bookmarks-Travelling-)
* [Selection, Macros, Tags](#Selection-Macros-Tags-)
* [Filtering, Sorting, Directory Flattening](#Filtering-Sorting-Directory-Flattening-)
* [File operations](#File-operations-)
* [Using Shell and Flags](#Using-Shell-and-Flags-)
* [More tips](#More-tips-)


# User interface

The main window consists of 3 panels (this layout is called Miller columns):
- left: parent dir
- middle: cwd contents
- right: preview, etc.

The current file's attributes are at the bottom and the cwd path is at the top.

The ranger uses the `hjkl` keys for navigation and other [vim](http://www.vim.org) conventions: `yy` copy, `pp` paste, `dd` cut. More complex functions are invoked with a colon which opens ranger's console where you can manually enter commands.

ranger allows you to create new tabs (a la web browser) and switch between them with `Alt-number` or `Tab`. With only 2 tabs, they behave like mc's panels.

## Basic navigation

* movement by arrow keys or
- `j` move up
- `k` move down
- `l` chdir or open a file
- `h` parent dir


More useful keys:  
`i` inspect file or exit from inspecting file. Inspecting a file means to show a preview of the current file fullscreen, available for scrolling.
`q` quit. You can use this key to close active tab, quit from inspecting or quit from ranger if this is the last tab. 

Key bindings and hints [^](#Contents)
================================

A lot of commands can be performed using key bindings, making use of the hints to find the correct mapping. 

Command hints show up whenever a mapping has multiple continuations:  
`g`  for navigation and tabs  
`r`  for :open_with command  
`y`  for yank(copy)  
`d`  for cut/delete  
`p`  for paste  
`o`  for sort  
`.`  for filter_stack  
`z`  for changing settings  
`u`  for "undo"  
`M`  for linemode  
`+`, `-`, `=` for setting access rights to files

Command hints consist of keys in the left column and corresponding commands in right column. When you press a key the corresponding command is invoked or further hints are revealed.


Configuration [^](#Contents)
=============================

`ranger` uses 4 main configuration files:

-   `rc.conf` is used for setting various options and binding keys
    to functions.
-   `rifle.conf` decides which program to use for opening a file.
-   `scope.sh` is a shell script used to generate previews for
    various file types.
-   `commands.py` contains various functions' implementation, written in
    Python, used to modify `ranger's` behavior, and implement your own
    [[Custom Commands]].

Use `ranger --copy-config=rc` or one of `rifle, scope, commands` to copy the
default config files to `~/.config/ranger` and modify them there, only copy the
files you want to edit. This way ranger won't keep using outdated configuration
files when you update it, except for the ones you do copy, you're responsible for
keeping those up to date.
Be aware that for `rc.conf` and `commands.py`, ranger reads *both* the global
*and* the user's config (in that order). It allows the user to maintain only a small
config which sets only the things not set in the default one.  For `scope.sh`
and `rifle.conf`, ranger reads *either* the user's *or* the global config.

The best practice is to only add the options/keybindings you actually want to
change to your `rc.conf`, rather than to have a complete copy of the default
`rc.conf`.  This eliminates the need to update your config manually and gives you
the benefits from new options/keybindings of future ranger versions.
If you want to keep the full `rc.conf` though, you may want to set the
environment variable `RANGER_LOAD_DEFAULT_RC` to `FALSE` to avoid loading
*both* the default and your own `rc.conf`.  In this case you have to update your
config manually though.

Changing settings on the fly
----------------------------

You can change some ranger settings without editing config files.
These changes are valid for the current ranger session only.
To do this, press the `z` key and use the command hints. For example,
`zh` toggles showing/hiding hidden files.

Previews [^](#Contents)
========

All file previews are supplied by the `scope.sh` config file. It is a
regular shell script and it's behavior is documented in detail in comments.

Note that it's possible to replace `scope.sh` with a script in other
languages or compiled binaries. It only has to follow `scope.sh`'s calling
conventions and its return codes.

Image previews
--------------

A very special case of the previews are the image previews. Yes,
`ranger` can display images in your terminal. It uses a utility
supplied with the `w3m` web browser (sometimes packaged in a separate
package, like `w3m-img` in Debian). While it's reliable most of the
time, please be aware that it is a hack and may behave very strangely at
times.

`ranger` supports reliable image previews in some terminals that support them
like `urxvt`, `iTerm2`, `Kitty` and `Terminology`. To enable it, open your `rc.conf`
file and set `preview_images_method` to `urxvt`, `iterm2`, `kitty` or `terminology`,
depending on your terminal. For the `urxvt` method to work on Arch Linux it might be 
needed to install the `rxvt-unicode-pixbuf` package instead of the regular 
`rxvt-unicode`.

To toggle image previewing, use `zi`.

Custom image previews
---------------------

In recent versions of `ranger`, the mechanism of the image previews
was extended and generalized. When calling `scope.sh`, `ranger` sets the
`$cached` environment variable containing a unique path to a file
where the image preview may be generated if needed. `scope.sh` may then
save an image to that path and exit with the exitcode `6` (documented
inside `scope.sh`, consult the comment at the top) to tell `ranger` to
use it. 
  
In other words if you can generate a jpg from a file, `ranger` is
able to show a graphical preview for it. Videos, PDFs, all sort of
files.

Tabs, Bookmarks, Travelling [^](#Contents)
===========================

Tabs and/or Bookmarks are used for getting quick access to some directories.
You can also go through directories using the `:travel` command.
Ranger does also have command hints for some navigation shortcuts.
Press `g` to invoke it.

Tabs
----

you may create tabs for each directory want to access quickly.
The tabs are numbered. To switch to the N-th tab,
press `Alt-N`, where `N` is the tab number. If such tab does not exist
yet, it will be created. You can also switch between tabs, using `Tab`
and `shift-Tab` keys. To close a tab, press `q` (if you close the
last tab, the entire `ranger` process will close).

Bookmarks
---------

A bookmark is just a character that is used for getting quick access to a directory.
You can bookmark the current folder using `m<key>` and quickly access it from any 
other place using `'<key>`. Use `''` to move back. Ranger saves your bookmarks by default

Travelling
-----------

What if you need fast access to a directory, that is not in your bookmarks? In that case, you 
can use the `:travel` command. Just type `:travel ` in your ranger console and then type
the first letters of a directory or file. `:travel` finds matches in the current directory and automatically enters them when unique, waiting for the name of another directory or file. So, you can go travel through multiple nested directories by just partly typing their names.

Selection, Macros, Tags [^](#Contents)
========================

Selection and Macros are used in ranger to specify file(s), on which a command will be performed.
Commands by default work on the files in the selection, but you can specify other files using macros.
You can also use `:mark_tag` to select all tagged files.

Selection
---------

Ranger commands usually work on the selection. The selection is all
marked files if there are any, otherwise the current file.
  
You can mark the current file by pressing `space`, `v` inverts the
selection and `V` enters a visual mode where you can mark a range
of files using movement or search.
To mark/unmark files matching regular expressions, use `:mark REGEX`
and `:unmark REGEX` respectively. To mark/unmark files by tag, use
`:mark_tag TAG` and `:unmark_tag TAG` respectively.
To unmark all marked files, use `:unmark` or `uv`.
  
A yellow __Mrk__ symbol at the bottom right indicates that there are
marked files in this directory.

Macros
------
If you type commands in the ranger console, you can use one of the macros
below to abbreviate things:

`%f`   the highlighted file  
`%d`   the path of the current directory  
`%s`   the selected files in the current directory  
`%t`   all tagged files in the current directory  
`%c`   the full paths of the currently copied/cut files  
`%p`   the full paths of selected files  
  
Suppose, you have some files selected, but wanted to run the `:delete` command
on a single file.
If you run just `:delete` it will delete all the files in your selection, because
commands operate on the selection by default. 
So you need to highlight the file you need to delete, and type the following command
in the console, `:delete %f`.

Tags
-----

Tags are single characters which are displayed to the left of a filename.
By pressing `t` you can set the default tag (which is an asterisk `*`) on
a file or remove a tag from the file. To remove tags from the selection,
use `ut`. You are not limited to the default tag. Pressing a quotation 
mark `"` followed by any other character sets this character as a tag
for the file. Tags are persistent and will be there until you remove 
them manually. It may be used for example for marking ebooks you've read
or files that need some action.
  
The tags may also be used to automatically enable some options in
certain directories. Refer to the documentation of the `:setintag`
command.

Filtering, Sorting, Directory Flattening [^](#Contents)
========================================

If there are too many files in the current directory, you can use filtering (`zf` or `zz`) to show only files matching your regular expression.
Run `:filter REGEX` to show only files matching REGEX and `:filter` to reset filter

There's also the `:filter_stack` functionality, key `.`. You can add filters to a stack, including binary operators. By default all the filters apply one by one and a file has to pass each of them. Using the OR combinator, `.|`, you can combine filters in an OR relation so files pass the filter if they satisfy either one. For example, `.l.ttext<CR>.|`, would only show symlinks or files with a MIME type containing "text". Use `..` at any time to view your current `filter_stack`. Use `.c` to clear the `filter_stack`.
  
You can also sort files, by pressing `o` and choosing your preferred way of sorting from the hints. 

__TIP 1:__ if you want to sort folders by size, you need to get size of their content. You can do it by selecting all files/folders (`v` key) and pressing keys`dc`. And then just press `os` to sort files/folders by size.  

__TIP 2:__ You can also see a list of folders, sorted by their size (from biggest to smallest) using `dU`. This keybinding invokes the shell command `du`, sorts its result and shows it you.

Directory flattening
--------------------

If you're browsing a moderately nested directory tree, you may find
`:flat N` useful. It allows browsing a directory tree in a linear
fashion: all the files up to the Nth level are shown together. It's a
bit hard to explain so just call `:flat 1` and observe what happens.
The argument is the maximum number of directories to flatten. Pass -1
for no limit (use with caution!) and 0 to disable `:flat`.


File operations [^](#Contents)
==============================  

Opening, moving, copy-pasting
-------

To open a file and let Ranger choose which program to use to open it with (via
[`rifle`](#Rifle)), just press Enter. To choose yourself, press `r`, and either choose
from the list or type the program you want to use. You can also use the command
`:open_with`.

To add a file handler to Ranger's repertoire, run the command `ranger
--copy-config=rifle`, then edit the resulting file. For example, to add 
Kolourpaint as an image editor, you could add:

 
    mime ^image, has kolourpaint, X, flag f = kolourpaint -- "$@"
 

The order of statements in this file reflects the order programs will be used
and appear on the `r` list in. 



To copy a file, highlight it, press `yy` to mark it for copying
(analogously to copying a line in `vim` with `yy`), then navigate to a
target directory (or switch a tab if you decided to do it the "`mc`
way") and then press "pp" to paste it (again, almost like in `vim`).

(To copy only the directory, filename, or file path with name as text to
your clipboard - requires that [xclip](https://github.com/astrand/xclip),
[xsel](http://www.vergenet.net/~conrad/software/xsel/) or
[pbcopy](https://www.unix.com/man-page/all/1/pbcopy/) (in case of mac os)
is installed - use `yd`, `yn`, and `yp` respectively.
Copying actual files remains internal to ranger.)

Moving a file differs very little from copying it: just use `dd` instead
of `yy` at the beginning.

To copy/move multiple files, just mark them with `Space` then use
`dd`/`yy`. If you want to operate on multiple files stored in different
directories, you may use `ya`/`da` to add them to the list of files to be
copied/moved before pasting them.

(Note that the copy/cut buffers can be used for other operations as
well, by using the `%c` macro in your commands. For example, adding
files to the cut/copy buffer using `ya`/`da` then using the `:shell -w
printf %c | xargs rm` command allows you to delete multiple files in
multiple directories. Remember to clear the buffer once you're done
using `ud`/`uy`.)

If you'd like to copy files from one ranger instance to another, type
`:save_copy_buffer` in one and `:load_copy_buffer` in the other ranger
instance.  This method can also be used to export a list of files.  They are
saved in the file `~/.config/ranger/copy_buffer`.

### Rifle


`rifle` is a powerful smart file opener bundled with `ranger`. It
tries to guess with what program it should open a given file based on
its MIME type, extension, the available programs and a few other
factors. It is configured with the `rifle.conf` file. It is used by
`ranger` internally but may be used as a standalone program too.

Renaming
--------
To rename a file just highlight it and press `cw` like you would change 
a word with vim, in the bottom of the screen the `:rename` command will appear
waiting for the new file name, type it and press enter. You can also use the %s
when renaming, for example, if you would like to only change the file extension,
you can do `:rename %s.txt`. There's also the `I` and `A` keybindings which
open the console with a rename with the cursor at the start, respectively end,
of the file name.

Bulk renaming 
-------------

`ranger` supports bulk file renaming with the `:bulkrename` command.
Mark the files that you want to rename and call `:bulkrename`. It
should open a file containing a list of these files in your text
editor (determined with `rifle`). You may freely change the names in
that file. When you are done, save the file and close the editor.
`ranger` will show you a preview of what will happen in a few moments.

`:bulkrename` works great with `:flat`!

Deleting and creating
---------------------
You can delete files from selection using `:delete` command. To create file 
or directory, use `:touch FILENAME` and `:mkdir DIRNAME` respectively

Using shell and Flags [^](#Contents)
=====================================
Ranger allows you to use shell. Just type your shell command in ranger's console after `:shell` and press `Enter` to run it. You can use flags there to run program/command in some special way(with root rights, in background, etc) 

Flags
------

Flags is used to make an external command run in some custom way. 

use flag `w` if you need to see output of external command, like this `:shell -w free`  
use flag `t` to fork console program (run in a new terminal window), like this `:shell -t nano`  
use flag `f` to fork GUI program, , like this `:shell -f firefox`  
use flag `r` to run program with root rights. You can use more than one flag at the same time, like this `:shell -rw apt update`

To get more info about flags, go here [Ranger Man #FLAGS](https://ranger.github.io/ranger.1.html#FLAGS)


More tips [^](#Contents)
=========

Getting Help
------------

You can get help while using Ranger by pressing `?`, followed by:

-   `m`: opens the man page for ranger
-   `k`: opens a list of keybindings
-   `c`: opens a list of available commands and descriptions 
-   `s`: opens a list of settings and their current values


Metadata
--------

Storing the file metadata is a brand new feature of `ranger`. It may
be used to add arbitrary key-value data to any file. Calling `:meta
title a very interesting title` will set the tag "title" of the
current file to "a very interesting title".

`:meta` is most commonly used in conjunction with `:linemode`. The
built-in linemodes are bound to "M" followed by some letter. At the
moment of writing this guide, there are 6 built-in linemodes:

-   `filename`: no metadata, the default mode of ranger,
-   `permissions`: file permissions are displayed next to the files,
-   `fileinfo`: show file type information based on shell `file` commmand
-   `mtime`: show the modified time of files
-   `sizemtime`: show the size and the modified time
-   `metatitle`: see below.

The last line mode, `metatitle`, is extremely handy for organizing all
sorts of documents: books, movies, pictures and more. It displays the
files based on their metadata. The current format is:
`[[year - ]title] alignment [authors]`. Bracketed content is ignored
if empty. The `title` field is mandatory for this to work. To define
a custom linemode, please refer to this page:
[[Custom linemodes|Custom linemodes]].

`:meta` stores the metadata in the ".metadata.json" file for each
directory in which it is used.
 