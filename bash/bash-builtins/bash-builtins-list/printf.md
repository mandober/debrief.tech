# Builtins: printf

printf [-v NAME] FMT [ARGS]

Print args to stdout in a way controlled by FMT format specifiers and modifiers. Besides the standard format specifications, as described in `man 1 printf`, this printf also interprets: `%b`, `%q` and `%(fmt)T`


FORMAT SPECIFIERS
=================

%b
%q
%(fmt)T
%s
%c
%n
%d %i
%u
%f
%o
%x %X
%g %G
%a %A
%e %E
%%


BACKSLASH ESCAPES
=================

- `\"`          double quote
- `\\`          backslash
- `\a`          alert (BEL)
- `\b`          backspace
- `\c`          produce no further output
- `\e`          escape
- `\f`          form feed
- `\n`          new line
- `\r`          carriage return
- `\t`          horizontal tab
- `\v`          vertical tab
- `\NNN`        byte with octal value NNN (1 to 3 digits)
- `\xHH`        byte with hexadecimal value HH (1 to 2 digits)
- `\uHHHH`      Unicode (ISO/IEC 10646) char with hex value HHHH (4 digits)
- `\UHHHHHHHH`  Unicode char with hex value HHHHHHHH (8 digits)




       %b     ARGUMENT as a string with '\' escapes interpreted, except that octal escapes are of the form \0 or \0NNN

       %q     ARGUMENT is printed in a format that can be reused as shell input, escaping non-printable characters with the proposed POSIX $'' syntax.


       and all C format specifications ending with one of diouxXfeEgGcs, with ARGUMENTs converted to proper type first.  Variable widths are handled.

       NOTE: your shell may have its own version of printf, which usually supersedes the version described here.  Please refer to your shell's documentation for details about the options it supports.

---

%(TIME_FORMAT)T
- output the date-time string resulting from using `TIME_FORMAT` as a format string for `strftime`
- the corresponding arg is an int representing:
  * number of seconds since the epoch, as in `(date +%s)`
  * if `-1` it represents the current time
  * if `-2` it represents the time the shell was invoked
- without the args, conversion behaves as if `-1` had been given (this is an exception to the usual printf behavior).



printf '%d' \'a   # 97
printf '%d' '"D'  # 68



OPTIONS
=======

`-v NAME`   
Prints to variable NAME instead to stdout (similar to `sprintf` in C)

`--help`    
Displays short help. See `man 1 printf` for more details.




## Format Specifiers

Strings
- `%s` Interpret arg literally and print it as a string.
- `%b` Print arg and interpret *backslash escapes*.
- `%q` Print arg shell-quoted, reusable as input.
- `%c` Interpret arg as char and print only its 1st character.

Print char count to arg variable
* `%n` Assigns the number of chars printed so far to var named in the arg.

Percent
- `%%` Double the percent sign to print one `%`

Numbers
- `%d` Print arg as *signed decimal*.
- `%i` Print arg as *signed decimal* (same as %d)
- `%u` Print arg as *unsigned decimal*.
- `%f` Interpret and print arg as a *float*.
- `%o` Print arg as unsigned *octal* number
- `%x` Print arg as unsigned *hex* with lowercase hex-digits (a-f)
- `%X` Print arg as unsigned hex with uppercase hex-digits (A-F)

Doubles
- `%g` Interpret arg as *double*, prints it like `%f` or `%e`
- `%G` Interpret arg as *double*; same as `%g`, but print it like `%E`

- `%a` Interpret arg as *double*, print it like C99 hex float literal
- `%A` Interpret arg as *double*. Same as `%a`, print it like `%E`

**e** is for exponential (scientific) form
- `%e` Interpret arg as *double*, and print it in <N>±e<N> format
- `%E` Interpret arg as *double*, and print it in <N>±E<N> format



```bash
printf '%a\n' 22            # 0xbp+1
printf '%a\n' 2200021554    # 0x8.321aa32p+28
```



## Print to variable

`-v NAME` option causes the output to be assigned to the variable NAME instead of being printed. It can also be used to assign to array indices.

```bash
str="Stringy Lingy"
printf '%s' "$str" # Stringy Lingy
printf '%s' $str   # StringyLingy
printf -v var '%s' "$str"

Indexed=(0 1 2)
# Indexed=([0]="0" [1]="1" [2]="2")

printf -v Indexed '%d' 100
# Indexed=([0]="100" [1]="1" [2]="2")

printf -v Indexed[3] '%d' 300
# Indexed=([0]="100" [1]="1" [2]="2" [3]="300")
```


## Format

Format consists of characters which specify 3 types of elements:
1. *Plain characters* are copied to stdout
2. *Character escape sequences* are converted then copied to stdout
3. *Format specifications*, each causes printing of the next arg


- `%s` Strings
- `%d` Digits
- `%q` Causes output of its arg in a format reusable as shell input.
- `%b` Causes expansion of backslash escape sequences in its arg.
       More rules apply here:
       - `\c` terminates the output
       - backslashes in `\'`, `\"`, and `\?` are not removed
       - octal escapes beginning with `\0` may contain up to 4 digits

