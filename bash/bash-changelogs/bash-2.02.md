
bash-2.02 - bash-2.01.1

1. New Features in Bash

a.  A new version of malloc, based on the older GNU malloc, that has many
    changes, is more page-based, is more conservative with memory usage,
    and does not 'orphan' large blocks when they are freed.

b.  A new version of gmalloc, based on the old GLIBC malloc, with many
    changes and range checking included by default.

c.  A new implementation of fnmatch(3) that includes full POSIX.2 Basic
    Regular Expression matching, including character classes, collating
    symbols, equivalence classes, and support for case-insensitive pattern
    matching.

d.  ksh-88 egrep-style extended pattern matching ([@+*?!](patlist)) has been
    implemented, controlled by a new 'shopt' option, 'extglob'.  
    
e.  There is a new ksh-like '[[' compound command, which implements   
    extended 'test' functionality.
    
f.  There is a new 'printf' builtin, implemented according to the POSIX.2
    specification.

g.  **New feature for command substitution**: 
    `$(< filename)` 
    expands to the contents of 'filename' with any trailing newlines removed; equivalent to `$(cat filename)`

h.  There are new tilde prefixes which expand to directories from the
    directory stack.

i.  There is a new '**' arithmetic operator to do exponentiation.

j.  There are new configuration options to control how bash is linked:
    '--enable-profiling', to allow bash to be profiled with gprof, and
    '--enable-static-link', to allow bash to be linked statically.

k.  There is a new configuration option, '--enable-cond-command', which
    controls whether or not the '[[' command is included.  It is on by
    default. 

l.  There is a new configuration option, '--enable-extended-glob', which
    controls whether or not the ksh extended globbing feature is included.
    It is enabled by default.

m.  There is a new configuration #define in config.h.top that, when enabled,
    will cause all login shells to source /etc/profile and one of the user-
    specific login shell startup files, whether or not the shell is
    interactive.  
    
n.  There is a new invocation option, '--dump-po-strings', to dump
    a shell script's translatable strings ($"...") in GNU 'po' format. 
    
o.  There is a new 'shopt' option, 'nocaseglob', to enable case-insensitive
    pattern matching when globbing filenames and using the 'case' construct.

p.  There is a new 'shopt' option, 'huponexit', which, when enabled, causes
    the shell to send SIGHUP to all jobs when an interactive login shell
    exits.

q.  'bind' has a new '-u' option, which takes a readline function name as an
    argument and unbinds all key sequences bound to that function in a
    specified keymap.
    
r.  'disown' now has '-a' and '-r' options, to limit operation to all jobs
    and running jobs, respectively.

s.  The 'shopt' '-p' option now causes output to be displayed in a reusable
    format.
    
t.  'test' has a new '-N' option, which returns true if the filename argument
    has been modified since it was last accessed.

u.  'umask' now has a '-p' option to print output in a reusable format.
    
v.  A new escape sequence, '\xNNN', has been added to the 'echo -e' and $'...'
    translation code.  It expands to the character whose ascii code is NNN
    in hexadecimal.
    
w.  The prompt string expansion code has a new '\r' escape sequence.

x.  The shell may now be cross-compiled for the CYGWIN32 environment on
    a Unix machine.

2. New Features in Readline

a.  There is now an option for 'iterative' yank-last-arg handline, so a user
    can keep entering 'M-.', yanking the last argument of successive history
    lines.

b.  New variable, 'print-completions-horizontally', which causes completion
    matches to be displayed across the screen (like 'ls -x') rather than up
    and down the screen (like 'ls').

c.  New variable, 'completion-ignore-case', which causes filename completion
    and matching to be performed case-insensitively.

d.  There is a new bindable command, 'magic-space', which causes history
    expansion to be performed on the current readline buffer and a space to
    be inserted into the result.

e.  There is a new bindable command, 'menu-complete', which enables tcsh-like
    menu completion (successive executions of menu-complete insert a single
    completion match, cycling through the list of possible completions).

f.  There is a new bindable command, 'paste-from-clipboard', for use on Win32
    systems, to insert the text from the Win32 clipboard into the editing
    buffer.

g.  The key sequence translation code now understands printf-style backslash
    escape sequences, including \NNN octal escapes.  These escape sequences
    may be used in key sequence definitions or macro values.

h.  An '$include' inputrc file parser directive has been added.
