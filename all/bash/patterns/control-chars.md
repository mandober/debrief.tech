POSIX Character Classes

This is an alternate method of specifying a range of characters to match.

[:alnum:]	matches alphabetic or numeric characters. This is equivalent to A-Za-z0-9.
[:alpha:]	matches alphabetic characters. This is equivalent to A-Za-z.
[:lower:]  matches lowercase alphabetic characters. This is equivalent to a-z.
[:upper:]  matches uppercase alphabetic characters. This is equivalent to A-Z.
[:digit:]  matches (decimal) digits. This is equivalent to 0-9.
[:xdigit:] matches hexadecimal digits. This is equivalent to 0-9A-Fa-f.
[:blank:]  all horizontal whitespace
[:space:]  Any whitespace characters (space, tab, NL, FF, VT, CR). Many system abbreviate as \s.
[:cntrl:]  matches control characters.
[:graph:]  all printable characters (excluding space). Matches characters in the range of ASCII 33-126. 
[:print:]  all printable characters, including space. Matches characters in the range of ASCII 32-126. Same as [:graph:] + space character.
[:punct:]	all punctuation characters. Punctuation symbols . , " ' ? ! ; : # $ % & ( ) * + - / < > = @ [ ] \ ^ _ { } | ~
[:ascii:] 	ASCII characters
[:word:] 	Word characters (letters, numbers and underscores)


ASCII control characters
  0 null	 	\0	^@ 	null-string, null-byte
  7 bell	 	\a	^G 	alert (bell)
  8 backspace	\b	^H 	erase previous character
  9 tab		\t	^I  	horizontal tab
 10 line feed	\n	^J	new line
 12 form feed	\f	^L	tty will clear screen, printer will do other shit
 13 cr 		\r	^M	carriage return. used as the EOL marker in MacOS and others. 
 27 escape		\e	^[	escape sequence. \e and \E
127 delete			^?	erase character (right of the cursor)

* A \r\n pair is used by CP/M-80, DOS, Windows, etc. and by Application Layer protocols such as HTTP.

   \a   		alert (bell)
   \b   		backspace
   \c   		suppress further output
   \e			an escape character
   \E   		an escape character
   \f   		form feed
   \n   		new line
   \r   		carriage return
   \t   		horizontal tab
   \v   		vertical tab
   \\   		backslash
