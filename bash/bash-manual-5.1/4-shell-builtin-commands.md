# 4. Shell Builtin Commands

Builtin commands are contained within the shell itself. When the name
of a builtin command is used as the first word of a simple command
(Simple Commands), the shell executes the command directly,
without invoking another program. Builtin commands are necessary to
implement functionality impossible or inconvenient to obtain with
separate utilities.

This section briefly describes the builtins which Bash inherits from
the Bourne Shell, as well as the builtin commands which are unique to or
have been extended in Bash.

Several builtin commands are described in other chapters: builtin
commands which provide the Bash interface to the job control facilities
(Job Control Builtins), the directory stack (Directory
Stack Builtins), the command history (Bash History Builtins),
and the programmable completion facilities (Programmable
Completion Builtins).

Many of the builtins have been extended by POSIX or Bash.

Unless otherwise noted, each builtin command documented as accepting
options preceded by '-' accepts '--' to signify the end of the options.
The ':', 'true', 'false', and 'test'/'[' builtins do not accept options
and do not treat '--' specially. The 'exit', 'logout', 'return',
'break', 'continue', 'let', and 'shift' builtins accept and process
arguments beginning with '-' without requiring '--'. Other builtins
that accept arguments but are not specified as accepting options
interpret arguments beginning with '-' as invalid options and require
'--' to prevent this interpretation.

## 4.1 Bourne Shell Builtins

The following shell builtin commands are inherited from the Bourne
Shell. These commands are implemented as specified by the POSIX
standard.

': (a colon)'
: [ARGUMENTS]

Do nothing beyond expanding ARGUMENTS and performing redirections.
The return status is zero.

'. (a period)'
. FILENAME [ARGUMENTS]

Read and execute commands from the FILENAME argument in the current
shell context. If FILENAME does not contain a slash, the 'PATH'
variable is used to find FILENAME. When Bash is not in POSIX mode,
the current directory is searched if FILENAME is not found in
'$PATH'. If any ARGUMENTS are supplied, they become the positional
parameters when FILENAME is executed. Otherwise the positional
parameters are unchanged. If the '-T' option is enabled, 'source'
inherits any trap on 'DEBUG'; if it is not, any 'DEBUG' trap string
is saved and restored around the call to 'source', and 'source'
unsets the 'DEBUG' trap while it executes. If '-T' is not set, and
the sourced file changes the 'DEBUG' trap, the new value is
retained when 'source' completes. The return status is the exit
status of the last command executed, or zero if no commands are
executed. If FILENAME is not found, or cannot be read, the return
status is non-zero. This builtin is equivalent to 'source'.

'break'
break [N]

Exit from a 'for', 'while', 'until', or 'select' loop. If N is
supplied, the Nth enclosing loop is exited. N must be greater than
or equal to 1. The return status is zero unless N is not greater
than or equal to 1.

