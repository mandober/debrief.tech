## bash-2.05b

since
the release of bash-2.05a.  As always, the manual page (doc/bash.1) is
the place to look for complete descriptions.


1.  New Features in Bash

a.  If set, TMOUT is the default timeout for the 'read' builtin.

b.  'type' has two new options:  '-f' suppresses shell function lookup, and
    '-P' forces a $PATH search.

c.  New code to handle multibyte characters.

d.  'select' was changed to be more ksh-compatible, in that the menu is
    reprinted each time through the loop only if REPLY is set to NULL.
    The previous behavior is available as a compile-time option.

e.  'complete -d' and 'complete -o dirnames' now force a slash to be
    appended to names which are symlinks to directories.

f.  There is now a bindable edit-and-execute-command readline command,
    like the vi-mode 'v' command, bound to C-xC-e in emacs mode.

g.  Added support for ksh93-like [:word:] character class in pattern matching.

h.  The  $'...' quoting construct now expands \cX to Control-X.

i.  A new \D{...} prompt expansion; passes the '...' to strftime and inserts
    the result into the expanded prompt.

j.  The shell now performs arithmetic in the largest integer size the
    machine supports (intmax_t), instead of long.

k.  If a numeric argument is supplied to one of the bash globbing completion
    functions, a '*' is appended to the word before expansion is attempted.

l.  The bash globbing completion functions now allow completions to be listed
    with double tabs or if 'show-all-if-ambiguous' is set.

m.  New '-o nospace' option for 'complete' and 'compgen' builtins; suppresses
    readline's appending a space to the completed word.

n.  New 'here-string' redirection operator:  <<< word.

o.  When displaying variables, function attributes and definitions are shown
    separately, allowing them to be re-used as input (attempting to re-use
    the old output would result in syntax errors).

p.  There is a new configuration option '--enable-mem-scramble', controls
    bash malloc behavior of writing garbage characters into memory at
    allocation and free time.

q.  The 'complete' and 'compgen' builtins now have a new '-s/-A service'
    option to complete on names from /etc/services.

r.  'read' has a new '-u fd' option to read from a specified file descriptor.

s.  Fix the completion code so that expansion errors in a directory name
    don't cause a longjmp back to the command loop.

t.  Fixed word completion inside command substitution to work a little more
    intuitively.

u.  The 'printf' %q format specifier now uses $'...' quoting to print the
    argument if it contains non-printing characters.

v.  The 'declare' and 'typeset' builtins have a new '-t' option.  When applied
    to functions, it causes the DEBUG trap to be inherited by the named
    function.  Currently has no effect on variables.

w.  The DEBUG trap is now run *before* simple commands, ((...)) commands,
    [[...]] conditional commands, and for ((...)) loops.

x.  The expansion of $LINENO inside a shell function is only relative to the
    function start if the shell is interactive -- if the shell is running a
    script, $LINENO expands to the line number in the script.  This is as
    POSIX-2001 requires.

y.  The bash debugger in examples/bashdb has been modified to work with the
    new DEBUG trap semantics, the command set has been made more gdb-like,
    and the changes to $LINENO make debugging functions work better.  Code
    from Gary Vaughan.

z.  New [n]<&word- and [n]>&word- redirections from ksh93 -- move fds (dup
    and close).

aa. There is a new '-l' invocation option, equivalent to '--login'.

bb. The 'hash' builtin has a new '-l' option to list contents in a reusable
    format, and a '-d' option to remove a name from the hash table.

cc. There is now support for placing the long help text into separate files 
    installed into ${datadir}/bash.  Not enabled by default; can be turned  
    on with '--enable-separate-helpfiles' option to configure.
    
dd. All builtins that take operands accept a '--' pseudo-option, except
    'echo'.

ee. The 'echo' builtin now accepts \0xxx (zero to three octal digits following
    the '0') in addition to \xxx (one to three octal digits) for SUSv3/XPG6/
    POSIX.1-2001 compliance.


2.  New Features in Readline

a.  Support for key 'subsequences':  allows, e.g., ESC and ESC-a to both
    be bound to readline functions.  Now the arrow keys may be used in vi
    insert mode.

b.  When listing completions, and the number of lines displayed is more than
    the screen length, readline uses an internal pager to display the results.
    This is controlled by the 'page-completions' variable (default on).

c.  New code to handle editing and displaying multibyte characters.

d.  The behavior introduced in bash-2.05a of deciding whether or not to
    append a slash to a completed name that is a symlink to a directory has
    been made optional, controlled by the 'mark-symlinked-directories'
    variable (default is the 2.05a behavior).

e.  The 'insert-comment' command now acts as a toggle if given a numeric
    argument:  if the first characters on the line don't specify a
    comment, insert one; if they do, delete the comment text

f.  New application-settable completion variable:
    rl_completion_mark_symlink_dirs, allows an application's completion
    function to temporarily override the user's preference for appending
    slashes to names which are symlinks to directories.

g.  New function available to application completion functions:
    rl_completion_mode, to tell how the completion function was invoked
    and decide which argument to supply to rl_complete_internal (to list
    completions, etc.).

h.  Readline now has an overwrite mode, toggled by the 'overwrite-mode'
    bindable command, which could be bound to 'Insert'.

i.  New application-settable completion variable:
    rl_completion_suppress_append, inhibits appending of
    rl_completion_append_character to completed words.

j.  New key bindings when reading an incremental search string:  ^W yanks
    the currently-matched word out of the current line into the search
    string; ^Y yanks the rest of the current line into the search string,
    DEL or ^H deletes characters from the search string.
