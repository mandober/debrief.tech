# Index :: Bash Modes


Bash Modes:
- regular (default) mode
- restricted shell mode
  - `set -r`
- POSIX mode
  -  `--posix` invocation option
  - `set -o posix`
  - `POSIXLY_CORRECT`
- remote shell
  - invoked as `rbash`
- Bourne shell (sh) compatible mode
  - when invoked with `sh`, `/bin/sh`, or `#!/bin/sh`
- privileged mode
  - `set -p` or `set -o privileged`


- bash as default system shell
  - login shell
  - non-login shell
  - interactive shell (for user interaction)
  - non-interactive shell (for execution of commands)
- bash instance
  - active (current) shell
  - subshell
  - subprocess, child process
- bash process
  - controlling termianl
  - leader of a process group
