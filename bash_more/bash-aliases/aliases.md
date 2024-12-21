# Aliases

- use backslash to invoke non-alias command (skips alias namespace)
- alias def followed by space let's bash check if the next word is an alias


```bash
$ alias foo='echo "shell\tword\tone"'
$ alias f2='| cut -f2 '
$ foo f2
shell   word    one f2 # alias f2 is not expanded (!)

$ alias foo='echo "shell\tword\tone" ' # note the trailing space!
$ foo f2
word # alias f2 is now expanded

$ alias bar='| tr o O '
$ foo f2 bar
wOrd
```