`%(FORMAT)T`
- output the date-time string resulting from using `FORMAT` as a format string for `strftime`
- the corresponding arg is an int representing:
  * number of seconds since the epoch, as in `(date +%s)`
  * if `-1` it represents the current time
  * if `-2` it represents the time the shell was invoked
- without the args, conversion behaves as if `-1` had been given (this is an exception to the usual printf behavior).


- Args to non-string format specs are treated as C constants,
- except that a leading plus/minus is allowed, and
- if the leading character of the arg is a *quote* (single or double), the value is the *ASCII value* of the following character

```bash
printf '%d' \'a   # 97
printf '%d' '"D'  # 68
```

- The format is reused as many times as necessary to consume all of args.
- If the format requires more arguments than are supplied, the extra format specs behave as if zero/ϵ was given.
- return value is zero on success, non-zero on failure.

- `%s` Interprets the associated argument literally as string
- `%b` Print its arg while interpreting backslash escapes therein
- `%q` Print arg shell-quoted, reusable as input
- `%c` Interprets the arg as char: only the 1st char of given arg is printed
- `%d` Print the arg as signed decimal number.
- `%i` Same as `%d`
- `%u` Print the associated argument as unsigned decimal number
- `%f` Interpret and print the associated argument as floating point number
- `%o` Print the argument as unsigned octal number
- `%x` Print arg as unsigned hex with lowercase hex-digits (a-f)
- `%X` Print arg as unsigned hex with uppercase hex-digits (A-F)
- `%e` Interpret the arg as double, and print it in <N>±e<N> format
- `%E` Interpret the arg as double, and print it in <N>±E<N> format
- `%g` Interprets the arg as double, but prints it like `%f` or `%e`
- `%G` Interprets the arg as double; same as `%g`, but print it like `%E`
- `%a` Interprets the arg as double, print it like C99 hex float literal
- `%A` Interprets the argument as double. Same as `%a`, print it like `%E`
- `%%` No conversion is done, it just prints the % (percent sign)
- `%n` Assigns the number of chars printed so far to var named in the arg
       Cannot specify an array index. `printf "%s%n" "abcd" var; echo $var #4`




## Format Modifiers

Format modifiers, which modify the formatting, are specified between the introductory `%` and the formatting character in the format specifier.

```bash
printf "%50s\n" "This field will take 50 characters of space"
```

### Field and printing modifiers


#### Field output format

`n` 
- specifies a minimum field width. 
- if the text is shorter, it's padded with spaces
- if longer, the field is expanded

`.`
- The dot together with a field width makes the text truncated
- `%.s` is equivalent to `%.0s`, which effectively hides the field

`*`
- the field's width is given in the previous arg
- e.g. `printf "%*s\n" 20 "test string"` (asterix is associated to "20")

`-`
- print left-aligned text (default is right-aligned)

`0`
- Pads numbers with zeros, not spaces

`<space>`
- pad a positive number with a space
- put a minus for negative numbers

`+`
- Prints all numbers signed: + sign for positive, - for negative

`'`
- For decimal conversions, the thousands grouping separator is applied to the int portion of the output according to the current `LC_NUMERIC`



### Alternative format for numbers with a hash symbol

`%#o`
- unless zero, the octal number is printed with a leading zero

`%#x, %#X`
- unless zero, the hex is printed with a leading `0x` or `0X`

`%#g, %#G`
- The float is printed with the trailing zeros until the number of digits for the current precision is reached; by default, trailing zeros are not printed.


> All number formats (except %d, %o, %x, %X) always print a decimal point in the output, even if no digits follow it.



### Precision

The precision for a float or double can be specified by using .<DIGITS>, 
where <DIGITS> is the number of digits for precision. 
If <DIGITS> is an asterisk (*), the precision is read from the 
argument that precedes the number to print, like 
printf "%.*f\n" 10 4,3   # prints 4,3000000000

* The format .*N to specify the Nth argument for precision does not work in Bash.
* For strings, the precision specifies the maximum number of characters to print (i.e., the maximum field width). 
* For integers, it specifies the number of digits to print (zero padding).


### Escape codes

These are interpreted if used anywhere in the format string, or in an argument corresponding to a %b format.

Code			Description
\\			Prints the character \ (backslash)
\a			Prints the alert character (ASCII code 7 decimal)
\b			Prints a backspace
\f			Prints a form-feed
\n			Prints a newline
\r			Prints a carriage-return
\t			Prints a horizontal tabulator
\v			Prints a vertical tabulator
\"			Prints a '
\?			Prints a ?
\OCT			Interpret OCT as octal and print the corresponding char from the char set
\0OCT			Interpret OCT as octal and print the corresponding char from the char set.
\xHEX			Interpret HEX as hex and print corresponding char from the char set (3 digits)
\uHEXX		Interpret HEXX as hex and print corresponding char from the char set (4 digits).
\UHEXXxxxx		Interpret HEXXxxxx as hex and print corresponding char from the char set (8 digits).

The following additional escape and extra rules apply only to arguments associated with a %b format:
\c	Terminate output similarly to the \c escape used by echo -e. 
printf produces no additional output after coming across a \c escape in a %b argument.

* Backslashes in the escapes: \', \", and \? are not removed.
* Octal escapes beginning with \0 may contain up to four digits. (POSIX specifies up to three).
These are also respects in which %b differs from the escapes used by $'...' style quoting.
