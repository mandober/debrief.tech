# Bash Startup Files

- if a relevant file exist but cannot be read, bash reports an error
- if a relevant file doesn't exist, no errors are reported
- tilde expansion is performed


## Invoked as an login shell or with --login

1. *all-users*
  - bash first tries `/etc/profile` *all-shells*

2. *current-user* 
  - bash tries in this order:
    ★★★   `~/.bash_profile`  *bash-shell*   
    ★★    `~/.bash_login`    *bash-shell*   
    ★     `~/.profile`       *all-shells*

The `--noprofile` may be used to skip the user profile search completely

When invoked as *sh* as *interactive*, *login shell*, or as *non-interactive* shell with the `--login` option, it reads ONLY `~/.profile`, after `/etc/profile`, so it may be prudent to only use `~/.profile` for user-specific settings (and get rid of both, `~/.bash_profile` and `~/.bash_login`). 
  Place bash-checking conditionals as .profile is also read by other shells.

When a login shell exits, bash reads user-specific ~/.bash_logout, then sytem-wide /etc/bash.bash_logout.



## Invoked as interactive, non-login shell: bashrc

read `/etc/bash.bashrc`
read `~/.bashrc`

- inhibit with `--norc`
- The `--rcfile` to specify alt startup file


## Invoked as non-interactive (script mode)

When Bash is started non-interactively (to run a script), 
it uses the value of `BASH_ENV` as the name of a file to read.

Bash behaves as if this was executed:
```bash
# -n is true if string is non-empty
[[ -n "$BASH_ENV" ]] && . "$BASH_ENV"
```
- but the PATH is not used to search for the filename
> However, if `-l, --login` given, bash reads login startup files



## Invoked as sh

Bash, invoked as *sh*:
- mimics the startup behavior of *sh*
- conforms to *POSIX* standard

When invoked as an interactive login shell (or as a non-interactive shell with the `--login` option):

1. /etc/profile
2. ~/.profile

it first attempts to read and execute commands from `/etc/profile` and `~/.profile`, in that order. 

* The --noprofile option may be used to inhibit this behavior.


When invoked as an interactive shell with the name sh:

1. $ENV
Bash looks for the variable ENV expands its value if it is defined, 
and uses the expanded value as the name of a file to read and execute. 
* Since a shell invoked as sh does not attempt to read and execute commands 
  from any other startup files, the `--rcfile` option has no effect. 

A non-interactive shell invoked with the name sh:
does not attempt to read any other startup files.

When invoked as sh, Bash enters POSIX mode after the startup files are read.


## Invoked in POSIX mode
When Bash is started in POSIX mode, as with the `--posix` command line option, it follows the POSIX standard for startup files. In this mode, interactive shells expand the ENV variable and commands are read and executed from the file whose name is the expanded value. No other startup files are read.


## Invoked by remote shell daemon (sshd)

Bash can determine when it is run with its stdin connected to a network connection (e.g. when executed by sshd). In such cases it:
- reads `~/.bashrc` unless invoked as `sh`

--norc prevents reading .bashrc and --rcfile may be given to specify another startup file, however, *sshd* generally does not invoke bash with those options, nor it permits them.


## Invoked with unequal effective and real UID/GIDs

*IF* started with (effective user/group ID) != (real user/group ID)
- NO startup files are read
- functions are NOT inherited from the env
- `SHELLOPTS`, `BASHOPTS`, `CDPATH`, `GLOBIGNORE` are IGNORED

*AND* if no `-p` option:
  - the effective user ID is set to the real user ID

*AND* if `-p` is supplied:
  - the effective user ID is not reset
