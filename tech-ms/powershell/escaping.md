# Escaping

- __Backtick__ (`) is the escape character in pwsh, unlike CMD.EXE's caret, (^)
- it either grants or removes some special meaning from the following character
- marks special as literal characters. e.g. marks space as a literal, wraps long
  lines by escaping the implicit newline character. *line continuation*
- marks literal as special characters when followed by letters:
  - n newline
  - t tab
  - ~~v vertical tab~~
  - a alert
  - ~~f form feed~~
  - r carriage retrun 


```pwsh
# denote newline
$two = "hi $who `n"

# escape space, treat space as a literal char not cmd separator
cd c:\Program` Files

# line continuation
Test-Path `
$PROFILE
```
