# Brace Expansion

*Brace expansion* is a mechanism by which arbitrary strings may be generated. It is similar to pathname expansion, but the filenames generated need not exist.

Patterns to be brace expanded take the form of:
- an optional preamble, followed by 
- either a series of comma-separated strings or a sequence expression between a pair of braces, followed by 
- an optional postscript
The preamble is prefixed to each string contained within the braces, 
and the postscript is then appended to each resulting string, expanding left to right.

Brace expansions may be nested. 
The results of each expanded string are not sorted; left to right order is preserved.
For example, a{d,c,b}e expands into `ade ace abe'

A sequence expression takes the form 
{x..y[..incr]}
where x and y are either integers or single characters, 
and incr, an optional increment, is an integer.
{1..10..2}
* When integers are supplied, the expression expands to each number between x and y, inclusive.
* Supplied integers may be prefixed with 0 to force each term to have the same width. {01..20..2}
* When either x or y begins with a zero, the shell attempts to force all generated terms 
  to contain the same number of digits, zero-padding where necessary. 

When characters are supplied, the expression expands to each character 
lexicographically between x and y, inclusive, using the default C locale.
* Note that both x and y must be of the same type.  {a..z}
* When the increment is supplied, it is used as the difference between each term. {a..z..2}
* The default increment is 1 or -1 as appropriate. {z..a}

Brace expansion is performed before any other expansions, and any 
characters special to other expansions are preserved in the result. 
* It is strictly textual. 
* Bash does not apply any syntactic interpretation to the 
  context of the expansion or the text between the braces.

* A correctly-formed brace expansion must contain unquoted opening and closing 
  braces, and at least one unquoted comma or a valid sequence expression. 
* Any incorrectly formed brace expansion is left unchanged. 
* A { or , may be quoted with a backslash to prevent its being considered part of a brace expression. 
* To avoid conflicts with parameter expansion, the string ${ is not considered eligible for brace expansion.

This construct is typically used as shorthand when the common prefix of the strings to be generated is long:
mkdir /usr/local/src/bash/{old,new,dist,bugs}
chown root /usr/{ucb/{ex,edit},lib/{ex?.?*,how_ex}}

Brace expansion introduces a slight incompatibility with historical versions of sh. 
sh does not treat opening or closing braces specially when 
they appear as part of a word, and preserves them in the output. 

Bash removes braces from words as a consequence of brace expansion. 

For example, a word entered to sh as file{1,2} appears identically in the output. 

The same word is output as file1 file2 after expansion by bash.

If strict compatibility with sh is desired, start bash with the +B option
or disable brace expansion with the +B option to the set command.
