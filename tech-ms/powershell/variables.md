# Variables

- classic rules for identifiers (names of vars, consts, funcs, classes, etc.)
- var name may be enclosed in braces
- var name must be enclosed in braces if identifier has llegal characters
- vars have `$` sigil except when defined using `New-Variable` cmdlet
- therefore this cmdet can be used to create variable variables
- hash tables are *K=V;* pairs, in braces prefixed with `@` sigil



```pwsh
# dollar sigil always (on create, read and write)
$a = "qwerty"

# except if var created using the cmdlet...
New-Variable -name one -value 'Heya'

# ...which makes variable variables possible:
New-Variable -name $a -value 'zxcvb'
$qwerty
#: zxcvb

# illegal identifiers wrapped in braces
${My Var} = 123

# also as delimiters in interpolated strings
echo "There are ${post}s"


# HASH TABLES

# hash table: new
$ht = @{ a='mickey'; b={5+3} }

# hash table: access
$ht['a']    #: mickey
$ht['b']    #: 5+3

# here, braces enclose hash-table but also a expression script block:
# (which is the value for the second key)
$hash = @{
  a='SomeValue';
  b={EXPRESSION}
}
```


