## New Features in bash-4.4

a.  There is now a settable configuration #define that will cause the shell
    to exit if the shell is running setuid without the -p option and setuid
    to the real uid fails.

b.  Command and process substitutions now turn off the '-v' option when
    executing, as other shells seem to do.

c.  The default value for the 'checkhash' shell option may now be set at
    compile time with a #define.

d.  The 'mapfile' builtin now has a -d option to use an arbitrary character
    as the record delimiter, and a -t option  to strip the delimiter as
    supplied with -d.

e.  The maximum number of nested recursive calls to 'eval' is now settable in
    config-top.h; the default is no limit.

f.  The '-p' option to declare and similar builtins will display attributes for
    named variables even when those variables have not been assigned values
    (which are technically unset).

g.  The maximum number of nested recursive calls to 'source' is now settable
    in config-top.h; the default is no limit.

h.  All builtin commands recognize the '--help' option and print a usage
    summary.

i.  Bash does not allow function names containing '/' and '=' to be exported.

j.  The 'ulimit' builtin has new -k (kqueues) and -P (pseudoterminals) options.

k.  The shell now allows 'time ; othercommand' to time null commands.

l.  There is a new '--enable-function-import' configuration option to allow
    importing shell functions from the environment; import is enabled by
    default.

m.  'printf -v var ""' will now set 'var' to the empty string, as if 'var=""'
    had been executed.

n.  GLOBIGNORE, the pattern substitution word expansion, and programmable
    completion match filtering now honor the value of the 'nocasematch' option.

o.  There is a new ${parameter@spec} family of operators to transform the
    value of 'parameter'.

p.  Bash no longer attempts to perform compound assignment if a variable on the
    rhs of an assignment statement argument to 'declare' has the form of a
    compound assignment (e.g., w='(word)' ; declare foo=$w); compound
    assignments are accepted if the variable was already declared as an array,
    but with a warning.

q.  The declare builtin no longer displays array variables using the compound
    assignment syntax with quotes; that will generate warnings when re-used as
    input, and isn't necessary.

r.  Executing the rhs of && and || will no longer cause the shell to fork if
    it's not necessary.

s.  The 'local' builtin takes a new argument: '-', which will cause it to save
    and the single-letter shell options and restore their previous values at
    function return.

t.  'complete' and 'compgen' have a new '-o nosort' option, which forces
    readline to not sort the completion matches.

u.  Bash now allows waiting for the most recent process substitution, since it
    appears as $!.

v.  The 'unset' builtin now unsets a scalar variable if it is subscripted with
    a '0', analogous to the ${var[0]} expansion.

w.  'set -i' is no longer valid, as in other shells.

x.  BASH_SUBSHELL is now updated for process substitution and group commands
    in pipelines, and is available with the same value when running any exit
    trap.

y.  Bash now checks $INSIDE_EMACS as well as $EMACS when deciding whether or
    not bash is being run in a GNU Emacs shell window.

z.  Bash now treats SIGINT received when running a non-builtin command in a
    loop the way it has traditionally treated running a builtin command:
    running any trap handler and breaking out of the loop.

aa. New variable: EXECIGNORE; a colon-separate list of patterns that will
    cause matching filenames to be ignored when searching for commands.

bb. Aliases whose value ends in a shell metacharacter now expand in a way to
    allow them to be 'pasted' to the next token, which can potentially change
    the meaning of a command (e.g., turning '&' into '&&').

cc. 'make install' now installs the example loadable builtins and a set of
    bash headers to use when developing new loadable builtins.

dd. 'enable -f' now attempts to call functions named BUILTIN_builtin_load when
    loading BUILTIN, and BUILTIN_builtin_unload when deleting it.  This allows
    loadable builtins to run initialization and cleanup code.

ee. There is a new BASH_LOADABLES_PATH variable containing a list of directories
    where the 'enable -f' command looks for shared objects containing loadable
    builtins.

ff. The 'complete_fullquote' option to 'shopt' changes filename completion to
    quote all shell metacharacters in filenames and directory names.

gg. The 'kill' builtin now has a '-L' option, equivalent to '-l', for
    compatibility with Linux standalone versions of kill.

