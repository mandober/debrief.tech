# POSIX :: Regex classes

https://www.regular-expressions.info/posixbrackets.html

- [:lower:]  [a-z]
- [:upper:]  [A-Z]
- [:alpha:]  [a-zA-Z]
- [:digit:]  [0-9]
- [:alnum:]  [a-zA-Z0-9]
- [:xdigit:] [A-Fa-f0-9]
- [:word:]   [A-Za-z0-9_] Word chars (letters, numbers, underscores)

- [:blank:]  [ \t]  SPACE and TAB
- [:space:]  [ \t\r\n\v\f] All whitespace chars including line breaks

- [:punct:]  [!"\#$%&'()*+, \-./:;<=>?@\[\\\]^_`{|}~] Punctuation

- [:cntrl:]  [\x00-\x1F\x7F] Control characters (0x00-0x1f, 0x7f)
- [:graph:]  [\x21-\x7E] Visible chars (ASCII except SPACE and CC)
- [:print:]  [\x20-\x7E] Visible chars and SPACE (ASCII except CC)
- [:ascii:]  [\x00-\x7F] ASCII range


blank = SPACE (0x20), TAB (\t, 0x09)
space = SPACE (0x20), TAB (\t, 0x09), VTAB (\v), CR (\r), LF (\n), FF (\f)
graph = print + SPACE (0x20)
cntrl + print = ascii


(lower, upper) ⊂ alpha ⊂ alnum ⊂ word
(digit, xdigit) ⊂ alnum ⊂ word
graph ⊂ print ⊂ ascii
cntrl ⊂ ascii


e.g.

```bash
VAR="a string"
echo "${VAR//[[:xdigit:]]}"
```


```
POSIX | Description | ASCII | Unicode | Shorthand

[:alnum:]  | Alphanumeric characters | [a-zA-Z0-9] | [\p{L}\p{Nl} \p{Nd}] |  | \p{Alnum}
[:alpha:]  | Alphabetic characters | [a-zA-Z] | \p{L}\p{Nl} |  | \p{Alpha}
[:ascii:]  | ASCII characters | [\x00-\x7F] | \p{InBasicLatin} |  | \p{ASCII}
[:blank:]  | Space and tab | [ \t] | [\p{Zs}\t] | \h | \p{Blank}
[:cntrl:]  | Control characters | [\x00-\x1F\x7F] | \p{Cc} |  | \p{Cntrl}
[:digit:]  | Digits | [0-9] | \p{Nd} | \d | \p{Digit}
[:graph:]  | Visible characters (anything except spaces and control characters) | [\x21-\x7E] | [^\p{Z}\p{C}] |  | \p{Graph}
[:lower:]  | Lowercase letters | [a-z] | \p{Ll} | \l | \p{Lower}
[:print:]  | Visible characters and spaces (anything except control characters) | [\x20-\x7E] | \P{C} |  | \p{Print}
[:punct:]  | Punctuation (and symbols). | [!"\#$%&'()*+, \-./:;<=>?@\[\\\]^_`{|}~] | \p{P} |  | \p{Punct}
[:space:]  | All whitespace characters, including line breaks | [ \t\r\n\v\f] | [\p{Z}\t\r\n\v\f] | \s | \p{Space}
[:upper:]  | Uppercase letters | [A-Z] | \p{Lu} | \u | \p{Upper}
[:word:]   | Word characters (letters, numbers and underscores) | [A-Za-z0-9_] | [\p{L}\p{Nl} \p{Nd}\p{Pc}] | \w | \p{IsWord}
[:xdigit:] | Hexadecimal digits | [A-Fa-f0-9] | [A-Fa-f0-9] |  | \p{XDigit}
```

## POSIX bracket expressions

**POSIX bracket expressions** are a special kind of *character classes*. POSIX bracket expressions match one character out of a set of characters, just like regular character classes. They use the same syntax with square brackets. A hyphen creates a range, and a caret at the start negates the bracket expression.

>One key syntactic difference is that the backslash is NOT a metacharacter in a POSIX bracket expression.

So in POSIX, the regular expression `[\d]` matches a `\` or a `d`. To match a `]`, put it as the first character after the opening `[` or the negating `^`. To match a `-`, put it right before the closing `]`. To match a `^`, put it before the final literal `-` or the closing `]`. Put together, `[]\d^-]` matches `]`, `\`, `d`, `^` or `-`.

The main purpose of bracket expressions is that they adapt to the user's or application's *locale*. A locale is a collection of rules and settings that describe language and cultural conventions, like sort order, date format, etc. The POSIX standard defines these locales.

Generally, only *POSIX-compliant regular expression engines* have proper and full support for POSIX bracket expressions. Some non-POSIX regex engines support POSIX character classes, but usually don't support *collating sequences* and *character equivalents*. Regular expression engines that support Unicode use Unicode properties and scripts to provide functionality similar to POSIX bracket expressions. In Unicode regex engines, shorthand character classes like `\w` normally match all relevant Unicode characters, alleviating the need to use locales.

## Character Classes

Don't confuse the POSIX term "character class" with what is normally called a regular expression character class. `[x-z0-9]` is an example of what is called a "character class", but what POSIX calls a "bracket expression".

`[:digit:]` is a POSIX character class, used inside a *bracket expression* like `[x-z[:digit:]]`. The POSIX character class names must be written all lowercase.
