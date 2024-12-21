# Bash :: Startup Files

Bash executable is usually `/bin/bash`. However, `/bin/bash` may also be a symlink to a binary executable elsewhere.


System-wide files:
- `/etc/profile` system-wide init file, executed for login shells
- `/etc/bash.bashrc`
- `/etc/bash.bash_logout`
- `/etc/inputrc` system-wide readline init file

Personal files:
- `~/.bash_profile` personal init file, executed for login shells
- `~/.bashrc` personal per-interactive-shell startup file
- `~/.bash_logout` personal login shell cleanup file
- `~/.inputrc` personal readline init file