'cd'
cd [-L|[-P [-e]] [-@] [DIRECTORY]

Change the current working directory to DIRECTORY. If DIRECTORY is
not supplied, the value of the 'HOME' shell variable is used. Any
additional arguments following DIRECTORY are ignored. If the shell
variable 'CDPATH' exists, it is used as a search path: each
directory name in 'CDPATH' is searched for DIRECTORY, with
alternative directory names in 'CDPATH' separated by a colon (':').
If DIRECTORY begins with a slash, 'CDPATH' is not used.

The '-P' option means to not follow symbolic links: symbolic links
are resolved while 'cd' is traversing DIRECTORY and before
processing an instance of '..' in DIRECTORY.

By default, or when the '-L' option is supplied, symbolic links in
DIRECTORY are resolved after 'cd' processes an instance of '..' in
DIRECTORY.

If '..' appears in DIRECTORY, it is processed by removing the
immediately preceding pathname component, back to a slash or the
beginning of DIRECTORY.

If the '-e' option is supplied with '-P' and the current working
directory cannot be successfully determined after a successful
directory change, 'cd' will return an unsuccessful status.

On systems that support it, the '-@' option presents the extended
attributes associated with a file as a directory.

If DIRECTORY is '-', it is converted to '$OLDPWD' before the
directory change is attempted.

If a non-empty directory name from 'CDPATH' is used, or if '-' is
the first argument, and the directory change is successful, the
absolute pathname of the new working directory is written to the
standard output.

The return status is zero if the directory is successfully changed,
non-zero otherwise.

'continue'
continue [N]

Resume the next iteration of an enclosing 'for', 'while', 'until',
or 'select' loop. If N is supplied, the execution of the Nth
enclosing loop is resumed. N must be greater than or equal to 1.
The return status is zero unless N is not greater than or equal to
1.

'eval'
eval [ARGUMENTS]

The arguments are concatenated together into a single command,
which is then read and executed, and its exit status returned as
the exit status of 'eval'. If there are no arguments or only empty
arguments, the return status is zero.

'exec'
exec [-cl] [-a NAME] [COMMAND [ARGUMENTS]]

If COMMAND is supplied, it replaces the shell without creating a
new process. If the '-l' option is supplied, the shell places a
dash at the beginning of the zeroth argument passed to COMMAND.
This is what the 'login' program does. The '-c' option causes
COMMAND to be executed with an empty environment. If '-a' is
supplied, the shell passes NAME as the zeroth argument to COMMAND.
If COMMAND cannot be executed for some reason, a non-interactive
shell exits, unless the 'execfail' shell option is enabled. In
that case, it returns failure. An interactive shell returns
failure if the file cannot be executed. A subshell exits
unconditionally if 'exec' fails. If no COMMAND is specified,
redirections may be used to affect the current shell environment.
If there are no redirection errors, the return status is zero;
otherwise the return status is non-zero.

'exit'
exit [N]

Exit the shell, returning a status of N to the shell's parent. If
N is omitted, the exit status is that of the last command executed.
Any trap on 'EXIT' is executed before the shell terminates.

'export'
export [-fn] [-p] [NAME[=VALUE]]

Mark each NAME to be passed to child processes in the environment.
If the '-f' option is supplied, the NAMEs refer to shell functions;
otherwise the names refer to shell variables. The '-n' option
means to no longer mark each NAME for export. If no NAMES are
supplied, or if the '-p' option is given, a list of names of all
exported variables is displayed. The '-p' option displays output
in a form that may be reused as input. If a variable name is
followed by =VALUE, the value of the variable is set to VALUE.

The return status is zero unless an invalid option is supplied, one
of the names is not a valid shell variable name, or '-f' is
supplied with a name that is not a shell function.

'getopts'
getopts OPTSTRING NAME [ARG ...]

'getopts' is used by shell scripts to parse positional parameters.
OPTSTRING contains the option characters to be recognized; if a
character is followed by a colon, the option is expected to have an
argument, which should be separated from it by whitespace. The
colon (':') and question mark ('?') may not be used as option
characters. Each time it is invoked, 'getopts' places the next
option in the shell variable NAME, initializing NAME if it does not
exist, and the index of the next argument to be processed into the
variable 'OPTIND'. 'OPTIND' is initialized to 1 each time the
shell or a shell script is invoked. When an option requires an
argument, 'getopts' places that argument into the variable
'OPTARG'. The shell does not reset 'OPTIND' automatically; it must
be manually reset between multiple calls to 'getopts' within the
same shell invocation if a new set of parameters is to be used.

When the end of options is encountered, 'getopts' exits with a
return value greater than zero. 'OPTIND' is set to the index of
the first non-option argument, and NAME is set to '?'.

'getopts' normally parses the positional parameters, but if more
arguments are supplied as ARG values, 'getopts' parses those
instead.

'getopts' can report errors in two ways. If the first character of
OPTSTRING is a colon, SILENT error reporting is used. In normal
operation, diagnostic messages are printed when invalid options or
missing option arguments are encountered. If the variable 'OPTERR'
is set to 0, no error messages will be displayed, even if the first
character of 'optstring' is not a colon.

If an invalid option is seen, 'getopts' places '?' into NAME and,
if not silent, prints an error message and unsets 'OPTARG'. If
'getopts' is silent, the option character found is placed in
'OPTARG' and no diagnostic message is printed.

If a required argument is not found, and 'getopts' is not silent, a
question mark ('?') is placed in NAME, 'OPTARG' is unset, and a
diagnostic message is printed. If 'getopts' is silent, then a
colon (':') is placed in NAME and 'OPTARG' is set to the option
character found.

'hash'
hash [-r] [-p FILENAME] [-dt] [NAME]

Each time 'hash' is invoked, it remembers the full pathnames of the
commands specified as NAME arguments, so they need not be searched
for on subsequent invocations. The commands are found by searching
through the directories listed in '$PATH'. Any
previously-remembered pathname is discarded. The '-p' option
inhibits the path search, and FILENAME is used as the location of
NAME. The '-r' option causes the shell to forget all remembered
locations. The '-d' option causes the shell to forget the
remembered location of each NAME. If the '-t' option is supplied,
the full pathname to which each NAME corresponds is printed. If
multiple NAME arguments are supplied with '-t', the NAME is printed
before the hashed full pathname. The '-l' option causes output to
be displayed in a format that may be reused as input. If no
arguments are given, or if only '-l' is supplied, information about
remembered commands is printed. The return status is zero unless a
NAME is not found or an invalid option is supplied.

'pwd'
pwd [-LP]

Print the absolute pathname of the current working directory. If
the '-P' option is supplied, the pathname printed will not contain
symbolic links. If the '-L' option is supplied, the pathname
printed may contain symbolic links. The return status is zero
unless an error is encountered while determining the name of the
current directory or an invalid option is supplied.

'readonly'
readonly [-aAf] [-p] [NAME[=VALUE]] ...

Mark each NAME as readonly. The values of these names may not be
changed by subsequent assignment. If the '-f' option is supplied,
each NAME refers to a shell function. The '-a' option means each
NAME refers to an indexed array variable; the '-A' option means
each NAME refers to an associative array variable. If both options
are supplied, '-A' takes precedence. If no NAME arguments are
given, or if the '-p' option is supplied, a list of all readonly
names is printed. The other options may be used to restrict the
output to a subset of the set of readonly names. The '-p' option
causes output to be displayed in a format that may be reused as
input. If a variable name is followed by =VALUE, the value of the
variable is set to VALUE. The return status is zero unless an
invalid option is supplied, one of the NAME arguments is not a
valid shell variable or function name, or the '-f' option is
supplied with a name that is not a shell function.

'return'
return [N]

Cause a shell function to stop executing and return the value N to
its caller. If N is not supplied, the return value is the exit
status of the last command executed in the function. If 'return'
is executed by a trap handler, the last command used to determine
the status is the last command executed before the trap handler.
If 'return' is executed during a 'DEBUG' trap, the last command
used to determine the status is the last command executed by the
trap handler before 'return' was invoked. 'return' may also be
used to terminate execution of a script being executed with the '.'
('source') builtin, returning either N or the exit status of the
last command executed within the script as the exit status of the
script. If N is supplied, the return value is its least
significant 8 bits. Any command associated with the 'RETURN' trap
is executed before execution resumes after the function or script.
The return status is non-zero if 'return' is supplied a non-numeric
argument or is used outside a function and not during the execution
of a script by '.' or 'source'.

'shift'
shift [N]

Shift the positional parameters to the left by N. The positional
parameters from N+1 ... '$#' are renamed to '$1' ... '$#'-N.
Parameters represented by the numbers '$#' down to '$#'-N+1 are
unset. N must be a non-negative number less than or equal to '$#'.
If N is zero or greater than '$#', the positional parameters are
not changed. If N is not supplied, it is assumed to be 1. The
return status is zero unless N is greater than '$#' or less than
zero, non-zero otherwise.

'test'
'['
test EXPR

Evaluate a conditional expression EXPR and return a status of 0
(true) or 1 (false). Each operator and operand must be a separate
argument. Expressions are composed of the primaries described
below in Bash Conditional Expressions::. 'test' does not
accept any options, nor does it accept and ignore an argument of
'--' as signifying the end of options.

When the '[' form is used, the last argument to the command must be
a ']'.

Expressions may be combined using the following operators, listed
in decreasing order of precedence. The evaluation depends on the
number of arguments; see below. Operator precedence is used when
there are five or more arguments.

'! EXPR'
True if EXPR is false.

'( EXPR )'
Returns the value of EXPR. This may be used to override the
normal precedence of operators.

'EXPR1 -a EXPR2'
True if both EXPR1 and EXPR2 are true.

'EXPR1 -o EXPR2'
True if either EXPR1 or EXPR2 is true.

The 'test' and '[' builtins evaluate conditional expressions using
a set of rules based on the number of arguments.

0 arguments
The expression is false.

1 argument
The expression is true if, and only if, the argument is not
null.

2 arguments
If the first argument is '!', the expression is true if and
only if the second argument is null. If the first argument is
one of the unary conditional operators (Bash Conditional
Expressions), the expression is true if the unary test is
true. If the first argument is not a valid unary operator,
the expression is false.

3 arguments
The following conditions are applied in the order listed.

1. If the second argument is one of the binary conditional
operators (Bash Conditional Expressions), the
result of the expression is the result of the binary test
using the first and third arguments as operands. The
'-a' and '-o' operators are considered binary operators
when there are three arguments.
2. If the first argument is '!', the value is the negation
of the two-argument test using the second and third
arguments.
3. If the first argument is exactly '(' and the third
argument is exactly ')', the result is the one-argument
test of the second argument.
4. Otherwise, the expression is false.

4 arguments
If the first argument is '!', the result is the negation of
the three-argument expression composed of the remaining
arguments. Otherwise, the expression is parsed and evaluated
according to precedence using the rules listed above.

5 or more arguments
The expression is parsed and evaluated according to precedence
using the rules listed above.

When used with 'test' or '[', the '<' and '>' operators sort
lexicographically using ASCII ordering.

'times'
times

Print out the user and system times used by the shell and its
children. The return status is zero.

'trap'
trap [-lp] [ARG] [SIGSPEC ...]

The commands in ARG are to be read and executed when the shell
receives signal SIGSPEC. If ARG is absent (and there is a single
SIGSPEC) or equal to '-', each specified signal's disposition is
reset to the value it had when the shell was started. If ARG is
the null string, then the signal specified by each SIGSPEC is
ignored by the shell and commands it invokes. If ARG is not
present and '-p' has been supplied, the shell displays the trap
commands associated with each SIGSPEC. If no arguments are
supplied, or only '-p' is given, 'trap' prints the list of commands
associated with each signal number in a form that may be reused as
shell input. The '-l' option causes the shell to print a list of
signal names and their corresponding numbers. Each SIGSPEC is
either a signal name or a signal number. Signal names are case
insensitive and the 'SIG' prefix is optional.

If a SIGSPEC is '0' or 'EXIT', ARG is executed when the shell
exits. If a SIGSPEC is 'DEBUG', the command ARG is executed before
every simple command, 'for' command, 'case' command, 'select'
command, every arithmetic 'for' command, and before the first
command executes in a shell function. Refer to the description of
the 'extdebug' option to the 'shopt' builtin (The Shopt
Builtin) for details of its effect on the 'DEBUG' trap. If a
SIGSPEC is 'RETURN', the command ARG is executed each time a shell
function or a script executed with the '.' or 'source' builtins
finishes executing.

If a SIGSPEC is 'ERR', the command ARG is executed whenever a
pipeline (which may consist of a single simple command), a list, or
a compound command returns a non-zero exit status, subject to the
following conditions. The 'ERR' trap is not executed if the failed
command is part of the command list immediately following an
'until' or 'while' keyword, part of the test following the 'if' or
'elif' reserved words, part of a command executed in a '&&' or '||'
list except the command following the final '&&' or '||', any
command in a pipeline but the last, or if the command's return
status is being inverted using '!'. These are the same conditions
obeyed by the 'errexit' ('-e') option.

Signals ignored upon entry to the shell cannot be trapped or reset.
Trapped signals that are not being ignored are reset to their
original values in a subshell or subshell environment when one is
created.

The return status is zero unless a SIGSPEC does not specify a valid
signal.

'umask'
umask [-p] [-S] [MODE]

Set the shell process's file creation mask to MODE. If MODE begins
with a digit, it is interpreted as an octal number; if not, it is
interpreted as a symbolic mode mask similar to that accepted by the
'chmod' command. If MODE is omitted, the current value of the mask
is printed. If the '-S' option is supplied without a MODE
argument, the mask is printed in a symbolic format. If the '-p'
option is supplied, and MODE is omitted, the output is in a form
that may be reused as input. The return status is zero if the mode
is successfully changed or if no MODE argument is supplied, and
non-zero otherwise.

Note that when the mode is interpreted as an octal number, each
number of the umask is subtracted from '7'. Thus, a umask of '022'
results in permissions of '755'.

'unset'
unset [-fnv] [NAME]

Remove each variable or function NAME. If the '-v' option is
given, each NAME refers to a shell variable and that variable is
removed. If the '-f' option is given, the NAMEs refer to shell
functions, and the function definition is removed. If the '-n'
option is supplied, and NAME is a variable with the NAMEREF
attribute, NAME will be unset rather than the variable it
references. '-n' has no effect if the '-f' option is supplied. If
no options are supplied, each NAME refers to a variable; if there
is no variable by that name, a function with that name, if any, is
unset. Readonly variables and functions may not be unset. Some
shell variables lose their special behavior if they are unset; such
behavior is noted in the description of the individual variables.
The return status is zero unless a NAME is readonly.

## 4.2 Bash Builtin Commands

This section describes builtin commands which are unique to or have been
extended in Bash. Some of these commands are specified in the POSIX
standard.

'alias'
alias [-p] [NAME[=VALUE] ...]

Without arguments or with the '-p' option, 'alias' prints the list
of aliases on the standard output in a form that allows them to be
reused as input. If arguments are supplied, an alias is defined
for each NAME whose VALUE is given. If no VALUE is given, the name
and value of the alias is printed. Aliases are described in *note
Aliases::.

'bind'
bind [-m KEYMAP] [-lpsvPSVX]
bind [-m KEYMAP] [-q FUNCTION] [-u FUNCTION] [-r KEYSEQ]
bind [-m KEYMAP] -f FILENAME
bind [-m KEYMAP] -x KEYSEQ:SHELL-COMMAND
bind [-m KEYMAP] KEYSEQ:FUNCTION-NAME
bind [-m KEYMAP] KEYSEQ:READLINE-COMMAND

Display current Readline (Command Line Editing) key and
function bindings, bind a key sequence to a Readline function or
macro, or set a Readline variable. Each non-option argument is a
command as it would appear in a Readline initialization file (*note
Readline Init File), but each binding or command must be passed
as a separate argument; e.g., '"\C-x\C-r":re-read-init-file'.

Options, if supplied, have the following meanings:

'-m KEYMAP'
Use KEYMAP as the keymap to be affected by the subsequent
bindings. Acceptable KEYMAP names are 'emacs',
'emacs-standard', 'emacs-meta', 'emacs-ctlx', 'vi', 'vi-move',
'vi-command', and 'vi-insert'. 'vi' is equivalent to
'vi-command' ('vi-move' is also a synonym); 'emacs' is
equivalent to 'emacs-standard'.

'-l'
List the names of all Readline functions.

'-p'
Display Readline function names and bindings in such a way
that they can be used as input or in a Readline initialization
file.

'-P'
List current Readline function names and bindings.

'-v'
Display Readline variable names and values in such a way that
they can be used as input or in a Readline initialization
file.

'-V'
List current Readline variable names and values.

'-s'
Display Readline key sequences bound to macros and the strings
they output in such a way that they can be used as input or in
a Readline initialization file.

'-S'
Display Readline key sequences bound to macros and the strings
they output.

'-f FILENAME'
Read key bindings from FILENAME.

'-q FUNCTION'
Query about which keys invoke the named FUNCTION.

'-u FUNCTION'
Unbind all keys bound to the named FUNCTION.

'-r KEYSEQ'
Remove any current binding for KEYSEQ.

'-x KEYSEQ:SHELL-COMMAND'
Cause SHELL-COMMAND to be executed whenever KEYSEQ is entered.
When SHELL-COMMAND is executed, the shell sets the
'READLINE_LINE' variable to the contents of the Readline line
buffer and the 'READLINE_POINT' and 'READLINE_MARK' variables
to the current location of the insertion point and the saved
insertion point (the MARK), respectively. If the executed
command changes the value of any of 'READLINE_LINE',
'READLINE_POINT', or 'READLINE_MARK', those new values will be
reflected in the editing state.

'-X'
List all key sequences bound to shell commands and the
associated commands in a format that can be reused as input.

The return status is zero unless an invalid option is supplied or
an error occurs.

'builtin'
builtin [SHELL-BUILTIN [ARGS]]

Run a shell builtin, passing it ARGS, and return its exit status.
This is useful when defining a shell function with the same name as
a shell builtin, retaining the functionality of the builtin within
the function. The return status is non-zero if SHELL-BUILTIN is
not a shell builtin command.

'caller'
caller [EXPR]

Returns the context of any active subroutine call (a shell function
or a script executed with the '.' or 'source' builtins).

Without EXPR, 'caller' displays the line number and source filename
of the current subroutine call. If a non-negative integer is
supplied as EXPR, 'caller' displays the line number, subroutine
name, and source file corresponding to that position in the current
execution call stack. This extra information may be used, for
example, to print a stack trace. The current frame is frame 0.

The return value is 0 unless the shell is not executing a
subroutine call or EXPR does not correspond to a valid position in
the call stack.

'command'
command [-pVv] COMMAND [ARGUMENTS ...]

Runs COMMAND with ARGUMENTS ignoring any shell function named
COMMAND. Only shell builtin commands or commands found by
searching the 'PATH' are executed. If there is a shell function
named 'ls', running 'command ls' within the function will execute
the external command 'ls' instead of calling the function
recursively. The '-p' option means to use a default value for
'PATH' that is guaranteed to find all of the standard utilities.
The return status in this case is 127 if COMMAND cannot be found or
an error occurred, and the exit status of COMMAND otherwise.

If either the '-V' or '-v' option is supplied, a description of
COMMAND is printed. The '-v' option causes a single word
indicating the command or file name used to invoke COMMAND to be
displayed; the '-V' option produces a more verbose description. In
this case, the return status is zero if COMMAND is found, and
non-zero if not.

'declare'
declare [-aAfFgiIlnrtux] [-p] [NAME[=VALUE] ...]

Declare variables and give them attributes. If no NAMEs are given,
then display the values of variables instead.

The '-p' option will display the attributes and values of each
NAME. When '-p' is used with NAME arguments, additional options,
other than '-f' and '-F', are ignored.

When '-p' is supplied without NAME arguments, 'declare' will
display the attributes and values of all variables having the
attributes specified by the additional options. If no other
options are supplied with '-p', 'declare' will display the
attributes and values of all shell variables. The '-f' option will
restrict the display to shell functions.

The '-F' option inhibits the display of function definitions; only
the function name and attributes are printed. If the 'extdebug'
shell option is enabled using 'shopt' (The Shopt Builtin),
the source file name and line number where each NAME is defined are
displayed as well. '-F' implies '-f'.

The '-g' option forces variables to be created or modified at the
global scope, even when 'declare' is executed in a shell function.
It is ignored in all other cases.

The '-I' option causes local variables to inherit the attributes
(except the NAMEREF attribute) and value of any existing variable
with the same NAME at a surrounding scope. If there is no existing
variable, the local variable is initially unset.

The following options can be used to restrict output to variables
with the specified attributes or to give variables attributes:

'-a'
Each NAME is an indexed array variable (Arrays).

'-A'
Each NAME is an associative array variable (Arrays).

'-f'
Use function names only.

'-i'
The variable is to be treated as an integer; arithmetic
evaluation (Shell Arithmetic) is performed when the
variable is assigned a value.

'-l'
When the variable is assigned a value, all upper-case
characters are converted to lower-case. The upper-case
attribute is disabled.

'-n'
Give each NAME the NAMEREF attribute, making it a name
reference to another variable. That other variable is defined
by the value of NAME. All references, assignments, and
attribute modifications to NAME, except for those using or
changing the '-n' attribute itself, are performed on the
variable referenced by NAME's value. The nameref attribute
cannot be applied to array variables.

'-r'
Make NAMEs readonly. These names cannot then be assigned
values by subsequent assignment statements or unset.

'-t'
Give each NAME the 'trace' attribute. Traced functions
inherit the 'DEBUG' and 'RETURN' traps from the calling shell.
The trace attribute has no special meaning for variables.

'-u'
When the variable is assigned a value, all lower-case
characters are converted to upper-case. The lower-case
attribute is disabled.

'-x'
Mark each NAME for export to subsequent commands via the
environment.

Using '+' instead of '-' turns off the attribute instead, with the
exceptions that '+a' and '+A' may not be used to destroy array
variables and '+r' will not remove the readonly attribute. When
used in a function, 'declare' makes each NAME local, as with the
'local' command, unless the '-g' option is used. If a variable
name is followed by =VALUE, the value of the variable is set to
VALUE.

When using '-a' or '-A' and the compound assignment syntax to
create array variables, additional attributes do not take effect
until subsequent assignments.

The return status is zero unless an invalid option is encountered,
an attempt is made to define a function using '-f foo=bar', an
attempt is made to assign a value to a readonly variable, an
attempt is made to assign a value to an array variable without
using the compound assignment syntax (Arrays), one of the
NAMES is not a valid shell variable name, an attempt is made to
turn off readonly status for a readonly variable, an attempt is
made to turn off array status for an array variable, or an attempt
is made to display a non-existent function with '-f'.

'echo'
echo [-neE] [ARG ...]

Output the ARGs, separated by spaces, terminated with a newline.
The return status is 0 unless a write error occurs. If '-n' is
specified, the trailing newline is suppressed. If the '-e' option
is given, interpretation of the following backslash-escaped
characters is enabled. The '-E' option disables the interpretation
of these escape characters, even on systems where they are
interpreted by default. The 'xpg_echo' shell option may be used to
dynamically determine whether or not 'echo' expands these escape
characters by default. 'echo' does not interpret '--' to mean the
end of options.

'echo' interprets the following escape sequences:
'\a'
alert (bell)
'\b'
backspace
'\c'
suppress further output
'\e'
'\E'
escape
'\f'
form feed
'\n'
new line
'\r'
carriage return
'\t'
horizontal tab
'\v'
vertical tab
'\\'
backslash
'\0NNN'
the eight-bit character whose value is the octal value NNN
(zero to three octal digits)
'\xHH'
the eight-bit character whose value is the hexadecimal value
HH (one or two hex digits)
'\uHHHH'
the Unicode (ISO/IEC 10646) character whose value is the
hexadecimal value HHHH (one to four hex digits)
'\UHHHHHHHH'
the Unicode (ISO/IEC 10646) character whose value is the
hexadecimal value HHHHHHHH (one to eight hex digits)

'enable'
enable [-a] [-dnps] [-f FILENAME] [NAME ...]

Enable and disable builtin shell commands. Disabling a builtin
allows a disk command which has the same name as a shell builtin to
be executed without specifying a full pathname, even though the
shell normally searches for builtins before disk commands. If '-n'
is used, the NAMEs become disabled. Otherwise NAMEs are enabled.
For example, to use the 'test' binary found via '$PATH' instead of
the shell builtin version, type 'enable -n test'.

If the '-p' option is supplied, or no NAME arguments appear, a list
of shell builtins is printed. With no other arguments, the list
consists of all enabled shell builtins. The '-a' option means to
list each builtin with an indication of whether or not it is
enabled.

The '-f' option means to load the new builtin command NAME from
shared object FILENAME, on systems that support dynamic loading.
The '-d' option will delete a builtin loaded with '-f'.

If there are no options, a list of the shell builtins is displayed.
The '-s' option restricts 'enable' to the POSIX special builtins.
If '-s' is used with '-f', the new builtin becomes a special
builtin (Special Builtins).

The return status is zero unless a NAME is not a shell builtin or
there is an error loading a new builtin from a shared object.

'help'
help [-dms] [PATTERN]

Display helpful information about builtin commands. If PATTERN is
specified, 'help' gives detailed help on all commands matching
PATTERN, otherwise a list of the builtins is printed.

Options, if supplied, have the following meanings:

'-d'
Display a short description of each PATTERN
'-m'
Display the description of each PATTERN in a manpage-like
format
'-s'
Display only a short usage synopsis for each PATTERN

The return status is zero unless no command matches PATTERN.

'let'
let EXPRESSION [EXPRESSION ...]

The 'let' builtin allows arithmetic to be performed on shell
variables. Each EXPRESSION is evaluated according to the rules
given below in Shell Arithmetic::. If the last EXPRESSION
evaluates to 0, 'let' returns 1; otherwise 0 is returned.

'local'
local [OPTION] NAME[=VALUE] ...

For each argument, a local variable named NAME is created, and
assigned VALUE. The OPTION can be any of the options accepted by
'declare'. 'local' can only be used within a function; it makes
the variable NAME have a visible scope restricted to that function
and its children. If NAME is '-', the set of shell options is made
local to the function in which 'local' is invoked: shell options
changed using the 'set' builtin inside the function are restored to
their original values when the function returns. The restore is
effected as if a series of 'set' commands were executed to restore
the values that were in place before the function. The return
status is zero unless 'local' is used outside a function, an
invalid NAME is supplied, or NAME is a readonly variable.

'logout'
logout [N]

Exit a login shell, returning a status of N to the shell's parent.

'mapfile'
mapfile [-d DELIM] [-n COUNT] [-O ORIGIN] [-s COUNT]
[-t] [-u FD] [-C CALLBACK] [-c QUANTUM] [ARRAY]

Read lines from the standard input into the indexed array variable
ARRAY, or from file descriptor FD if the '-u' option is supplied.
The variable 'MAPFILE' is the default ARRAY. Options, if supplied,
have the following meanings:

'-d'
The first character of DELIM is used to terminate each input
line, rather than newline. If DELIM is the empty string,
'mapfile' will terminate a line when it reads a NUL character.
'-n'
Copy at most COUNT lines. If COUNT is 0, all lines are
copied.
'-O'
Begin assigning to ARRAY at index ORIGIN. The default index
is 0.
'-s'
Discard the first COUNT lines read.
'-t'
Remove a trailing DELIM (default newline) from each line read.
'-u'
Read lines from file descriptor FD instead of the standard
input.
'-C'
Evaluate CALLBACK each time QUANTUM lines are read. The '-c'
option specifies QUANTUM.
'-c'
Specify the number of lines read between each call to
CALLBACK.

If '-C' is specified without '-c', the default quantum is 5000.
When CALLBACK is evaluated, it is supplied the index of the next
array element to be assigned and the line to be assigned to that
element as additional arguments. CALLBACK is evaluated after the
line is read but before the array element is assigned.

If not supplied with an explicit origin, 'mapfile' will clear ARRAY
before assigning to it.

'mapfile' returns successfully unless an invalid option or option
argument is supplied, ARRAY is invalid or unassignable, or ARRAY is
not an indexed array.

'printf'
printf [-v VAR] FORMAT [ARGUMENTS]

Write the formatted ARGUMENTS to the standard output under the
control of the FORMAT. The '-v' option causes the output to be
assigned to the variable VAR rather than being printed to the
standard output.

The FORMAT is a character string which contains three types of
objects: plain characters, which are simply copied to standard
output, character escape sequences, which are converted and copied
to the standard output, and format specifications, each of which
causes printing of the next successive ARGUMENT. In addition to
the standard 'printf(1)' formats, 'printf' interprets the following
extensions:

'%b'
Causes 'printf' to expand backslash escape sequences in the
corresponding ARGUMENT in the same way as 'echo -e' (*note
Bash Builtins).
'%q'
Causes 'printf' to output the corresponding ARGUMENT in a
format that can be reused as shell input.
'%(DATEFMT)T'
Causes 'printf' to output the date-time string resulting from
using DATEFMT as a format string for 'strftime'(3). The
corresponding ARGUMENT is an integer representing the number
of seconds since the epoch. Two special argument values may
be used: -1 represents the current time, and -2 represents the
time the shell was invoked. If no argument is specified,
conversion behaves as if -1 had been given. This is an
exception to the usual 'printf' behavior.

The %b, %q, and %T directives all use the field width and precision
arguments from the format specification and write that many bytes
from (or use that wide a field for) the expanded argument, which
usually contains more characters than the original.

Arguments to non-string format specifiers are treated as C language
constants, except that a leading plus or minus sign is allowed, and
if the leading character is a single or double quote, the value is
the ASCII value of the following character.

The FORMAT is reused as necessary to consume all of the ARGUMENTS.
If the FORMAT requires more ARGUMENTS than are supplied, the extra
format specifications behave as if a zero value or null string, as
appropriate, had been supplied. The return value is zero on
success, non-zero on failure.

'read'
read [-ers] [-a ANAME] [-d DELIM] [-i TEXT] [-n NCHARS]
[-N NCHARS] [-p PROMPT] [-t TIMEOUT] [-u FD] [NAME ...]

One line is read from the standard input, or from the file
descriptor FD supplied as an argument to the '-u' option, split
into words as described above in Word Splitting::, and the
first word is assigned to the first NAME, the second word to the
second NAME, and so on. If there are more words than names, the
remaining words and their intervening delimiters are assigned to
the last NAME. If there are fewer words read from the input stream
than names, the remaining names are assigned empty values. The
characters in the value of the 'IFS' variable are used to split the
line into words using the same rules the shell uses for expansion
(described above in Word Splitting). The backslash
character '\' may be used to remove any special meaning for the
next character read and for line continuation.

Options, if supplied, have the following meanings:

'-a ANAME'
The words are assigned to sequential indices of the array
variable ANAME, starting at 0. All elements are removed from
ANAME before the assignment. Other NAME arguments are
ignored.

'-d DELIM'
The first character of DELIM is used to terminate the input
line, rather than newline. If DELIM is the empty string,
'read' will terminate a line when it reads a NUL character.

'-e'
Readline (Command Line Editing) is used to obtain the
line. Readline uses the current (or default, if line editing
was not previously active) editing settings, but uses
Readline's default filename completion.

'-i TEXT'
If Readline is being used to read the line, TEXT is placed
into the editing buffer before editing begins.

'-n NCHARS'
'read' returns after reading NCHARS characters rather than
waiting for a complete line of input, but honors a delimiter
if fewer than NCHARS characters are read before the delimiter.

'-N NCHARS'
'read' returns after reading exactly NCHARS characters rather
than waiting for a complete line of input, unless EOF is
encountered or 'read' times out. Delimiter characters
encountered in the input are not treated specially and do not
cause 'read' to return until NCHARS characters are read. The
result is not split on the characters in 'IFS'; the intent is
that the variable is assigned exactly the characters read
(with the exception of backslash; see the '-r' option below).

'-p PROMPT'
Display PROMPT, without a trailing newline, before attempting
to read any input. The prompt is displayed only if input is
coming from a terminal.

'-r'
If this option is given, backslash does not act as an escape
character. The backslash is considered to be part of the
line. In particular, a backslash-newline pair may not then be
used as a line continuation.

'-s'
Silent mode. If input is coming from a terminal, characters
are not echoed.

'-t TIMEOUT'
Cause 'read' to time out and return failure if a complete line
of input (or a specified number of characters) is not read
within TIMEOUT seconds. TIMEOUT may be a decimal number with
a fractional portion following the decimal point. This option
is only effective if 'read' is reading input from a terminal,
pipe, or other special file; it has no effect when reading
from regular files. If 'read' times out, 'read' saves any
partial input read into the specified variable NAME. If
TIMEOUT is 0, 'read' returns immediately, without trying to
read any data. The exit status is 0 if input is available on
the specified file descriptor, non-zero otherwise. The exit
status is greater than 128 if the timeout is exceeded.

'-u FD'
Read input from file descriptor FD.

If no NAMEs are supplied, the line read, without the ending
delimiter but otherwise unmodified, is assigned to the variable
'REPLY'. The exit status is zero, unless end-of-file is
encountered, 'read' times out (in which case the status is greater
than 128), a variable assignment error (such as assigning to a
readonly variable) occurs, or an invalid file descriptor is
supplied as the argument to '-u'.

'readarray'
readarray [-d DELIM] [-n COUNT] [-O ORIGIN] [-s COUNT]
[-t] [-u FD] [-C CALLBACK] [-c QUANTUM] [ARRAY]

Read lines from the standard input into the indexed array variable
ARRAY, or from file descriptor FD if the '-u' option is supplied.

A synonym for 'mapfile'.

'source'
source FILENAME

A synonym for '.' (Bourne Shell Builtins).

'type'
type [-afptP] [NAME ...]

For each NAME, indicate how it would be interpreted if used as a
command name.

If the '-t' option is used, 'type' prints a single word which is
one of 'alias', 'function', 'builtin', 'file' or 'keyword', if NAME
is an alias, shell function, shell builtin, disk file, or shell
reserved word, respectively. If the NAME is not found, then
nothing is printed, and 'type' returns a failure status.

If the '-p' option is used, 'type' either returns the name of the
disk file that would be executed, or nothing if '-t' would not
return 'file'.

The '-P' option forces a path search for each NAME, even if '-t'
would not return 'file'.

If a command is hashed, '-p' and '-P' print the hashed value, which
is not necessarily the file that appears first in '$PATH'.

If the '-a' option is used, 'type' returns all of the places that
contain an executable named FILE. This includes aliases and
functions, if and only if the '-p' option is not also used.

If the '-f' option is used, 'type' does not attempt to find shell
functions, as with the 'command' builtin.

The return status is zero if all of the NAMES are found, non-zero
if any are not found.

'typeset'
typeset [-afFgrxilnrtux] [-p] [NAME[=VALUE] ...]

The 'typeset' command is supplied for compatibility with the Korn
shell. It is a synonym for the 'declare' builtin command.

'ulimit'
ulimit [-HS] -a
ulimit [-HS] [-bcdefiklmnpqrstuvxPRT] [LIMIT]

'ulimit' provides control over the resources available to processes
started by the shell, on systems that allow such control. If an
option is given, it is interpreted as follows:

'-S'
Change and report the soft limit associated with a resource.

'-H'
Change and report the hard limit associated with a resource.

'-a'
All current limits are reported; no limits are set.

'-b'
The maximum socket buffer size.

'-c'
The maximum size of core files created.

'-d'
The maximum size of a process's data segment.

'-e'
The maximum scheduling priority ("nice").

'-f'
The maximum size of files written by the shell and its
children.

'-i'
The maximum number of pending signals.

'-k'
The maximum number of kqueues that may be allocated.

'-l'
The maximum size that may be locked into memory.

'-m'
The maximum resident set size (many systems do not honor this
limit).

'-n'
The maximum number of open file descriptors (most systems do
not allow this value to be set).

'-p'
The pipe buffer size.

'-q'
The maximum number of bytes in POSIX message queues.

'-r'
The maximum real-time scheduling priority.

'-s'
The maximum stack size.

'-t'
The maximum amount of cpu time in seconds.

'-u'
The maximum number of processes available to a single user.

'-v'
The maximum amount of virtual memory available to the shell,
and, on some systems, to its children.

'-x'
The maximum number of file locks.

'-P'
The maximum number of pseudoterminals.

'-R'
The maximum time a real-time process can run before blocking,
in microseconds.

'-T'
The maximum number of threads.

If LIMIT is given, and the '-a' option is not used, LIMIT is the
new value of the specified resource. The special LIMIT values
'hard', 'soft', and 'unlimited' stand for the current hard limit,
the current soft limit, and no limit, respectively. A hard limit
cannot be increased by a non-root user once it is set; a soft limit
may be increased up to the value of the hard limit. Otherwise, the
current value of the soft limit for the specified resource is
printed, unless the '-H' option is supplied. When more than one
resource is specified, the limit name and unit, if appropriate, are
printed before the value. When setting new limits, if neither '-H'
nor '-S' is supplied, both the hard and soft limits are set. If no
option is given, then '-f' is assumed. Values are in 1024-byte
increments, except for '-t', which is in seconds; '-R', which is in
microseconds; '-p', which is in units of 512-byte blocks; '-P',
'-T', '-b', '-k', '-n' and '-u', which are unscaled values; and,
when in POSIX Mode (Bash POSIX Mode), '-c' and '-f', which
are in 512-byte increments.

The return status is zero unless an invalid option or argument is
supplied, or an error occurs while setting a new limit.

'unalias'
unalias [-a] [NAME ... ]

Remove each NAME from the list of aliases. If '-a' is supplied,
all aliases are removed. Aliases are described in Aliases::.

## 4.3 Modifying Shell Behavior

### 4.3.1 The Set Builtin

This builtin is so complicated that it deserves its own section. 'set'
allows you to change the values of shell options and set the positional
parameters, or to display the names and values of shell variables.

'set'
set [--abefhkmnptuvxBCEHPT] [-o OPTION-NAME] [ARGUMENT ...]
set [+abefhkmnptuvxBCEHPT] [+o OPTION-NAME] [ARGUMENT ...]

If no options or arguments are supplied, 'set' displays the names
and values of all shell variables and functions, sorted according
to the current locale, in a format that may be reused as input for
setting or resetting the currently-set variables. Read-only
variables cannot be reset. In POSIX mode, only shell variables are
listed.

When options are supplied, they set or unset shell attributes.
Options, if specified, have the following meanings:

'-a'
Each variable or function that is created or modified is given
the export attribute and marked for export to the environment
of subsequent commands.

'-b'
Cause the status of terminated background jobs to be reported
immediately, rather than before printing the next primary
prompt.

'-e'
Exit immediately if a pipeline (Pipelines), which may
consist of a single simple command (Simple Commands),
a list (Lists), or a compound command (Compound
Commands) returns a non-zero status. The shell does not
exit if the command that fails is part of the command list
immediately following a 'while' or 'until' keyword, part of
the test in an 'if' statement, part of any command executed in
a '&&' or '||' list except the command following the final
'&&' or '||', any command in a pipeline but the last, or if
the command's return status is being inverted with '!'. If a
compound command other than a subshell returns a non-zero
status because a command failed while '-e' was being ignored,
the shell does not exit. A trap on 'ERR', if set, is executed
before the shell exits.

This option applies to the shell environment and each subshell
environment separately (Command Execution
Environment), and may cause subshells to exit before
executing all the commands in the subshell.

If a compound command or shell function executes in a context
where '-e' is being ignored, none of the commands executed
within the compound command or function body will be affected
by the '-e' setting, even if '-e' is set and a command returns
a failure status. If a compound command or shell function
sets '-e' while executing in a context where '-e' is ignored,
that setting will not have any effect until the compound
command or the command containing the function call completes.

'-f'
Disable filename expansion (globbing).

'-h'
Locate and remember (hash) commands as they are looked up for
execution. This option is enabled by default.

'-k'
All arguments in the form of assignment statements are placed
in the environment for a command, not just those that precede
the command name.

'-m'
Job control is enabled (Job Control). All processes
run in a separate process group. When a background job
completes, the shell prints a line containing its exit status.

'-n'
Read commands but do not execute them. This may be used to
check a script for syntax errors. This option is ignored by
interactive shells.

'-o OPTION-NAME'

Set the option corresponding to OPTION-NAME:

'allexport'
Same as '-a'.

'braceexpand'
Same as '-B'.

'emacs'
Use an 'emacs'-style line editing interface (*note
Command Line Editing). This also affects the editing
interface used for 'read -e'.

'errexit'
Same as '-e'.

'errtrace'
Same as '-E'.

'functrace'
Same as '-T'.

'hashall'
Same as '-h'.

'histexpand'
Same as '-H'.

'history'
Enable command history, as described in Bash
History Facilities::. This option is on by default in
interactive shells.

'ignoreeof'
An interactive shell will not exit upon reading EOF.

'keyword'
Same as '-k'.

'monitor'
Same as '-m'.

'noclobber'
Same as '-C'.

'noexec'
Same as '-n'.

'noglob'
Same as '-f'.

'nolog'
Currently ignored.

'notify'
Same as '-b'.

'nounset'
Same as '-u'.

'onecmd'
Same as '-t'.

'physical'
Same as '-P'.

'pipefail'
If set, the return value of a pipeline is the value of
the last (rightmost) command to exit with a non-zero
status, or zero if all commands in the pipeline exit
successfully. This option is disabled by default.

'posix'
Change the behavior of Bash where the default operation
differs from the POSIX standard to match the standard
(Bash POSIX Mode). This is intended to make Bash
behave as a strict superset of that standard.

'privileged'
Same as '-p'.

'verbose'
Same as '-v'.

'vi'
Use a 'vi'-style line editing interface. This also
affects the editing interface used for 'read -e'.

'xtrace'
Same as '-x'.

'-p'
Turn on privileged mode. In this mode, the '$BASH_ENV' and
'$ENV' files are not processed, shell functions are not
inherited from the environment, and the 'SHELLOPTS',
'BASHOPTS', 'CDPATH' and 'GLOBIGNORE' variables, if they
appear in the environment, are ignored. If the shell is
started with the effective user (group) id not equal to the
real user (group) id, and the '-p' option is not supplied,
these actions are taken and the effective user id is set to
the real user id. If the '-p' option is supplied at startup,
the effective user id is not reset. Turning this option off
causes the effective user and group ids to be set to the real
user and group ids.

'-t'
Exit after reading and executing one command.

'-u'
Treat unset variables and parameters other than the special
parameters '@' or '*' as an error when performing parameter
expansion. An error message will be written to the standard
error, and a non-interactive shell will exit.

'-v'
Print shell input lines as they are read.

'-x'
Print a trace of simple commands, 'for' commands, 'case'
commands, 'select' commands, and arithmetic 'for' commands and
their arguments or associated word lists after they are
expanded and before they are executed. The value of the 'PS4'
variable is expanded and the resultant value is printed before
the command and its expanded arguments.

'-B'
The shell will perform brace expansion (Brace
Expansion). This option is on by default.

'-C'
Prevent output redirection using '>', '>&', and '<>' from
overwriting existing files.

'-E'
If set, any trap on 'ERR' is inherited by shell functions,
command substitutions, and commands executed in a subshell
environment. The 'ERR' trap is normally not inherited in such
cases.

'-H'
Enable '!' style history substitution (History
Interaction). This option is on by default for interactive
shells.

'-P'
If set, do not resolve symbolic links when performing commands
such as 'cd' which change the current directory. The physical
directory is used instead. By default, Bash follows the
logical chain of directories when performing commands which
change the current directory.

For example, if '/usr/sys' is a symbolic link to
'/usr/local/sys' then:
$ cd /usr/sys; echo $PWD
/usr/sys
$ cd ..; pwd
/usr

If 'set -P' is on, then:
$ cd /usr/sys; echo $PWD
/usr/local/sys
$ cd ..; pwd
/usr/local

'-T'
If set, any trap on 'DEBUG' and 'RETURN' are inherited by
shell functions, command substitutions, and commands executed
in a subshell environment. The 'DEBUG' and 'RETURN' traps are
normally not inherited in such cases.

'--'
If no arguments follow this option, then the positional
parameters are unset. Otherwise, the positional parameters
are set to the ARGUMENTS, even if some of them begin with a
'-'.

'-'
Signal the end of options, cause all remaining ARGUMENTS to be
assigned to the positional parameters. The '-x' and '-v'
options are turned off. If there are no arguments, the
positional parameters remain unchanged.

Using '+' rather than '-' causes these options to be turned off.
The options can also be used upon invocation of the shell. The
current set of options may be found in '$-'.

The remaining N ARGUMENTS are positional parameters and are
assigned, in order, to '$1', '$2', ... '$N'. The special parameter
'#' is set to N.

The return status is always zero unless an invalid option is
supplied.

### 4.3.2 The Shopt Builtin

This builtin allows you to change additional shell optional behavior.

'shopt'
shopt [-pqsu] [-o] [OPTNAME ...]

Toggle the values of settings controlling optional shell behavior.
The settings can be either those listed below, or, if the '-o'
option is used, those available with the '-o' option to the 'set'
builtin command (The Set Builtin). With no options, or
with the '-p' option, a list of all settable options is displayed,
with an indication of whether or not each is set; if OPTNAMES are
supplied, the output is restricted to those options. The '-p'
option causes output to be displayed in a form that may be reused
as input. Other options have the following meanings:

'-s'
Enable (set) each OPTNAME.

'-u'
Disable (unset) each OPTNAME.

'-q'
Suppresses normal output; the return status indicates whether
the OPTNAME is set or unset. If multiple OPTNAME arguments
are given with '-q', the return status is zero if all OPTNAMES
are enabled; non-zero otherwise.

'-o'
Restricts the values of OPTNAME to be those defined for the
'-o' option to the 'set' builtin (The Set Builtin).

If either '-s' or '-u' is used with no OPTNAME arguments, 'shopt'
shows only those options which are set or unset, respectively.

Unless otherwise noted, the 'shopt' options are disabled (off) by
default.

The return status when listing options is zero if all OPTNAMES are
enabled, non-zero otherwise. When setting or unsetting options,
the return status is zero unless an OPTNAME is not a valid shell
option.

The list of 'shopt' options is:

'assoc_expand_once'
If set, the shell suppresses multiple evaluation of
associative array subscripts during arithmetic expression
evaluation, while executing builtins that can perform variable
assignments, and while executing builtins that perform array
dereferencing.

'autocd'
If set, a command name that is the name of a directory is
executed as if it were the argument to the 'cd' command. This
option is only used by interactive shells.

'cdable_vars'
If this is set, an argument to the 'cd' builtin command that
is not a directory is assumed to be the name of a variable
whose value is the directory to change to.

'cdspell'
If set, minor errors in the spelling of a directory component
in a 'cd' command will be corrected. The errors checked for
are transposed characters, a missing character, and a
character too many. If a correction is found, the corrected
path is printed, and the command proceeds. This option is
only used by interactive shells.

'checkhash'
If this is set, Bash checks that a command found in the hash
table exists before trying to execute it. If a hashed command
no longer exists, a normal path search is performed.

'checkjobs'
If set, Bash lists the status of any stopped and running jobs
before exiting an interactive shell. If any jobs are running,
this causes the exit to be deferred until a second exit is
attempted without an intervening command (Job
Control). The shell always postpones exiting if any jobs
are stopped.

'checkwinsize'
If set, Bash checks the window size after each external
(non-builtin) command and, if necessary, updates the values of
'LINES' and 'COLUMNS'. This option is enabled by default.

'cmdhist'
If set, Bash attempts to save all lines of a multiple-line
command in the same history entry. This allows easy
re-editing of multi-line commands. This option is enabled by
default, but only has an effect if command history is enabled
(Bash History Facilities).

'compat31'
'compat32'
'compat40'
'compat41'
'compat42'
'compat43'
'compat44'
These control aspects of the shell's compatibility mode (*note
Shell Compatibility Mode).

