# bash-5.0-alpha

This document details the changes between this version, *bash-5.0-alpha*, and
the previous version, *bash-4.4-release*.


### 1. Changes to Bash

a. Fixed a bug that could cause traps in background jobs to give the terminal
   to the wrong process group.

b. Fixed a bug that caused `kill -l 0' to print an out-of-range error.

c. Fixed a problem that could result in here-documents being displayed in
   the wrong order.

d. Fixed a number of out-of-bounds and free memory read errors found via
   fuzzing.

e. Fixed a subshell inheritance problem that could cause a subshell to wait for
   the wrong process.

f. Fixed a bug that caused SHLVL to be incremented one too many times when
   creating subshells.

g. A job dying due to SIGINT can now interrupt sourcing a file in a shell with
   job control enabled.

h. Fixed a spurious warning about unterminated ${ or $( constructs during
   word completion.

i. The shell no longer runs traps if a signal arrives while reading command
   substitution output.

j. Fixed an arithmetic expansion error that could allow ++var++ as valid
   syntax.

k. Fixed an error that allowed out-of-bounds references to the directory stack.

l. The shell does a better job of saving multi-line history entries with
   embedded comments.

m. Fixed a bug that could cause quoted bracket expressions in regular expression
   arguments to `[[' to not match correctly.

n. Fixed a bug that could cause an IFS character in a word to result in an
   extra '\001' character in the expansion.

o. A trailing backslash in a glob pattern can match a trailing backslash in the
   string.

p. Fixed a memory leak in the process creation code path when job control is
   enabled.

q. Fixed a bug that caused `printf' to output broken surrogate pairs for
   Japanese locales.

r. Fixed a bug that caused a SIGINT generated from `kill' in a dot script to
   kill an interactive shell.

s. Fixed a bug that could cause the `read' builtin to not fully read a
   multibyte character.

t. Fixed a bug that could cause identifiers to be evaluated in conditional
   arithmetic expressions even when evaluation is suppressed.

u. Fixed a bug that could result in command substitution, when executed in a
   context where word splitting is not performed, to leave a stray '\001'
   character in the string.

v. Fixed a bug that could cause history expansion to be disabled in a non-
   interactive shell even if `-o histexpand' is supplied at startup.

w. Fixed a bug that caused `read -N' to strip leading whitespace IFS characters.

x. Fixed a bug that caused spurious tilde expansion in arithmetic expressions.

y. If indirect expansion attempts to indirectly reference through an unset
   variable, report an error.

z. Added a guard to prevent the shell from looping while receiving an endless
   stream of SIGTTIN at shell startup.

aa. Fixed a bug with parsing here documents inside a command substitution when
    looking for the closing delimiter.

bb. Fixed a bug that caused printf to not quote all <blank> characters in the
    current locale when using the `%q' format specifier.

cc. Fixed a bug with bash's internal buffered I/O system that caused the input
    pointer to not be reset when read(2) returned an EOF.

dd. Bash now installs its SIGWINCH signal handler with SA_RESTART, so it will
    not interrupt open/read/write system calls.

ee. The ERR trap now reports line numbers more reliably.

ff. The shell no longer tries to manipulate the terminal process group if a
    command or process substitution is killed by SIGTERM when job control is
    enabled.

gg. Fixed a bug that caused extglob patterns to match filenames beginning with
    a period.

hh. File descriptors open for writing to here documents are no longer available
    to subshells.

ii. Make sure word completion doesn't perform command or process substitution.

jj. Fixed a bug with parsing $$'...' inside a command substitution.

kk. Fixed a bug that caused bash to remove backslash-newline pairs from the
    body of a here-document with a quoted delimiter inside a command
    substitution.

ll. Fixed a bug that could cause the shell to hang when adding a pid to the
    table of background process exit statuses.

mm. Fixed a bug that could cause 0x01 characters to be doubled in the output
    of process substitution.

nn. Restricted shells now clear the hash table before making the PATH variable
    read-only.

oo. There are a number of changes to the expansion of $* and $@ in contexts
    where word splitting does not occur (quoted and unquoted), with IFS set
    to NULL or a non-standard value, mostly to deal with the consequences of
    the behavior defined in Posix interpretation 888.

pp. There are a number of changes to nameref variable handling to avoid
    creating variables with invalid names.

qq. A non-interactive posix mode shell no longer exits when an assignment
    statement fails if the assignment is utimately being performed by the
    `command' builtin.

rr. When using character class names for globbing, don't allow case
    insensitivity, even if nocaseglob is enabled.

ss. Fixed a bug that allowed some redirections to stay in place if a later
    redirection failed.

tt. Fixed a bug in how command and process substitutions are recognized within
    other parameter expansions.

uu. Fixed a bug that caused bash to loop under certain circumstances when
    performing arithmetic expansion on a variable whose value is an invalid
    expression.

vv. Fixed a bug that could cause bash to expand aliases inappropriately while
    parsing compound commands like `case'.

ww. Fixed a bug that could cause `read -N' to fail to read complete multibyte
    characters, even when the sequences are incomplete or invalid, with or
    without readline.

xx. Fixed a bug that could cause `case' to fail to match patterns containing
    0x01 characters.

yy. Fixed a bug that caused exported functions to contain stray 0x01 characters.

zz. Fixed some inconsistencies with how the history number is handled in the
    various prompt strings.

aaa. Fixed a bug that could cause a core dump if READLINE_LINE was unset
     inside a shell function bound to a key sequence with `bind -x'.

bbb. Fixed a bug that could cause bash to not read a token terminator correctly
     if a command substitution was used inside an arithmetic `for' command.

ccc. Fixed problems that could occur with a fatal arithmetic expansion error
     in a context (like prompt expansion) where you can't jump back to the
     top level.

ddd. Expression errors in arithmetic `for' commands are treated more like
     shell syntax errors.

eee. Fixed a parser synchronization error resulting from a syntax error
     followed immediately by an EOF.

fff. When executing a shell function, the first line in the function ($LINENO)
     is line 1 instead of line 0, as Posix requires.

ggg. In Posix mode, bash will canonicalize the value of PWD it inherits from
     the environment and use that to set its idea of the current directory.

hhh. If LINENO is exported, bash needs to regenerate its value each time it
     constructs the environment.

iii. Fixed a bug with restoring the SIGINT handler when using `wait -n'.

jjj. Make sure the `coproc' command returns an appropriate status if the NAME
     argument is invalid.

kkk. Fixed a problem with arithmetic expressions containing array references
     that contain arithmetic expressions with syntax errors.

lll. The `select' command and help builtin will use $COLUMNS before the window
     size returned from the kernel as the terminal width.

mmm. `read -n 0' and `read -N 0' now try a zero-length read in an attempt to
     detect file descriptor errors.

nnn. The `read' builtin now does a better job of acting on signals that don't
     interrupt read(2).

ooo. Fixed some cases where `printf -v' did not return failure status on a
     variable assignment error.

ppp. Fixed temporary environment propagation back to the current environment
     so that it doesn't happen for special builtins run by the `command'
     builtin.

qqq. Fixed a bug when searching for the end of a here-document delimiter in a
     command substitution.

rrr. Fixed a bug that could cause `cd ${DIRSTACK[0]}' to fail.

sss. Fixed a bug that could cause reserved words to not be recognized in a
     for statement without the `in' inside a command substitution.

ttt. Fixed a bug that could cause a double-free in a timed command with an
     expansion error.

uuu. Fixed a bug that could cause a core dump if a script switches from a UTF-8
     locale to a different locale after displaying a lone surrogate character.

vvv. Fixed cases where bash prematurely removed FIFOs attached to process
     substitutions.

www. Fixed a problem with calculating the size of the table that stores exit
     statuses from background processes when the child process resource limit
     is very large.

xxx. Fixed a memory leak with functions using `return' when using FIFOs for
     standard input.

yyy. `wait' without arguments attempts to wait for all active process
     substitution processes.

zzz. Fixed a bug where an indirect parameter was subjected to word splitting
     when trying to find the indirected variable name.

aaaa. Fixed a bug that could allow restricted shell users to add commands to
      the hash table.

bbbb. When using the `!(patlist)' extended globbing operator, a filename
      beginning with a `.' that doesn't match any of the patterns is not
      returned as a match if leading dots must be matched explicitly.

cccc. Fixed a bug that could cause line number and source file information for
      a function definition to be incorrect if there are multiple definitions.

dddd. Fixed a bug that could cause builtins like `readonly' to behave
      differently when applied to arrays and scalar variables within functions.

eeee. Fixed a bug that could cause alias expansion to add an extra space to
      a quoted string that begins outside the alias expansion.

ffff. Fixed a bug that could result in unwanted alias expansion after timing
      the null command.

gggg. Fixed a bug that could cause a core dump if a timestamp in a history
      file overflowed a time_t.

hhhh. Restricted shells can no longer redirect from /dev/tcp or /dev/udp, since
      the kernel calls make those file descriptors read-write.

iiii. Fixed a problem with splitting double-quoted words for programmable
      completion when the double quote immediately follows another word
      delimiter.

jjjj. Fixed a bug resulting in a use-after-free if two file descriptors share
      the same input buffer.

kkkk. The error message resulting from ${x:?} and ${x?} now differs depending
      on whether the variable is null or unset.

llll. In Posix mode, the shell exits if a variable assignment fails and precedes
      an empty simple command (after expansion).

mmmm. Fixed a timing problem with SIGALRM that could cause the read builtin to
      drop characters.

nnnn. Added code to deal with kill(2) failing to send the shell a fatal signal
      due to Linux pid namespace peculiarities.

oooo. Fixed a bug that made \C-@ (NUL) unusable in key sequences used for
      `bind -x' commands.

pppp. Fixed a bug that could cause SIGINT recursion when running an external
      command in a trap the shell takes after a command exits due to SIGINT.

qqqq. Make sure the shell turns off job control before running the command-
      not-found handle, so the command doesn't try to manipulate process
      groups.

rrrr. Fixed a problem with timing process substitutions that caused the shell
      to print timing information for the calling command.

ssss. Fixed a bug that caused backquotes in a here-document delimiter to mark
      the delimiter as quoted (inhibiting expansion of the here-document
      contents).

tttt. Fixed several problems with 0x01 and 0x177 in case pattern lists and
      conditional command pattern matches.

uuuu. Fixed a bug that could cause the pattern matching engine to not recognize
      locale-specific character classes.

vvvv. The auto-configuration now tests for /dev/stdin and /dev/fd independently.

wwww. The `globstar' code now skips over symbolic links to directories,
      preventing them from being scanned twice.

xxxx. When running `bind -x' commands, bash now sets READLINE_POINT based on
      the number of characters in the readline line buffer, not the number of
      bytes.

yyyy. Fixed a problem that could cause recursive trap evaluation of the RETURN
      trap when using `eval return'.

zzzz. Fixed a bug with expanding 0x01 in an unquoted here-document.

aaaaa. The process substitution code now closes and unlinks FIFOs when the
       process on the other side exits, in order to prevent SIGPIPE or
       waiting until a FIFO opened for read has a writer.

bbbbb. Fixed a bug with recursive calls to the parser overwriting the token in
       an {id}>foo construct.

ccccc. After a Posix discussion, the pattern matching engine just skips over
       invalid character classes in bracket expressions, instead of matching
       them like individual characters in the expression.

ddddd. Fixed a posix-mode problem with variable scoping when creating variables
       from assignment statements preceding special builtins.

eeeee. Fixed a bug that could cause patterns containing backslashes to not be
       run through the pattern matching engine.

fffff. Fixed a bug that could cause redirections to compound commands to not
       be `undone' if the file descriptor in the redirection was closed when
       the redirection was initially processed.

ggggg. Fixed a bug that could cause buffer corruption when using `bind -x' in
       a command execute as a result of a key binding installed by `bind -x'.



### 2. Changes to Readline

a. Added a guard to prevent nested macros from causing an infinite expansion
   loop.

b. Instead of allocating enough history list entries to hold the maximum list
   size, cap the number allocated initially.

c. Added a strategy to avoid allocating huge amounts of memory if a block of
   history entries without timestamps occurs after a block with timestamps.

d. Added support for keyboard timeouts when an ESC character is the last
   character in a macro.

e. There are several performance improvements when in a UTF-8 locale.

f. Readline does a better job of preserving the original set of blocked
   signals when using pselect() to wait for input.

g. Fixed a bug that caused multibyte characters in macros to be mishandled.

h. Fixed several bugs in the code that calculates line breaks when expanding
   prompts that span several lines, contain multibyte characters, and contain
   invisible character seqeuences.

i. Fixed several bugs in cursor positioning when displaying lines with prompts
   containing invisible characters and multibyte characters.

j. When performing case-insensitive completion, Readline no longer sorts the
   list of matches unless directed to do so.

k. Fixed a problem with key sequences ending with a backslash.

l. Fixed out-of-bounds and free memory read errors found via fuzzing.

m. Fixed several cases where the mark was set to an invalid value.

n. Fixed a problem with the case-changing operators in the case where the
   lower and upper case versions of a character do not have the same number
   of bytes.

o. Handle incremental and non-incremental search character reads returning EOF.

p. Handle the case where a failing readline command at the end of a multi-key
   sequence could be misinterpreted.

q. The history library now prints a meaningful error message if the history
   file isn't a regular file.

r. Fixed a problem with vi-mode redo (`.') on a command when trying to replace
   a multibyte character.

s. The key binding code now attempts to remove a keymap if a key unbinding
   leaves it empty.

t. Fixed a line-wrapping issue that caused problems for some terminal
   emulators.

u. If there is a key bound to the tty's VDISCARD special character, readline
   disables VDISCARD while it is active.

v. Fixed a problem with exiting bracketed paste mode on terminals that assume
   the bracketed paste mode character sequence contains visible characters.

w. Fixed a bug that could cause a key binding command to refer to an
   uninitialized variable.



### 3. New Features in Bash

a. The `wait' builtin can now wait for the last process substitution created.

b. There is an EPOCHSECONDS variable, which expands to the time in seconds
   since the Unix epoch.

c. There is an EPOCHREALTIME variable, which expands to the time in seconds
   since the Unix epoch with microsecond granularity.

d. New loadable builtins: rm, stat, fdflags.

e. BASH_ARGV0: a new variable that expands to $0 and sets $0 on assignment.

f. When supplied a numeric argument, the shell-expand-line bindable readline
   command does not perform quote removal and suppresses command and process
   substitution.

g. `history -d' understands negative arguments: negative arguments offset from
   the end of the history list.

h. The `name' argument to the `coproc' reserved word now undergoes word
   expansion, so unique coprocs can be created in loops.

i. A nameref name resolution loop in a function now resolves to a variable by
   that name in the global scope.

j. The `wait' builtin now has a `-f' option, which signfies to wait until the
   specified job or process terminates, instead of waiting until it changes
   state.

k. There is a define in config-top.h that allows the shell to use a static
   value for $PATH, overriding whatever is in the environment at startup, for
   use by the restricted shell.

l. Process substitution does not inherit the `v' option, like command
   substitution.

m. If a non-interactive shell with job control enabled detects that a foreground
   job died due to SIGINT, it acts as if it received the SIGINT.

n. The SIGCHLD trap is run once for each exiting child process even if job
   control is not enabled when the shell is in Posix mode.

o. A new shopt option: localvar_inherit; if set, a local variable inherits the
   value of a variable with the same name at the nearest preceding scope.

p. `bind -r' now checks whether a key sequence is bound before binding it to
   NULL, to avoid creating keymaps for a multi-key sequence.

q. A numeric argument to the line editing `operate-and-get-next' command
   specifies which history entry to use.

r. The positional parameters are now assigned before running the shell startup
   files, so startup files can use $@.

s. There is a compile-time option that forces the shell to disable the check
   for an inherited OLDPWD being a directory.

t. The `history' builtin can now delete ranges of history entries using
   `-d start-end'.

u. The `vi-edit-and-execute-command' bindable readline command now puts readline
   back in vi insertion mode after executing commands from the edited file.

v. The command completion code now matches aliases and shell function names
   case-insensitively if the readline completion-ignore-case variable is set.

w. There is a new `assoc_expand_once' shell option that attempts to expand
   associative array subscripts only once.

x. The shell only sets up BASH_ARGV and BASH_ARGC at startup if extended
   debugging mode is active. The old behavior of unconditionally setting them
   is available as part of the shell compatibility options.

y. The `umask' builtin now allows modes and masks greater than octal 777.

z. The `times' builtin now honors the current locale when printing a decimal
   point.

aa. There is a new (disabled by default, undocumented) shell option to enable
    and disable sending history to syslog at runtime.


### 4.  New Features in Readline

a. Non-incremental vi-mode search (`N', `n') can search for a shell pattern, as
   Posix specifies (uses fnmatch(3) if available).

b. There are new `next-screen-line' and `previous-screen-line' bindable
   commands, which move the cursor to the same column in the next, or previous,
   physical line, respectively.

c. There are default key bindings for control-arrow-key key combinations.

d. A negative argument (-N) to `quoted-insert' means to insert the next N
   characters using quoted-insert.

e. New public function: rl_check_signals(), which allows applications to
   respond to signals that readline catches while waiting for input using
   a custom read function.

f. There is new support for conditionally testing the readline version in an
   inputrc file, with a full set of arithmetic comparison operators available.

g. There is a simple variable comparison facility available for use within an
   inputrc file. Allowable operators are equality and inequality; string
   variables may be compared to a value; boolean variables must be compared to
   either `on' or `off'; variable names are separated from the operator by
   whitespace.
