# Command line processing

Expansion is performed on the command line after it has been split into tokens.


## Expansions and substitutions

- arithmetic expansion
- brace expansion
- command substitution
- filename/pathname expansion
- parameter expansion
- process substitution
- quote removal
- tilde expansion
- word splitting



Brace Expansion
Expansion of expressions in braces, `/s{bin}`

Tilde Expansion
Expansion of the tilde into a folder name.

Shell Parameter Expansion
Expansion of bash variables into their values.

Command Substitution
Using the output of a command as an argument.

Arithmetic Expansion
How to use arithmetic in shell expansions.

Process Substitution
A way to write and read to and from a command.

Word Splitting
How the results of expansion are split into separate arguments.

Filename Expansion
A shorthand for specifying filenames matching patterns.

Quote Removal
How and when quote characters are removed from words.


The order of expansions is:
1. Brace Expansion
2. Expansions, LTR
  - tilde expansion
  - parameter and variable expansion
  - arithmetic expansion
  - command substitution
  - process substitution
3. word splitting
4. filename expansion

On systems that can support it, there is an additional expansion available: process substitution. This is performed at the same time as tilde, parameter, variable, and arithmetic expansion and command substitution.

**Quote Removal**   
After these expansions are performed, quote characters present in the original word are removed unless they have been quoted themselves (quote removal).

Only brace expansion, word splitting, and filename expansion can increase the number of words of the expansion; other expansions expand a single word to a single word.

The only exceptions to this are the expansions of special positional parameters, `$@` and `$*`, and arrays, `${arr[@]}` and `${arr[*]}`.

After all expansions, Quote Removal is performed.
