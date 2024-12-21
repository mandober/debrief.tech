# rlwrap

https://www.systutorials.com/docs/linux/man/1-rlwrap/

## rlwrap options

https://www.systutorials.com/docs/linux/man/1-rlwrap/

rlwrap [rlwrap-options] command [command-options]

rlwrap runs the specified command, intercepting user input in order to provide readline's line editing, persistent history and completion.

-A, --ansi-colour-aware     
  Prompts that use colour will confuse rlwrap, especially at the end of long input lines. This option will make rlwrap better behaved in such cases. If the prompt contains anything fancier than ANSI colour codes, this option may actually make things worse.

-c, --complete-filenames    
  Complete filenames (filename completion is always case-sensitive, even with the -i option). When doing this, rlwrap keeps track of commands working directory.

-f, --file FILE   
  Split file into words and add them to the completion word list. This option can be given more than once, and adds to the default completion list in `$RLWRAP_HOME` or `/usr/share/rlwrap/completions`. Specifying `-f .` will make rlwrap use the current history file as a completion word list.
  *--file $HOME/.mit_scheme_bindings.txt*

-H, --history-filename FILE    
  Read command history from file (and write it back there if --histsize >= 0)
  *--history-filename $HOME/.mit_scheme_history*

-I, --pass-sigint-as-sigterm    
  Send a TERM signal to command when an INT is received (e.g. when you press CTRL-C).

-r, --remember
  Put all words seen on in- and output on the completion list.

-s, --histsize N
Limit the history list to N entries, truncating the history file (default: 300). A negative size -N means the same as N, but treats the history file as read-only.

Wrap gauche (a Scheme interpreter) with a bold blue prompt, enable multi-line editing (using .scm as filename extension) and don't consider single quotes as quotes (so that the parentheses in e.g. `(print 'q)` match)
`rlwrap -pBlue -m -M .scm -q'' gosh`
