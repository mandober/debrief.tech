# Environment Variables: LOCALE

LANG
LANGUAGE
LC_ALL
LC_COLLATE
LC_CTYPE
LC_MESSAGES
LC_NUMERIC
LC_MONETARY
LC_TIME


LANG
Used to determine the locale category for any category not 
specifically selected with a variable starting with LC_*

LANGUAGE  
override for LC_MESSAGES, used by GNU gettext only

LC_ALL
This variable overrides the value of LANG and any 
other LC_* variable specifying a locale category.

LC_COLLATE
sorting rules - determines the collation order used when sorting the results of 
pathname expansion, and determines the behavior of range expressions, equivalence 
classes, and collating sequences within pathname expansion and pattern matching.

LC_CTYPE
character types and encoding - determines the interpretation of characters 
and the behavior of character classes within pathname expansion and pattern matching.

LC_MESSAGES
natural language messages - determines the locale used to 
translate double-quoted strings preceded by a $ (e.g. echo $"message")

LC_NUMERIC
determines the locale category used for number formatting.

LC_MONETARY
money amount formatting

LC_TIME
date and time display


* Each of the LC_* and LANG variables can contain a locale name of the following form:
     			language[_territory[.codeset]][@modifier]
  language is an ISO 639 language code (lower case), 
  territory is an ISO 3166 country code (upper case), 
  codeset denotes a character set, and 
  modifier stands for other particular attributes (for example indicating a particular language dialect, or a nonstandard orthography).
	e.g.   LANG=en_US.UTF-8

* LANGUAGE can contain several locale names, separated by colons.
