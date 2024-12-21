# Index :: Command Classification Factors

Criteria according to which commands are classified.

The first criterium is whether a command is internal or external to the shell. Internal commands include keywords and builtins.

- external vs internal shell commands
- internal shell commands
  - keywords
  - builtins
  - functions
  - sourceables
    - sourceable file that defines functions that will be loaded on-source
    - sourceable file itself used as if it were a function's body
- external shell commands
  - executables found in PATH
    - programs, binaries
    - scripts
