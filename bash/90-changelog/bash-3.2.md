# bash-3.2

This is a terse description of the new features added to bash-3.2 since
the release of bash-3.1.  As always, the manual page (doc/bash.1) is
the place to look for complete descriptions.

## 1.  New Features in Bash

a.  Changed the parameter pattern replacement functions to not anchor the
    pattern at the beginning of the string if doing global replacement - that
    combination doesn't make any sense.

b.  When running in 'word expansion only' mode (--wordexp option), inhibit
    process substitution.

c.  Loadable builtins now work on MacOS X 10.[34].

d.  Shells running in posix mode no longer set $HOME, as POSIX requires.

e.  The code that checks for binary files being executed as shell scripts now
    checks only for NUL rather than any non-printing character.

f.  Quoting the string argument to the [[ command's  =~ operator now forces
    string matching, as with the other pattern-matching operators.

## 2.  New Features in Readline

a.  Calling applications can now set the keyboard timeout to 0, allowing
    poll-like behavior.

b.  The value of SYS_INPUTRC (configurable at compilation time) is now used as
    the default last-ditch startup file.

c.  The history file reading functions now allow windows-like \r\n line
    terminators.
