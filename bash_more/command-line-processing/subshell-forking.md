# Forking a subshell

A subshell starts out as an almost identical copy of the parent shell process. Under the hood, the shell calls the `fork` system call ¹, which creates a new process whose code and memory are copies ².

When the subshell is created, there are very few differences between it and its parent. In particular, they have the same variables. Even the `$$` special variable keeps the same value in subshells: it's the original shell's process ID. Similarly `$PPID` is the PID of the parent of the original shell.

A few shells change a few variables in the subshell. Bash sets `BASHPID` to the PID of the shell process, which changes in subshells. Bash, zsh and mksh arrange for `$RANDOM` to yield different values in the parent and in the subshell. But apart from built-in special cases like these, all variables have the same value in the subshell as in the original shell, the same export status, the same read-only status, etc. All function definitions, alias definitions, shell options and other settings are inherited as well.

A subshell created by `(…)` has the same file descriptors as its creator. Some other means of creating subshells modify some file descriptors before executing user code.

For example, the left-hand side of a pipe runs in a subshell ³ with standard output connected to the pipe. The subshell also starts out with the same current directory, the same signal mask, etc. 

One of the few exceptions is that *subshells do not inherit custom traps*: ignored signals, `trap '' SIGNAL`, remain ignored in the subshell, but other traps, `trap CODE SIGNAL`, are reset to the default action ⁴.

A subshell is thus different from executing a script. A script is a separate program. This separate program might coincidentally be also a script which is executed by the same interpreter as the parent, but this coincidence doesn't give the separate program any special visibility on internal data of the parent. Non-exported variables are internal data, so when the interpreter for the child shell script is executed, it doesn't see these variables. Exported variables, i.e. environment variables, are transmitted to executed programs.

Thus:

 x=1
 (echo $x)

prints 1 because the subshell is a replication of the shell that spawned it.

 x=1
 sh -c 'echo $x'

happens to run a shell as a child process of a shell, but the `x` on the second line has no more connection with the `x` on the second line than in

 x=1
 perl -le 'print $x'

or in

 x=1
 python -c 'print(x)'



¹ An exception is the ksh93 shell where the forking is optimised out and most of its side effects are emulated.

² Semantically, they're copies. From an implementation perspective, there's a lot of sharing going on.

³ For the right-hand side, it depends on the shell.

⁴ If you test this out, note that things like `$(trap)` may report the traps of the original shell. Note also that many shells have bugs in corner cases involving traps. For example, as of bash 4.3, 

```shell
bash -x -c 'trap "echo ERR at \$BASH_SUBSHELL \$BASHPID" ERR; set -E; false; echo one subshell; (false); echo two subshells; ( (false) )'

# ie

bash -x -c 'trap \
"echo ERR at \$BASH_SUBSHELL \$BASHPID" ERR; \
set -E; \
false; \
echo one subshell; \
(false); \
echo two subshells; \
( (false) )'
```

runs the ERR trap from the nested subshell in the "two subshells" case, but not the ERR trap from the intermediate subshell; setting the `set -E` option should propagate the ERR trap to all subshells, but the intermediate subshell is optimized away, and so it isn't there to run its ERR trap.

## More examples 

With this in mind (order of expansion is for things at the same level), it would then appear that it is superfluous to assign an order between *parameter expansion* and *command substitution* - the manual does not add any information in indicating the order between the two. In other words, I cannot find an example where the results would be different had command substitution happened before parameter expansion (keeping in mind this order we're discussing is for things at the same level).

(@flow2k) There is no order between parameter expansion and command substitution. Note that this sentence uses semicolons to separate expansion steps, but parameter expansion and command substitution are in the same semicolon-delimited clause (yes, it's subtle). The order matters when one of the parts has a side effect that affects the other part, e.g. (with x unset):

The parameter expansion and command substitution are equal in precedence and whichever comes first (leftmost) gets executed earlier.

```
echo $(echo foo > somefile)${x-$(cat somefile)}

(x=out; (x=in; echo $x))
in


unset x
( echo $(echo $x),${x=1} )
,1

( echo $(echo ${y=2},$y) )
2,2


( echo ${x:=2},echo $(echo $x),${x=1} )
2,echo 2,2
```

So, a *subshell* is a *child process* which executes in the parent shell environment, while *external command execution* is a *child process* but with a different execution environment.
