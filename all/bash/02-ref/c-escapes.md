


ASCII control characters

name     | C-esc | ^-esc | notes
null      \0  ^@    null-string, null-byte
bell      \a  ^G    alert (bell)
backspace \b  ^H    erase previous character
tab       \t  ^I    horizontal tab
line feed \n  ^J    new line
form feed \f  ^L    tty will clear screen, printer will do other shit
cr        \r  ^M    carriage return.
escape    \e  ^[    escape, \e or \E, escape sequence: `\e[`
delete        ^?    erase character (right of the cursor)


* `\r\n` pair is used by Windows and by Application Layer protocols (HTTP)

\a     alert (bell)
\b     backspace
\c     suppress further output
\e   an escape character
\E     an escape character
\f     form feed
\n     new line
\r     carriage return
\t     horizontal tab
\v     vertical tab
\\     backslash
