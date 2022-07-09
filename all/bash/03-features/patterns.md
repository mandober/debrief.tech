# Patterns, Globs and Regexp

## Globbing

- `*` zero or more charcters, `*.mp3`
- `/etc/**/*` recursively, all files, dirs and subdirs
- `/etc/**/*.txt` text file only in etc and recursively in its subdirs
- `?` stands for any char
- `[a-z]` one of the chars in range
- `[^a-z]` NOT one of the chars in range
- `[!a-z-]` NOT one of the chars in range


## Brace expansion

Brace expansion is not so much of a pattern for matching per se, but more of a text generator that's useful for creating new words (e.g. files, folders) with similar names. However, it may be used as a pattern if the generated name matches, e.g. an existing file.

Brace exapansion is great for generating sequences of numbers or letters. It supports the step value and works in both directions, from low to high values and vice versa.

Synopsis: `{start..stop[..step]}`



Since the string concatenation is done in bash by mere juxtaposition, brace expansion surrounded with prefix and suffix words is oftenly used idiom.



```bash
# sequence generator: {start..stop..step}
echo {1..10..2}

#  numeric sequence generator
echo {1..10}

# generate an alphabet
echo {a..z}

# in both directions
echo {z..a}
```
