# Quoting

**Quoting** is used to remove the special meaning from special characters. Quoting can also alter a shell mechanism: e.g. to skip searching aliases during the command-lookup phase, quote any character of the command (i.e. of the first word on the command line).

Quoting is used
- to turn special into plain characters (escaping), `\\`, `'"'`
- to turn plain into special characters, `\n`
- to prevent special treatment of metacharacters and operators, `\$`
- to prevent searching aliases during the command-lookup phase, `l\s`
- to inhibit recognition of reserved words, `'{}'`
- as means of line-continuation
- to inhibit word-splitting and various word expansions


Each metacharacter has special meaning and must be quoted to stand for itself.

When command history expansion is enabled, the *history expansion character* (usually a bang) must be quoted to prevent history expansion.

There are 3 quoting mechanisms:
1. escape character
2. single quotes
3. double quotes


## Escape character

A non-quoted <backslash> is the escape character. It preserves the literal value of the following character; one exception is the <backslash> <lf> pair that is treated as a line continuation (there must not be a space after the backslash).

```bash
echo \$var   # $var

# line continuation:
decalre -A \
variable
```


## Single quotes
Enclosing characters in single quotes preserves the literal value of each character within the quotes. 
A single quote may not occur between single quotes, even when preceded by a backslash.

## Double quotes
Enclosing characters in double quotes preserves the literal value of all characters within the quotes, with the exception of $, `, \, and, when history expansion is enabled, !. The characters $ and ` retain their special meaning within double quotes. The backslash retains its special meaning only when followed by one of the following characters: $, `, ", \, or <newline>. A double quote may be quoted within double quotes by preceding it with a backslash. If enabled, history expansion will be performed unless an ! appearing in double quotes is escaped using a backslash. The backslash preceding the ! is not removed. The special parameters * and @ have special meaning when in double quotes.


## EOF Marker
End Of File is usually CTRL+D (^D) when input is from the keyboard.
If ^D doesn't work, type 'stty -a' to see what the eof character is.

## ANSI C quoting
$'string'
Words of the form $'string' are treated specially. 
The word expands to string, with backslash-escaped characters replaced as specified by the ANSI C standard. 
Backslash escape sequences, if present, are decoded as follows:

\a   			alert (bell)
\b   			backspace
\e   			an escape character
\E   			an escape character
\f   			form feed
\n   			new line
\r   			carriage return
\t   			horizontal tab
\v   			vertical tab
\\   			backslash
\'   			single quote
\"   			double quote
\c-x 			a control-x character
\nnn  		the eight-bit character whose value is the octal value nnn (one to three digits)
\xHH  		the eight-bit character whose value is the hexadecimal value HH (one or two hex digits)
\uHHHH 		the Unicode (ISO/IEC 10646) character whose value is the hexadecimal value HHHH (one to four hex digits)
\UHHHHHHHH		the Unicode (ISO/IEC 10646) character whose value is the hexadecimal value HHHHHHHH (one to eight hex digits)

* The expanded result is single-quoted, as if the dollar sign had not been present.


## Locale-Specific Translation

$"string"
A double-quoted string preceded by a dollar sign $"string" will cause the string to be translated according to the current locale. 
* If the current locale is C or POSIX, the dollar sign is ignored. 
* If the string is translated and replaced, the replacement is double-quoted.
