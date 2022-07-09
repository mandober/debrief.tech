# bash v.4.0

This is a terse description of the new features added to bash-4.0 since
the release of bash-3.2.

## New Features in Bash

a.  When using substring expansion on the positional parameters, a starting
    index of 0 now causes $0 to be prefixed to the list.

b.  The 'help' builtin now prints its columns with entries sorted vertically
    rather than horizontally.

c.  There is a new variable, $BASHPID, which always returns the process id of
    the current shell.

d.  There is a new 'autocd' option that, when enabled, causes bash to attempt
    to 'cd' to a directory name that is supplied as the first word of a
    simple command.

e.  There is a new 'checkjobs' option that causes the shell to check for and
    report any running or stopped jobs at exit.

f.  The programmable completion code exports a new COMP_TYPE variable, set to
    a character describing the type of completion being attempted.

g.  The programmable completion code exports a new COMP_KEY variable, set to
    the character that caused the completion to be invoked (e.g., TAB).

h.  If creation of a child process fails due to insufficient resources, bash
    will try again several times before reporting failure.

i.  The programmable completion code now uses the same set of characters as
    readline when breaking the command line into a list of words.

j.  The block multiplier for the ulimit -c and -f options is now 512 when in
    Posix mode, as Posix specifies.

k.  Changed the behavior of the read builtin to save any partial input received
    in the specified variable when the read builtin times out.  This also
    results in variables specified as arguments to read to be set to the empty
    string when there is no input available.  When the read builtin times out,
    it returns an exit status greater than 128.

l.  The shell now has the notion of a 'compatibility level', controlled by
    new variables settable by 'shopt'.  Setting this variable currently
    restores the bash-3.1 behavior when processing quoted strings on the rhs
    of the '=~' operator to the '[[' command.

m.  The 'ulimit' builtin now has new -b (socket buffer size) and -T (number
    of threads) options.

n.  The -p option to 'declare' now displays all variable values and attributes
    (or function values and attributes if used with -f).

o.  There is a new 'compopt' builtin that allows completion functions to modify
    completion options for existing completions or the completion currently
    being executed.

p.  The 'read' builtin has a new -i option which inserts text into the reply
    buffer when using readline.

q.  A new '-E' option to the complete builtin allows control of the default
    behavior for completion on an empty line.

r.  There is now limited support for completing command name words containing
    globbing characters.

s.  Changed format of internal help documentation for all builtins to roughly
    follow man page format.

t.  The 'help' builtin now has a new -d option, to display a short description,
    and a -m option, to print help information in a man page-like format.

u.  There is a new 'mapfile' builtin to populate an array with lines from a
    given file.  The name 'readarray' is a synonym.

v.  If a command is not found, the shell attempts to execute a shell function
    named 'command_not_found_handle', supplying the command words as the
    function arguments.

w.  There is a new shell option: 'globstar'.  When enabled, the globbing code
    treats '**' specially -- it matches all directories (and files within
    them, when appropriate) recursively.

x.  There is a new shell option: 'dirspell'.  When enabled, the filename
    completion code performs spelling correction on directory names during
    completion.

y.  The '-t' option to the 'read' builtin now supports fractional timeout
    values.

z.  Brace expansion now allows zero-padding of expanded numeric values and
    will add the proper number of zeroes to make sure all values contain the
    same number of digits.

aa. There is a new bash-specific bindable readline function: 'dabbrev-expand'.
    It uses menu completion on a set of words taken from the history list.

bb. The command assigned to a key sequence with 'bind -x' now sets two new
    variables in the environment of the executed command:  READLINE_LINE_BUFFER
    and READLINE_POINT.  The command can change the current readline line
    and cursor position by modifying READLINE_LINE_BUFFER and READLINE_POINT,
    respectively.

cc. There is a new &>> redirection operator, which appends the standard output
    and standard error to the named file.

dd. The parser now understands '|&' as a synonym for '2>&1 |', which redirects
    the standard error for a command through a pipe.

ee. The new ';&' case statement action list terminator causes execution to
    continue with the action associated with the next pattern in the
    statement rather than terminating the command.

ff. The new ';;&' case statement action list terminator causes the shell to
    test the next set of patterns after completing execution of the current
    action, rather than terminating the command.

gg. The shell understands a new variable: PROMPT_DIRTRIM.  When set to an
    integer value greater than zero, prompt expansion of \w and \W  will
    retain only that number of trailing pathname components and replace
    the intervening characters with '...'.

hh. There are new case-modifying word expansions: uppercase (^[^]) and
    lowercase (,[,]).  They can work on either the first character or
    array element, or globally.  They accept an optional shell pattern
    that determines which characters to modify.  There is an optionally-
    configured feature to include capitalization operators.

ii. The shell provides associative array variables, with the appropriate
    support to create, delete, assign values to, and expand them.

jj. The 'declare' builtin now has new -l (convert value to lowercase upon
    assignment) and -u (convert value to uppercase upon assignment) options.
    There is an optionally-configurable -c option to capitalize a value at
    assignment.

kk. There is a new 'coproc' reserved word that specifies a coprocess: an
    asynchronous command run with two pipes connected to the creating shell.
    Coprocs can be named.  The input and output file descriptors and the
    PID of the coprocess are available to the calling shell in variables
    with coproc-specific names.

ll. A value of 0 for the -t option to 'read' now returns success if there is
    input available to be read from the specified file descriptor.

mm. CDPATH and GLOBIGNORE are ignored when the shell is running in privileged
    mode.

nn. New bindable readline functions shell-forward-word and shell-backward-word,
    which move forward and backward words delimited by shell metacharacters
    and honor shell quoting.

oo.  New bindable readline functions shell-backward-kill-word and 
    shell-kill-word
    which kill words backward and forward, but use the same word boundaries
    as shell-forward-word and shell-backward-word.

## New Features in Readline

a.  A new variable, rl_sort_completion_matches; allows applications to inhibit
    match list sorting (but beware: some things don't work right if
    applications do this).

b.  A new variable, rl_completion_invoking_key; allows applications to discover
    the key that invoked rl_complete or rl_menu_complete.

c.  The functions rl_block_sigint and rl_release_sigint are now public and
    available to calling applications who want to protect critical sections
    (like redisplay).

d.  The functions rl_save_state and rl_restore_state are now public and
    available to calling applications; documented rest of readline's state
    flag values.

e.  A new user-settable variable, 'history-size', allows setting the maximum
    number of entries in the history list.

f.  There is a new implementation of menu completion, with several improvements
    over the old; the most notable improvement is a better 'completions
    browsing' mode.

g.  The menu completion code now uses the rl_menu_completion_entry_function
    variable, allowing applications to provide their own menu completion
    generators.

h.  There is support for replacing a prefix  of a pathname with a '...' when
    displaying possible completions.  This is controllable by setting the
    'completion-prefix-display-length' variable.  Matches with a common prefix
    longer than this value have the common prefix replaced with '...'.

i.  There is a new 'revert-all-at-newline' variable.  If enabled, readline will
    undo all outstanding changes to all history lines when 'accept-line' is
    executed.

j.  If the kernel supports it, readline displays special characters
    corresponding to a keyboard-generated signal when the signal is received.
