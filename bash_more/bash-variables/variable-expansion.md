# Shell Parameter Expansion

https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion

In general, parameter is used synonymously with variable. In bash, the set of *parameters* seems to be a superset of the set of *variables* since it also includes special parameter names (`@`, `*`, `$`, `!`, `-`).



The `$` character introduces 
- parameter expansion, $VAR
- command substitution, $(…)
- arithmetic expansion, $((…))

The parameter name or symbol to be expanded may be enclosed in braces, which are optional but serve to protect the variable to be expanded from characters immediately following it which could be interpreted as part of the name, `${s}`.

When braces are used, the matching ending brace is the first `}` not escaped by a backslash or within a quoted string, and not within an embedded arithmetic expansion, command substitution, or parameter expansion.

The basic form of parameter expansion is `${parameter}`. The value of parameter is substituted. The parameter is a shell parameter or an array reference. The braces are required when parameter is a positional parameter with more than one digit, or when parameter is followed by a character that is not to be interpreted as part of its name.

If the first character of parameter is an exclamation point (!), and parameter is not a nameref, it introduces a level of indirection. Bash uses the value formed by expanding the rest of parameter as the new parameter; this is then expanded and that value is used in the rest of the expansion, rather than the expansion of the original parameter. This is known as indirect expansion. The value is subject to tilde expansion, parameter expansion, command substitution, and arithmetic expansion. If parameter is a nameref, this expands to the name of the variable referenced by parameter instead of performing the complete indirect expansion. The exceptions to this are the expansions of ${!prefix*} and ${!name[@]} described below. The exclamation point must immediately follow the left brace in order to introduce indirection.

In each of the cases below, word is subject to tilde expansion, parameter expansion, command substitution, and arithmetic expansion.

When not performing substring expansion, using the form described below (e.g., ':-'), Bash tests for a parameter that is unset or null. Omitting the colon results in a test only for a parameter that is unset. Put another way, if the colon is included, the operator tests for both parameter's existence and that its value is not null; if the colon is omitted, the operator tests only for existence.


```bash
s="shell variable"
echo $s
echo "$s"
echo "${s}s"


```
