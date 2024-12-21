A list of the bare essentials for editing the text of an input line follows, emacs mode:

C-b  				Move back one character. 
C-f  				Move forward one character. 
C-d  				Delete the character underneath the cursor. 
DEL or Backspace	Delete the character to the left of the cursor. 
C-_ or C-x C-u		Undo the last editing command. You can undo all the way back to an empty line. 

Depending on your configuration, the Backspace key be set to delete the character to the left of the cursor and 
the DEL key set to delete the character underneath the cursor, like C-d, rather than the character to the left of the cursor.

readline movement commands

C-a		Move to the start of the line. 
C-e		Move to the end of the line. 
M-f		Move forward a word, where a word is composed of letters and digits. 
M-b		Move backward a word. 
C-l		Clear the screen, reprinting the current line at the top. 

Notice how C-f moves forward a character, while M-f moves forward a word. 
It is a loose convention that control keystrokes operate on characters while meta keystrokes operate on words.


Readline Killing Commands
Killing text means to delete the text from the line, but to save it away for later use, 
usually by yanking (re-inserting) it back into the line. 
When you use a kill command, the text is saved in a kill-ring. 
Any number of consecutive kills save all of the killed text together, so that when you yank it back, you get it all. 

C-k	Kill the text from the current cursor position to the end of the line.
M-d	Kill from the cursor to the end of the current word, or, if between words, to the end of the next word. 
M-DEL	Kill from the cursor to the start of the current word, or, if between words, to the start of the previous word. 
C-w	Kill from the cursor to the previous whitespace. This is different than M-DEL because the word boundaries differ.

Here is how to yank the text back into the line. Yanking means to copy the most-recently-killed text from the kill buffer.
C-y	Yank the most recently killed text back into the buffer at the cursor.
M-y	Rotate the kill-ring, and yank the new top. You can only do this if the prior command is C-y or M-y. 


Readline Arguments
Readline commands may be given numeric arguments, which normally act as a repeat count. Sometimes, however, it is the sign of the argument that is significant. Passing a negative argument to a command that acts in the forward direction (e.g., kill-line) causes that command to act in a backward direction. You can pass numeric arguments to Readline commands. Sometimes the argument acts as a repeat count, other times it is the sign of the argument that is significant. If you pass a negative argument to a command which normally acts in a forward direction, that command will act in a backward direction. For example, to kill text back to the start of the line, you might type `M-- C-k'. The general way to pass numeric arguments to a command is to type meta digits before the command. If the first `digit' typed is a minus sign (`-'), then the sign of the argument will be negative. Once you have typed one meta digit to get the argument started, you can type the remainder of the digits, and then the command. For example, to give the C-d command an argument of 10, you could type `M-1 0 C-d', which will delete the next ten characters on the input line.

Searching for Commands in the History
Readline provides commands for searching through the command history for lines containing a specified string. 

Incremental searches begin before the user has finished typing the search string. As each character of the search string is typed, Readline displays the next entry from the history matching the string typed so far. An incremental search requires only as many characters as needed to find the desired history entry. To search backward in the history for a particular string, type C-r. Typing C-s searches forward through the history. The characters present in the value of the isearch-terminators variable are used to terminate an incremental search. If that variable has not been assigned a value, the ESC and C-J characters will terminate an incremental search. C-g will abort an incremental search and restore the original line. When the search is terminated, the history entry containing the search string becomes the current line.
To find other matching entries in the history list, type C-r or C-s as appropriate. This will search backward or forward in the history for the next entry matching the search string typed so far. Any other key sequence bound to a Readline command will terminate the search and execute that command. For instance, a RET will terminate the search and accept the line, thereby executing the command from the history list. A movement command will terminate the search, make the last line found the current line, and begin editing.
Readline remembers the last incremental search string. If two C-rs are typed without any intervening characters defining a new search string, any remembered search string is used.

Non-incremental searches read the entire search string before starting to search for matching history 
lines. The search string may be typed by the user or be part of the contents of the current line.



