# 4.4 Special Builtins

https://www.gnu.org/software/bash/manual/html_node/Special-Builtins.html

For historical reasons, POSIX has designated 14 bash builtins as special.

When Bash is in POSIX mode, the differences from the regular mode pertaining to the special builtins are:
1. special builtins are found before functions during the command lookup.
2. If a special builtin returns an error status, a non-interactive shell exits.
3. Assignment statements preceding the command stay in effect in the shell environment after the command completes.


When Bash is not executing in POSIX mode, these builtins behave no differently than the rest of the Bash builtin commands.

* The Bash POSIX mode is described in Bash POSIX Mode.
https://www.gnu.org/software/bash/manual/html_node/Bash-POSIX-Mode.html


## Special builtins

The following 14 builtins are special builtins according to POSIX:

break       :          .         continue
eval        exec       exit      export
readonly    return     set       shift
trap        unset







* Major Differences From The Bourne Shell i.e. `sh` as included in SVR4.2

https://www.gnu.org/software/bash/manual/html_node/Major-Differences-From-The-Bourne-Shell.html#Major-Differences-From-The-Bourne-Shell
