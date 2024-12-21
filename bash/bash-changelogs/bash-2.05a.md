## bash-2.05a

since
the release of bash-2.05.  As always, the manual page (doc/bash.1) is
the place to look for complete descriptions.

1.  New Features in Bash

a.  Added support for DESTDIR installation root prefix, so you can do a
    'make install DESTDIR=bash-root' and do easier binary packaging.

b.  Added support for builtin printf "'" flag character as per latest POSIX
    drafts.

c.  Support for POSIX.2 printf(1) length specifiers 'j', 't', and 'z' (from
    ISO C99).

d.  New autoconf macro, RL_LIB_READLINE_VERSION, for use by other applications
    (bash doesn't use very much of what it returns).

e.  'set [-+]o nolog' is recognized as required by the latest POSIX drafts,
    but ignored.

f.  New read-only 'shopt' option:  login_shell.  Set to non-zero value if the
    shell is a login shell.

g.  New '\A' prompt string escape sequence; expands to time in 24 HH:MM format.

h.  New '-A group/-g' option to complete and compgen; does group name
    completion.

i.  New '-t' option to 'hash' to list hash values for each filename argument.

j.  New [-+]O invocation option to set and unset 'shopt' options at startup.

k.  configure's '--with-installed-readline' option now takes an optional
    '=PATH' suffix to set the root of the tree where readline is installed
    to PATH.

l.  The ksh-like 'ERR' trap has been added.  The 'ERR' trap will be run
    whenever the shell would have exited if the -e option were enabled.
    It is not inherited by shell functions.

m.  'readonly', 'export', and 'declare' now print variables which have been
    given attributes but not set by assigning a value as just a command and
    a variable name (like 'export foo') when listing, as the latest POSIX
    drafts require.

n.  'bashbug' now requires that the subject be changed from the default.

o.  configure has a new '--enable-largefile' option, like other GNU utilities.

p.  'for' loops now allow empty word lists after 'in', like the latest POSIX
    drafts require.

q.  The builtin 'ulimit' now takes two new non-numeric arguments:  'hard',
    meaning the current hard limit, and 'soft', meaning the current soft  
    limit, in addition to 'unlimited'
    
r.  'ulimit' now prints the option letter associated with a particular
    resource when printing more than one limit.

s.  'ulimit' prints 'hard' or 'soft' when a value is not 'unlimited' but is
    one of RLIM_SAVED_MAX or RLIM_SAVED_CUR, respectively.

t.  The 'printf' builtin now handles the %a and %A conversions if they're
    implemented by printf(3).

u.  The 'printf' builtin now handles the %F conversion (just about like %f).

v.  The 'printf' builtin now handles the %n conversion like printf(3).  The
    corresponding argument is the name of a shell variable to which the
    value is assigned.

2.  New Features in Readline

a.  Added extern declaration for rl_get_termcap to readline.h, making it a
    public function (it was always there, just not in readline.h).

b.  New #defines in readline.h:  RL_READLINE_VERSION, currently 0x0402,
    RL_VERSION_MAJOR, currently 4, and RL_VERSION_MINOR, currently 2.

c.  New readline variable:  rl_readline_version, mirrors RL_READLINE_VERSION.

d.  New bindable boolean readline variable:  match-hidden-files.  Controls
    completion of files beginning with a '.' (on Unix).  Enabled by default.

e.  The history expansion code now allows any character to terminate a
    ':first-' modifier, like csh.

f.  New bindable variable 'history-preserve-point'.  If set, the history
    code attempts to place the user at the same location on each history
    line retrived with previous-history or next-history.
