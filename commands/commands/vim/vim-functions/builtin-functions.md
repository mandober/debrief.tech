# builtin-functions

`line()` takes a file position and returns the line number.
- `line('.')`  Current line, i.e. line with the cursor.
- `line('$')`  Last line of the current buffer.
- `line("'a")` Line with mark 'a'.
- `line('w0')` Top screen line.
- `line('w$')` Bottom screen line.

- `append({pos}, {text})`
takes a position {pos} and a {string} to append to a buffer. 
If {text} is a list, it goes through it, appending each item. 