'complete_fullquote'
If set, Bash quotes all shell metacharacters in filenames and
directory names when performing completion. If not set, Bash
removes metacharacters such as the dollar sign from the set of
characters that will be quoted in completed filenames when
these metacharacters appear in shell variable references in
words to be completed. This means that dollar signs in
variable names that expand to directories will not be quoted;
however, any dollar signs appearing in filenames will not be
quoted, either. This is active only when bash is using
backslashes to quote completed filenames. This variable is
set by default, which is the default Bash behavior in versions
through 4.2.

'direxpand'
If set, Bash replaces directory names with the results of word
expansion when performing filename completion. This changes
the contents of the readline editing buffer. If not set, Bash
attempts to preserve what the user typed.

'dirspell'
If set, Bash attempts spelling correction on directory names
during word completion if the directory name initially
supplied does not exist.

'dotglob'
If set, Bash includes filenames beginning with a '.'  in the
results of filename expansion. The filenames '.' and '..'
must always be matched explicitly, even if 'dotglob' is set.

'execfail'
If this is set, a non-interactive shell will not exit if it
cannot execute the file specified as an argument to the 'exec'
builtin command. An interactive shell does not exit if 'exec'
fails.

'expand_aliases'
If set, aliases are expanded as described below under Aliases,
Aliases::. This option is enabled by default for
interactive shells.

