# Bash syntax

```bash
# replacing colons in PATH with a newline
# this won't work
printf "%s\n" ${PATH//:/\n}
# must use the special quaotes $'…'
printf "%s\n" ${PATH//:/$'\n'}
```



- $- $$ $? $* $@
- $NAME
- '…'    $'…'
- "…"    $"…"
- (…)    $(…)  `cmd`
- ((…))  $((…))
- { … }
- [ … ]
- [[ … ]]
