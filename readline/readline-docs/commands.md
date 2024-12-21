# Readline Command Names


The following is a list of the names of the commands and the default key sequences to which they are bound.

Command names without an accompanying key sequence are unbound by default. 
In the following descriptions, point refers to the current cursor position, 
and mark refers to a cursor position saved by the set-mark command. 
The text between the point and mark is referred to as the region.

new in readline 7

vi-cmd-mode-string ((cmd))

This string is displayed immediately before the last line of the primary prompt when vi editing mode is active and in command mode. The value is expanded like a key  binding, so the standard set of meta- and control prefixes and backslash escape sequences is available. Use the \1 and \2 escapes to begin and end sequences of non-printing characters, which can be used to embed a terminal control sequence into the mode string.

vi-ins-mode-string ((ins))

This string is displayed immediately before the last line of the primary prompt when vi editing mode is active and in insertion mode. The value is expanded like a key binding, so the standard set of meta- and control prefixes and backslash escape  sequences is available. Use the \1 and \2 escapes to begin and end sequences of non-printing characters, which can be used to embed a terminal control sequence into the mode string.
