# Suppressing the output

# https://stackoverflow.com/questions/5260125/whats-the-better-cleaner-way-to-ignore-output-in-powershell


&{
    Write-Warning "hello"
    Write-Error "hello"
    Write-Output "hi"
 } 3>&1 2>&1 > P:\Temp\redirection.log




write-host "Results (ms):"

$m = Measure-Command {$(1..1000)}
write-host $m.TotalMilliseconds -NoNewline
write-host "`tControl group"

$m = Measure-Command {$(1..1000) | Out-Null}
write-host $m.TotalMilliseconds -NoNewline
write-host "`tPipe to Out-Null"

$m = Measure-Command {$(1..100) | Where-Object{$_ -is [int]} | Out-Null}
write-host $m.TotalMilliseconds -NoNewline
write-host "`tPipe to Out-Null using Where-Object"

$m = Measure-Command {[Void]$(1..1000)}
write-host $m.TotalMilliseconds -NoNewline
write-host `t'Cast to [void]'

$m = Measure-Command {$null = $(1..1000)}
write-host $m.TotalMilliseconds -NoNewline
write-host "`tAssignment to `$null"

$m = Measure-Command {$(1..1000) > $null}
write-host $m.TotalMilliseconds -NoNewline
write-host "`tRedirect to `$null"




# Results:
#  0.85 | CONTROL: unsuppressed output
# 11.28 | pipe to Out-Null
#  4.21 | pipe to Out-Null with Where-Object
#  0.50 | assign to null
#  0.49 | cast to void
#  0.43 | redirect to null

# the sore looser is Out-Null piping
