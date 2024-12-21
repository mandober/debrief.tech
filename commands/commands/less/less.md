# less

https://www.greenwoodsoftware.com/less/
https://github.com/gwsw/less

The current released version is less-661 released 30 Jun 2024.

## COMPATIBILITY WITH MORE

If the environment variable LESS_IS_MORE is set to 1, or if the program is invoked via a file link named "more", less behaves (mostly) in conformance with the POSIX "more" command specification. In this mode, less behaves differently in these ways:

The -e option works differently. If the -e option is not set, less behaves as if the -e option were set. If the -e option is set, less behaves as if the -E option were
set.

The -m option works differently. If the -m option is not set, the medium prompt is used, and it is prefixed with the string "--More--". If the -m option is set, the short prompt is used.

The -n option acts like the -z option. The normal behavior of the -n option is unavailable in this mode.

The parameter to the -p option is taken to be a less command rather than a search pattern.

The LESS environment variable is ignored, and the MORE environment variable is used in its place.

## ENVIRONMENT VARIABLES

Environment variables may be specified either in the system environment as usual, or in a *lesskey(1) file*. If environment variables are defined in more than one place, variables defined in a local lesskey file take precedence over variables defined in the system environment, which take precedence over variables defined in the system-wide lesskey file.


### LESS specific env vars

LESS
Put options in this envar. The environment variable is parsed before the command line, so command line options override the LESS environment variable. If an option appears in the LESS variable, it can be reset to its default value on the command line by beginning the command line option with `-+`. Some options like `-k` or `-D` require a string to follow the option letter. The string for that option is considered to end when a dollar sign is found. For example, you can set two `-D` options like this: `LESS="Dn9.1$Ds4.1"`.

LESSANSIENDCHARS
Characters which may end an ANSI color escape sequence (default "m").

LESSANSIMIDCHARS
Characters which may appear between the ESC character and the end character in an ANSI color escape sequence (default `0123456789:;[?!"'#%()*+ `).

LESSBINFMT
Format for displaying non-printable, non-control characters.

LESSCHARDEF
Defines a character set.

LESSCHARSET
Selects a predefined character set.

LESSCLOSE
Command line to invoke the (optional) input-postprocessor.

LESSECHO
Name of the lessecho program (default "lessecho"). The *lessecho* program is needed to expand metacharacters, such as `*` and `?`, in filenames on Unix systems.

LESSEDIT
Editor prototype string (used for the v command). See discussion under PROMPTS.

LESSGLOBALTAGS
Name of the command used by the `-t` option to find global tags. Normally should be set to "global" if your system has the global(1) command. If not set, global tags are not used.

LESSHISTFILE
Name of the history file used to remember search commands and shell commands between invocations of less. If set to "-" or "/dev/null", a history file is not used. The default is "$XDG_DATA_HOME/lesshst" or "$HOME/.lesshst" on Unix systems, "$HOME/_lesshst" on DOS and Windows systems, or "$HOME/lesshst.ini" or "$INIT/lesshst.ini" on OS/2 systems.

LESSHISTSIZE
The maximum number of commands to save in the history file. The default is 100.

LESSKEYIN
Name of the default lesskey source file.

LESSKEY
Name of the default lesskey binary file. (Not used if "$LESSKEYIN" exists.)

LESSKEYIN_SYSTEM
Name of the default system-wide lesskey source file.

LESSKEY_SYSTEM
Name of the default system-wide lesskey binary file. (Not used if "$LESSKEYIN_SYSTEM" exists.)

LESSMETACHARS
List of characters which are considered "metacharacters" by the shell.

LESSMETAESCAPE
Prefix which less will add before each metacharacter in a command sent to the shell. If LESSMETAESCAPE is an empty string, commands containing metacharacters
will not be passed to the shell.

LESSOPEN
Command line to invoke the (optional) input-preprocessor.

LESSSECURE
Runs less in "secure" mode. See discussion under SECURITY.

LESSSEPARATOR
String to be appended to a directory name in filename completion.

LESSUTFBINFMT
Format for displaying non-printable Unicode code points.

LESS_IS_MORE
Emulate the `more(1)` command.

MORE
Options which are passed to less automatically when running in more compatible mode.


### Other env vars

COLUMNS LINES EDITOR VISUAL LANG LC_CTYPE PATH HOME SHELL TERM


COLUMNS
Sets the number of columns on the screen. Takes precedence over the number of columns specified by the TERM variable. (But if you have a windowing system which supports TIOCGWINSZ or WIOCGETD, the window system's idea of the screen size takes precedence over the LINES and COLUMNS environment variables).

LINES
Sets the number of lines on the screen. Takes precedence over the number of lines specified by the TERM variable. (But if you have a windowing system which supports TIOCGWINSZ or WIOCGETD, the window system's idea of the screen size takes precedence over the LINES and COLUMNS).

EDITOR
The name of the editor (used for the `v` command).

VISUAL
The name of the editor (used for the v command).

LANG
Language for determining the character set.

LC_CTYPE
Language for determining the character set.

PATH
Search path (to find a lesskey file on MS-DOS and OS/2).

HOME
User home directory is searched for lesskey file (on OS/2 searches INIT dir).

SHELL
The shell used to execute the `!` command, as well as to expand filenames.

TERM
The type of terminal on which less is being run.
