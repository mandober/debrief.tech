# Hooks

zsh hook functions
- `chpwd`
- `periodic`
- `precmd`
- `preexec`
- `zshaddhistory`
- `zshexit`

Each hook may take either of the 2 shapes
- basic function
- an array of function names

It is possible to define an array that has the same name as a hook function with `_functions` appended. Any element in such an array is taken as the name of a function to execute; it is executed in the same context and with the same arguments as the basic function.

For example, if `$chpwd_functions` is an array containing the values `mychpwd, chpwd_save_dirstack`, then the shell attempts to execute the functions `chpwd`, `mychpwd` and `chpwd_save_dirstack` (in that order).

- A function found by this mechanism is referred to as a *hook function*.
- Any function that does not exist is silently ignored.
- An error in any function causes subsequent functions not to run.
- Note further that an error in a `precmd` hook causes an immediately following *periodic function* not to run (though it may run at the next opportunity).


## chpwd
Executed whenever the current working directory is changed.

## periodic
If the enwar `PERIOD` is set, this function is executed every `$PERIOD` seconds, just before a prompt. Note that if multiple functions are defined using the array `periodic_functions` only one period is applied to the complete set of functions, and the scheduled time is not reset if the list of functions is altered. Hence the set of functions is always called together.

## precmd
Executed before each prompt. Note that precmd functions are not re-executed simply because the command line is redrawn, as happens, for example, when a notification about an exiting job is displayed.

## preexec
Executed just after a command has been read and is about to be executed. If the history mechanism is active (regardless of whether the line was discarded from the history buffer), the string that the user typed is passed as the first argument, otherwise it is an empty string. The actual command that will be executed (including expanded aliases) is passed in two different forms: the second argument is a single-line, size-limited version of the command (with things like function bodies elided); the third argument contains the full text that is being executed.

## zshaddhistory
Executed when a history line has been read interactively, but before it is executed. The sole argument is the complete history line (so that any terminating newline will still be present).

If any of the hook functions returns status 1 (or any non-zero value other than 2, though this is not guaranteed for future versions of the shell) the history line will not be saved, although it lingers in the history until the next line is executed, allowing you to reuse or edit it immediately.

If any of the hook functions returns status 2 the history line will be saved on the internal history list, but not written to the history file. In case of a conflict, the first non-zero status value is taken.

A hook function may call `fc -p ...` to switch the history context so that the history is saved in a different file from that in the global `HISTFILE` parameter. This is handled specially: the history context is automatically restored after the processing of the history line is finished.

The following example function works with one of the options `INC_APPEND_HISTORY` or `SHARE_HISTORY` set, in order that the line is written out immediately after the history entry is added. It first adds the history line to the normal history with the newline stripped, which is usually the correct behaviour. Then it switches the history context so that the line will be written to a history file in the current directory.

```zsh
zshaddhistory() {
  print -sr -- ${1%%$'\n'}
  fc -p .zsh_local_history
}
```

## zshexit
Executed at the point where the main shell is about to exit normally. This is not called by exiting subshells, nor when the exec precommand modifier is used before an external command. Also, unlike `TRAPEXIT`, it is not called when functions exit.
