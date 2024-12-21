# Shell modes

In the basic scenario, with bash as the default shell, the user logs into the system and ends up at the command line. This instance of bash will be called the main bash process, aka the current shell. The current shell is the login shell and also interactive shell.

The login and interactive modes influenced the init files read. 



dropping into the bash shell means bash runs as login and interactive shell; that particular instanceof bash identified as a particular process is the main shell that runs in login mode and interactive mode.

Interactive mode may be identified by several things, one being the output of the special shell parameter `-`, e.g. `himBHs`; the presence of the letter `i` in the output indicates the interactive mode is on. Another giveaway is the absence of `PS0`, `PS1`, `PS2`, `PS3` env var (`PS4` could be present).



Shell modes:
- login | non-login 
- interactive | non-interactive
- local | remote
- normal | restricted -r | POSIX


The shell can be run in 3 possible modes:
- interactive login
- interactive non-login
- non-interactive


Combinations
- after logging in the system (using /bin/login), after authentication 
  (credentials stored in /etc/passwd): login, interactive
  +login
  +interactive
- start a new shell process, e.g. bash: non‑login, interactive
  ‑login
  +interactive
- ssh:
  +login
  +interactive
  +remote
- execute a script remotely and request a terminal, 
  e.g. `ssh user@host -t 'echo $pwd'`: non-login, interactive
  -login
  +interactive
- execute a script remotely, e.g. `ssh user@host 'echo $pwd`: 
  ‑login
  ‑interactive
- run a script, `bash myscript.sh`: non‑login, non‑interactive
  ‑login
  ‑interactive
- run an executable with `#!/usr/bin/env bash` shebang: 
  ‑login
  ‑interactive
- open a new graphical terminal window/tab:
  ‑login
  +interactive
