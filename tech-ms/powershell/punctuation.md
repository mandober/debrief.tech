# Punctuation characters

- ( [ { ` ' " % ? $ ~ } ] ) 
- *backtick*        escape character
- *single quotes*   demarcate strings
- *double quotes*   demarcate strings (+ var interpolation and escaping)
- *percent*         mod operator, `ForEach-Object` alias
- *question mark*   `Where-Object` alias
- *dollar*          introduces an identifier
- *tilde*           special only in filepaths (user HOME def by `$UserProfile`)
- *parentheses*:
  - **call expression**: enclose parameter list in a function
  - **precedence**: pwsh executes commands in parens first, from the innermost 
    out. This makes it conveninet to run an inner cmd and let its output feed 
    the parameters of an outer command. Similar to bash's: $(expr) or `expr`
- *brackets*:
  - collection **indexing**: array getters, indexes are zero-based
  - type *casting** : casting data as the type in brackets, rel. to `-as`
- *braces*:
  - enclose **illegal identifiers** (made of illegal chars): `${My Var}`
  - contain blocks of executable code or commands, called **script blocks**, 
    often fed to params that expect a script/filter block:
    `Get-Service | Where-Object { $_.Status -eq 'Running' }`
  - **hash table** k/v pairs. hashes are preceded by `@`


```pwsh
# output of inner cmd passed to the outer cmd as input
Get-Service -computerName (Get-Content c:\computernames.txt)

# call expression (without args)
Delete()

# call expression (single arg)
Change-StartMode('Automatic')

# array/collection indexing: get object in the third slot
$services[2]

# casting: type cast
10 / 3             #: 3.33333333333
10 / 3 -as [int]   #: 3

# casting: read a file then parse it as XML
[xml]$data = Get-Content "data.xml"

# script block
Get-Service | Where-Object { $_.Status -eq 'Running' }


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


# VARIABLES

# illegal identifiers:
${My Var} = 123


# creates a new variable, "two", named after the value in $one:
$one = "two"
New-Variable -name $one -value 'Hello'
$two    #: Hello

# creates a new variable named "one"
New-Variable -name one -value 'Heya'
$one    #: Heya
```


