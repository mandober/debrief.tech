# History Conditional Constructs

There are 4 parser directives used for conditional constructs:
- `$if`
- `$else`
- `$endif`
- `$include`


## $if

The `$if` construct allows conditional blocks based on:
- the current editing mode
- the terminal being used
- the Readline version
- the application using Readline

Two kinds of Constructs:
- `$if...$endif`
- `$if...$else...$endif`

The text making the test, after a comparison operator, extends to the EOL.

$if supports comparisions based in 3 keywords and 2 names:
- `mode`        Readline editing mode
- `term`        Current terminal 
- `version`     Readline version
- Client app
- Readline variable


> mode

The `mode=` form of the `$if` directive is used to test whether Readline is in *emacs* or *vi* mode. This may be used in conjunction with the `set keymap` command, for instance, to set bindings in the "emacs-standard" and "emacs-ctlx" keymaps only if Readline is starting out in emacs mode.


> term

The `term=` form may be used to include terminal-specific key bindings, perhaps to bind the key sequences output by the terminal's function keys. The RHS word is tested against the full name of the terminal and the portion of the terminal name before the first dash; this allows "sun" to match both "sun" and "sun-cmd", for instance.


> version **NEW**

The version test is used to perform comparisons against Readline versions. 
The version expands to the current Readline version. 
The set of comparison operators includes:
- `==` (or `=`), `!=`
- `< > <= >=`

The version number supplied on the RHS of the operator consists of:
- a major version number
- an optional decimal point
- an optional minor version
- for example: "7.1"
- If the minor version is omitted, it is assumed to be 0
- the operator may be separated from the string version and from the version number argument by whitespace.



> application

- The application construct is used to include app-specific settings
- Each program using Readline sets its name, which may be used in tests
- e.g. to bind keyseq to functions that are only useful for that app


> variable **NEW**

- var construct provides equality tests for Readline vars and values
- permitted comparison operators are: `=, ==, !=`
- var name must be separated from the comparison operator by whitespace
- the operator may be separated from the RHS value by whitespace
- both string and boolean variables may be tested
- Boolean variables must be tested against the values `on` or `off`


## $else
Commands in this branch of the `$if` directive are executed if the test fails.

## $endif
This command terminates an `$if` command.

## $include
This directive takes a single filename as an argument and reads commands and bindings from that file. For example: `$include /etc/inputrc`



## Examples

```bash
# $include FILE
$include /etc/inputrc


# MODE
$if mode=vi
  "\e[24~": emacs-editing-mode
$endif
# switch to the other mode using the same key, F12
$if mode=emacs
  "\e[24~": vi-editing-mode
$endif

# $TERM
$if term=xterm
    "\e[17~": "git add "
$endif

# VERSION
# sets a variable if Readline version is 7.0+
$if version >= 7.0
  set show-mode-in-prompt on
$endif


# VARIABLE
# this is the same as mode=emacs test above
$if editing-mode == emacs
  set show-mode-in-prompt on
$endif


# CLIENT APP
# this adds keyseq exclusively if Bash is the client app
$if Bash
  # quote the current or previous word
  "\C-xq": "\eb\"\ef\""
$endif
```
