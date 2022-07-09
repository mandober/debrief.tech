# Arrays

- arrays are collection of `key=value` pairs, strictly one-dimensional
- *indexed array*: keys are integers, zero based, keys are sparse/packed
- *associative array*: keys are strings, there is no ordering of keys
- both kinds of arrays are heterogenous except an array cannot be element
- arrays are bound by a *array-var* in a declare statement:
  - `declare -a indexedArray` (explicit declaration is optional but recommended)
  - `declare -A associativeArray` (must be declared explicitly)


## Indexed Array
- heterogenous
- strictly one-dimensional
- keys are indices i.e. interger (zero based) numbers
- indices may be ordered naturally
- elements are referred to by a subscript
- subscript is in brackets, which is arithetic context evaluating to an int
- in the subscript arith. conext variables may appear without the dollar sigil
- declaration may be explicit:

```bash
# explicit declaration
declare -a Nix

# explicit declaration and assignment
declare -a Nix=(Ubuntu Arch Strikey)

# implicit declaration
Nix=(Ubuntu Arch Strikey)

# slap parens, possibly also a commad substitution operator, around
# a space-delimited sentence to quickly obtain an indexed array
seq=( $( echo {1..10} ) )
```

## Associative Array
- heterogenous
- strictly one-dimensional
- keys are strings
- there is no notion of order, when iterated elements may appear in any order


```bash
# declare and assign
declare -A Linii=([a]=61 [b]=62)

# split declare
declare -A Linii
# and assignment
Linii=(
  [ubuntu]='Simon Spectacular'
  [debian]='Lizzy Thin'
)

# late addition
Linii[minty]='Larrikin Love'
```
