# which

Usage: /usr/bin/which [options] [--] COMMAND [...]

Write the full path of COMMAND(s) to standard output.

OPTIONS:
* --all, -a            Print all matches in PATH, not just the first
* --tty-only           Stop processing options on the right if not on tty.

* --show-dot           Don't expand a dot to current directory in output.
* --skip-dot           Skip directories in PATH that start with a dot.

* --show-tilde         Output a tilde for HOME directory for non-root.
* --skip-tilde         Skip directories in PATH that start with a tilde.

* --read-alias, -i     Read list of aliases from stdin.
* --skip-alias         Ignore option `--read-alias`: don't read stdin.

* --read-functions     Read shell functions from stdin.
* --skip-functions     Ignore option `--read-functions`: don't read stdin.

* --help,              Print this help and exit successfully.
* --version, -[vV]     Print version and exit successfully.


If the options `--read-alias` and/or `--read-functions` are specified then the output can be a full alias or function definition, optionally followed by the full path of each command used inside of those.

Recommended use is to write the output of `(alias; declare -f)` to standard input, so that which can show aliases and shell functions.

See `which(1)` for examples.
