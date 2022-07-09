# Readline Variables

Readline has variables that can be used to further customize its behavior. 
A variable may be set in the inputrc file with a statement of the form:
set varname value

* Except where noted, readline variables can take the values on or off (without regard to case). Unrecognized variable names are ignored. 
* When a variable value is read, empty or null values, "on" (case-insensitive), and "1" are equivalent to on. All other values are equivalent to off. 

bind -v	prints readline variables in reusable mode
bind -V	prints readline variables in human friendly mode


The variables and their default values are:

enable-keypad (Off)
When set to On, readline will try to enable the application keypad when it is called. 
Some systems need this to enable the arrow keys.

horizontal-scroll-mode (Off)
When set to On, makes readline use a single line for display, scrolling 
the input horizontally on a single screen line when it becomes longer 
than the screen width rather than wrapping to a new line.

comment-begin (`#')
The string that is inserted when the readline insert-comment command is executed. 
This command is bound to M-# in emacs mode and to # in vi command mode.

editing-mode (emacs)
Controls whether readline begins with a set of key bindings similar to Emacs or vi. 
editing-mode can be set to either emacs or vi.

show-mode-in-prompt (Off)
If set to On, add a character to the beginning of the prompt indicating 
the editing mode: emacs (@), vi command (:) or vi insertion (+).

echo-control-characters (On)
When set to On, on operating systems that indicate they support it, 
readline echoes a character corresponding to a signal generated from the keyboard

bell-style (audible)
Controls what happens when readline wants to ring the terminal bell. 
* If set to none, readline never rings the bell. 
* If set to visible, readline uses a visible bell if one is available. 
* If set to audible, readline attempts to ring the terminal's bell.

bind-tty-special-chars (On)
If set to On, readline attempts to bind the control characters treated 
specially by the kernel's terminal driver to their readline equivalents.

keymap (emacs)
Set the current readline keymap. 
The set of valid keymap names is: 
 emacs, emacs-standard, emacs-meta, emacs-ctlx, vi, vi-command, vi-insert. 
 (emacs is equivalent to emacs-standard and vi is equivalent to vi-command) 
The default value is emacs; the value of editing-mode also affects the default keymap.

keyseq-timeout (500)
Specifies the duration readline will wait for a character when reading an ambiguous 
key sequence (one that can form a complete key sequence using the input read so far, 
or can take additional input to complete a longer key sequence). 
- If no input is received within the timeout, readline will use the shorter but complete key sequence. 
- The value is specified in milliseconds, so a value of 1000 means that readline will wait one second for additional input. 
- If this variable is set to a value less than or equal to zero, or to a non-numeric value, readline will wait until another
  key is pressed to decide which key sequence to complete.



set bind-tty-special-chars on
set blink-matching-paren on
set byte-oriented off
set colored-stats on
set completion-ignore-case on
set completion-map-case on
set convert-meta off
set disable-completion off
set echo-control-characters on
set enable-keypad off
set enable-meta-key on
set expand-tilde off
set history-preserve-point off
set horizontal-scroll-mode off
set input-meta on
set mark-directories on
set mark-modified-lines off
set mark-symlinked-directories on
set match-hidden-files on
set menu-complete-display-prefix on
set meta-flag on
set output-meta on
set page-completions on
set prefer-visible-bell on
set print-completions-horizontally off
set revert-all-at-newline off
set show-all-if-ambiguous on
set show-all-if-unmodified on
set show-mode-in-prompt off
set skip-completed-text on
set visible-stats on
set bell-style visible
set comment-begin #
set completion-display-width -1
set completion-prefix-display-length 0
set completion-query-items 100
set editing-mode emacs
set history-size 500
set keymap emacs
set keyseq-timeout 500
