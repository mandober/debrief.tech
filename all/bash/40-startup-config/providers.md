# Configuration providers

Configuration settings for terminal, shell environment, apps, bash and for many of bash's "services" may come from various configuration providers.

Bash has an internal set of default settings, that also depend on the current bash's mode (normal, POSIX, restricted, etc.). Bash accepts settings from additional sources, in a different order of priority, so a later setting may override an earlier one.

Many settings are available as environment variables; most settings may be set, or at least read, through an environment variable, even though they have a specialized means of configuration, e.g. using a specialized tool or builtin. Settins may also be stated on the command line or read from a file, e.g. an rc, a config-file or options-file.


Configuration providers:
- bash defaults
- bash internal rules and modes
- command line switches
- rc-files
- bash builtins
- specialized utilities


Configuration sources:
- environment variables
  - configured
  - inherited
  - injected
- bash builtins
  - shopts: settings configured using `shopt` builtin
  - setopts: settings configured using `set` builtin
- readline
  - readline variables
  - readline functions
  - readline bindings
- specialized utilities
  - env
  - stty
  - setterm
  - locale
