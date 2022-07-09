 bash | man | builtins

read

read [-ers] [-a name] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt] [-t timeout] [-u fd] [name ...]

One line is read from the standard input, or from the file descriptor fd supplied as an argument to the -u option, 
and the first word is assigned to the first name, the second word to the second name, and so on, with leftover words 
and their intervening separators assigned to the last name.


> Instead of supplying a NAME, we let `read` assign to its default variable `$REPLY`. This has the pleasant side-effect of preserving leading and trailing spaces, which are otherwise stripped.  *no!*: setting $IFS to the empty string, e.g. `IFS='' read -r myvar` should also preserve spaces at the beginning and end when storing the result into `$myvar`, meaning you aren't forced to use `$REPLY` after all.



http://mywiki.wooledge.org/BashFAQ/001 

read name1 name2 name3 < text.txt  (text.txt contains 1 line: john paul george ringo \n)
read name1 name2 name3 <<< "john paul george ringo"
IFS=, read -r -a ARRAY <<< "abc,def,ghi"
read -r -N 1 -a ARRAY <<< "abc"

read -d var <<< "abc"

while IFS= read -r line; do
  printf '%s\n' "$line"
done < "$file"

while IFS=: read -r user pass uid gid gecos home shell; do
  printf '%s: %s\n' "$user" "$shell"
done < /etc/passwd

while IFS=' ,' read -r -N 1 -a ray; do
  :
done <<< "abc, def, ghi"

IFS=' ,' read -a ArrayOut <<< "abc, def, ghi"

while read -N 1 temp; do
  ArrayOut+=(temp)
done <<< "abc"


* If there are fewer words read from the input stream than names, the remaining names are assigned empty values.
* If no names are supplied, the line read is assigned to the variable REPLY. 
* The characters in IFS are used to split the line into words using the same rules the shell uses for expansion. 
* The backslash character (\) may be used to remove any special meaning for the next character read and for line continuation. 


OPT:
-a VAR	-d DELIM		-p PROMPT		-e (readline)
		-n nCHARS		-i TEXT		-r (escaped backslash)
-u FD		-N nCHARS		-t TIMEOUT		-s (silent)


OPTIONS:

-a NAME
 The words are assigned to sequential indices of the array variable NAME, starting at 0.
 NAME is unset before any new values are assigned. Other name arguments are ignored.
 IFS=, read -r -a ARRAY <<< "a,b,c"

-d DELIMITER
 The first character of DELIMITER is used to terminate the input line, rather than newline.
 read -d '}' var <<< "$string"

-e
 If the standard input is coming from a terminal, readline is used to obtain the line. 
 Readline uses the current (or default, if line editing was not previously active) editing settings.

-i TEXT
 If readline is being used to read the line, TEXT is placed into the editing buffer before editing begins.

-n nCHARS
 read returns after reading nCHARS characters rather than waiting for a complete line of input, 
 but honor a delimiter if fewer than nCHARS characters are read before the DELIMITER.

-N nCHARS
 read returns after reading exactly nCHARS characters rather than waiting for a complete line of input, 
 unless EOF is encountered or read times out. DELIMITER characters encountered in the input are not treated 
 specially and do not cause read to return until nCHARS characters are read.

-p PROMPT
 Display prompt on standard error, without a trailing newline, before attempting to read any input. 
 The prompt is displayed only if input is coming from a terminal.

-r
 Backslash does not act as an escape character. The backslash is considered to be part of the line. 
 In particular, a backslash-newline pair may not be used as a line continuation.

-s
 Silent mode. If input is coming from a terminal, characters are not echoed. 
 Convenient to ask for user's password.

-u FD
 Read input from file descriptor FD

-t TIMEOUT
 Cause read to time out and return failure if a complete line of input, or a specified number 
 of characters (when -n nCHARS or -N nCHARS) is used, is not read within TIMEOUT seconds. 
 - TIMEOUT may be a decimal number with a fractional portion following the decimal point. 
 - This option is only effective if read is reading input from a terminal, pipe, or other special file; 
   it has no effect when reading from regular files. 
 - If read times out, read saves any partial input read into the specified variable name.
 - If TIMEOUT is 0, read returns immediately, without trying to read any data.
 The exit status is 0 if input is available on the specified file descriptor, non-zero otherwise. 
 The exit status is greater than 128 if the timeout is exceeded.


* The return code is 0, unless:
  - EOF (end-of-file) is encountered
  - read times out (in which case the return code > 128)
  - variable assignment error occurs (such as assigning to a readonly variable) 
  - an invalid file descriptor is supplied as the argument to -u.

