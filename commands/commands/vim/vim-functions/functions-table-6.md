# Functions :: Table

## Legend: Vim categorization

- VH = Vim help pages category
  - 01 String manipulation
  - 02 List manipulation
  - 03 Dictionary manipulation
  - 04 Floating point computation
  - 05 Blob manipulation
  - 06 Other computation (bitwise, random, hash)
  - 07 Variables (types, funcref, GC)
  - 08 Cursor and mark position
  - 09 Working with text in the current buffer
  - 10 Working with text in another buffer
  - 11 System functions and manipulation of files
  - 12 Date and Time
  - 13 Autocmds
  - 14 Buffers, windows and the argument list
  - 15 Command line
  - 16 Quickfix and location lists
  - 17 Insert mode completion
  - 18 Folding
  - 19 Syntax and highlighting
  - 20 Spelling
  - 21 History
  - 22 Interactive
  - 23 GUI
  - 24 Vim server
  - 25 Window size and position
  - 26 Mappings and Menus
  - 27 Testing
  - 28 Inter-process communication
  - 29 Jobs
  - 30 Signs
  - 31 Terminal window
  - 32 Popup window
  - 33 Timers
  - 34 Tags
  - 35 Prompt Buffer
  - 36 Registers
  - 37 Text Properties
  - 38 Sound
  - 39 Various

## Legend: Logical categorization

- LC = Logical category
  - Al Arg list
  - As Assertions
  - Au Autocommands
  - Ba Balloon
  - Bu Buffer
  - Bw Bitwise
  - Cb Callback
  - Ch Channel
  - Co Completions
  - Cu Cursor
  - Dg Digraph
  - Di Dict
  - Fd Fold
  - Fs File system (file, dir)
  - GS Getters and Setters (get/set info, etc.)
  - Hi History
  - Io I/O ops: hash, rand, GC, swap
  - Jb Jobs
  - Js JSON de/encode
  - Ln Line
  - Ia Interactive
  - Ls List
  - Ma Math
  - Mk Mark
  - Mp Mappings
  - PB Prompt Buffer
  - Pm Popup (window)
  - Pr Property (text properties)
  - Rg Register
  - Sd Sound
  - Se Search (find, pattern)
  - Sp Spell
  - Sn Signs
  - St Strings
  - Sy Syntax (highlighting, match)
  - Ta Tags
  - Te Terminal (terminal, terminal window)
  - Ti Timers
  - Ts Testing
  - Ty Type (return null blob, dict, etc.)
  - Va Variable, type, funcref
  - Vs Vim server
  - Wd Window



## Table of functions

