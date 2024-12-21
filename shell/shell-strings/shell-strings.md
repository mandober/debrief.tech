# Shell strings

Shell has numerous entities, it's important to keep them in line i.e. cimpletely defined. For example, there is a bunch of string-like entities liek names and words and such, and these are not strictly defined.

Shell is typeless, i.e. it has a single type - **string**.

## String theory

To define a sequence of characters as being of some particular sort (e.g. name, identifier, word, WORD, C-string, label, pattern, etc.) these properties need to be determined (at least):
- alphabet, a finite set of symbols
- rules of composition (building rules)



A sequence of characters is qualified by these properties
- elements are pulled from a specified set
- is the empty string (ϵ) a valid member?
- does it uses delimiters? which?
- does it require terminators? which?
- format (P-string, C-string)
- quotes?
- interpolation?
- escaping


An ASCII sequnce is a sequence of characters pulled from the ASCII set 
built using the elements of an allowed set of characters.


A (unqualified, underspacified) word is a sequence built using the elements of an allowed set of characters.


A C-string is a sequence of ASCII characters terminated by the ASCII character NUL (\0).


delimited
String may be delimited


A word, written "word",
A word, written "WORD",

A WORD is a sequence of characters (built from a subset of ASCII characters or Unicode letters) treated as a unit by the shell.

A *WORD* is a non-zero-length sequence of characters delimited by white space.
A *word* is a non-zero-length sequence of characters delimited by white space.


Words do not not include unquoted *metacharacters*.
