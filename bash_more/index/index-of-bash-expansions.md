# Index :: Bash Expansions

3.5 Shell Expansions
https://www.gnu.org/software/bash/manual/bash.html#Shell-Expansions

Expansion is performed on the command line after it has been split into tokens. 

There are several kinds of expansion performed:
- alias expansion (should be first)
- brace expansion
- then from left to right:
  - tilde expansion
  - parameter and variable expansion
  - arithmetic expansion
  - command substitution
  - process substitution
- word splitting
- filename expansion
  - globbing
    - wildcard expansion
    - generation of filenames
    - ls *.sh      The `*` is any number of characters widcard
    - ls *.htm?    The `?` is 1 character widcard
    - ls *.[oh]    Brackets contain allowed chars
- quote removal
  - backslash removal
  - quotation removal
  - escape removal

When is this performed?
- *alias expansion* (at the time an alias is expanded, the rest of the command line has not yet had variable or wildcard expansions done).
- *history expansion* (using `!` and other symbols on the cmdline)
- *redirections* (operator expansions)


The order of expansions is: brace expansion; tilde expansion, parameter and variable expansion, arithmetic expansion, command substitution (done in a left-to-right fashion); word splitting; filename expansion. After all the expansions, quote removal is performed.

On systems that can support it, there is an additional expansion available: *process substitution*. This is performed at the same time as tilde, parameter, variable, and arithmetic expansion and command substitution.

After these expansions, *quote characters* present in the original word are removed unless they have been quoted themselves (quote removal).

Expansions that may increase the number of words
- brace expansion
- word splitting
- filename expansion

Only brace expansion, word splitting, and filename expansion can increase the number of words (of the expansion). Other expansions expand a single word to a single word. The only exceptions to this are the expansions of `"$@"` and `$*` and `"${name[@]}"` and `${name[*]}`.
