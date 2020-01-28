# Suppress output

https://stackoverflow.com/questions/5260125/whats-the-better-cleaner-way-to-ignore-output-in-powershell

Suppress console output in PowerShell
1. Piping to `Out-Null` discards the output
2. Typecast to `[void]`
3. Rredirect the output to the automatic variable `$Null`
3. Assign the output to the automatic variable `$Null`

> NOTE: Piping adds delay


```powershell
# Piping to Out-Null
write-host "Check it" | Out-Null
# time: 17ms

# typecasting to [void]
[void] $array.Add(5)
# time: 0.46ms
$array.Add(6)
#> 6

# Redirection to $NULL
write-host "Check it" > $null
# time: 0.39ms

# assignment to `$NULL`
$null = write-host "Check it"
# time: 0.43ms


# another option is `Out-Null` used with the `-inputObject` parameter.
# Using it is fast as the null/void methods, but the syntax is different:
Out-Null -inputObject ($(1..1000) | ?{$_ -is [int]})
```


Suppress all:
`cmd 2>&1 | out-null`

Suppress only standard error:
`cmd $url 2>$null`

`$(cmd $url 2>&) | out-null`
`$(cmd $url) 2>&1 | out-null`
`cmd /c "cmd args 2>&1" | Out-Null`
