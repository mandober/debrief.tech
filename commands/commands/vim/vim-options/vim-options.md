# Vim :: Options

- [options.txt](https://vimhelp.org/options.txt.html)
- [Overview of all options](https://vimhelp.org/quickref.txt.html)

## TOC

1. Setting options
2. Automatically setting options
3. Options summary

## 1. Setting options

Overview of options: 
[quickref.txt option-list](https://vimhelp.org/quickref.txt.html#option-list)


`:set {option}` is sugar for `:let {option}`

Types of options
- boolean option can only be on (1) or off (0)
- number options take number argument
- string options take string argument

```vim
" List configured (non-default) options
:set

" Check option status
:set {option}?
```


Boolean options
- :set {option}     Enable Boolean option
- :set no{option}   Disable Boolean option
- :set {option}!    Toggle Boolean option
- :set {option}?    Query option status
- :set &{option}    ?
- :set {option}&    ?


## Setting options

:set[!]
  Show all options that differ from their default value.
  ! put each option on a separate line.

:set[!] all
  Show all non-terminal related options.
  ! put each option on a separate line.

:set termcap
  Show all terminal options.
:set! termcap
  ! do not use multiple columns.
  Note that in the GUI the key codes are not shown, because they are generated internally and can't be changed. Changing the terminal codes in the GUI is not useful either. The options have the form [t_AB], see terminal-options:
  https://vimhelp.org/term.txt.html#terminal-options

:set {option}?
  Show value of {option}

:set {option}
  Enable boolean option.
  Show set value for Number and String options.

:set no{option}
  Disble boolean option.

:set {option}!  :set inv{option}  :set-! :set-inv
  Toggle boolean option.


				:set-default :set-& :set-&vi :set-&vim
:set {option}&	Reset option to its default value.  May depend on the
			current value of 'compatible'.
:set {option}&vi	Reset option to its Vi default value.
:set {option}&vim	Reset option to its Vim default value.

:set all&		Set all options to their default value.  The values of
			these options are not changed:
			  all terminal options, starting with t_
			  'columns'
			  'cryptmethod'
			  'encoding'
			  'key'
			  'lines'
			  'term'
			  'ttymouse'
			  'ttytype'
			Warning: This may have a lot of side effects.

					    :set-args :set= E487 E521
:set {option}={value}		or
:set {option}:{value}
			Set string or number option to {value}.
			For numeric options the value can be given in decimal,
			hex (preceded with 0x) or octal (preceded with '0').
			The old value can be inserted by typing 'wildchar' (by
			default this is a <Tab> or CTRL-E if 'compatible' is
			set). Many string options with fixed syntax and names
			also support completing known values.  See
			cmdline-completion and complete-set-option.
			White space between {option} and '=' is allowed and
			will be ignored.  White space between '=' and {value}
			is not allowed.
			See option-backslash for using white space and
			backslashes in {value}.

:set {option}+={value}				:set+=
			Add the {value} to a number option, or append the
			{value} to a string option.  When the option is a
			comma-separated list, a comma is added, unless the
			value was empty.
			If the option is a list of flags, superfluous flags
			are removed.  When adding a flag that was already
			present the option value doesn't change.
			Also see :set-args above.

:set {option}^={value}				:set^=
			Multiply the {value} to a number option, or prepend
			the {value} to a string option.  When the option is a
			comma-separated list, a comma is added, unless the
			value was empty.
			Also see :set-args above.

:set {option}-={value}				:set-=
			Subtract the {value} from a number option, or remove
			the {value} from a string option, if it is there.
			If the {value} is not found in a string option, there
			is no error or warning.  When the option is a comma
			separated list, a comma is deleted, unless the option
			becomes empty.
			When the option is a list of flags, {value} must be
			exactly as they appear in the option.  Remove flags
			one by one to avoid problems.
			The individual values from a comma separated list or
			list of flags can be inserted by typing 'wildchar'.
			See complete-set-option.
			Also see :set-args above.

The {option} arguments to ":set" may be repeated.  For example: 
	:set ai nosi sw=3 ts=3
If you make an error in one of the arguments, an error message will be given
and the following arguments will be ignored.
