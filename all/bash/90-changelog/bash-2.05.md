## bash-2.05
since
the release of bash-2.04.  As always, the manual page (doc/bash.1) is
the place to look for complete descriptions.

1.  New Features in Bash

a.  Added a new '--init-file' invocation argument as a synonym for '--rcfile',
    per the new GNU coding standards.

b.  The /dev/tcp and /dev/udp redirections now accept service names as well as
    port numbers.

c.  'complete' and 'compgen' now take a '-o value' option, which controls some
    of the aspects of that compspec.  Valid values are:

        default - perform bash default completion if programmable
                  completion produces no matches
        dirnames - perform directory name completion if programmable
                   completion produces no matches
        filenames - tell readline that the compspec produces filenames,
                    so it can do things like append slashes to
                    directory names and suppress trailing spaces

d.  A new loadable builtin, realpath, which canonicalizes and expands symlinks
    in pathname arguments.
    
e.  When 'set' is called without options, it prints function defintions in a
    way that allows them to be reused as input.  This affects 'declare' and 
    'declare -p' as well.  This only happens when the shell is not in POSIX
    mode, since POSIX.2 forbids this behavior.

f.  Bash-2.05 once again honors the current locale setting when processing
    ranges within pattern matching bracket expressions (e.g., [A-Z]).

2.  New Features in Readline

a.  The blink timeout for paren matching is now settable by applications,
    via the rl_set_paren_blink_timeout() function.

b.  _rl_executing_macro has been renamed to rl_executing_macro, which means
    it's now part of the public interface.

c.  Readline has a new variable, rl_readline_state, which is a bitmap that
    encapsulates the current state of the library; intended for use by
    callbacks and hook functions.

d.  New application-callable function rl_set_prompt(const char *prompt):
    expands its prompt string argument and sets rl_prompt to the result.

e.  New application-callable function rl_set_screen_size(int rows, int cols):
    public method for applications to set readline's idea of the screen
    dimensions.

f.  New function, rl_get_screen_size (int *rows, int *columns), returns
    readline's idea of the screen dimensions.

g.  The timeout in rl_gather_tyi (readline keyboard input polling function)
    is now settable via a function (rl_set_keyboard_input_timeout()).

h.  Renamed the max_input_history variable to history_max_entries; the old
    variable is maintained for backwards compatibility.

i.  The list of characters that separate words for the history tokenizer is
    now settable with a variable:  history_word_delimiters.  The default
    value is as before.