hh. BASH_COMPAT and FUNCNEST can be inherited and set from the shell's initial
    environment.

ii. inherit_errexit: a new 'shopt' option that, when set, causes command
    substitutions to inherit the -e option.  By default, those subshells disable
    -e.  It's enabled as part of turning on posix mode.

jj. New prompt string: PS0.  Expanded and displayed by interactive shells after
    reading a complete command but before executing it.

kk. Interactive shells now behave as if SIGTSTP/SIGTTIN/SIGTTOU are set to
    SIG_DFL when the shell is started, so they are set to SIG_DFL in child
    processes.

ll. Posix-mode shells now allow double quotes to quote the history expansion
    character.

mm. OLDPWD can be inherited from the environment if it names a directory.

nn. Shells running as root no longer inherit PS4 from the environment, closing
    a security hole involving PS4 expansion performing command substitution.

oo. If executing an implicit 'cd' when the 'autocd' option is set, bash will
    now invoke a function named 'cd' if one exists before executing the 'cd'
    builtin.

pp. Value conversions (arithmetic expansions, case modification, etc.) now
    happen when assigning elements of an array using compound assignment.

qq. There is a new option settable in config-top.h that makes multiple
    directory arguments to 'cd' a fatal error.

rr. Bash now uses mktemp() when creating internal temporary files; it produces
    a warning at build time on many Linux systems.


### New Features in Readline

a.  The history truncation code now uses the same error recovery mechansim as
    the history writing code, and restores the old version of the history file
    on error.  The error recovery mechanism handles symlinked history files.

b.  There is a new bindable variable, 'enable-bracketed-paste', which enables
    support for a terminal's bracketed paste mode.

c.  The editing mode indicators can now be strings and are user-settable
    (new 'emacs-mode-string', 'vi-cmd-mode-string' and 'vi-ins-mode-string'
    variables).  Mode strings can contain invisible character sequences.
    Setting mode strings to null strings restores the defaults.

d.  Prompt expansion adds the mode string to the last line of a multi-line
    prompt (one with embedded newlines).

e.  There is a new bindable variable, 'colored-completion-prefix', which, if
    set, causes the common prefix of a set of possible completions to be
    displayed in color.

f.  There is a new bindable command 'vi-yank-pop', a vi-mode version of emacs-
    mode yank-pop.

g.  The redisplay code underwent several efficiency improvements for multibyte
    locales.

h.  The insert-char function attempts to batch-insert all pending typeahead
    that maps to self-insert, as long as it is coming from the terminal.

i.  rl_callback_sigcleanup: a new application function that can clean up and
    unset any state set by readline's callback mode.  Intended to be used
    after a signal.

j.  If an incremental search string has its last character removed with DEL, the
    resulting empty search string no longer matches the previous line.

k.  If readline reads a history file that begins with '#' (or the value of
    the history comment character) and has enabled history timestamps, the
    history entries are assumed to be delimited by timestamps.  This allows
    multi-line history entries.

l.  Readline now throws an error if it parses a key binding without a
    terminating ':' or whitespace.

m.  The default binding for ^W in vi mode now uses word boundaries specified
    by Posix (vi-unix-word-rubout is bindable command name).

n.  rl_clear_visible_line: new application-callable function; clears all
    screen lines occupied by the current visible readline line.

o.  rl_tty_set_echoing: application-callable function that controls whether
    or not readline thinks it is echoing terminal output.

p.  Handle >| and strings of digits preceding and following redirection
    specifications as single tokens when tokenizing the line for history
    expansion.

q.  Fixed a bug with displaying completions when the prefix display length
    is greater than the length of the completions to be displayed.

r.  The :p history modifier now applies to the entire line, so any expansion
    specifying :p causes the line to be printed instead of expanded.

s.  New application-callable function: rl_pending_signal(): returns the signal
    number of any signal readline has caught but not yet handled.

t.  New application-settable variable: rl_persistent_signal_handlers: if set
    to a non-zero value, readline will enable the readline-6.2 signal handler
    behavior in callback mode: handlers are installed when
    rl_callback_handler_install is called and removed removed when a complete
    line has been read.
