# Vim :: Glossary

## Buffer
A buffer is the in-memory text of a file. In addition, an empty buffer with no associated file can be created to allow the entry of text.

## Ex
Ex is a line-based text editor created at the time of proper consoles. Being line-based means the user edits the text by issuing (Ex) commands using a single line text interface. Vi and Vim, and its Vi's clones like Neovim, still use the very efficient Ex command mode today since it enables users to do a lot with few concise commands, like, e.g. issuing the search or search-and-replace commands and parameters.

https://en.wikipedia.org/wiki/Ex_(text_editor)
https://pubs.opengroup.org/onlinepubs/9699919799/utilities/ex.html

## Neovim
The Neovim project was initiated in 2014, as a Vim's fork after the Vim's development team refused to pursue multi-threading. With the 0.5 release on July 2, 2021, Neovim gained builtin support for the LSP, Tree-sitter, and more complete Lua support, including the support for configuration scripts written in Lua instead of VimL.

## netrw
The 'netrw' is Vim's builtin file manager (an OOBE plugin), also capable to connect to remote systems (unlike e.g. NEDRTree).

## Quickfix window

## Preview window

## Tab
A tab is a collection of windows.

## Vi
Vi /viːaɪ/ (for "visual") is a screen-oriented text editor originally created for Unix by Bill Joy as a visual mode for "ex" in 1975. The portable subset of Vi's behavior and programs based on it, and the Ex editor language supported within these programs, is described by (and thus standardized by) the POSIX and SUS (Single Unix Specification).
https://en.wikipedia.org/wiki/Vi_(text_editor)
https://pubs.opengroup.org/onlinepubs/9699919799/utilities/vi.html

## Vim
Vim was created by Bram Moolenaar in 1991. He derived it from a port of the "Stevie" editor, a Vi clone for Atari ST ported to Amiga, which had a lot of problems and was lacking features Vi had, but its source code was available so that was what Moolenaar used as the starting point. At the time of its first release, the name "Vim" was an acronym for "Vi IMitation", but this changed to "Vi IMproved" in 1993.

## VimL
"VimL" is Vim's built-in scripting language. Owing to its inefficiency, it has been superceeded by Vim8 scripting language. However, the two scripts can be used in parallel.

## Window
A window is a viewport on a buffer. There can be multiple windows on a buffer, or several windows on different buffers.
