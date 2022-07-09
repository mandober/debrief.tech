## New Features in bash-4.2

a.  'exec -a foo' now sets $0 to 'foo' in an executable shell script without a
    leading #!.

b.  Subshells begun to execute command substitutions or run shell functions or
    builtins in subshells do not reset trap strings until a new trap is
    specified.  This allows $(trap) to display the caller's traps and the
    trap strings to persist until a new trap is set.

c.  'trap -p' will now show signals ignored at shell startup, though their
    disposition still cannot be modified.

d.  $'...', echo, and printf understand \uXXXX and \UXXXXXXXX escape sequences.

e.  declare/typeset has a new '-g' option, which creates variables in the
    global scope even when run in a shell function.

f.  `test/[/[[` have a new -v variable unary operator, which returns success if
    'variable' has been set.

g.  Posix parsing changes to allow '! time command' and multiple consecutive
    instances of '!' (which toggle) and 'time' (which have no cumulative
    effect).

h.  Posix change to allow 'time' as a command by itself to print the elapsed
    user, system, and real times for the shell and its children.

j.  $((...)) is always parsed as an arithmetic expansion first, instead of as
    a potential nested command substitution, as Posix requires.

k.  A new FUNCNEST variable to allow the user to control the maximum shell
    function nesting (recursive execution) level.

l.  The mapfile builtin now supplies a third argument to the callback command:
    the line about to be assigned to the supplied array index.

m.  The printf builtin has a new %(fmt)T specifier, which allows time values
    to use strftime-like formatting.

n.  There is a new 'compat41' shell option.

o.  The cd builtin has a new Posix-mandated '-e' option.

p.  Negative subscripts to indexed arrays, previously errors, now are treated
    as offsets from the maximum assigned index + 1.

q.  Negative length specifications in the ${var:offset:length} expansion,
    previously errors, are now treated as offsets from the end of the variable.

r.  Parsing change to allow 'time -p --'.

s.  Posix-mode parsing change to not recognize 'time' as a keyword if the
    following token begins with a '-'.  This means no more Posix-mode
    'time -p'.  Posix interpretation 267.

t.  There is a new 'lastpipe' shell option that runs the last command of a
    pipeline in the current shell context.  The lastpipe option has no
    effect if job control is enabled.

u.  History expansion no longer expands the '$!' variable expansion.

v.  Posix mode shells no longer exit if a variable assignment error occurs
    with an assignment preceding a command that is not a special builtin.

w.  Non-interactive mode shells exit if -u is enabled and an attempt is made
    to use an unset variable with the % or # expansions, the '//', '^', or
    ',' expansions, or the parameter length expansion.

x.  Posix-mode shells use the argument passed to '.' as-is if a $PATH search
    fails, effectively searching the current directory.  Posix-2008 change.

### New Features in Readline

a.  The history library does not try to write the history filename in the
    current directory if $HOME is unset.  This closes a potential security
    problem if the application does not specify a history filename.

b.  New bindable variable 'completion-display-width' to set the number of
    columns used when displaying completions.

c.  New bindable variable 'completion-case-map' to cause case-insensitive
    completion to treat '-' and '_' as identical.

d.  There are new bindable vi-mode command names to avoid readline's case-
    insensitive matching not allowing them to be bound separately.

e.  New bindable variable 'menu-complete-display-prefix' causes the menu
    completion code to display the common prefix of the possible completions
    before cycling through the list, instead of after.
