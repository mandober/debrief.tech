# Pattern Matching

https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html


```
*     ?       [       ]
```


## 3.5.8.1 Pattern Matching

Any character that appears in a pattern, other than the special pattern characters described below, matches itself. 

* The NUL character may not occur in a pattern. 
* A backslash escapes the following character; the escaping backslash is discarded when matching. 
* The special pattern characters must be quoted if they are to be matched literally.

The special pattern characters have the following meanings:

`*`    
Matches any string, including the null string. When the globstar shell option is enabled, and '*' is used in a filename expansion context, two adjacent '*'s used as a single pattern will match all files and zero or more directories and subdirectories. If followed by a '/', two adjacent '*'s will match only directories and subdirectories.

`?`    
Matches any single character.

`[…]`    
Matches any one of the enclosed characters. 
A pair of characters separated by a hyphen denotes a range expression; 
any character that falls between those two characters, inclusive, using the current locale's collating sequence and character set, is matched. 
If the first character following the `[` is a `!` or a `^` then any character not enclosed is matched. 
A `-` may be matched by including it as the first or last character in the set. 
A `]` may be matched by including it as the first character in the set. 


*The sorting order of characters in range expressions* is determined by the current locale and the values of the `LC_COLLATE` and `LC_ALL` shell variables, if set.

For example, in the default C locale, `[a-dx-z]` is equivalent to `[abcdxyz]`.

Many locales sort characters in dictionary order, and in these 
locales `[a-dx-z]` is typically not equivalent to `[abcdxyz]`; 
it might be equivalent to `[aBbCcDdxXyYz]`, for example. 

To obtain the traditional interpretation of ranges in bracket expressions, 
you can force the use of the C locale by setting the `LC_COLLATE` or `LC_ALL` environment variable to the value `C`, or enable the *globasciiranges* shell option.


```
[:CLS:]   character class,  [:alnum:]
[=ε=]     equivalence class
[.SYM.]   collating class
```


Within `[` and `]`, **character classes** can be specified using 
the syntax `[:CLS:]`, where CLS is one of the following classes defined in the POSIX standard:

```
alnum   alpha   ascii   blank   cntrl   digit   graph   lower
print   punct   space   upper   word    xdigit
```

A character class matches any character belonging to that class. 
The word character class matches letters, digits, and the character `_`.


Within `[` and `]`, an **equivalence class** can be specified using 
the syntax `[=ε=]`, which matches all characters with the same collation weight (as defined by the current locale) as the character 'ε'.


Within `[` and `]`, the syntax `[.SYM.]` matches the **collating symbol** SYM.


If the _extglob_ shell option is enabled using the _shopt_ builtin, 
several extended pattern matching operators are recognized. 

In the following description, a pattern-list is a list of one or more patterns separated by a `|`. 

Composite patterns may be formed using one or more of the following sub-patterns:

`?(pattern-list)`
- Matches zero or one occurrence of the given patterns.

`*(pattern-list)`
- Matches zero or more occurrences of the given patterns.

`+(pattern-list)`
- Matches one or more occurrences of the given patterns.

`@(pattern-list)`
- Matches one of the given patterns.

`!(pattern-list)`
- Matches anything except one of the given patterns.

Complicated extended pattern matching against long strings is slow, especially when the patterns contain alternations and the strings contain multiple matches.

Using separate matches against shorter strings, or using arrays of strings instead of a single long string, may be faster.
