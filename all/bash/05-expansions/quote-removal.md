# Quote Removal

There are 3 kids of quoting mechanism in bash:
- backslash escape, `\$var`
- single quotes, `'$var'`
- double quotes, `"$var"`

Quoting using the double quotes enables parameter expansion and is often used in string interpolation. Single quotes and backslashes both escape special characters.

After bash finishes with the expansion stage, all *unquoted occurrences* of the quoting characters, `\`, `'` and `"`, that were not produced due to expansions, are removed.

> This means that quoting is removed in layers - with each evaluation bash removes one layer of quotes.

```bash
echo \$BASH
# $BASH
```
