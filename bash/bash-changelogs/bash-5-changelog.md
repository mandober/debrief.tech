# Bash v.5.0 Changelog


* Builtins
  - wait
  - loadables: rm, stat, fdflags, seq
* Enwars
  - EPOCHSECONDS
  - EPOCHREALTIME
  - BASH_ARGV0
* Keywords
* Readline
  - shell-expand-line


## Keywords
* **coproc**: the `name` arg now undergoes word-expansion so that unique coprocessors may be created in loops.

## Bash Enwars
- *EPOCHSECONDS*  new var expands to the time in seconds since Unix epoch.
- *EPOCHREALTIME* new var for Unix epoch time in s (granularity in ms).
- *BASH_ARGV0*    new var expands to *$0* and sets *$0* on assignment.
- *$_* var doesn't change when the shell executes a command that forks.

## Builtins
* New loadable builtins: `rm`, `stat`, `fdflags`
* `umask` now allows modes and masks greater than octal 777
* `times` now honors the current locale when printing a decimal point
* `complete` has new `-I` option that applies completion to initial word
* `history` can now delete ranges of history entries using `-d FROM-TO`,negative args offset from the end of the history list.
* `bind -r` now checks whether a key sequence is bound before binding it to NULL, to avoid creating keymaps for a multi-key sequence.
* `kill` now supports `-sSIGNAME` and `-nSIGNUM` (even though conforming apps aren't supposed to use them)
* `wait` now waits for the last process substitution created. With new `-f` option it waits until the specified job or process terminates, instead of waiting until it changes state.


## Misc

* Process substitution does not inherit `-v` option, like command substitution.

* Bash no longer allows *var assignments* preceding a *special builtins* that changes var attributes to propagate back to the calling env, unless the compatibility level is 44 or lower. **wtf?!**

* A *nameref* name resolution loop in a function now resolves to a variable by that name in the global scope.

* The positional parameters are now assigned before running the shell startup files, so startup files can use `$@`.

* Associative and indexed arrays now allow subscripts consisting solely of whitespace.

* The shell only sets up `BASH_ARGV` and `BASH_ARGC` at startup if extended debugging mode is active. The old behavior of unconditionally setting them is available as part of the shell compatibility options.

* The shell doesn't automatically set `BASH_ARGC` and `BASH_ARGV` at startup unless it's in debugging mode, as the documentation has always said, but will dynamically create them if a script references them at the top level without having enabled debugging mode.

* The internal bash `malloc` now uses `mmap` (if available) to satisfy requests greater than 128K bytes, so `free` can use `mfree` to return the pages to the kernel.


## Signals and Job control

* The signal name processing code now understands **SIGRTMIN+n** all the way up to **SIGRTMAX**.

* Trap execution now honors the (internal) max invocations of `eval`, since traps are supposed to be executed as if using `eval`.

* If a non-interactive shell with job control enabled detects that a foreground job died due to **SIGINT**, it acts as if it received the **SIGINT**.

* The **SIGCHLD** trap is run once for each exiting child process even if job control is not enabled when the shell is in POSIX mode.



## shopts

* `globasciiranges` enabled by default (which can be changed in configure)
* `checkwinsize`    enabled by default
* `shift_verbose`   enabled in POSIX mode
* `progcomp_alias`  visible and documented
* `localvar_unset`  visible and documented
* `localvar_inherit`new option: if set, local var inherits the var with the same name and compatible type at the nearest preceding scope.
* `assoc_expand_once` new shell option: attempts to expand associative array subscripts only once.
* new undocumented, disabled by default, shell option to dis/enable sending history to *syslog* at runtime.


```bash
hi () { declare x=55; lo; }

lo () {
    shopt -s localvar_inherit
    declare x
    echo $x # 55

    shopt -u localvar_inherit
    echo $x # (void)

    shopt -s localvar_unset
    echo $x
}

hi
```



## Configure and compile-time options

* There is a define in `config-top.h` that allows the shell to use a static value for `$PATH`, overriding whatever is in the env at startup, for use by the restricted shell.

* There is a compile-time option that forces the shell to disable the check for an inherited `OLDPWD` being a directory.

* You can set the default value for `HISTSIZE` at build time in config-top.h.



## Readline

* When supplied a numeric argument, the `shell-expand-line` bindable readline command does not perform quote removal and suppresses command and process substitution.

* A numeric argument to the line editing `operate-and-get-next` command specifies which history entry to use.

* `vi-edit-and-execute-command` bindable readline command now puts readline back in vi insertion mode after executing commands from the edited file.

* The command completion code now matches aliases and shell function names case-insensitively if the readline `completion-ignore-case` variable is set.

* New public function, `rl_check_signals`, which allows apps to respond to signals that readline catches while waiting for input using a custom read function.

* Non-incremental vi-mode search ('N', 'n') can search for a shell pattern, as Posix specifies (uses `fnmatch(3)` if available).

* There are new `next-screen-line` and `previous-screen-line` bindable commands, which move the cursor to the same column in the next, or previous, physical line, respectively.

* There are default key bindings for control-arrow-key key combinations.

* A negative argument (-N) to `quoted-insert` means to insert the next N characters using quoted-insert.

* There is new support for conditionally testing the readline version in an inputrc file, with a full set of arithmetic comparison operators available.

* There is a simple variable comparison facility available for use within an inputrc file. Allowable operators are equality and inequality; string vars may be compared to a value; boolean variables must be compared to either 'on' or 'off'; variable names are separated from the operator by whitespace.

* The history expansion library now understands command and process substitution and extended globbing and allows them to appear anywhere in a word.

* The history library has a new var that allows apps to set the initial quoting state, so quoting state can be inherited from a previous line.

* Readline now allows application-defined keymap names; there is a new public function, `rl_set_keymap_name`, to do that.

* The "Insert" keypad key, if available, now puts readline into overwrite mode.
