# Bash :: Index :: Parameter Transformation Operators

Each transformation operator is a single letter: `UuL QE P Aa Kk`

The form of variable expansion: `${parameter@operator}`.

- `U` value is UPPERCASED
- `u` value is Title cased
- `L` value is lowercased
- `Q` value quoted in a format reusable for input.
- `E` backslash escape sequences in value expanded à la `$'…'`
- `P` value processed as a prompt string
- `A` assignment statement or declare command to recreate the variable
- `a` expands to the parameter's attributes (`i`, `xr`, ϵ, …)
- `K` 
Produces a possibly-quoted version of the value of parameter, except that it prints the values of indexed and associative arrays as a sequence of quoted key-value pairs.

- `k` (since bash-v.5.2)    
Like the `K` transformation, but expands the keys and values of indexed and associative arrays to separate words after word splitting. 

```
--
-x
-r
-i
-a
-A

-ar
-ir
-ix

-f
-fx
```

If parameter is `@` or `*`, the operation is applied to each positional parameter in turn, and the expansion is the resultant list.

If parameter is an array variable subscripted with `@` or `*`, the operation is applied to each member of the array in turn, and the expansion is the resultant list.

The result of the expansion is subject to
- word splitting
- filename expansion
