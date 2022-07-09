## New Features in bash v.5.0


BUILTINs changes:
wait


a. The `wait` BUILTIN can now wait for the last *process substitution* created.


b. new *EPOCHSECONDS* variable expands to the time in seconds since Unix epoch.

c. *EPOCHREALTIME* variable expands to the time in seconds since the Unix epoch with microsecond granularity.

d. New loadable BUILTINs: *rm*, *stat*, *fdflags*.

e. *BASH_ARGV0*: a new variable that expands to $0 and sets $0 on assignment.

f. When supplied a numeric argument, the `shell-expand-line` bindable readline
   command does not perform quote removal and suppresses command and process
   substitution.

g. `history -d` understands negative arguments: negative arguments offset from
   the end of the history list.

h. The 'name' argument to the `coproc` reserved word now undergoes word
   expansion, so unique coprocs can be created in loops.

i. A nameref name resolution loop in a function now resolves to a variable by
   that name in the global scope.

j. The `wait` BUILTIN now has a '-f' option, which signfies to wait until the
   specified job or process terminates, instead of waiting until it changes
   state.

k. There is a define in config-top.h that allows the shell to use a static
   value for $PATH, overriding whatever is in the environment at startup, for
   use by the restricted shell.

l. Process substitution does not inherit the 'v' option, like command
   substitution.

m. If a non-interactive shell with job control enabled detects that a foreground
   job died due to SIGINT, it acts as if it received the SIGINT.

n. The SIGCHLD trap is run once for each exiting child process even if job
   control is not enabled when the shell is in Posix mode.

o. new shopt *localvar_inherit*: if set, a local variable inherits the
   value of a variable with the same name at the nearest preceding scope.

p. `bind -r` now checks whether a key sequence is bound before binding it to
   NULL, to avoid creating keymaps for a multi-key sequence.

q. A numeric argument to the line editing 'operate-and-get-next' command
   specifies which history entry to use.

r. The positional parameters are now assigned before running the shell startup
   files, so startup files can use $@.

s. There is a compile-time option that forces the shell to disable the check
   for an inherited OLDPWD being a directory.

t. The 'history' BUILTIN can now delete ranges of history entries using
   '-d start-end'.

u. The 'vi-edit-and-execute-command' bindable readline command now puts readline
   back in vi insertion mode after executing commands from the edited file.

v. The command completion code now matches aliases and shell function names
   case-insensitively if the readline *completion-ignore-case* variable is set.

w. There is a new **assoc_expand_once** shell option that attempts to expand
   associative array subscripts only once.

x. The shell only sets up BASH_ARGV and BASH_ARGC at startup if extended
   debugging mode is active. The old behavior of unconditionally setting them
   is available as part of the shell compatibility options.

y. The 'umask' BUILTIN now allows modes and masks greater than octal 777.

z. The 'times' BUILTIN now honors the current locale when printing a decimal
   point.

aa. There is a new (disabled by default, undocumented) shell option to enable
    and disable sending history to *syslog* at runtime.

bb. Bash no longer allows variable assignments preceding a special BUILTIN that
    changes variable attributes to propagate back to the calling environment
    unless the compatibility level is 44 or lower.

cc. You can set the default value for $HISTSIZE at build time in config-top.h.

dd. The 'complete' BUILTIN now accepts a -I option that applies the completion
    to the initial word on the line.

ee.  The internal bash malloc now uses mmap (if available) to satisfy requests
    greater than 128K bytes, so free can use mfree to return the pages to the
    kernel.

ff. The shell doesn't automatically set BASH_ARGC and BASH_ARGV at startup
    unless it's in debugging mode, as the documentation has always said, but
    will dynamically create them if a script references them at the top level
    without having enabled debugging mode.

gg. The `localvar_inherit` option will not attempt to inherit a value from a
    variable of an incompatible type (indexed vs. associative arrays, for
    example).

hh. The 'globasciiranges' option is now enabled by default; it can be set to
    off by default at configuration time.

ii. Associative and indexed arrays now allow subscripts consisting solely of
    whitespace.

jj. 'checkwinsize' is now enabled by default.

kk. The 'localvar_unset' shopt option is now visible and documented.

ll. The `progcomp_alias` shopt option is now visible and documented.

mm. The signal name processing code now understands 'SIGRTMIN+n' all the way
    up to SIGRTMAX.

nn. There is a new *seq* loadable BUILTIN.

oo. Trap execution now honors the (internal) max invocations of 'eval', since
    traps are supposed to be executed as if using 'eval'.

pp. The `$_` variable doesn't change when the shell executes a command that forks.

qq. The 'kill' BUILTIN now supports -sSIGNAME and -nSIGNUM, even though
    conforming applications aren't supposed to use them.

rr. POSIX mode now enables the `shift_verbose` option.


### New Features in Readline

a. Non-incremental vi-mode search ('N', 'n') can search for a shell pattern, as
   Posix specifies (uses fnmatch(3) if available).

b. There are new 'next-screen-line' and 'previous-screen-line' bindable
   commands, which move the cursor to the same column in the next, or previous,
   physical line, respectively.

c. There are default key bindings for control-arrow-key key combinations.

d. A negative argument (-N) to 'quoted-insert' means to insert the next N
   characters using quoted-insert.

e. New public function: rl_check_signals(), which allows applications to
   respond to signals that readline catches while waiting for input using
   a custom read function.

f. There is new support for conditionally testing the readline version in an
   inputrc file, with a full set of arithmetic comparison operators available.

g. There is a simple variable comparison facility available for use within an
   inputrc file. Allowable operators are equality and inequality; string
   variables may be compared to a value; boolean variables must be compared to
   either 'on' or 'off'; variable names are separated from the operator by
   whitespace.

h. The history expansion library now understands command and process
   substitution and extended globbing and allows them to appear anywhere in a
   word.

i. The history library has a new variable that allows applications to set the
   initial quoting state, so quoting state can be inherited from a previous
   line.

j. Readline now allows application-defined keymap names; there is a new public
   function, rl_set_keymap_name(), to do that.

k. The "Insert" keypad key, if available, now puts readline into overwrite
   mode.