'extdebug'
If set at shell invocation, or in a shell startup file,
arrange to execute the debugger profile before the shell
starts, identical to the '--debugger' option. If set after
invocation, behavior intended for use by debuggers is enabled:

1. The '-F' option to the 'declare' builtin (Bash
Builtins) displays the source file name and line number
corresponding to each function name supplied as an
argument.

2. If the command run by the 'DEBUG' trap returns a non-zero
value, the next command is skipped and not executed.

3. If the command run by the 'DEBUG' trap returns a value of
2, and the shell is executing in a subroutine (a shell
function or a shell script executed by the '.' or
'source' builtins), the shell simulates a call to
'return'.

4. 'BASH_ARGC' and 'BASH_ARGV' are updated as described in
their descriptions (Bash Variables).

5. Function tracing is enabled: command substitution, shell
functions, and subshells invoked with '( COMMAND )'
inherit the 'DEBUG' and 'RETURN' traps.

6. Error tracing is enabled: command substitution, shell
functions, and subshells invoked with '( COMMAND )'
inherit the 'ERR' trap.

'extglob'
If set, the extended pattern matching features described above
(Pattern Matching) are enabled.

'extquote'
If set, '$'STRING'' and '$"STRING"' quoting is performed
within '${PARAMETER}' expansions enclosed in double quotes.
This option is enabled by default.

