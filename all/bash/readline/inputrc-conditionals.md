# Conditional Constructs | Readline



## Conditional Constructs: Examples


```shell
$if mode=emacs
set editing-mode vi
$endif

$if term=xterm
# do xterm specific shit
$endif

$if version > 7.1
# do some recent readline shit
$endif

$if bash
# adds a keyseq that quotes the current or previous word but ONLY in bash
# Quote the current or previous word
"\C-xq": "\eb\"\ef\""
$endif

$if variable rl-var = off
$if variable rl-var != on

```


## Conditional Constructs: Desc

Readline implements conditionals which allows key bindings and variable settings to be performed as the result of tests.

Directives:
* $include FILENAME
* $if TEST [ $else ] $endif


## $include

**$include**
- this directive takes a single filename as an argument
- and reads commands and bindings from that file
- e.g. `$include /etc/inputrc`

## $if

**$if**
The `$if` construct allows bindings to be made based on the
- editing mode              [vi|emacs]
- terminal name             [xterm|cmd.exe]
- client application name   [bash|cmd.exe|pwsh.exe|clink.exe]
The text of the test, after any comparison operator, extends to the end of the line; unless otherwise noted, no characters are required to isolate it.
- **$endif** terminates an `$if` command
- **$else**  this branch is executed `$if` the test fails


## mode

`mode=`
* mode= tests whether readline is in `emacs` or `vi` mode
* may be used in conjunction with the `set keymap` command, for instance, to set bindings in the `emacs-standard` and `emacs-ctlx` keymaps only if readline is starting out in emacs mode.


## term

`term=`
* test the name of the terminal used
* e.g. to include terminal-specific key bindings
* the string arg on the RHS of `=` is tested against:
  - the full name of the terminal and
  - the portion of the terminal name before the first `-`.
This allows `xterm` to match `xterm`, `xterm-256color`, `xterm-color`, or generally, anything after the dash, `xterm-*`

## version

form := `version` oper vers
oper := `=` | `!=` | `<=` | `>=` | `<` | `>`
vers := major[ `.` ][minor]
      | 8.0 | 8.1
      | 7.0
      | 6.0 | 6.1 | 6.2 | 6.3
      | 5.0 | 5.1 | 5.2
      | 4.0 | 4.1 | 4.2 | 4.2a | 4.3
      | 2.1 | 2.2


* test performs comparisons against specific readline versions
* The version expands to the current readline version
* comparison ops: `=` (or `==`), `!=`, `<=`, `>=`, `<`, `>`
* version arg on the RHS of op consists of
  - a major version number
  - an optional decimal point
  - and an optional minor version, like "7.1" (if omitted, 0 assumed)
* op may be surrounded by whitespace on both sides, `$if version < 8`

## application

* The `application` construct is used to include application-specific settings
* Each program using the readline library sets the application name
* an init file can test for a particular value
* can be used to bind keyseqs to functions useful for a specific app


## variable

* `variable` provides equality tests for *readline variables and values*
* permitted comparison ops: `=` (or `==`), `!=`
* variable name *must be* separated from the comparison op by whitespace
* the operator *may be* separated from the value on the RHS by whitespace
* both string and boolean variables may be tested
* Boolean variables *must be* tested against the values `on` and `off`

form := `variable` var op val
var  := *readline-variable-name*
op   := `=` | `!=`
val  := string | bool
bool := `on` | `off`
