# Bash :: FAQ


## Redirection

### Can we colorize stderr?
of any and all commands, perhaps to make it stand out from stdin.

### Where does stdin, stdout and stderr of a background job go?

stdin  => /dev/null
stdout => /dev/null
stderr => /dev/null

### Familial relations

>If the subshells or child-processes inherit the parent's environment, why do we bother exporting variables?

Seeing that a child process arises as a complete duplicate of the parent process (`fork` then `exec`), it should get the identical execution context, including all the shell vars, whether they were promoted to envars or not.

I think I've read somewhere that this is true for subshells but not for child processes; in the sense that a subshell is immediately created from the current shell process, while a child process, in general, may be created in an unreleted (non-familial) setting, somewhere outside the current (interactive) session.

However, it seems tricky to start a script outside an interactive shell, so as to test inheritance. It seems difficult to come up with a non-familial chain-of-commands without parent-child relationships.

We could start a zsh script from bash - the zsh process, although a child process of bash - won't inherit the shell vars, right? Only the env vars? But this doesn't seems sensible. Neither does starting it from a GUI file manager - maybe we're bounded to the Linux console.

Can `env` help clean up the environment?

So, is the answer: we need not bother if we only need those vars for the duration of the current session. For anything beyond, we have to record them in a statup file anyway. Yes, hmm, but do we need to export them, is the question?


## Quoting

```bash
$ foo="field mouse"
$ bar="house mouse"
$ echo "\\$foo"
\house mouse            # as expected
$ echo "\\$bar"

ield mouse              # wtf?!
$ bar='field mouse'     # single-quotes don't help
$ echo "\\$bar"

ield mouse              # wtf?!
$ bar=$'field mouse'    # dollar-single-quotes neither
$ echo "\\$bar"

ield mouse              # wtf?! sure it's got something to do with ›\f‹
$ bar=$'alert'
$ echo "\\$bar"
lert                    # wtf?! why would ›\a‹ (BEL) remove inital "a"

echo "x\\bahama"
ahama
```

## Interactive comment

```bash
$ shopt -s interactive_comments
$ echo foo # ; echo bar
 foo
$ echo "foo # ; echo bar"
 foo # ; echo bar
$ echo foo# echo bar
 foo# echo ba
$ echo foo;# echo bar
 foo
$ echo foo|# echo bar
> cat
 foo

$ shopt -u interactive_comments
$ echo foo # ; echo bar
 foo #
 bar
```
