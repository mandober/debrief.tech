# Control or Caret Escapes

`Ctrl + chr((ord(CC)+64))`


Ctrol pressed together with another character, usually a letter, which is obtained by adding 64 (dec) to the control character's decimal number.

For example (all numbers are decimal):

ord(NUL) = 0, chr(0+64) = @, so ^@ produces a NUL

ord(TAB) = 9, chr(9+64) = @, so ^I produces a TAB


The only exception is the notation for DEL, in which case plus is replaced with minus sign: 

ord(DEL) = 127, chr(127-64) = ?, so ^? produces a DEL
