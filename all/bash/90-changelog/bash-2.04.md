## bash-2.04

since the release of bash-2.03.

New Features in Bash

a.  The history builtin has a '-d offset' option to delete the history entry
    at position 'offset'.

b.  The prompt expansion code has two new escape sequences: \j, the number of
    active jobs; and \l, the basename of the shell's tty device name.

c.  The 'bind' builtin has a new '-x' option to bind key sequences to shell   
    commands.

d.  There is a new shell option, no_empty_command_completion, which, when
    enabled, disables command completion when TAB is typed on an empty line.

e.  The 'help' builtin has a '-s' option to just print a builtin's usage
    synopsis.

f.  There are several new arithmetic operators:  id++, id-- (variable
    post-increment/decrement), ++id, --id (variable pre-increment/decrement),
    expr1 , expr2 (comma operator).

g.  There is a new ksh-93 style arithmetic for command:
        for ((expr1 ; expr2; expr3 )); do list; done

h.  The 'read' builtin has a number of new options:
        -t timeout      only wait timeout seconds for input
        -n nchars       only read nchars from input instead of a full line
        -d delim        read until delim rather than newline
        -s              don't echo input chars as they are read

i.  The redirection code now handles several filenames specially:
    /dev/fd/N, /dev/stdin, /dev/stdout, and /dev/stderr, whether or
    not they are present in the file system.

j.  The redirection code now recognizes pathnames of the form
    /dev/tcp/host/port and /dev/udp/host/port, and tries to open a socket
    of the appropriate type to the specified port on the specified host.

k.  The ksh-93 ${!prefix*} expansion, which expands to the names of all
    shell variables with prefix PREFIX, has been implemented.

l.  There is a new dynamic variable, FUNCNAME, which expands to the name of
    a currently-executing function.  Assignments to FUNCNAME have no effect.

m.  The GROUPS variable is no longer readonly; assignments to it are silently
    discarded.  This means it can be unset.

n.  A new programmable completion facility, with two new builtin commands:
    complete and compgen.

o.  configure has a new option, '--enable-progcomp', to compile in the
    programmable completion features (enabled by default).

p.  'shopt' has a new option, 'progcomp', to enable and disable programmable
    completion at runtime.

q.  Unsetting HOSTFILE now clears the list of hostnames used for completion.

r.  configure has a new option, '--enable-bash-malloc', replacing the old
    '--with-gnu-malloc' (which is still present for backwards compatibility).

s.  There is a new manual page describing rbash, the restricted shell.

t.  'bashbug' has new '--help' and '--version' options.

u.  'shopt' has a new 'xpg_echo' option, which controls the behavior of
    'echo' with respect to backslash-escaped characters at runtime.

v.  If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read the
    startup files, even if they are not interactive.

w.  The LC_NUMERIC variable is now treated specially, and used to set the
    LC_NUMERIC locale category for number formatting, e.g., when 'printf'
    displays floating-point numbers.

2.  New features in Readline

a.  Parentheses matching is now always compiled into readline, and enabled
    or disabled when the value of the 'blink-matching-paren' variable is
    changed.

b.  MS-DOS systems now use ~/_inputrc as the last-ditch inputrc filename.

c.  MS-DOS systems now use ~/_history as the default history file.

d.  history-search-{forward,backward} now leave the point at the end of the
    line when the string to search for is empty, like
    {reverse,forward}-search-history.

e.  history-search-{forward,backward} now leave the last history line found
    in the readline buffer if the second or subsequent search fails.

f.  New function for use by applications:  rl_on_new_line_with_prompt, used
    when an application displays the prompt itself before calling readline().

g.  New variable for use by applications:  rl_already_prompted.  An application
    that displays the prompt itself before calling readline() must set this to
    a non-zero value.

h.  A new variable, rl_gnu_readline_p, always 1.  The intent is that an
    application can verify whether or not it is linked with the 'real'
    readline library or some substitute.
