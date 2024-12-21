# Index :: Shell utility suites

- binutils 17
+ dateutils
- diffutils 4
- fileutils 21
- findutils 4
- fontutils 10
- id-utils 9
- inetutils 9
- plotutils 18
- sh-utils 33
+ shadowutils
- sharutils (7)
- termutils (2)
- textutils (24)


## GNU utils index

https://ftp.gnu.org/gnu/ProgramIndex

## shadow-utils

Utilities for managing accounts and shadow password files.

https://www.mankier.com/package/shadow-utils
https://github.com/shadow-maint/shadow

The shadow-utils package includes the necessary programs for converting UNIX password files to the shadow password format, plus programs for managing user and group accounts.

Commands
- General Commands
  - `passwd`      change user password
  - `chage`       change expiry information of user password
  - `gpasswd`     administer /etc/group and /etc/gshadow
  - `newgrp`      log in to a new group
  - `newgidmap`   set the gid mapping of a user namespace
  - `newuidmap`   set the uid mapping of a user namespace
  - `sg`          execute command as different group ID
- Library Functions
  - `shadow`      encrypted password file routines
- File Formats
  - `shadow`      shadowed password file
  - `gshadow`     shadowed group file
  - `login.defs`  shadow password suite configuration
  - `subuid`      configuration for subordinate user ids
  - `subgid`      configuration for subordinate group ids
- System Administration
  - `chpasswd`    update passwords in batch mode
  - `chgpasswd`   update group passwords in batch mode
  - `groupadd`    create a new group
  - `groupdel`    delete a group
  - `groupmod`    modify a group definition on the system
  - `groupmems`   administer members of a user's primary group
  - `grpck`       verify integrity of group files
  - `lastlog`     report most recent login of all users or given user
  - `newusers`    update and create new users in batch
  - `pwconv`      convert to and from shadow passwords and groups
  - `useradd`     create a new user or update default new user information
  - `userdel`     delete a user account and related files
  - `usermod`     modify a user account
  - `pwck`        verify the integrity of password files
  - `vipw`        edit password, group, shadow-password or shadow-group file
  - `adduser`     alias for useradd
  - `grpconv`     alias for pwconv
  - `grpunconv`   alias for pwconv
  - `pwunconv`    alias for pwconv
  - `vigr`        alias for vipw

## Dateutils

Nifty command line date and time utilities; fast date calculations and conversion in the shell.

Dateutils are hosted primarily on github:
- project homepage: https://www.fresse.org/dateutils/
- github page: https://github.com/hroptatyr/dateutils
- downloads: https://bitbucket.org/hroptatyr/dateutils/downloads

Dateutils commands are prefixed with a date but otherwise resemble known Unix commands for reasons of intuition; the only exception being 'strptime' which is analogous to the libc function of the same name.

- `strptime`  Command line version of the C function
- `dateadd`   Add durations to dates or times
- `dateconv`  Convert dates or times between calendars
- `datediff`  Compute durations between dates or times
- `dategrep`  Grep dates or times in input streams
- `dateround` Round dates or times to "fuller" values
- `dateseq`   Generate sequences of dates or times
- `datesort`  Sort chronologically.
- `datetest`  Compare dates or times
- `datezone`  Convert date/times to timezones in bulk
