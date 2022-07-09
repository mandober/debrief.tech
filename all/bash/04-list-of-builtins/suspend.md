# bash builtins: suspend

`suspend [-f]`

- Suspend the execution of **this shell** until it receives a *SIGCONT* signal.
- login shell cannot be suspended, unless forced with `-f`.
- Return status:
  - 0: all ok
  - 1: the shell is a login shell but `-f` wasn't given
  - 1: job control is not enabled


```bash
ss() (
  echo $PPID
  echo 'I am the subshell in bg'
  suspend
  sleep 5
)

ss &
echo $!

kill -s SIGCONT
```
