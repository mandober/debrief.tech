bash

bind
Display current readline key and function bindings, bind a key sequence to a readline function or macro, or set a readline variable. 

bind [-m keymap] [-lpsvPSVX]
bind [-m keymap] [-q function] [-u function] [-r keyseq]
bind [-m keymap] -f filename
bind [-m keymap] -x keyseq:shell-command
bind [-m keymap] keyseq:function-name
bind readline-command

Each non-option argument is a command as it would appear in .inputrc, but each binding or command must be passed as a separate argument, e.g.:
bind '"\C-x\C-r": re-read-init-file'
bind '"\e[3~": delete-char'


Options, if supplied, have the following meanings:

-l   			List the names of all readline functions.
-p   			Display readline function names and bindings formatted for re-using.
-P   			Current readline function names and bindings.

-s   			Display readline key sequences bound to macros and the strings they output formatted for re-using
-S   			Display readline key sequences bound to macros and the strings they output.

-v   			Display readline variable names and values formatted for re-using
-V   			Current readline variable names and values.

-f filename  	Read key bindings from filename.

-q function  	Query about which keys invoke named readline function. bind -q accept-line  #> accept-line can be invoked via "\C-j", "\C-m".
-u function  	Unbind all keys bound to the named readline function.

-r keyseq    	Remove any current binding for keyseq.

-m keymap		Use keymap as the keymap to be affected by the subsequent bindings. 
Acceptable keymap names are: emacs (emacs-standard), emacs-meta, emacs-ctlx; vi (vi-command), vi-insert, vi-move
vi is equivalent to vi-command; emacs is equivalent to emacs-standard.

-X   			List all key sequences bound to shell commands and the associated commands in a format that can be reused as input.

-x keyseq:cmd  	Cause cmd to be executed whenever keyseq is entered. 
			When cmd is executed, the shell sets the 
			READLINE_LINE variable to the contents of the readline line buffer and the 
			READLINE_POINT variable to the current location of the insertion point. 
			If the executed command changes the value of READLINE_LINE or READLINE_POINT, 
			those new values will be reflected in the editing state.


RETURN VALUE
is 0 unless an unrecognized option is given or an error occurred.


