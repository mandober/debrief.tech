# Bash Startup

* invoked as
  - sh
  - bash
* enwars
  - BASH_ENV
  - ENV
* files
  * system
    - /etc/profile
    - /etc/bash.bash_logout
    - /etc/bash.bashrc
  * user
    - (.bash_profile)
    - (.bash_login)
    - .profile
    - .bash_logout
    - .bashrc
* options
  * Prohibit file
    - `--norc`
    - `--noprofile`
  * Alternative file
    - `--rcfile FILE`
  * Behavior
    - `--posix`
* permissions
  - effective user/group ID != real user/group ID
  - effective user/group ID == real user/group ID


Modes:
* profile mode
  - interactive login
  - non-interactive with `--login`
* rc mode
  - interactive non-login
* script mode
  - non-interactive (non-login)



shell       | positive | non
------------|----------|-----------
login       |          | 
interactive |          | 
restricted  |          | 
POSIX       |          | 
remote      |          | 
