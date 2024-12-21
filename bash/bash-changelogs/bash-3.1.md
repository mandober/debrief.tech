# bash-3.1

This is a terse description of the new features added to bash-3.1 since
the release of bash-3.0.  As always, the manual page (doc/bash.1) is
the place to look for complete descriptions.

## New Features in Bash

a.  Bash now understands LC_TIME as a special variable so that time display
    tracks the current locale.

b.  BASH_ARGC, BASH_ARGV, BASH_SOURCE, and BASH_LINENO are no longer created
    as 'invisible' variables and may not be unset.

c.  In POSIX mode, if 'xpg_echo' option is enabled, the 'echo' builtin doesn't
    try to interpret any options at all, as POSIX requires.

d.  The 'bg' builtin now accepts multiple arguments, as POSIX seems to specify.

e.  Fixed vi-mode word completion and glob expansion to perform tilde
    expansion.

f.  The '**' mathematic exponentiation operator is now right-associative.

g.  The 'ulimit' builtin has new options: -i (max number of pending signals),
    -q (max size of POSIX message queues), and -x (max number of file locks).

h.  A bare '%' once again expands to the current job when used as a job
    specifier.

i.  The '+=' assignment operator (append to the value of a string or array) is
    now supported for assignment statements and arguments to builtin commands
    that accept assignment statements.

j.  BASH_COMMAND now preserves its value when a DEBUG trap is executed.

k.  The 'gnu_errfmt' option is enabled automatically if the shell is running
    in an emacs terminal window.

l.  New configuration option:  --single-help-strings.  Causes long help text
    to be written as a single string; intended to ease translation.

m.  The COMP_WORDBREAKS variable now causes the list of word break characters
    to be emptied when the variable is unset.

n.  An unquoted expansion of $* when $IFS is empty now causes the positional
    parameters to be concatenated if the expansion doesn't undergo word
    splitting.

o.  Bash now inherits `$_` from the environment if it appears there at startup.

p.  New shell option: nocasematch.  If non-zero, shell pattern matching ignores
    case when used by 'case' and '[[' commands.

q.  The 'printf' builtin takes a new option: -v var.  That causes the output
    to be placed into var instead of on stdout.

r.  By default, the shell no longer reports processes dying from SIGPIPE.

s.  Bash now sets the extern variable 'environ' to the export environment it
    creates, so C library functions that call getenv() (and can't use the
    shell-provided replacement) get current values of environment variables.

t.  A new configuration option, '--enable-strict-posix-default', which will
    build bash to be POSIX conforming by default.

u.  If compiled for strict POSIX conformance, LINES and COLUMNS may now
    override the true terminal size.

## New Features in Readline

a.  The key sequence sent by the keypad 'delete' key is now automatically
    bound to delete-char.

b.  A negative argument to menu-complete now cycles backward through the
    completion list.

c.  A new bindable readline variable:  bind-tty-special-chars.  If non-zero,
    readline will bind the terminal special characters to their readline
    equivalents when it's called (on by default).

d.  New bindable command: vi-rubout.  Saves deleted text for possible
    reinsertion, as with any vi-mode 'text modification' command; 'X' is bound
    to this in vi command mode.

e.  A new external application-controllable variable that allows the LINES
    and COLUMNS environment variables to set the window size regardless of
    what the kernel returns: rl_prefer_env_winsize
