# Bash :: Syntax :: Aspects of bash syntax

whitespace
trailing space
trailing newline
line continuation
quotes
- `'…'`
- `"…"`
- command substitution:
  - tick quotes, `…` (old style), ›file `which printenv`‹
  - new form, 
special forms
- `$'…'`
- `$"…"`
- (tick quotes), `$(…)`, `"$(…)"`, `"$("…nested quotes…")"`
- `((…))`
- `$((…))`
- `$[…]`   ✘
- `$[[…]]` ✘
- `[[…]]`
Unicode escapes
`\xHH`
`\uHHHHHH`



```bash
# line continuation
echo "a line \
is continued"

# a line continuation with embedded newline
echo "a line \n\
is continued"

```
