# Shell initialization files

## Init files

Every shell reads a particular set of files on startup and that set of init files depends on many things including what type of shell is being instantiated, how the shell is invoked, shell modes, and more. Set of init files read in login mode is different from those read in interactive mode. Special shell modes (POSIX, restricted, remote, etc.) further restrict the init procedure. Moreover, there are system-wide and user-specific init files.

The default shell is a part of the login process, so it is called *login shell*, and normally it will remain *the main shell* process (contolling shell) during the entire user session. The main shell is *interactive shell* as well, and usually it will be the only interactive shell during the session.

Being a login shell, the shell will read a set of init files intended to be read exclusively by login shells. These are usually both system and user files.

Being an interactive shell, the shell will read a set of init files intended to be read exclusively by interactive shells. These are usually both system and user files.

If another instance of the shell is started (on the command line) just by typing `bash`, nothing dramatic will happen except that the SHLVL (shell level) env var will be 2.




Shell init (initialization) files are files that a shell reads on startup.

The exact set of init files read depends on
- particular shell
- shell mode
- shell login mode: login vs non-login
- shell runtime mode: interactive vs non-interactive

Each shell has a specific set of init files it reads, although some init files are common to different shells, primarily "profile" files.

Initialization files are divided into
- shell-specific files
- mode-specific files
- system-wide files
- personal (user) files

The directory `/etc/skel/` contains skeleton (template) files which are instantiated when a new user is created.


## Shell modes

Initialization files are dependent on the shell, shell mode, and combinations.


## Profile files

profile files
- system: /etc/profile, /etc/profile.d
- user: ~/.profile

System `/etc/profile`


User's `~/.profile` executed by the command interpreter for login shells.   
User's ~/.profile contains:
- instructions to source ~/.bashrc if the shell is bash
- adds local bin folders to PATH if they exists:
  - ~/bin
  - ~/.local/bin



## Bash

~/.profile is not read by bash if ~/.bash_profile or ~/.bash_login exist.

bash files
- system:
  - /etc/bash.bashrc
- user:
  - ~/.bashrc
  - ~/.bash_profile
  - ~/.bash_login

### /etc/bash.bashrc

System-wide .bashrc file for *interactive bash shells*.

To enable the settings in this file for *login shells* as well, this file has to be sourced in /etc/profile.
- if not running interactively, bails
- shopt -s checkwinsize
- sets PS1 (chroot)
- enable bash completion in interactive shells
- sudo hint
- command-not-found package


## /etc/inputrc
/etc/inputrc - global inputrc for libreadline

## /etc/profile

/etc/profile: system-wide .profile file for the Bourne shell, sh(1), and Bourne compatible shells: bash(1), ksh(1), ash(1), etc.
- if the shell is bash, then
  - it sources /etc/bash.bashrc
  - configures PS1: diff between regular user ($) and sudo (#)
- sources .sh files in /etc/profile.d/*.sh
