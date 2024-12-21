# vim spellcheck

Vim must be compiled with `+syntax`. There also is a *vimspell* plugin. If you have it you can do ":help vimspell" to find about it. But you will probably want to get rid of the plugin and use the 'spell' option instead, it works better.

## Keys

- :set spell    Turn on spell checker
- [s, [S        jump to prev spelling error
- ]s, ]S        jump to next spelling error

on misspelled word:
- zg            identifies bad word as good (ignore it henceforth)
- zw            identifies good word as bad
- z=            list corrections from *ispell* program
- 1z=           replace a spelling error with the first suggested correction


For Vim to be able to add these words to a custom dictionary, you must define your *spellfile*. Vim allows you to define as many spellfiles as you'd like. So you'd have one dictionary for acronyms you need for one type of file without 'contaminating' another dictionary.

For example, `:set spellfile=.spellfile.sailing.add` creates a custom wordlist where you can put all your arcane sailing acronyms, and then choose not to load that dictionary while working on your medical thesis.

This is useful but not perfect - I happen to think emacs has the advantage here - and consequently prefer to exit vim and use the *ispell* program to spell check text files already written; the advantage is no highlighted text distracts you.




## Quick start

Switch on spell checking: 
`:setlocal spell spelllang=en_us`



## Remarks on spell checking
## Generating a spell file
## Spell file format
