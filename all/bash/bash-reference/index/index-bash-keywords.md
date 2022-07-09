

## Metacharacters

Metacharacters are unquoted symbols that separate words.

Metacharacters:
- Specified by the `$IFS` envar (internal field separators):
  1. SP (space), TAB (HT, tab, `\t`), NL (newline, `\n`)
  - The 3 chars in (1) are the default
  - 
- `|`, `&`, `;`
- `(`, `)`
- `<`, `>`


## Control operators

A token that performs a control function:
- `\n` (NL, newline), `;`, `&`
- `||`, `&&`
- `|`, `|&`
- `;;`, `;&` `;;&`
- `(`, `)`
