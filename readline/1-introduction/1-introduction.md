# Readline :: Introduction

The readline library provides command-line editing support to bash.

readline-v8.2 was released in Sep 2022 along with bash-v5.2. Readline is developed alongside bash, so they are usually released together - their minor version numbers coincides. Initially, readline was an integral part of bash, but eventually was extracted into its own package. However, bash is not its only client.

In bash, *command-line editing facilities* are enabled by default in interactive shells, unless `--noediting` option is set at invocation.

Readline's services are also used by the bash's `read` builtin when the option `-e` is given.

By default, the command-line editing procedures are similar to those of emacs', but the user may also switch to the vi-style with `set -o vi` and get back to emacs explicitly with `set -o emacs`, or with `set +o vi` (in accordance with the flipped shell logic, `-o` turns an option ON while `+o` turns it OFF).

Line editing can be enabled at any time using the -o emacs or -o vi options to the set builtin command (see The Set Builtin), or disabled using the +o emacs or +o vi options to set.
