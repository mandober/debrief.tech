## bash-3.0

since
the release of bash-2.05b.  As always, the manual page (doc/bash.1) is
the place to look for complete descriptions.

## 1.  New Features in Bash

a.  ANSI string expansion now implements the \x{hexdigits} escape.

b.  There is a new loadable 'strftime' builtin.

c.  New variable, COMP_WORDBREAKS, which controls the readline completer's
    idea of word break characters.

d.  The 'type' builtin no longer reports on aliases unless alias expansion
    will actually be performed.    

e.  HISTCONTROL is now a colon-separated list of values, which permits
    more extensibility and backwards compatibility.

f.  HISTCONTROL may now include the 'erasedups' option, which causes all lines
    matching a line being added to be removed from the history list.

g.  'configure' has a new '--enable-multibyte' argument that permits multibyte
    character support to be disabled even on systems that support it.

h.  New variables to support the bash debugger:  BASH_ARGC, BASH_ARGV,
    BASH_SOURCE, BASH_LINENO, BASH_SUBSHELL, BASH_EXECUTION_STRING,
    BASH_COMMAND

i.  FUNCNAME has been changed to support the debugger: it's now an array
    variable.

j.  for, case, select, arithmetic commands now keep line number information
    for the debugger.

k.  There is a new 'RETURN' trap executed when a function or sourced script
    returns (not inherited child processes; inherited by command substitution
    if function tracing is enabled and the debugger is active).

l.  New invocation option:  --debugger.  Enables debugging and turns on new
    'extdebug' shell option.

m.  New 'functrace' and 'errtrace' options to 'set -o' cause DEBUG and ERR
    traps, respectively, to be inherited by shell functions.  Equivalent to
    'set -T' and 'set -E' respectively.  The 'functrace' option also controls
    whether or not the DEBUG trap is inherited by sourced scripts.

n.  The DEBUG trap is run before binding the variable and running the action
    list in a 'for' command, binding the selection variable and running the
    query in a 'select' command, and before attempting a match in a 'case'
    command.

o.  New '--enable-debugger' option to 'configure' to compile in the debugger
    support code.

p.  'declare -F' now prints out extra line number and source file information
    if the 'extdebug' option is set.

q.  If 'extdebug' is enabled, a non-zero return value from a DEBUG trap causes
    the next command to be skipped, and a return value of 2 while in a
    function or sourced script forces a 'return'.

r.  New 'caller' builtin to provide a call stack for the bash debugger.

s.  The DEBUG trap is run just before the first command in a function body is
    executed, for the debugger.

t.  'for', 'select', and 'case' command heads are printed when 'set -x' is
    enabled.

u.  There is a new {x..y} brace expansion, which is shorthand for {x.x+1,
    x+2,...,y}.  x and y can be integers or single characters; the sequence
    may ascend or descend; the increment is always 1.

v.  New ksh93-like ${!array[@]} expansion, expands to all the keys (indices)
    of array.

w.  New 'force_fignore' shopt option; if enabled, suffixes specified by
    FIGNORE cause words to be ignored when performing word completion even
    if they're the only possibilities.

x.  New 'gnu_errfmt' shopt option; if enabled, error messages follow the 'gnu
    style' (filename:lineno:message) format.

y.  New '-o bashdefault' option to complete and compgen; if set, causes the
    whole set of bash completions to be performed if the compspec doesn't
    result in a match.

z.  New '-o plusdirs' option to complete and compgen; if set, causes directory
    name completion to be performed and the results added to the rest of the
    possible completions.

aa. 'kill' is available as a builtin even when the shell is built without
    job control.

bb. New HISTTIMEFORMAT variable; value is a format string to pass to
    strftime(3).  If set and not null, the 'history' builtin prints out
    timestamp information according to the specified format when displaying
    history entries.  If set, bash tells the history library to write out
    timestamp information when the history file is written.

cc. The [[ ... ]] command has a new binary '=~' operator that performs
    extended regular expression (egrep-like) matching.

dd. 'configure' has a new '--enable-cond-regexp' option (enabled by default)
    to enable the =~ operator and regexp matching in [[ ... ]].

ee. Subexpressions matched by the =~ operator are placed in the new
    BASH_REMATCH array variable.

ff. New 'failglob' option that causes an expansion error when pathname
    expansion fails to produce a match.

gg. New 'set -o pipefail' option that causes a pipeline to return a failure
    status if any of the processes in the pipeline fail, not just the last
    one.

hh. printf builtin understands two new escape sequences:  \" and \?.

ii. 'echo -e' understands two new escape sequences:  \" and \?.

jj. The GNU 'gettext' package and libintl have been integrated; the shell's
    messages can be translated into different languages.

kk. The '\W' prompt expansion now abbreviates $HOME as '~', like '\w'.

ll. The error message printed when bash cannot open a shell script supplied
    as argument 1 now includes the name of the shell, to better identify
    the error as coming from bash.

mm. The parameter pattern removal and substitution expansions are now much
    faster and more efficient when using multibyte characters.

nn. The 'jobs', 'kill', and 'wait' builtins now accept job control notation
    even if job control is not enabled.

oo. The historical behavior of 'trap' that allows a missing 'action' argument
    to cause each specified signal's handling to be reset to its default is
    now only supported when 'trap' is given a single non-option argument.

## 2.  New Features in Readline

a.  History expansion has a new 'a' modifier equivalent to the 'g' modifier
    for compatibility with the BSD csh.

b.  History expansion has a new 'G' modifier equivalent to the BSD csh 'g'
    modifier, which performs a substitution once per word.

c.  All non-incremental search operations may now undo the operation of
    replacing the current line with the history line.

d.  The text inserted by an 'a' command in vi mode can be reinserted with
    '.'.

e.  New bindable variable, 'show-all-if-unmodified'.  If set, the readline
    completer will list possible completions immediately if there is more
    than one completion and partial completion cannot be performed.

f.  There is a new application-callable 'free_history_entry()' function.

g.  History list entries now contain timestamp information; the history file
    functions know how to read and write timestamp information associated
    with each entry.

h.  Four new key binding functions have been added:

    rl_bind_key_if_unbound()
    rl_bind_key_if_unbound_in_map()
    rl_bind_keyseq_if_unbound()
    rl_bind_keyseq_if_unbound_in_map()

i.  New application variable, rl_completion_quote_character, set to any
    quote character readline finds before it calls the application completion
    function.

j.  New application variable, rl_completion_suppress_quote, settable by an
    application completion function.  If set to non-zero, readline does not
    attempt to append a closing quote to a completed word.

k.  New application variable, rl_completion_found_quote, set to a non-zero
    value if readline determines that the word to be completed is quoted.
    Set before readline calls any application completion function.

l.  New function hook, rl_completion_word_break_hook, called when readline
    needs to break a line into words when completion is attempted.  Allows
    the word break characters to vary based on position in the line.

m.  New bindable command: unix-filename-rubout.  Does the same thing as
    unix-word-rubout, but adds '/' to the set of word delimiters.

n.  When listing completions, directories have a '/' appended if the
    'mark-directories' option has been enabled.
