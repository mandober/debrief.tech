## Changes bash-2.01 and bash 2.0

1. New Features in Bash

a.  There is a new builtin array variable: GROUPS, the set of groups to which
    the user belongs.  This is used by the test suite.

2.  New Features in Readline

a.  If a key sequence bound to 'universal-argument' is read while reading a
    numeric argument started with 'universal-argument', it terminates the
    argument but is otherwise ignored.  This provides a way to insert multiple
    instances of a digit string, and is how GNU emacs does it.
