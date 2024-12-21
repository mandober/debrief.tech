# Variable assignment

- variable assignment is done using assignment statement, `NAME=VALUE`
- operationally, it is just a name/value pair
- the shell first expands the VALUE, then assigns that expansion to the NAME
- If VALUE is omitted, the empty string is assigned to NAME
- it is possible to only define a NAME, with `declare NAME`, without assigning it any value.
- positional number systems, base is given ater `#`, e.g. `n=$((133#16))`

Before being assigned to the NAME, VALUE undergoes these expansions
- tilde expansion
- parameter expansion
- command substitution
- arithmetic expansion
- quote removal 

- variable assignments affect the current shell environment.
- assignment to a readonly variable (declared with `-r` attribute) triggers an error and the command exits with a non-zero code.
- assigning a non-integer variable to variable with the integer attribute set (declared with `-i` attribute), triggers an error and the command exits with a non-zero code.
- variable assignment (a key=value pair) that precedes a command name does not affect the current environment but only the subshell in which the comamnd will be executed.
- e.g. `USER=noone echo $USER` changes only the subshell's environment, which is destoryed as soon as echo finishes anyway.

>Bash does not consider assignment as command, so the previous command's return/exit status is preserved after assignments.

- However, an assignement with the `declare` builtin *is considered a command*, so the evaluated exit code in that case is the assignement itself and not the command executed in the subshell.


```bash
(Q=1 declare -p Q)
>>>declare -x Q="1"

(Q=1 printenv Q)
>>>1

set -o keyword

(q=1 printenv q && printenv z z=2)
>>>1
>>>2

(a=1 b=2 printenv a b c a=3 b=4)
>>>3
>>>4

(a=1 b=2 printenv a b c a=3 b=$((b+4)))
>>>3
>>>6
```

NUMBERS
base10  n=14 echo $n     -> 14
base2   n=$[2#010110111] -> 183
base8   n=$[8#34]        -> 28
base10  n=$[10#54]       -> 54
base16  n=$[16#ff]       -> 255


```bash
n=$[16#fe]
m=$((16#ff))
```
