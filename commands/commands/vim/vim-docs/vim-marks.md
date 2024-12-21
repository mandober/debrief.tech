# Vim :: Marks

Marks are a non-standard (concerning editors in general) functionality that Vim provides to allow users to bookmark places in a document (buffer, file) and later jump to those places quickly.

Each mark has a distinctive name, which is just a single alphabetic char (a letter). EaCH **mark** records the current location in terms of
- the current column
- the current line
- the current file (buffer)

Thus, a mark consists of a name and the location information.

There are 2 kinds of marks: local and global:
* *Local marks* have lowercase names (a-z), and they are tied to the current buffer. They are valid as long as the buffer is loaded. Once the buffer is deleted (inloaded), they are lost forever.
* *Global marks* have uppercase names (A-Z). They are saved, so they can be used across sessions.

- m{l} create
- m{L} create
- '{l} invoke
- `{l} invoke


Creating a mark
- `mm` creates a local mark named 'm'
- `mm` creates a global mark named 'M'

Recall
- 'm    Jump to the mark 'a' (actually to the BOL containing the mark)
- \`m   Jump to the mark 'a' (exact spot)
