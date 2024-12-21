# history

history [n]
history [-c] [-d offset] [n]
history -anrw [filename]
history -ps arg...


Display or manipulate the history list.

Display the history list with line numbers, prefixing each modified entry with a `*`. An argument of N lists only the last N entries.

Options:
  -c    clear the history list by deleting all of the entries
  -d M  delete the history entry at position M.

  -a    append history lines from this session to the history file
  -n    read all history lines not already read from the history file
        and append them to the history list
  -r    read the history file and append the contents to the history list
  -w    write the current history to the history file

  -p    perform history expansion on each ARG and display the result
        without storing it in the history list
  -s    append the ARGs to the history list as a single entry


If FILENAME is given, it is used as the history file. Otherwise, if *HISTFILE* has a value, that is used, else `~/.bash_history`.

If the *HISTTIMEFORMAT* variable is set and not null, its value is used
as a format string for `strftime(3)` to print the time stamp associated
with each displayed history entry. No time stamps are printed otherwise.

Exit Status: Returns 0 unless an invalid option is given or an error occurs.
