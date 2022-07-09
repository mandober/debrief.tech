
bash-2.03 - bash-2.02


1.  New Features in Bash

a.  New 'shopt' option, 'restricted_shell', indicating whether or not the
    shell was started in restricted mode, for use in startup files.

b.  Filename generation is now performed on the words between ( and ) in
    array assignments (which it probably should have done all along).

c.  OLDPWD is now auto-exported, as POSIX.2 seems to require.

d.  ENV and BASH_ENV are read-only variables in a restricted shell.

e.  A change was made to the startup file code so that any shell begun with
    the '--login' option, even non-interactive shells, will source the login
    shell startup files.

2.  New Features in Readline

a.  Many changes to the signal handling:
        o Readline now catches SIGQUIT and cleans up the tty before returning;
        o A new variable, rl_catch_signals, is available to application writers 
          to indicate to readline whether or not it should install its own
          signal handlers for SIGINT, SIGTERM, SIGQUIT, SIGALRM, SIGTSTP,
          SIGTTIN, and SIGTTOU;
        o A new variable, rl_catch_sigwinch, is available to application
          writers to indicate to readline whether or not it should install its
          own signal handler for SIGWINCH, which will chain to the calling
          applications's SIGWINCH handler, if one is installed;
        o There is a new function, rl_free_line_state, for application signal
          handlers to call to free up the state associated with the current
          line after receiving a signal;
        o There is a new function, rl_cleanup_after_signal, to clean up the
          display and terminal state after receiving a signal;
        o There is a new function, rl_reset_after_signal, to reinitialize the
          terminal and display state after an application signal handler
          returns and readline continues

b.  There is a new function, rl_resize_terminal, to reset readline's idea of
    the screen size after a SIGWINCH.

c.  New public functions: rl_save_prompt and rl_restore_prompt.  These were
    previously private functions with a '_' prefix.

d.  New function hook: rl_pre_input_hook, called just before readline starts
    reading input, after initialization.

e.  New function hook: rl_display_matches_hook, called when readline would
    display the list of completion matches.  The new function
    rl_display_match_list is what readline uses internally, and is available
    for use by application functions called via this hook.

f.  New bindable function, delete-char-or-list, like tcsh.

g.  A new variable, rl_erase_empty_line, which, if set by an application using
    readline, will cause readline to erase, prompt and all, lines on which the
    only thing typed was a newline.

h.  New bindable variable: 'isearch-terminators'.

i.  New bindable function: 'forward-backward-delete-char' (unbound by default).
