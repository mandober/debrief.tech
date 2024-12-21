# Bash :: Tips

## Check-list

1. Idempotence


Make everything idempotent, especially env vars, and especially `PATH`. Also, `COMMAND_PROMPT` may blow up if it was set using append-string pattern

Basically, avoid patterns like
- append-to operator (`+=`) pattern, e.g. `EVAR+=…`
- EVAR=$EVAR:…

## Export

To declare a new shell var you intend to export
- at the top level: declare -x VAR
- inside a function: declare -gx VAR
  This is pretty weird, but it would probably need the -g (global) flag as well because vars declared inside a function are local by default.
- declare a local variable inside a funciton:
  - declare VAR
  - local VAR

export a shell variable, declare it using the `-x` flag, e.g. `declare -x PATH`

it is sufficient to 

An env var 

## Infinite loop

```bash
# : is the official null command
while :; do :; done

while :; do echo "busy waiting…"; done

for ((;;)); do echo "busy waiting…"; done

busy () {
  trap 'echo SIGTSTP; return' SIGTSTP
  while :; do echo "busy waiting…"; sleep 1; done
}
```
