# Builtin commands

:e[dit] [++opt] [+cmd]
:ex [++opt] [+cmd] [file]
:e[dit]! [++opt] [+cmd]
:e[dit] [++opt] [+cmd] {file}
:e[dit]! [++opt] [+cmd] {file}
:e[dit] [++opt] [+cmd] #[count]
:ene[w]
:ene[w]!

:fin[d][!] [++opt] [+cmd] {file}
:{count}fin[d][!] [++opt] [+cmd] {file}

:vi[sual][!] [++opt] [+cmd] [file]
:vie[w][!] [++opt] [+cmd] file

*CTRL-^*
  Edit the alternate file, which is usually the previously edited file. This is a quick way to toggle between two files. It is equivalent to `:e #`, except that it also works when there is no file name. If the 'autowrite' or 'autowriteall' option is on and the buffer was changed, write it.

*{N}CTRL-^*
Edit the Nth file in the buffer list; equivalent to `:e #N`. 
This is a quick way to switch between files.

- `bufexists({buf})`
  The result is a Number, which is TRUE if a buffer called {buf} exists.

- bufwinnr({bufname})
  get the window's number. If there is a window open with that buffer name, we get its number. If there isn't, bufwinnr() returns -1.
- sbuffer({bufnr})
  opens a new split window to the buffer with the given number.
- bufnr({bufname})
  get buffer number of the buffer named {bufname}
- wincmd()
  executes a window-related comamnd


`:[N]new`
- Creates a new buffer with name *[No Name]*
- in a new window (N lines high/long)
- puts the cursor in it


`:execute {string}` takes a string and executes it as an Ex command.

`:normal {command}`
- `:normal` takes a string of normal mode commands to run
- `:normal!` use the normal command's default mapping (disregard user mappings)
