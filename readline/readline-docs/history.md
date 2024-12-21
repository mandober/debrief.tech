shopt: history

histappend
histreedit
histverify
lithist
cmdhist

histappend
If set, the history list is appended to the file named by the value of 
the HISTFILE variable when the shell exits, rather than overwriting the file.

histreedit
If set, and readline is being used, a user is given the 
opportunity to re-edit a failed history substitution.

histverify
If set, and readline is being used, the results of history substitution are not 
immediately passed to the shell parser.  Instead, the resulting line is loaded 
into the readline editing buffer, allowing further modification.

lithist 
If set, and the cmdhist option is enabled, multi-line commands are saved to the 
history with embedded newlines rather than using semicolon separators where possible.

cmdhist 
If set, bash attempts to save all lines of a multiple-line command in the 
same history entry. This allows easy re-editing of multi-line commands.
