# w

- name: `w`
- note: `w` is the only single-letter preinstalled command
- type: command, executable
- orig: preinstalled
- desc: shows who is logged on and what they are doing

```bash
# man page = info page
man 1 w

# help (backslash circumvents aliasing making sure to call 'w')
\w --help

USAGE: w [options]
-h, --no-header     do not print header
-u, --no-current    ignore current process username
-s, --short         short format
-f, --from          show remote hostname field
-o, --old-style     old style output
-i, --ip-addr       display IP address instead of hostname (if possible)
-V, --version       output version information and exit
```

## Manual

w (procps-ng, May 2012)

- [NAME](#name)
- [SYNOPSIS](#synopsis)
- [DESCRIPTION](#description)
- [COMMAND-LINE OPTIONS](#command-line-options)
- [ENVIRONMENT](#environment)
- [FILES](#files)
- [SEE ALSO](#see-also)

## NAME

`w` show who is logged on and what they are doing.

## SYNOPSIS

w [options] user [...]

## DESCRIPTION

`w` displays information about the users currently on the machine, and their processes. The header shows, in this order, the current time, how long the system has been running, how many users are currently logged on, and the system load averages for the past 1, 5, and 15 minutes.

The following entries are displayed for each user: login name, the tty name, the remote host, login time, idle time, JCPU, PCPU, and the command line of their current process.

The JCPU time is the time used by all processes attached to the tty. It does not include past background jobs, but does include currently running background jobs.

The PCPU time is the time used by the current process, named in the "what" field.

## COMMAND-LINE OPTIONS

       -h, --no-header
              Don't print the header.

       -u, --no-current
              Ignores the username while figuring out the current process and cpu times.  To demonstrate this, do a "su" and do a "w" and a "w -u".

       -s, --short
              Use the short format.  Don't print the login time, JCPU or PCPU times.

       -f, --from
              Toggle printing the from (remote hostname) field.  The default as released is for the from field to not be printed, although your system  adminis‐
              trator or distribution maintainer may have compiled a version in which the from field is shown by default.

       --help Display help text and exit.

       -i, --ip-addr
              Display IP address instead of hostname for from field.

       -V, --version
              Display version information.

       -o, --old-style
              Old style output.  Prints blank space for idle times less than one minute.

       user   Show information about the specified user only.

## ENVIRONMENT

`PROCPS_USERLEN`    
Override the default width of the username column. Defaults to 8.

`PROCPS_FROMLEN`    
Override the default width of the from column. Defaults to 16.

## FILES
- `/var/run/utmp`   information about who is currently logged on
- `/proc`           process information

## SEE ALSO
- free(1)
- ps(1)
- top(1)
- uptime(1)
- utmp(5)
- who(1)
