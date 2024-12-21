# Functions :: Table

Legend
- c Function category
  - S String functions
  - L List functions
  - D Dictionary functions
  - B Blob functions
- A Args
- B Return value


c|A|B| function name     | desc
-|-|-|-------------------|-----------------------------------------------------
S| | | nr2char()         | get a character by its number value
S| | | list2str()        | get a character string from a list of numbers
S| | | char2nr()         | get number value of a character
S| | | str2list()        | get list of numbers from a string
S| | | str2nr()          | convert a string to a Number
S| | | str2float()       | convert a string to a Float
S| | | printf()          | format a string according to % items
S| | | escape()          | escape characters in a string with a '\'
S| | | shellescape()     | escape a string for use with a shell command
S| | | fnameescape()     | escape a file name for use with a Vim command
S| | | tr()              | translate characters from one set to another
S| | | strtrans()        | translate a string to make it printable
S| | | keytrans()        | translate internal keycodes to form used by :map
S| | | tolower()         | turn a string to lowercase
S| | | toupper()         | turn a string to uppercase
S| | | charclass()       | class of a character
S| | | match()           | position where a pattern matches in a string
S| | | matchbufline()    | all the matches of a pattern in a buffer
S| | | matchend()        | position where a pattern match ends in a string
S| | | matchfuzzy()      | fuzzy matches a string in a list of strings
S| | | matchfuzzypos()   | fuzzy matches a string in a list of strings
S| | | matchstr()        | match of a pattern in a string
S| | | matchstrlist()    | all the matches of a pattern in a List of strings
S| | | matchstrpos()     | match and positions of a pattern in a string
S| | | matchlist()       | like matchstr() and also return submatches
S| | | stridx()          | first index of a short string in a long string
S| | | strridx()         | last index of a short string in a long string
S| | | strlen()          | length of a string in bytes
S| | | strcharlen()      | length of a string in characters
S| | | strchars()        | number of characters in a string
S| | | strutf16len()     | number of UTF-16 code units in a string
S| | | strwidth()        | size of string when displayed
S| | | strdisplaywidth() | size of string when displayed, deals with tabs
S| | | setcellwidths()   | set character cell width overrides
S| | | getcellwidths()   | get character cell width overrides
S| | | reverse()         | reverse the order of characters in a string
S| | | substitute()      | substitute a pattern match with a string
S| | | submatch()        | get a specific match in ":s" and substitute()
S| | | strpart()         | get part of a string using byte index
S| | | strcharpart()     | get part of a string using char index
S| | | slice()           | take a slice of string using char index in Vim9
S| | | strgetchar()      | get character from a string using char index
S| | | expand()          | expand special keywords
S| | | expandcmd()       | expand a command like done for :edit
S| | | iconv()           | convert text from one encoding to another
S| | | byteidx()         | byte index of a character in a string
S| | | byteidxcomp()     | like byteidx() but count composing characters
S| | | charidx()         | character index of a byte in a string
S| | | utf16idx()        | UTF-16 index of a byte in a string
S| | | repeat()          | repeat a string multiple times
S| | | eval()            | evaluate a string expression
S| | | execute()         | execute an Ex command and get the output
S| | | win_execute()     | like execute() but in a specified window
S| | | trim()            | trim characters from a string
S| | | gettext()         | lookup message translation
L| | | get()             | get an item without error for wrong index
L| | | len()             | number of items in a List
L| | | empty()           | check if List is empty
L| | | insert()          | insert an item somewhere in a List
L| | | add()             | append an item to a List
L| | | extend()          | append a List to a List
L| | | extendnew()       | make a new List and append items
L| | | remove()          | remove one or more items from a List
L| | | copy()            | make a shallow copy of a List
L| | | deepcopy()        | make a full copy of a List
L| | | filter()          | remove selected items from a List
L| | | map()             | change each List item
L| | | mapnew()          | make a new List with changed items
L| | | reduce()          | reduce a List to a value
L| | | slice()           | take a slice of a List
L| | | sort()            | sort a List
L| | | reverse()         | reverse the order of items in a List
L| | | uniq()            | remove copies of repeated adjacent items
L| | | split()           | split a String into a List
L| | | join()            | join List items into a String
L| | | range()           | return a List with a sequence of numbers
L| | | string()          | String representation of a List
L| | | call()            | call a function with List as arguments
L| | | index()           | index of a value in a List or Blob
L| | | indexof()         | index in List/Blob where exp evaluates to true
L| | | max()             | maximum value in a List
L| | | min()             | minimum value in a List
L| | | count()           | count number of times a value appears in a List
L| | | repeat()          | repeat a List multiple times
L| | | flatten()         | flatten a List
L| | | flattennew()      | flatten a copy of a List
D| | | get()             | get an entry without an error for a wrong key
D| | | len()             | number of entries in a Dictionary
D| | | has_key()         | check whether a key appears in a Dictionary
D| | | empty()           | check if Dictionary is empty
D| | | remove()          | remove an entry from a Dictionary
D| | | extend()          | add entries from one Dictionary to another
D| | | extendnew()       | make a new Dictionary and append items
D| | | filter()          | remove selected entries from a Dictionary
D| | | map()             | change each Dictionary entry
D| | | mapnew()          | make a new Dictionary with changed items
D| | | keys()            | get List of Dictionary keys
D| | | values()          | get List of Dictionary values
D| | | items()           | get List of Dictionary key-value pairs
D| | | copy()            | make a shallow copy of a Dictionary
D| | | deepcopy()        | make a full copy of a Dictionary
D| | | string()          | String representation of a Dictionary
D| | | max()             | maximum value in a Dictionary
D| | | min()             | minimum value in a Dictionary
D| | | count()           | count number of times a value appears
B| | | blob2list()       | get a list of numbers from a blob
B| | | list2blob()       | get a blob from a list of numbers
B| | | reverse()         | reverse the order of numbers in a blob