VH|LC|function name            |desc
--|--|-------------------------|--------------------------------------------
01|St|nr2char                  |get a character by its number value
01|St|list2str                 |get a character string from list of numbers
01|St|char2nr                  |get number value of a character
01|St|str2list                 |get list of numbers from a string
01|St|str2nr                   |convert a string to a Number
01|St|str2float                |convert a string to a Float
01|St|printf                   |format a string according to % items
01|St|escape                   |escape characters in a string with a '\'
01|St|shellescape              |escape string for use with a shell command
01|St|fnameescape              |escape file name for use with a Vim command
01|St|tr                       |translate chars from one set to another
01|St|strtrans                 |translate a string to make it printable
01|St|keytrans                 |translate keycodes to form used by :map
01|St|tolower                  |turn a string to lowercase
01|St|toupper                  |turn a string to uppercase
01|St|charclass                |class of a character
01|St|match                    |position where pattern matches in a string
01|St|matchbufline             |all the matches of a pattern in a buffer
01|St|matchend                 |position where pattern match ends in string
01|St|matchfuzzy               |fuzzy matches a string in a list of strings
01|St|matchfuzzypos            |fuzzy matches a string in a list of strings
01|St|matchstr                 |match of a pattern in a string
01|St|matchstrlist             |all matches of pattern in a List of strings
01|St|matchstrpos              |match and positions of pattern in a string
01|St|matchlist                |like matchstr and also return submatches
01|St|stridx                   |first index of short string in long string
01|St|strridx                  |last index of short string in long string
01|St|strlen                   |length of a string in bytes
01|St|strcharlen               |length of a string in characters
01|St|strchars                 |number of characters in a string
01|St|strutf16len              |number of UTF-16 code units in a string
01|St|strwidth                 |string size when displayed
01|St|strdisplaywidth          |string size when displayed, deals with tabs
01|St|setcellwidths            |set character cell width overrides
01|St|getcellwidths            |get character cell width overrides
01|St|reverse                  |reverse the order of characters in string
01|St|substitute               |substitute a pattern match with a string
01|St|submatch                 |get specific match in ":s" and substitute
01|St|strpart                  |get part of a string using byte index
01|St|strcharpart              |get part of a string using char index
01|St|slice                    |take slice of string using char index Vim9
01|St|strgetchar               |get character from string using char index
01|St|expand                   |expand special keywords
01|St|expandcmd                |expand a command like done for :edit
01|St|iconv                    |convert text from one encoding to another
01|St|byteidx                  |byte index of a character in a string
01|St|byteidxcomp              |like byteidx but count composing characters
01|St|charidx                  |character index of a byte in a string
01|St|utf16idx                 |UTF-16 index of a byte in a string
01|St|repeat                   |repeat a string multiple times
01|St|eval                     |evaluate a string exp
01|St|execute                  |execute an Ex command and get the output
01|St|win_execute              |like execute but in a specified window
01|St|trim                     |trim characters from a string
01|St|gettext                  |lookup message translation
02|Ls|get                      |get an item without error for wrong index
02|Ls|len                      |number of items in a List
02|Ls|empty                    |check if List is empty
02|Ls|insert                   |insert an item somewhere in a List
02|Ls|add                      |append an item to a List
02|Ls|extend                   |append a List to a List
02|Ls|extendnew                |make a new List and append items
02|Ls|remove                   |remove one or more items from a List
02|Ls|copy                     |make a shallow copy of a List
02|Ls|deepcopy                 |make a full copy of a List
02|Ls|filter                   |remove selected items from a List
02|Ls|map                      |change each List item
02|Ls|mapnew                   |make a new List with changed items
02|Ls|reduce                   |reduce a List to a value
02|Ls|slice                    |take a slice of a List
02|Ls|sort                     |sort a List
02|Ls|reverse                  |reverse the order of items in a List
02|Ls|uniq                     |remove copies of repeated adjacent items
02|Ls|split                    |split a String into a List
02|Ls|join                     |join List items into a String
02|Ls|range                    |return a List with a sequence of numbers
02|Ls|string                   |String representation of a List
02|Ls|call                     |call a function with List as arguments
02|Ls|index                    |index of a value in a List/Blob
02|Ls|indexof                  |index in List/Blob where exp is true
02|Ls|max                      |maximum value in a List
02|Ls|min                      |minimum value in a List
02|Ls|count                    |number of times a value appears in a List
02|Ls|repeat                   |repeat a List multiple times
02|Ls|flatten                  |flatten a List
02|Ls|flattennew               |flatten a copy of a List
03|Di|get                      |get an entry without wrong key error
03|Di|len                      |number of entries in a Dictionary
03|Di|has_key                  |check whether a key appears in a Dictionary
03|Di|empty                    |check if Dictionary is empty
03|Di|remove                   |remove an entry from a Dictionary
03|Di|extend                   |add entries from one Dictionary to another
03|Di|extendnew                |make a new Dictionary and append items
03|Di|filter                   |remove selected entries from a Dictionary
03|Di|map                      |change each Dictionary entry
03|Di|mapnew                   |make a new Dictionary with changed items
03|Di|keys                     |get List of Dictionary keys
03|Di|values                   |get List of Dictionary values
03|Di|items                    |get List of Dictionary key-value pairs
03|Di|copy                     |make a shallow copy of a Dictionary
03|Di|deepcopy                 |make a full copy of a Dictionary
03|Di|string                   |String representation of a Dictionary
03|Di|max                      |maximum value in a Dictionary
03|Di|min                      |minimum value in a Dictionary
03|Di|count                    |count number of times a value appears
04|Ma|float2nr                 |convert Float to Number
04|Ma|abs                      |absolute value (also works for Number)
04|Ma|round                    |round off
04|Ma|ceil                     |round up
04|Ma|floor                    |round down
04|Ma|trunc                    |remove value after decimal point
04|Ma|fmod                     |remainder of division
04|Ma|exp                      |exponential
04|Ma|log                      |natural logarithm (logarithm to base e)
04|Ma|log10                    |logarithm to base 10
04|Ma|pow                      |value of x to the exponent y
04|Ma|sqrt                     |square root
04|Ma|sin                      |sine
04|Ma|cos                      |cosine
04|Ma|tan                      |tangent
04|Ma|asin                     |arc sine
04|Ma|acos                     |arc cosine
04|Ma|atan                     |arc tangent
04|Ma|atan2                    |arc tangent
04|Ma|sinh                     |hyperbolic sine
04|Ma|cosh                     |hyperbolic cosine
04|Ma|tanh                     |hyperbolic tangent
04|Ma|isinf                    |check for infinity
04|Ma|isnan                    |check for NaN
05|Ls|blob2list                |get a list of numbers from BLOB
05|Ls|list2blob                |get a BLOB from list of numbers
05|Ls|reverse                  |reverse order of numbers in BLOB
06|Bw|and                      |bitwise AND
06|Bw|invert                   |bitwise invert
06|Bw|or                       |bitwise OR
06|Bw|xor                      |bitwise XOR
06|Io|sha256                   |SHA-256 hash
06|Io|rand                     |get a pseudo-random number
06|Io|srand                    |initialize seed used by rand
07|Va|instanceof               |check if variable is instance of a class
07|Va|type                     |type of a variable as a number
07|Va|typename                 |type of a variable as text
07|Va|islocked                 |check if a variable is locked
07|Va|funcref                  |get Funcref for a function reference
07|Va|function                 |get Funcref for a function name
07|Va|getbufvar                |get var value from a specific buffer
07|Va|setbufvar                |set var in a specific buffer
07|Va|getwinvar                |get var from specific window
07|Va|gettabvar                |get var from specific TabPage
07|Va|gettabwinvar             |get var from specific window and TabPage
07|Va|setwinvar                |set var in a specific window
07|Va|settabvar                |set var in a specific TabPage
07|Va|settabwinvar             |set var in a specific window and TabPage
07|Io|garbagecollect           |possibly free memory
08|Mk|col                      |column number of the cursor or a mark
08|Mk|virtcol                  |screen column of the cursor or a mark
08|Mk|line                     |line number of the cursor or mark
08|Cu|wincol                   |window column number of the cursor
08|Cu|winline                  |window line number of the cursor
08|Cu|cursor                   |position the cursor at a line/column
08|Cu|screencol                |get screen column of the cursor
08|Cu|screenrow                |get screen row of the cursor
08|Cu|screenpos                |screen row and col of a text character
08|Cu|virtcol2col              |byte index of a text character on screen
08|Cu|getcurpos                |get position of the cursor
08|Cu|getpos                   |get position of cursor, mark, etc.
08|Cu|setpos                   |set position of cursor, mark, etc.
08|Mk|getmarklist              |list of global/local marks
08|Cu|byte2line                |get line number at a specific byte count
08|Cu|line2byte                |byte count at a specific line
08|Cu|diff_filler              |get the number of filler lines above a line
08|Cu|screenattr               |get attribute at a screen line/row
08|Cu|screenchar               |get character code at a screen line/row
08|Cu|screenchars              |get character codes at a screen line/row
08|Cu|screenstring             |get string of chars at a screen line/row
08|Cu|charcol                  |character number of the cursor or a mark
08|Cu|getcharpos               |get character position of cursor, mark, etc.
08|Cu|setcharpos               |set character position of cursor, mark, etc.
08|Cu|getcursorcharpos         |get character position of the cursor
08|Cu|setcursorcharpos         |set character position of the cursor
09|Ln|getline                  |get a line or list of lines from the buffer
09|Ln|setline                  |replace a line in the buffer
09|Ln|append                   |append line or list of lines in the buffer
09|Bu|indent                   |indent of a specific line
09|Bu|cindent                  |indent according to C indenting
09|Bu|lispindent               |indent according to Lisp indenting
09|Ln|nextnonblank             |find next non-blank line
09|Ln|prevnonblank             |find previous non-blank line
09|Se|search                   |find a match for a pattern
09|Se|searchpos                |find a match for a pattern
09|Se|searchcount              |get number of matches before/after cursor
09|Se|searchpair               |find the other end of a start/skip/end
09|Se|searchpairpos            |find the other end of a start/skip/end
09|Se|searchdecl               |search for the declaration of a name
09|Se|getcharsearch            |return character search information
09|Se|setcharsearch            |set character search information
10|Ln|getbufline               |get list of lines from the specified buffer
10|Ln|getbufoneline            |get a one line from the specified buffer
10|Ln|setbufline               |replace a line in the specified buffer
10|Ln|appendbufline            |append list of lines in specified buffer
10|Ln|deletebufline            |delete lines from a specified buffer
11|Se|glob                     |expand wildcards
11|Se|globpath                 |expand wildcards in number of directories
11|Se|glob2regpat              |convert a glob pattern into search pattern
11|Fs|findfile                 |find a file in a list of directories
11|Fs|finddir                  |find a directory in a list of directories
11|Fs|resolve                  |find out where a shortcut points to
11|Fs|fnamemodify              |modify a file name
11|Fs|pathshorten              |shorten directory names in a path
11|Fs|simplify                 |simplify path without changing its meaning
11|Fs|executable               |check if an executable program exists
11|Fs|exepath                  |full path of an executable program
11|Fs|filereadable             |check if a file can be read
11|Fs|filewritable             |check if a file can be written to
11|Fs|getfperm                 |get the permissions of a file
11|Fs|setfperm                 |set the permissions of a file
11|Fs|getftype                 |get the kind of a file
11|Fs|isabsolutepath           |check if a path is absolute
11|Fs|isdirectory              |check if a directory exists
11|Fs|getfsize                 |get the size of a file
11|Fs|getcwd                   |get the current working directory
11|Fs|haslocaldir              |check if current window used :lcd or :tcd
11|Fs|tempname                 |get the name of a temporary file
11|Fs|mkdir                    |create a new directory
11|Fs|chdir                    |change current working directory
11|Fs|delete                   |delete a file
11|Fs|rename                   |rename a file
11|Fs|system                   |get the result of shell command as string
11|Fs|systemlist               |get the result of shell command as list
11|Fs|environ                  |get all environment variables
11|Fs|getenv                   |get one environment variable
11|Fs|setenv                   |set an environment variable
11|Fs|hostname                 |name of the system
11|Fs|readfile                 |read a file into a List of lines
11|Fs|readblob                 |read a file into a Blob
11|Fs|readdir                  |get a List of file names in a directory
11|Fs|readdirex                |get a List of file information in dir
11|Fs|writefile                |write a List of lines or Blob into a file
12|Fs|getftime                 |get last modification time of a file
12|Fs|localtime                |get current time in seconds
12|Fs|strftime                 |convert time to a string
12|Fs|strptime                 |convert a date/time string to time
12|Fs|reltime                  |get the current or elapsed time accurately
12|Fs|reltimestr               |convert reltime result to a string
12|Fs|reltimefloat             |convert reltime result to a Float
13|Au|autocmd_add              |add a list of autocmds and groups
13|Au|autocmd_delete           |delete a list of autocmds and groups
13|Au|autocmd_get              |return a list of autocmds
14|Al|argc                     |number of entries in the argument list
14|Al|argidx                   |current position in the argument list
14|Al|arglistid                |get id of the argument list
14|Al|argv                     |get one entry from the argument list
14|Bu|bufadd                   |add a file to the list of buffers
14|Bu|bufexists                |check if a buffer exists
14|Bu|buflisted                |check if a buffer exists and is listed
14|Bu|bufload                  |ensure a buffer is loaded
14|Bu|bufloaded                |check if a buffer exists and is loaded
14|Bu|bufname                  |get the name of a specific buffer
14|Bu|bufnr                    |get the buffer number of a specific buffer
14|Bu|tabpagebuflist           |return List of buffers in a TabPage
14|GS|tabpagenr                |get the number of a TabPage
14|GS|tabpagewinnr             |like winnr for a specified TabPage
14|Wd|winnr                    |get the window number for current window
14|Bu|bufwinid                 |get the window ID of a specific buffer
14|Bu|bufwinnr                 |get the window number of a specific buffer
14|Wd|winbufnr                 |get the buffer number of a specific window
14|Cb|listener_add             |add a callback to listen to changes
14|Cb|listener_flush           |invoke listener callbacks
14|Cb|listener_remove          |remove a listener callback
14|Wd|win_findbuf              |find windows containing a buffer
14|Wd|win_getid                |get window ID of a window
14|Wd|win_gettype              |get type of window
14|Wd|win_gotoid               |go to window with ID
14|Wd|win_id2tabwin            |get tab and window nr from window ID
14|Wd|win_id2win               |get window nr from window ID
14|Wd|win_move_separator       |move window vertical separator
14|Wd|win_move_statusline      |move window status line
14|Wd|win_splitmove            |move window to a split of another window
14|GS|getbufinfo               |get a list with buffer information
14|GS|gettabinfo               |get a list with TabPage information
14|GS|getwininfo               |get a list with window information
14|GS|getchangelist            |get a list of change list entries
14|GS|getjumplist              |get a list of jump list entries
14|GS|swapfilelist             |list of existing swap files in 'directory'
14|Io|swapinfo                 |information about a swap file
14|Io|swapname                 |get the swap file path of a buffer
15|Co|getcmdcompltype          |get type of current command line completion
15|GS|getcmdline               |get the current command line
15|GS|getcmdpos                |get position of the cursor in the cmdline
15|GS|getcmdscreenpos          |get screen position of cursor in cmdline
15|GS|setcmdline               |set the current cmdline
15|GS|setcmdpos                |set position of the cursor in the cmdline
15|GS|getcmdtype               |return current command-line type
15|GS|getcmdwintype            |return current command-line window type
15|Co|getcompletion            |list of command-line completion matches
15|GS|fullcommand              |get full command name
16|GS|getqflist                |list of quickfix errors
16|GS|setqflist                |modify a quickfix list
16|GS|getloclist               |list of location list items
16|GS|setloclist               |modify a location list
17|Co|complete                 |set found matches
17|Co|complete_add             |add to found matches
17|Co|complete_check           |check if completion should be aborted
17|Co|complete_info            |get current completion information
17|Pm|pumvisible               |check if the popup menu is displayed
17|Pm|pum_getpos               |position and size of popup menu if visible
18|Fd|foldclosed               |check for a closed fold at a specific line
18|Fd|foldclosedend            |like foldclosed but return the last line
18|Fd|foldlevel                |check for the fold level at specific line
18|Fd|foldtext                 |generate the line displayed for closed fold
18|Fd|foldtextresult           |get the text displayed for closed fold
19|Sy|clearmatches             |clear matches defined by :matchadd, :match
19|Sy|getmatches               |get matches defined by :matchadd, :match
19|Sy|hlexists                 |check if a highlight group exists
19|Sy|hlget                    |get highlight group attributes
19|Sy|hlset                    |set highlight group attributes
19|Sy|hlID                     |get ID of a highlight group
19|Sy|synID                    |get syntax ID at a specific position
19|Sy|synIDattr                |get a specific attribute of a syntax ID
19|Sy|synIDtrans               |get translated syntax ID
19|Sy|synstack                 |get list of syntax IDs at specific position
19|Sy|synconcealed             |get info about concealing
19|Sy|diff_hlID                |get highlight ID for diff mode at position
19|Sy|matchadd                 |define a pattern to highlight (a "match")
19|Sy|matchaddpos              |define a list of positions to highlight
19|Sy|matcharg                 |get info about :match arguments
19|Sy|matchdelete              |delete match def by matchadd or :match cmd
19|Sy|setmatches               |restore list of matches saved by getmatches
20|Sp|spellbadword             |locate bad spellings at or after cursor
20|Sp|spellsuggest             |return suggested spelling corrections
20|Sd|soundfold                |return the sound-a-like equivalent of word
21|Hi|histadd                  |add an item to a history
21|Hi|histdel                  |delete an item from a history
21|Hi|histget                  |get an item from a history
21|Hi|histnr                   |get highest index of a history list
22|Ia|browse                   |put up a file requester
22|Ia|browsedir                |put up a directory requester
22|Ia|confirm                  |let the user make a choice
22|Ia|getchar                  |get a character from the user
22|Ia|getcharstr               |get a character from the user as a string
22|Ia|getcharmod               |get modifiers for the last typed character
22|Ia|getmousepos              |get last known mouse position
22|Ia|getmouseshape            |get name of the current mouse shape
22|Ia|echoraw                  |output characters as-is
22|Ia|feedkeys                 |put characters in the typeahead queue
22|Ia|input                    |get a line from the user
22|Ia|inputlist                |let the user pick an entry from a list
22|Ia|inputsecret              |get a line from the user without showing it
22|Ia|inputdialog              |get a line from the user in a dialog
22|Ia|inputsave                |save and clear typeahead
22|Ia|inputrestore             |restore typeahead
23|GS|getfontname              |get name of current font being used
23|GS|getwinpos                |position of the Vim window
23|GS|getwinposx               |X position of the Vim window
23|GS|getwinposy               |Y position of the Vim window
23|Ba|balloon_show             |set the balloon content
23|Ba|balloon_split            |split a message for a balloon
23|Ba|balloon_gettext          |get the text in the balloon
24|Vs|serverlist               |return the list of server names
24|Vs|remote_startserver       |run a server
24|Vs|remote_send              |send command characters to Vim server
24|Vs|remote_expr              |evaluate an exp in Vim server
24|Vs|server2client            |send a reply to a client of Vim server
24|Vs|remote_peek              |check if there is a reply from Vim server
24|Vs|remote_read              |read a reply from a Vim server
24|Vs|foreground               |move the Vim window to fg
24|Vs|remote_foreground        |move the Vim server window to fg
25|Wd|winheight                |get height of a specific window
25|Wd|winwidth                 |get width of a specific window
25|Wd|win_screenpos            |get screen position of a window
25|Wd|winlayout                |get layout of windows in a TabPage
25|Wd|winrestcmd               |return command to restore window sizes
25|Wd|winsaveview              |get view of current window
25|Wd|winrestview              |restore saved view of current window
26|Dg|digraph_get              |get digraph
26|Dg|digraph_getlist          |get all digraphs
26|Dg|digraph_set              |register digraph
26|Dg|digraph_setlist          |register multiple digraphs
26|Mp|hasmapto                 |check if a mapping exists
26|Mp|mapcheck                 |check if a matching mapping exists
26|Mp|maparg                   |get rhs of a mapping
26|Mp|maplist                  |get list of all mappings
26|Mp|mapset                   |restore a mapping
26|GS|menu_info                |get information about a menu item
26|GS|wildmenumode             |check if the wildmode is active
27|As|assert_equal             |assert 2 exp values are equal
27|As|assert_equalfile         |assert 2 file contents are equal
27|As|assert_notequal          |assert 2 exp values are not equal
27|As|assert_inrange           |assert an exp is inside a range
27|As|assert_match             |assert a pattern matches the value
27|As|assert_notmatch          |assert a pattern does not match the value
27|As|assert_false             |assert an exp is false
27|As|assert_true              |assert an exp is true
27|As|assert_exception         |assert a command throws an exception
27|As|assert_beeps             |assert a command beeps
27|As|assert_nobeep            |assert a command does not cause a beep
27|As|assert_fails             |assert a command fails
27|As|assert_report            |report a test failure
27|Ts|test_alloc_fail          |make memory allocation fail
27|Ts|test_autochdir           |enable 'autochdir' during startup
27|Ts|test_override            |test with Vim internal overrides
27|Ts|test_garbagecollect_now  |free memory right now
27|Ts|test_garbagecollect_soon |set a flag to free memory soon
27|Ts|test_getvalue            |get value of an internal variable
27|Ts|test_gui_event           |generate a GUI event for testing
27|Ts|test_ignore_error        |ignore a specific error message
27|Ts|test_mswin_event         |generate an MS-Windows event
27|Ty|test_null_blob           |return a null Blob
27|Ty|test_null_channel        |return a null Channel
27|Ty|test_null_dict           |return a null Dict
27|Ty|test_null_function       |return a null Funcref
27|Ty|test_null_job            |return a null Job
27|Ty|test_null_list           |return a null List
27|Ty|test_null_partial        |return a null Partial function
27|Ty|test_null_string         |return a null String
27|Ts|test_settime             |set the time Vim uses internally
27|Ts|test_setmouse            |set the mouse position
27|Ts|test_feedinput           |add key sequence to input buffer
27|Ts|test_option_not_set      |reset flag indicating option was set
27|Ts|test_refcount            |return an exp's reference count
27|Ts|test_srand_seed          |set the seed value for srand
27|Ts|test_unknown             |return a value with unknown type
27|Ts|test_void                |return a value with void type
28|Ch|ch_canread               |check if there is something to read
28|Ch|ch_open                  |open a channel
28|Ch|ch_close                 |close a channel
28|Ch|ch_close_in              |close the in part of a channel
28|Ch|ch_read                  |read a message from a channel
28|Ch|ch_readblob              |read a Blob from a channel
28|Ch|ch_readraw               |read a raw message from a channel
28|Ch|ch_sendexpr              |send a JSON message over a channel
28|Ch|ch_sendraw               |send a raw message over a channel
28|Ch|ch_evalexpr              |evaluate an exp over channel
28|Ch|ch_evalraw               |evaluate a raw string over channel
28|Ch|ch_status                |get status of a channel
28|Ch|ch_getbufnr              |get the buffer number of a channel
28|Ch|ch_getjob                |get the job associated with a channel
28|Ch|ch_info                  |get channel information
28|Ch|ch_log                   |write a message in the channel log file
28|Ch|ch_logfile               |set the channel log file
28|Ch|ch_setoptions            |set the options for a channel
28|Js|json_encode              |encode an exp to a JSON string
28|Js|json_decode              |decode a JSON string to Vim types
28|Js|js_encode                |encode an exp to a JSON string
28|Js|js_decode                |decode a JSON string to Vim types
28|Js|err_teapot               |give error 418 or 503
29|Jb|job_start                |start a job
29|Jb|job_stop                 |stop a job
29|Jb|job_status               |get the status of a job
29|Jb|job_getchannel           |get the channel used by a job
29|Jb|job_info                 |get information about a job
29|Jb|job_setoptions           |set options for a job
30|Sn|sign_define              |define or update a sign
30|Sn|sign_getdefined          |get a list of defined signs
30|Sn|sign_getplaced           |get a list of placed signs
30|Sn|sign_jump                |jump to a sign
30|Sn|sign_place               |place a sign
30|Sn|sign_placelist           |place a list of signs
30|Sn|sign_undefine            |undefine a sign
30|Sn|sign_unplace             |unplace a sign
30|Sn|sign_unplacelist         |unplace a list of signs
31|Te|term_start               |open a terminal window and run a job
31|Te|term_list                |get the list of terminal buffers
31|Te|term_sendkeys            |send keystrokes to a terminal
31|Te|term_wait                |wait for screen to be updated
31|Te|term_getjob              |get the job associated with a terminal
31|Te|term_scrape              |get row of a terminal screen
31|Te|term_getline             |get a line of text from a terminal
31|Te|term_getattr             |get the value of attribute {what}
31|Te|term_getcursor           |get the cursor position of a terminal
31|Te|term_getscrolled         |get the scroll count of a terminal
31|Te|term_getaltscreen        |get the alternate screen flag
31|Te|term_getsize             |get the size of a terminal
31|Te|term_getstatus           |get the status of a terminal
31|Te|term_gettitle            |get the title of a terminal
31|Te|term_gettty              |get the tty name of a terminal
31|Te|term_setansicolors       |set 16 ANSI colors, used for GUI
31|Te|term_getansicolors       |get 16 ANSI colors, used for GUI
31|Te|term_dumpdiff            |display difference between two screen dumps
31|Te|term_dumpload            |load a terminal screen dump in a window
31|Te|term_dumpwrite           |dump contents of a terminal screen to file
31|Te|term_setkill             |set signal to stop job in a terminal
31|Te|term_setrestore          |set command to restore a terminal
31|Te|term_setsize             |set the size of a terminal
31|Te|term_setapi              |set terminal JSON API function name prefix
32|Pm|popup_create             |create popup centered in the screen
32|Pm|popup_atcursor           |create popup, closes when cursor moves
32|Pm|popup_beval              |at pos indicated by v:beval_, close on move
32|Pm|popup_notification       |show a notification for three seconds
32|Pm|popup_dialog             |create popup centered with padding border
32|Pm|popup_menu               |prompt for selecting an item from a list
32|Pm|popup_hide               |hide a popup temporarily
32|Pm|popup_show               |show a previously hidden popup
32|Pm|popup_move               |change the position and size of a popup
32|Pm|popup_setoptions         |override options of a popup
32|Pm|popup_settext            |replace the popup buffer contents
32|Pm|popup_close              |close one popup
32|Pm|popup_clear              |close all popups
32|Pm|popup_filter_menu        |select from a list of items
32|Pm|popup_filter_yesno       |block until 'y' or 'n' is pressed
32|Pm|popup_getoptions         |get current options for a popup
32|Pm|popup_getpos             |get actual position and size of a popup
32|Pm|popup_findecho           |get window ID for popup used for :echowindow
32|Pm|popup_findinfo           |get window ID for popup info window
32|Pm|popup_findpreview        |get window ID for popup preview window
32|Pm|popup_list               |get list of all popup window IDs
32|Pm|popup_locate             |get popup window ID from screen position
33|Ti|timer_start              |create a timer
33|Ti|timer_pause              |pause or unpause a timer
33|Ti|timer_stop               |stop a timer
33|Ti|timer_stopall            |stop all timers
33|Ti|timer_info               |get information about timers
34|Ta|taglist                  |get list of matching tags
34|Ta|tagfiles                 |get a list of tags files
34|Ta|gettagstack              |get the tag stack of a window
34|Ta|settagstack              |modify the tag stack of a window
35|PB|prompt_getprompt         |get the effective prompt text for buffer
35|PB|prompt_setcallback       |set prompt callback for a buffer
35|PB|prompt_setinterrupt      |set interrupt callback for a buffer
35|PB|prompt_setprompt         |set the prompt text for a buffer
36|Rg|getreg                   |get contents of a register
36|Rg|getreginfo               |get information about a register
36|Rg|getregtype               |get type of a register
36|Rg|setreg                   |set contents and type of a register
36|Rg|reg_executing            |return the name of register being executed
36|Rg|reg_recording            |return the name of register being recorded
37|Pr|prop_add                 |attach a property at a position
37|Pr|prop_add_list            |attach a property at multiple positions
37|Pr|prop_clear               |remove all properties from a line or lines
37|Pr|prop_find                |search for a property
37|Pr|prop_list                |return a list of all properties in a line
37|Pr|prop_remove              |remove a property from a line
37|Pr|prop_type_add            |add/define a property type
37|Pr|prop_type_change         |change properties of a type
37|Pr|prop_type_delete         |remove a text property type
37|Pr|prop_type_get            |return the properties of a type
37|Pr|prop_type_list           |return a list of all property types
38|Sd|sound_clear              |stop playing all sounds
38|Sd|sound_playevent          |play an event's sound
38|Sd|sound_playfile           |play a sound file
38|Sd|sound_stop               |stop playing a sound
39|GS|mode                     |get current editing mode
39|GS|state                    |get current busy state
39|GS|visualmode               |last visual mode used
39|Va|exists                   |check if a variable, function, etc. exists
39|Va|exists_compiled          |like exists but check at compile time
39|GS|has                      |check if a feature is supported in Vim
39|Io|changenr                 |return number of most recent change
39|Io|cscope_connection        |check if a cscope connection exists
39|Au|did_filetype             |check if a FileType autocommand was used
39|Io|eventhandler             |check if invoked by an event handler
39|Io|getpid                   |get process ID of Vim
39|Fs|getscriptinfo            |get list of sourced vim scripts
39|Io|getimstatus              |check if IME status is active
39|Fs|interrupt                |interrupt script execution
39|Io|windowsversion           |get MS-Windows version
39|Te|terminalprops            |properties of the terminal
39|Io|libcall                  |call a function in an external library
39|Io|libcallnr                |idem, returning a number
39|Io|undofile                 |get the name of the undo file
39|Bu|undotree                 |return the state of undo tree for a buffer
39|GS|shiftwidth               |effective value of 'shiftwidth'
39|Bu|wordcount                |get byte/word/char count of buffer
39|Io|luaeval                  |evaluate Lua exp
39|Io|mzeval                   |evaluate MzScheme exp
39|Io|perleval                 |evaluate Perl exp (+perl)
39|Io|py3eval                  |evaluate Python exp (+python3)
39|Io|pyeval                   |evaluate Python exp (+python)
39|Io|pyxeval                  |evaluate python_x exp
39|Io|rubyeval                 |evaluate Ruby exp
39|Io|debugbreak               |interrupt a program being debugged