'failglob'
If set, patterns which fail to match filenames during filename
expansion result in an expansion error.

'force_fignore'
If set, the suffixes specified by the 'FIGNORE' shell variable
cause words to be ignored when performing word completion even
if the ignored words are the only possible completions. *Note
Bash Variables::, for a description of 'FIGNORE'. This option
is enabled by default.

'globasciiranges'
If set, range expressions used in pattern matching bracket
expressions (Pattern Matching) behave as if in the
traditional C locale when performing comparisons. That is,
the current locale's collating sequence is not taken into
account, so 'b' will not collate between 'A' and 'B', and
upper-case and lower-case ASCII characters will collate
together.

'globstar'
If set, the pattern '**' used in a filename expansion context
will match all files and zero or more directories and
subdirectories. If the pattern is followed by a '/', only
directories and subdirectories match.

'gnu_errfmt'
If set, shell error messages are written in the standard GNU
error message format.

'histappend'
If set, the history list is appended to the file named by the
value of the 'HISTFILE' variable when the shell exits, rather
than overwriting the file.

'histreedit'
If set, and Readline is being used, a user is given the
opportunity to re-edit a failed history substitution.

'histverify'
If set, and Readline is being used, the results of history
substitution are not immediately passed to the shell parser.
Instead, the resulting line is loaded into the Readline
editing buffer, allowing further modification.

