# Buffers

## Commands
- `:bd` (buffer destroy) close the current buffer
- `:ls` or `:buffers` lists all buffers
- `:e filename` to edit an existing file or a new file. 
  When a file is edited, the file is read into a new buffer that holds a temporary copy of the file (or an empty buffer for a new file). Editing makes changes to the buffer. To save a file, the original file is replaced by writing the buffer to disk.
- `:new` creates a new window displaying the contents of a new (empty) buffer
- `:ls` or `:buffers` lists all buffers
  1. column displays the number assigned to each buffer
  2. column describes the state of the buffer (see `:help :ls`)
  3. column holds the file name associated with the buffer

- c-O   Jump to the older position in the jump list
- c-I   Jump to the newer position in the jump list



A buffer can be in one of 3 states:
- active   - when buffer is shown in a window
- hidden   - when buffer is not shown in a visible window
- inactive - when buffer is not shown and doesn't contain anything

You can use multiple windows to display one buffer (one file content). Also, you can use several
windows to display a few different buffers.

Buffer, window, tab
- **buffer** is the in-memory text of a file. In addition, an empty buffer with no associated file can be created to allow the entry of text.
- **window** is a viewport on a buffer. You can use multiple windows on one buffer, or several windows on different buffers.
- **tab** is a collection of windows.

Use `-o` and `-O` args to open a window for each file
- `-o` arg splits the window horizontally
- `-O` arg splits the window vertically
- e.g. `vim -O ~/.vim/vimrc ~/.vim/mappings.vim`
