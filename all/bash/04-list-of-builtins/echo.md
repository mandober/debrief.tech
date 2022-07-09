# Builtins: echo

echo [-neE] [arg ...]

Output the args, separated by spaces, followed by a newline. 

-n suppresses the trailing newline
-e enables interpretation of the following backslash-escaped characters
-E disables the interpretation of these escape characters (even on systems where they are interpreted by default)

* The xpg_echo shell option may be used to dynamically determine whether or not echo expands these escape characters by default. 
* echo does not interpret -- to mean the end of options

echo interprets the following escape sequences:

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

   \0nnn 		the eight-bit character whose value is the octal value nnn (zero to three octal digits)
   \xHH  		the eight-bit character whose value is the hexadecimal value HH (one or two hex digits)
   \uHHHH 		the Unicode (ISO/IEC 10646) character whose value is the hexadecimal value HHHH (one to four hex digits)
   \UHHHHHHHH	the Unicode (ISO/IEC 10646) character whose value is the hexadecimal value HHHHHHHH (one to eight hex digits)


RETURN STATUS is 0 unless a write error occurs.
