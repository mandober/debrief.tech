# Environment variable

(environment variable, env var, envar, envvar, enwar)

- An environment variable is a key-value pair
- An environment variable is an exported shell variable.

Environment variables were introduced in their modern form in 1979 in Version 7 Unix, and they are present in all Unix operating system flavors and variants from then on, including Linux and macOS. From PC DOS 2.0 in 1982, all succeeding Microsoft operating systems, including Microsoft Windows and OS/2, have featured env vars, albeit with a different syntax and names for the standard ones.

>Environment variables are shell variables that are exported - variables with the `-x` attribute.

To list shell variables and their values (name=value pairs)
- printenv binary
- declare builtin
- declare -p

- declare -x
- printenv NAME  Prints the value of the variable NAME
- env


An environment variable is a user-definable value that can affect the way running processes will behave on a computer. Environment variables are part of the environment in which a process runs. For example, a running process can query the value of the TEMP environment variable to discover a suitable location to store temporary files, or the HOME or USERPROFILE variable to find the directory structure owned by the user running the process.