'hostcomplete'
If set, and Readline is being used, Bash will attempt to
perform hostname completion when a word containing a '@' is
being completed (Commands For Completion). This
option is enabled by default.

'huponexit'
If set, Bash will send 'SIGHUP' to all jobs when an
interactive login shell exits (Signals).

'inherit_errexit'
If set, command substitution inherits the value of the
'errexit' option, instead of unsetting it in the subshell
environment. This option is enabled when POSIX mode is
enabled.

'interactive_comments'
Allow a word beginning with '#' to cause that word and all
remaining characters on that line to be ignored in an
interactive shell. This option is enabled by default.

'lastpipe'
If set, and job control is not active, the shell runs the last
command of a pipeline not executed in the background in the
current shell environment.

'lithist'
If enabled, and the 'cmdhist' option is enabled, multi-line
commands are saved to the history with embedded newlines
rather than using semicolon separators where possible.

'localvar_inherit'
If set, local variables inherit the value and attributes of a
variable of the same name that exists at a previous scope
before any new value is assigned. The NAMEREF attribute is
not inherited.

'localvar_unset'
If set, calling 'unset' on local variables in previous
function scopes marks them so subsequent lookups find them
unset until that function returns. This is identical to the
behavior of unsetting local variables at the current function
scope.

'login_shell'
The shell sets this option if it is started as a login shell
(Invoking Bash). The value may not be changed.

