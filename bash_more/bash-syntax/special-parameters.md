# Special Parameters

3.4.2 Special Parameters
https://www.gnu.org/software/bash/manual/bash.html#Special-Parameters

The shell (bash definitely, but many other shells interpret these parameters the same) treats several parameters specially. The special parameters have names that is a single (non-alphanumeric) symbol - for clarity and to avoid confusion their names are written together with the `$` sign attached (which is the variable expansion operator). These parameters may only be referenced; assignment to them is not allowed.

Special parameters: `*`, `@`, `#`, `?`, `-`, `$`, `!`, `0` (and `$_`)
- $*
- $@
- $#
- $?
- $-
- $$
- $!
- $0
- what about `$_`? (aka repeat the last successful command)

## TOC
<!-- TOC -->

- [TOC](#toc)
- [hash](#hash)
- [question mark](#question-mark)
- [dash](#dash)
- [dollar](#dollar)
- [bang](#bang)
- [zero](#zero)
- [asterisk](#asterisk)
- [at](#at)

<!-- /TOC -->

## hash
`$#` expands to the number of positional parameters.

## question mark
`$?` expands to the exit status of most recently executed foreground pipeline.

## dash
`$-` expands to option flags as specified upon invocation, by `set` builtin, or those set by the shell itself, such as the `-i` (interactive) option.

## dollar
`$$` expands to the shell's PID. In a subshell, it holds the PID of the invoking shell, not the subshell.

## bang
`$!` expands to the PID of the most recently backgrounded job, whether executed as an async command (with `&`) or using the `bg` builtin.

## zero
`$0` expands to the name of the shell or shell script. This is set at shell initialization. If Bash is invoked with a file of commands (see Shell Scripts), $0 is set to the name of that file. If Bash is started with the -c option (see Invoking Bash), then $0 is set to the first argument after the string to be executed, if one is present. Otherwise, it is set to the filename used to invoke Bash, as given by argument zero.

## asterisk
`$*` expands to the positional parameters, starting from one. When the expansion is not within double quotes, each positional parameter expands to a separate word. In contexts where it is performed, those words are subject to further word splitting and filename expansion. When the expansion occurs within double quotes, it expands to a single word with the value of each parameter separated by the first character of the IFS special variable. That is, "$*" is equivalent to "$1c$2c…", where c is the first character of the value of the IFS variable. If IFS is unset, the parameters are separated by spaces. If IFS is null, the parameters are joined without intervening separators.

## at
`$@` expands to the positional parameters, starting from one. In contexts where word splitting is performed, this expands each positional parameter to a separate word; if not within double quotes, these words are subject to word splitting. In contexts where word splitting is not performed, this expands to a single word with each positional parameter separated by a space. When the expansion occurs within double quotes, and word splitting is performed, each parameter expands to a separate word. That is, "$@" is equivalent to "$1" "$2" …. If the double-quoted expansion occurs within a word, the expansion of the first parameter is joined with the beginning part of the original word, and the expansion of the last parameter is joined with the last part of the original word. When there are no positional parameters, "$@" and $@ expand to nothing (i.e., they are removed).
