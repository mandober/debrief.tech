# vim tabs

A tab is a collection of windows; a layout for windows.

In most modern apps, a tab hosts a file, and when you close it, that file goes away. In Vim, a tab does not represent an open file. *When you close a tab, you are not closing a file*. You are only closing the layout. Files opened in that layout are not closed - they are still open in their associated buffers.

- :tabnew {file}      Open file in a new tab
- :tabclose           Close current tab
- :tabnext            Go to tab next
- :tabprevious        Go to tab prev
- :tablast            Go to tab last
- :tabfirst           Go to tab first

To start Vim with multiple tabs, you can do this from the terminal:

    vim -p file1.vim file2.vim file3.vim
