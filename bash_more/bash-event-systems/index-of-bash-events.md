# Index :: Bash events

Hooking into bash events.

There are only a couple of hooks that bash provides
- `PROMPT_COMMAND` env var
- `command_not_found_handler`


The `PROMPT_COMMAND` env var is evaluated each time bash is about the print the prompt. It can hold a command as a string, or several commands as an indexed array in which case all elements are evaluated.

The shell function `command_not_found_handler` is executed at the end of the name resolution. When bash didn't manage to find a command corresponding to the first word on the command-line, it looks for this function, passing it the entire contents of the command-line. Unfortunatelly, the function `command_not_found_handler` is executed in a subshell.
