# 3.4.2 Special Parameters

https://www.gnu.org/software/bash/manual/bash.html#Special-Parameters

Shell parameters have a name and value, and possibly other attributes as well (variables in particular).

>*Name of parameter* refers to the parameter itself, while name prefixed with dollar referes to its value.

So, `@` is the name of a special parameter, while the form `$@` is used to dereference (expand) it, showing its value.

The shell treats several parameters specially: these parameters may only be referenced - they cannot be assigned to.

>Special Parameters: `* @ # ? - $ ! 0`

The names of these special parameters are single characters and for that reason they are almost always mentioned with the dollar prefix, i.e. in their dereferenced form; e.g. `$!` instead of just `!` (at least because `!` has other meanings). Dollar is not a part of their name (except for special parameter `$`).

* `$_`  
When Bash invokes an external command, the variable `$_` is set to the full pathname of the command and passed to that command in its environment.

<!-- TOC -->

- [Asterisk](#asterisk)
- [At](#at)
- [Hash](#hash)
- [Question mark](#question-mark)
- [Dash](#dash)
- [Dollar](#dollar)
- [Bang](#bang)
- [Zero](#zero)

<!-- /TOC -->


## Asterisk

The expression `$*` expands all the positional parameters, starting from 1.

When the expression is not in double quotes, `$*`, each positional parameter expands to a separate word. In contexts where it is performed, those words are subject to further word splitting and filename expansion. 

When the expression occurs within double quotes, `"$*"`, it expands to a *single word with the value of each parameter separated by the first character of the IFS special variable*.

That is, `"$*"` is equivalent to `"${1}c${2}c…"`, where `c` is the first character of IFS, i.e. `${IFS:0:1}`. 
- If IFS is unset, the parameters are separated by SPACEs.
- If IFS is null, i.e. `IFS=`, the parameters are glued together.

## At

The expression `$@` expands all the positional parameters, starting from 1.

In contexts where word splitting is performed, this expands each positional parameter to a separate word; if not within double quotes, these words are subject to word splitting.

In contexts where word splitting is not performed, this expands to a single word with each positional parameter separated by a space. 

When the expansion occurs within double quotes, and word splitting is performed, each parameter expands to a separate word. That is, `"$@"` is equivalent to `"$1" "$2" …`. 

If the double-quoted expansion occurs within a word, the expansion of the first parameter is joined with the beginning part of the original word, and the expansion of the last parameter is joined with the last part of the original word. 

When there are no positional parameters, `"$@"` and `$@` expand to nothing (i.e. they are removed).

## Hash

`$#` expands to the number of positional parameters, in the decimal notation.

## Question mark

`$?` expands to the exit status of the most recently executed fg pipeline.

## Dash

`$-` expands to the current option flags as specified upon invocation, by the `set` builtin, or those set by the shell itself (such as the `-i` option for "interactive shell").

## Dollar

`$$` expands to the process ID of the shell. In a subshell, it expands to the process ID of the invoking shell, not the subshell.

## Bang

`$!` expands to the PID of the job most recently placed into bg, whether executed as an asynchronous command or using the `bg` builtin.

## Zero

`$0` expands to the name of the shell or shell script. This is set at shell initialization. 

If Bash is invoked with a file of commands, `$0` is set to the name of that file. 

If Bash is started with the `-c` option, then `$0` is set to the first argument after the string to be executed, if one is present. 

Otherwise, it is set to the filename used to invoke Bash, as given by arg 0.