'mailwarn'
If set, and a file that Bash is checking for mail has been
accessed since the last time it was checked, the message '"The
mail in MAILFILE has been read"' is displayed.

'no_empty_cmd_completion'
If set, and Readline is being used, Bash will not attempt to
search the 'PATH' for possible completions when completion is
attempted on an empty line.

'nocaseglob'
If set, Bash matches filenames in a case-insensitive fashion
when performing filename expansion.

'nocasematch'
If set, Bash matches patterns in a case-insensitive fashion
when performing matching while executing 'case' or '[['
conditional commands, when performing pattern substitution
word expansions, or when filtering possible completions as
part of programmable completion.

'nullglob'
If set, Bash allows filename patterns which match no files to
expand to a null string, rather than themselves.

'progcomp'
If set, the programmable completion facilities (*note
Programmable Completion) are enabled. This option is
enabled by default.

'progcomp_alias'
If set, and programmable completion is enabled, Bash treats a
command name that doesn't have any completions as a possible
alias and attempts alias expansion. If it has an alias, Bash
attempts programmable completion using the command word
resulting from the expanded alias.

'promptvars'
If set, prompt strings undergo parameter expansion, command
substitution, arithmetic expansion, and quote removal after
being expanded as described below (Controlling the
Prompt). This option is enabled by default.

'restricted_shell'
The shell sets this option if it is started in restricted mode
(The Restricted Shell). The value may not be changed.
This is not reset when the startup files are executed,
allowing the startup files to discover whether or not a shell
is restricted.

'shift_verbose'
If this is set, the 'shift' builtin prints an error message
when the shift count exceeds the number of positional
parameters.

'sourcepath'
If set, the 'source' builtin uses the value of 'PATH' to find
the directory containing the file supplied as an argument.
This option is enabled by default.

'xpg_echo'
If set, the 'echo' builtin expands backslash-escape sequences
by default.

## 4.4 Special Builtins

For historical reasons, the POSIX standard has classified several
builtin commands as _special_. When Bash is executing in POSIX mode,
the special builtins differ from other builtin commands in three
respects:

1. Special builtins are found before shell functions during command
lookup.

2. If a special builtin returns an error status, a non-interactive
shell exits.

3. Assignment statements preceding the command stay in effect in the
shell environment after the command completes.

When Bash is not executing in POSIX mode, these builtins behave no
differently than the rest of the Bash builtin commands. The Bash POSIX
mode is described in Bash POSIX Mode::.

These are the POSIX special builtins:
break : . continue eval exec exit export readonly return set
shift trap unset
