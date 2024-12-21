# Shell style :: Printing

A utility should print out the payload kind of output to stdout, while the errors go to stderr.

Before printing anything, we must check if a terminal is attached, that is, if there's a place to print at all because a utility may be used as the so-called "filter" in a pipeline or sent to the background, and in these cases there's no tty attached. The latter case (a background job) has further issues with printing out while being backgrounded, and there are some signals involved (like SIGTTOUT) - to be explored later.

Bash has a `test` builtin for various checks. 
Check for the existence of:
- stdin:  `[[ -t 0 ]]`
- stdout: `[[ -t 1 ]]`
- stderr: `[[ -t 2 ]]`
