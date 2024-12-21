# Bash :: Escaping


```bash
# bash 5.0.17(1)

echo abc$'\010'
# abc

echo -e abc$'\010'
# abc

echo abc$'\010'xyz
# abxyz

echo -e abc$'\010'xyz
# abxyz

echo -e abc$'\010'xyz
# abxyz

printf "abc%cxyz\n" $'\010'
# abxyz
```

## echo bash builtin

echo: echo [-neE] [arg ...]

Write arguments to the standard output.

Display the ARGs, separated by a single space character and followed by a newline, on the standard output.

Exit Status: Returns success unless a write error occurs.

Options:
-n        do not append a newline
-e        enable interpretation of the following backslash escapes
-E        explicitly suppress interpretation of backslash escapes

* `echo` interprets the following backslash-escaped characters:
  - `\a`        alert (bell)
  - `\b`        backspace
  - `\c`        suppress further output
  - `\e`        escape character
  - `\E`        escape character
  - `\f`        form feed
  - `\n`        new line
  - `\r`        carriage return
  - `\t`        horizontal tab
  - `\v`        vertical tab
  - `\\`        backslash

  - [\'] single quote ¹
  - [\"] double quote ¹
  - [\?] question mark ¹

- [\0nnn]
  The character whose ASCII code is NNN (octal).
  NNN can be 0 - 3 octal digits

- [\nnn] ¹
  The character whose ASCII code is NNN (octal).
  NNN can be 0 - 3 octal digits

- [\xHH]
  The eight-bit character whose value is HH (hexadecimal).
  HH can be 1 - 2 hex digits


- [\uHHHH]
  The Unicode character whose value is the hexadecimal value HHHH.
  HHHH can be 1 - 4 hex digits.

- [\UHHHHHHHH]
  The Unicode character whose value is the hexadecimal value HHHHHHHH.
  HHHHHHHH can be 1 - 8 hex digits.


¹ From the official manual, absent from `help echo`

mark⃰
mark
(*) 🞯 🞰 🞱 
