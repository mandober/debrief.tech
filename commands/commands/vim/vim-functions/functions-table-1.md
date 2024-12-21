# Functions :: Table



c|A|B| function name     | desc
-|-|-|-------------------|-----------------------------------------------------
s| | | nr2char()         | get a character by its number value
s| | | list2str()        | get a character string from a list of numbers
s| | | char2nr()         | get number value of a character
s| | | str2list()        | get list of numbers from a string
s| | | str2nr()          | convert a string to a Number
s| | | str2float()       | convert a string to a Float
s| | | printf()          | format a string according to % items
s| | | escape()          | escape characters in a string with a '\'
s| | | shellescape()     | escape a string for use with a shell command
s| | | fnameescape()     | escape a file name for use with a Vim command
s| | | tr()              | translate characters from one set to another
s| | | strtrans()        | translate a string to make it printable
s| | | keytrans()        | translate internal keycodes to form used by :map
s| | | tolower()         | turn a string to lowercase
s| | | toupper()         | turn a string to uppercase
s| | | charclass()       | class of a character
s| | | match()           | position where a pattern matches in a string
s| | | matchbufline()    | all the matches of a pattern in a buffer
s| | | matchend()        | position where a pattern match ends in a string
s| | | matchfuzzy()      | fuzzy matches a string in a list of strings
s| | | matchfuzzypos()   | fuzzy matches a string in a list of strings
s| | | matchstr()        | match of a pattern in a string
s| | | matchstrlist()    | all the matches of a pattern in a List of strings
s| | | matchstrpos()     | match and positions of a pattern in a string
s| | | matchlist()       | like matchstr() and also return submatches
s| | | stridx()          | first index of a short string in a long string
s| | | strridx()         | last index of a short string in a long string
s| | | strlen()          | length of a string in bytes
s| | | strcharlen()      | length of a string in characters
s| | | strchars()        | number of characters in a string
s| | | strutf16len()     | number of UTF-16 code units in a string
s| | | strwidth()        | size of string when displayed
s| | | strdisplaywidth() | size of string when displayed, deals with tabs
s| | | setcellwidths()   | set character cell width overrides
s| | | getcellwidths()   | get character cell width overrides
s| | | reverse()         | reverse the order of characters in a string
s| | | substitute()      | substitute a pattern match with a string
s| | | submatch()        | get a specific match in ":s" and substitute()
s| | | strpart()         | get part of a string using byte index
s| | | strcharpart()     | get part of a string using char index
s| | | slice()           | take a slice of string using char index in Vim9
s| | | strgetchar()      | get character from a string using char index
s| | | expand()          | expand special keywords
s| | | expandcmd()       | expand a command like done for :edit
s| | | iconv()           | convert text from one encoding to another
s| | | byteidx()         | byte index of a character in a string
s| | | byteidxcomp()     | like byteidx() but count composing characters
s| | | charidx()         | character index of a byte in a string
s| | | utf16idx()        | UTF-16 index of a byte in a string
s| | | repeat()          | repeat a string multiple times
s| | | eval()            | evaluate a string expression
s| | | execute()         | execute an Ex command and get the output
s| | | win_execute()     | like execute() but in a specified window
s| | | trim()            | trim characters from a string
s| | | gettext()         | lookup message translation
