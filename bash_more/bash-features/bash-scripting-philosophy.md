# Bash :: Scripting philosophy

There are two opposing philosophies of shell scripting, especially in bash: leveraging progress or striving for maximum portability.

## Striving for portability

Striving to write shell scripts that work across many shells is a priority for conservatives who want to stop any change and use the same tooling like it's 1977. There is only an apparent merit in writing portable scipts. People that maintain utilities that should work on any Unix and Unix-like system are delusional - there are no such systems anymore, or those utilities were never and will never be used there. All the other systems have a recent version of bash installed, for heaven's sake. Using the traditional syntax makes for such ugly scripts, no possible benifit can change that. However, most people are delusional and nurish strong opinion about the way the shell scripts should be written, aka "this way or the highway". It's the same with using ANSI escape sequences - if some poor soul even suggest using the raw ANSI codes directly, they get obliterated fast because "styling should not be used anyway, but if you really must the only correct way is through `tput`"; God forbid your toy script emits a styling sequence that turns out gibberish if it happens to run on a DEC VT520; how embarrising would that be, eh? However -- those days are long gone; all modern terminals support the ANSI 3.4 standard, so be happy there is only one standard now, forget about terminfo (have you even forgotten about termcap yet?) and go ahead and hardcode those escape sequences raw.

Tolerating traditional approach and the philosophy of maximum compatibility hinders progress. Today should lead yesterday, not vice versa. Backward compatibility is shite.

Stubbornly stick with the latest bash version and make sure to use as much bashisms as possible. Use only the latest or the least compatible features. If there are two equivalent way to achieve the same thing, choose the one people hate. Now double those brackets everywhere!

- POSIX compatible scripts have the `.sh` suffix
- they are executed by the Bourne shell
- they use a subset of the shell syntax supported across different shells
- use single brackets, `[`, for tests
- ticks for command substitution
- redirect both stdout and stderr using `>1 >&2`

The first approach favors maximum compatibility not only between different bash versions, but across many different shells. Because most shells have the POSIX emulation mode in which they behave as close to some prehistorical standard derived from the conventions inadvertently set by the Bourne shell.

Some people still compete who will be the first to spot a bashism. Whenever someone posts some code that uses non-anal syntax, there's always some asshole ready to point out that "the code uses a redirection construct specific to bash and is therefore not portable" - you can just here those conservatives eyebrows rising and assholes puckering - "Please use `>file 2>&1` for maximum portability, mkey?". Those traditional ways need not be entertained for quite some time now. There's no good reason to do it anymore (not that there ever was one). Maximum effort.


## Leveraging progress

- using the latest bash version
- preferring bashism
- `#!/bin/bash` shebang, to hell with `#!/bin/sh`
- leverage newest bash features
- use double brackets, `[[`, for tests
- new syntax for command substitution, `$(…)`
- redirect both stdout and stderr using `&>`
- pipe both stdout and stderr to the next command, `|&`
