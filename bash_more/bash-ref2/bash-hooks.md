# Bash hooks

- events
- event listener
- event handler
- firing an event
- raising an event
- hook, hooking


## Poetic intro and relevant terminology

Bash is a command shell that interprets user's commands, most of the time acting as a gloryfied repl. Albeit seemingly removed from the paradigm of event-based programming, bash still manages to pull a few related tricks even at its ripe old age (for your shell here's a pretty flower). Moreover, from the moment terminals introduced mouse support, the necessary machanics for event-based programming has gotten a solid foundation.

In the event-based programming, users can associate functions as handlers of various events - most are predefined, but custom events may be defined as well. Users may also have the option to attach an *event listener* - a piece of code that tracks a particular event and invokes the associated *event handler* (usually a function) every time that event fires. When an event occurs "naturally", it is said that it fired, while when artificially triggered, it is said that it has been raised, or even re-raised.



Such freedom is not available in the shell, and bash, in particular, offers only a limited form of hooking.

By default, bash has a handful of events when it tries to invoke the handlers that must have a particular, fixed, name as prescribed by bash.

Probably the most well-known of such events is the *command-not-found*, raised when bash cannot find a command, which results in the exit code 127. Just before returning to report it, bash will try to invoke the `command_not_found` function to handle this matter.

Technical details: on getting the 127 exit code, bash calls the function named `command_not_found`, whether it is available in the current environment or not. If it is not available, bash proceeds to report the error to the user (the exit status is 127 and bash uses stderr to display an error message). If it does exists, bash passes it the contents of the command line.



This name is fixed, and bash always calls it in this situation, whether the function exists or not. 
This function can do whatever it wants, not necessarily relevant to missing commands; it may be used to implement a spell checker, myes. The utility "fuck" (probably) hooks into this event to do its business.

The exceprt from the `/etc/bash.bashrc` file

```bash
# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then

  function command_not_found_handle {
    # check because c-n-f could've been removed in the meantime
    if [ -x /usr/lib/command-not-found ]; then
      /usr/lib/command-not-found -- "$1"
      return $?
    elif [ -x /usr/share/command-not-found/command-not-found ]; then
      /usr/share/command-not-found/command-not-found -- "$1"
      return $?
    else
      printf "%s: command not found\n" "$1" >&2
      return 127
    fi
  }
fi
```



## The CNF package

The popular *command-not-found* (cnf) package installs its own `command_not_found` event handler, which looks up whether programs with similar names exist in the online software repositories (offering their installation).






Bash hooks are bash functions set up to fire on particular events and signals, but they may be also associated with a some pseudo-events. On some events, the shell invokes a particular name, expected to be a currently defined function.

For example, if you mistakenly type "pwf" (instead of "pwd") at the command line, the shell won't find such command (mutatis mutandis), also signified by the exit code 127. However, instead of just reporting the error to the user, the shell invokes the function defined as the handler of "the event 127"

before that (doomed) call returns with the status 127



A hook is a single function

 comes in two shapes
- as a standalone function
- as a list of function names

Trigger sources
- `trap` builtin
  - signals
    - SIGTERM
    - SIGTTYOU
    - SIGTTYIN
    - SIGUSER1
    - etc.
  - pesudo signals (scripting)
    - RETURN
    - EXIT
    - ERROR
    - DEBUG
- prompt
  - `PS0`, `PS1`, etc.
  - before printing the prompt
  - after printing the prompt
  - `PROMPT_COMMAND`
  - precmd
  - preexec https://github.com/rcaloras/bash-preexec
- completion
  - hooking into completion mechanism
  - keybindings as triggers
- command-not-found mechanism
  - raised on the exit code 127
  - the c-n-f hook
  - opportunity to command spelling mistakes
- `MAIL` and `MAIL_DIR`
  - FS watcher
  - watching a particular file for changes with `MAIL`
  - watching a particular dir for changes with `MAIL_DIR`



## Scripting hooks

The `preexec` hook (function) is executed before each interactive command is executed, with the interactive command as its argument.

The `precmd` hook (function) is executed before each prompt is displayed. Equivalent to `PROMPT_COMMAND`, but more flexible and resilient.

https://github.com/rcaloras/bash-preexec

The `trap` bash builtin is the main mechanism to set up hooks that fire on certain system signals, but also and a few pseudo-signals related to scripting (exit, return, debug, error) psedo events.
