 bash | manual

Pattern Matching


Any character that appears in a pattern, other than the 
special pattern characters described below, matches itself.

* The NUL character may not occur in a pattern.
* A backslash escapes the following character; the escaping backslash is discarded when matching. 
* The special pattern characters must be quoted if they are to be matched literally.

The special pattern characters have the following meanings:

*
Matches any string, including the null string.

**
When the globstar shell option is enabled, and * is used in a pathname expansion context,
two adjacent *s used as a single pattern (**) will match all files and zero or more directories and subdirectories. 
If followed by a /, two adjacent *s (**/) will match only directories and subdirectories.

?
Matches any single character.

[...] Matches any one of the enclosed characters. A pair of characters separated by a hyphen denotes a range expression; any character that
      falls between those two characters, inclusive, using the current locale's collating sequence and character set, is matched. If the first
      character following the [ is a ! or a ^ then any character not enclosed is matched. The sorting order of characters in range expressions
      is determined by the current locale and the values of the LC_COLLATE or LC_ALL shell variables, if set. To obtain the traditional inter‐
      pretation of range expressions, where [a-d] is equivalent to [abcd], set value of the LC_ALL shell variable to C, or enable the globasci‐
      iranges shell option. A - may be matched by including it as the first or last character in the set. A ] may be matched by including it as
      the first character in the set.

      Within [ and ], character classes can be specified using the syntax [:class:], where class is one of the following classes defined in the
      POSIX standard:
      alnum alpha ascii blank cntrl digit graph lower print punct space upper word xdigit
      A character class matches any character belonging to that class. The word character class matches letters, digits, and the character _.

      Within [ and ], an equivalence class can be specified using the syntax [=c=], which matches all characters with the same collation weight
      (as defined by the current locale) as the character c.

      Within [ and ], the syntax [.symbol.] matches the collating symbol symbol.

If the extglob shell option is enabled using the shopt builtin, several extended pattern matching operators are recognized. In the following description, a pattern-list is a list of one or more patterns separated by a |. Composite patterns may be formed using one or more of the following sub-patterns:

       ?(pattern-list)
           Matches zero or one occurrence of the given patterns
       *(pattern-list)
           Matches zero or more occurrences of the given patterns
       +(pattern-list)
           Matches one or more occurrences of the given patterns
       @(pattern-list)
           Matches one of the given patterns
       !(pattern-list)
           Matches anything except one of the given patterns
