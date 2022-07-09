## New Features in bash-4.3

a.  The 'helptopic' completion action now maps to all the help topics, not just
    the shell builtins.

b.  The 'help' builtin no longer does prefix substring matching first, so
    'help read' does not match 'readonly', but will do it if exact string
    matching fails.

c.  The shell can be compiled to not display a message about processes that
    terminate due to SIGTERM.

d.  Non-interactive shells now react to the setting of checkwinsize and set
    LINES and COLUMNS after a foreground job exits.

e.  There is a new shell option, 'globasciiranges', which, when set to on,
    forces globbing range comparisons to use character ordering as if they
    were run in the C locale.

f.  There is a new shell option, 'direxpand', which makes filename completion
    expand variables in directory names in the way bash-4.1 did.

g.  In Posix mode, the 'command' builtin does not change whether or not a
    builtin it shadows is treated as an assignment builtin.

h.  The 'return' and 'exit' builtins accept negative exit status arguments.

i.  The word completion code checks whether or not a filename containing a
    shell variable expands to a directory name and appends '/' to the word
    as appropriate.  The same code expands shell variables in command names
    when performing command completion.

j.  In Posix mode, it is now an error to attempt to define a shell function
    with the same name as a Posix special builtin.

k.  When compiled for strict Posix conformance, history expansion is disabled
    by default.

l.  The history expansion character (!) does not cause history expansion when
    followed by the closing quote in a double-quoted string.

m.  'complete' and its siblings compgen/compopt now takes a new '-o noquote'
    option to inhibit quoting of the completions.

n.  Setting HISTSIZE to a value less than zero causes the history list to be
    unlimited (setting it 0 zero disables the history list).

o.  Setting HISTFILESIZE to a value less than zero causes the history file size
    to be unlimited (setting it to 0 causes the history file to be truncated
    to zero size).

p.  The 'read' builtin now skips NUL bytes in the input.

q.  There is a new 'bind -X' option to print all key sequences bound to Unix
    commands.

r.  When in Posix mode, 'read' is interruptible by a trapped signal.  After
    running the trap handler, read returns 128+signal and throws away any
    partially-read input.

s.  The command completion code skips whitespace and assignment statements
    before looking for the command name word to be completed.

t.  The build process has a new mechanism for constructing separate help files
    that better reflects the current set of compilation options.

u.  The -nt and -ot options to test now work with files with nanosecond
    timestamp resolution.

v.  The shell saves the command history in any shell for which history is
    enabled and HISTFILE is set, not just interactive shells.

w.  The shell has 'nameref' variables and new -n(/+n) options to declare and
    unset to use them, and a 'test -R' option to test for them.

x.  The shell now allows assigning, referencing, and unsetting elements of
    indexed arrays using negative subscripts (a[-1]=2, echo ${a[-1]}) which
    count back from the last element of the array.

y.  The {x}<word redirection feature now allows words like {array[ind]} and
    can use variables with special meanings to the shell (e.g., BASH_XTRACEFD).

z.  There is a new CHILD_MAX special shell variable; its value controls the
    number of exited child statues the shell remembers.

aa. There is a new configuration option (--enable-direxpand-default) that
    causes the 'direxpand' shell option to be enabled by default.

bb. Bash does not do anything special to ensure that the file descriptor
    assigned to X in {x}<foo remains open after the block containing it
    completes.

cc. The 'wait' builtin has a new '-n' option to wait for the next child to
    change status.

dd. The 'printf' %(...)T format specifier now uses the current time if no
    argument is supplied.

ee. There is a new variable, BASH_COMPAT, that controls the current shell
    compatibility level.

ff. The 'popd' builtin now treats additional arguments as errors.

gg. The brace expansion code now treats a failed sequence expansion as a
    simple string and will continue to expand brace terms in the remainder
    of the word.

hh. Shells started to run process substitutions now run any trap set on EXIT.

ii. The fc builtin now interprets -0 as the current command line.

jj. Completing directory names containing shell variables now adds a trailing
    slash if the expanded result is a directory.

kk. 'cd' has a new '-@' option to browse a file's extended attributes on
    systems that support O_XATTR.

ll. The `test/[/[[` '-v variable' binary operator now understands array
    references.


### New Features in Readline

a.  Readline is now more responsive to SIGHUP and other fatal signals when
    reading input from the terminal or performing word completion but no
    longer attempts to run any not-allowable functions from a signal handler
    context.

b.  There are new bindable commands to search the history for the string of
    characters between the beginning of the line and the point
    (history-substring-search-forward, history-substring-search-backward)

c.  Readline allows quoted strings as the values of variables when setting
    them with 'set'.  As a side effect, trailing spaces and tabs are ignored
    when setting a string variable's value.

d.  The history library creates a backup of the history file when writing it
    and restores the backup on a write error.

e.  New application-settable variable: rl_filename_stat_hook: a function called
    with a filename before using it in a call to stat(2).  Bash uses it to
    expand shell variables so things like $HOME/Downloads have a slash
    appended.

f.  New bindable function 'print-last-kbd-macro', prints the most-recently-
    defined keyboard macro in a reusable format.

g.  New user-settable variable 'colored-stats', enables use of colored text
    to denote file types when displaying possible completions (colored analog
    of visible-stats).

h.  New user-settable variable 'keyseq-timout', acts as an inter-character
    timeout when reading input or incremental search strings.

i.  New application-callable function: rl_clear_history. Clears the history list
    and frees all readline-associated private data.

j.  New user-settable variable, show-mode-in-prompt, adds a characters to the
    beginning of the prompt indicating the current editing mode.

k.  New application-settable variable: rl_input_available_hook; function to be
    called when readline detects there is data available on its input file
    descriptor.

l.  Readline calls an application-set event hook (rl_event_hook) after it gets
    a signal while reading input (read returns -1/EINTR but readline does not
    handle the signal immediately) to allow the application to handle or
    otherwise note it.

m.  If the user-settable variable 'history-size' is set to a value less than
    0, the history list size is unlimited.

n.  New application-settable variable: rl_signal_event_hook; function that is
    called when readline is reading terminal input and read(2) is interrupted
    by a signal.  Currently not called for SIGHUP or SIGTERM.

o.  rl_change_environment: new application-settable variable that controls
    whether or not Readline modifies the environment (currently readline
    modifies only LINES and COLUMNS).
