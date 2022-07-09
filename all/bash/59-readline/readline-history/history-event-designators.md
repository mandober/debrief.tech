# History Event Designators

An event designator is a reference to a command line entry in the history list (by default, events are relative to the current position in the history list):


`!`     
Start a history substitution, except when followed by a: SP, LF, CR, `=`, `(` (when `extglob` shell option is enabled)

`!n`    
Refer to command line `n`.

`!-n`    
Refer to the current command minus `n`.

`!!`
Refer to the previous command. This is a synonym for `!-1`.

`!string`    
Refer to the most recent command preceding the current position in the history list starting with string.

`!?string[?]`    
Refer to the most recent command preceding the current position in the history list containing string. The trailing ? may be omitted if string is followed immediately by a newline.

`^string1^string2^`   
Quick substitution. Repeat the previous command, replacing `string1` with `string2`. Equivalent to `!!:s/string1/string2/`

`!#`    
The entire command line typed so far.
