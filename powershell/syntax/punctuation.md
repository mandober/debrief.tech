# Punctuation


*Backtick* is the escape character: strips or gives special meaning

```powershell
# newline
$two = "hi $who `n"

# treat space as a literal char
cd c:\Program` Files

# line continuation
Test-Path `
$PROFILE
```

*Tilde* is special only in a filepath when it represents the current user's home directory as defined by the `UserProfile` environment variable.

*Parentheses* are used for precedence and method calls.

* precedence: 
  powershell executes parenthetical commands first, from the innermost parentheses to the outermost. This is a good way to run an inner command and have its output feed the parameter list of main, outer, command.
* call expression: 
  enclosing method params (if no params required)

```powershell
# run inner command and have its output feed the params of main command
Get-Service -computerName (Get-Content c:\computernames.txt)

# method call
Change-StartMode('Automatic')

# method call wo param
Delete()
```

*Square brackets* are used for collection indexing and casting.

* collection indexing: indexes are zero-based
* casting: `-as`, casting data as the bracketed type

```powershell
# get obj at index 3
$services[2]

# casting result as int
10 / 3
#> 3.33333333333
10 / 3 -as [int]
#> 3

# reads a file, attempts to parse it as a valid XML:
[xml]$data = Get-Content "data.xml"
```

*Braces*
- Identifiers containing illegal characters, `${My Var}`
- They contain blocks of executable code or commands, called **script blocks**, which are often fed to parameters that expect a script block or a filter block:
`Get-Service | Where-Object { $_.Status -eq 'Running' }`
- They contain the key=value pairs that make up a new hash table.
  The opening brace is always preceded by an `@` sign. 
  In the following example, we use braces both to enclose the hash-table key=value pairs (of which there are two) and to enclose an expression script block, which is the value for the second key, `e`:
  `$hashtable = @{a='SomeValue'; b={EXPRESSION}}`

```powershell
# identifiers w illegal characters
${My Var} = 123

# script block
Get-Service | Where-Object { $_.Status -eq 'Running' }

# hash table
$ht = @{ a='mickey'; b={5+3} }

$ht['a']
#> mickey
$ht['b']
#> 5+3

# hash table def can be split accross lines
$ht = @{
  a='mickey';
  b={5+3}
}
```

- *Single quotes* demarcate strings.
- *Double quotes* demarcate strings and support var interpolation and escaping.
- *Percent sign* is alias for `ForEach-Object` cmdlet and a mod operator.
- *Question mark* is alias for `Where-Object` cmdlet.
- *Dollar sign* introduces an identifier: it tells the shell that the following characters, up to the next whitespace, represent a variable name.

```powershell
$one = "two"
# creates a new variable, "two", named after the value in $one
New-Variable -name $one -value 'Hello'
$two
# Hello

# creates a new variable named "one"
New-Variable -name one -value 'Heya'
$one
# Heya
```
