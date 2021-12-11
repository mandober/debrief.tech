# bash v.5.0-rc1

Changes between bash-5.0-rc1 and bash-5.0-beta2

## Changes to Bash

a. Fix to initial word completion detection code.

b. Fixed a bug that caused issues with assignment statements containing `^A` in
   the value assigned when IFS contains `^A`.

c. Added a fallback to fnmatch() when strcoll can't correctly deal with
   bracket expression character equivalence classes.

d. Fixed a bug that caused $BASH_COMMAND to contain the trap handler command
   when running a trap handler containing `[[` or `((` commands.

e. Fixed a bug that caused nameref assignments in the temporary environment
   to potentially create variables with invalid names.

f. Fixed a bug that caused `local -` to turn off alias expansion in scripts.

g. Fixed a parser issue with a command string containing EOF after an invalid
   command as an argument to a special builtin not causing a posix-mode shell
   to exit.

h. Made a slight change to the FNV-1 string hash algorithm used for associative
   arrays (corrected the initial seed).


## New Features in Bash

a. The `select` command now supports command forms without a word list
   following `in`.
