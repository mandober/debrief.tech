# 3. Basic Shell Features

Bash is an acronym for *Bourne-Again SHell*. The Bourne shell is the traditional Unix shell originally written by Stephen Bourne. All of the Bourne shell builtins are available in Bash, The rules for evaluation and quoting are taken from the POSIX specification for the "standard" Unix shell.

This chapter briefly summarizes the shell's *building blocks*:
- commands
- control structures
- shell functions
- shell parameters
- shell expansions
- redirections
- command execution

## 3.1 Shell Syntax

When the shell reads input, it proceeds through a sequence of
operations. If the input indicates the beginning of a comment, the
shell ignores the comment symbol ('#'), and the rest of that line.

Otherwise, roughly speaking, the shell reads its input and divides
the input into words and operators, employing the quoting rules to
select which meanings to assign various words and characters.

The shell then parses these tokens into commands and other
constructs, removes the special meaning of certain words or characters,
expands others, redirects input and output as needed, executes the
specified command, waits for the command's exit status, and makes that
exit status available for further inspection or processing.

### 3.1.1 Shell Operation

The following is a brief description of the shell's operation when it
reads and executes a command. Basically, the shell does the following:

1. Reads its input from a file (*note Shell Scripts::), from a string
supplied as an argument to the '-c' invocation option (*note
Invoking Bash::), or from the user's terminal.

2. Breaks the input into words and operators, obeying the quoting
rules described in *note Quoting::. These tokens are separated by
'metacharacters'. Alias expansion is performed by this step (*note
Aliases::).

3. Parses the tokens into simple and compound commands (*note Shell
Commands::).

4. Performs the various shell expansions (*note Shell Expansions::),
breaking the expanded tokens into lists of filenames (*note
Filename Expansion::) and commands and arguments.

5. Performs any necessary redirections (*note Redirections::) and
removes the redirection operators and their operands from the
argument list.

6. Executes the command (*note Executing Commands::).

7. Optionally waits for the command to complete and collects its exit
status (*note Exit Status::).

### 3.1.2 Quoting

Quoting is used to remove the special meaning of certain characters or
words to the shell. Quoting can be used to disable special treatment
for special characters, to prevent reserved words from being recognized
as such, and to prevent parameter expansion.

Each of the shell metacharacters (*note Definitions::) has special
meaning to the shell and must be quoted if it is to represent itself.
When the command history expansion facilities are being used (*note
History Interaction::), the HISTORY EXPANSION character, usually '!',
must be quoted to prevent history expansion. *Note Bash History
Facilities::, for more details concerning history expansion.

There are three quoting mechanisms: the ESCAPE CHARACTER, single
quotes, and double quotes.

#### 3.1.2.1 Escape Character

A non-quoted backslash '\' is the Bash escape character. It preserves
the literal value of the next character that follows, with the exception
of 'newline'. If a '\newline' pair appears, and the backslash itself is
not quoted, the '\newline' is treated as a line continuation (that is,
it is removed from the input stream and effectively ignored).

#### 3.1.2.2 Single Quotes

Enclosing characters in single quotes (''') preserves the literal value
of each character within the quotes. A single quote may not occur
between single quotes, even when preceded by a backslash.

#### 3.1.2.3 Double Quotes

Enclosing characters in double quotes ('"') preserves the literal value
of all characters within the quotes, with the exception of '$', '`',
'\', and, when history expansion is enabled, '!'. When the shell is in
POSIX mode (*note Bash POSIX Mode::), the '!' has no special meaning
within double quotes, even when history expansion is enabled. The
characters '$' and '`' retain their special meaning within double quotes
(*note Shell Expansions::). The backslash retains its special meaning
only when followed by one of the following characters: '$', '`', '"',
'\', or 'newline'. Within double quotes, backslashes that are followed
by one of these characters are removed. Backslashes preceding
characters without a special meaning are left unmodified. A double
quote may be quoted within double quotes by preceding it with a
backslash. If enabled, history expansion will be performed unless an
'!' appearing in double quotes is escaped using a backslash. The
backslash preceding the '!' is not removed.

The special parameters '*' and '@' have special meaning when in
double quotes (*note Shell Parameter Expansion::).

#### 3.1.2.4 ANSI-C Quoting

Words of the form '$'STRING'' are treated specially. The word expands
to STRING, with backslash-escaped characters replaced as specified by
the ANSI C standard. Backslash escape sequences, if present, are
decoded as follows:

'\a'
alert (bell)
'\b'
backspace
'\e'
'\E'
an escape character (not ANSI C)
'\f'
form feed
'\n'
newline
'\r'
carriage return
'\t'
horizontal tab
'\v'
vertical tab
'\\'
backslash
'\''
single quote
'\"'
double quote
'\?'
question mark
'\NNN'
the eight-bit character whose value is the octal value NNN (one to
three octal digits)
'\xHH'
the eight-bit character whose value is the hexadecimal value HH
(one or two hex digits)
'\uHHHH'
the Unicode (ISO/IEC 10646) character whose value is the
hexadecimal value HHHH (one to four hex digits)
'\UHHHHHHHH'
the Unicode (ISO/IEC 10646) character whose value is the
hexadecimal value HHHHHHHH (one to eight hex digits)
'\cX'
a control-X character

The expanded result is single-quoted, as if the dollar sign had not been
present.

#### 3.1.2.5 Locale-Specific Translation

A double-quoted string preceded by a dollar sign ('$') will cause the
string to be translated according to the current locale. The GETTEXT
infrastructure performs the message catalog lookup and translation,
using the 'LC_MESSAGES' and 'TEXTDOMAIN' shell variables, as explained
below. See the gettext documentation for additional details. If the
current locale is 'C' or 'POSIX', or if there are no translations
available, the dollar sign is ignored. If the string is translated and
replaced, the replacement is double-quoted.

Some systems use the message catalog selected by the 'LC_MESSAGES'
shell variable. Others create the name of the message catalog from the
value of the 'TEXTDOMAIN' shell variable, possibly adding a suffix of
'.mo'. If you use the 'TEXTDOMAIN' variable, you may need to set the
'TEXTDOMAINDIR' variable to the location of the message catalog files.
Still others use both variables in this fashion:
'TEXTDOMAINDIR'/'LC_MESSAGES'/LC_MESSAGES/'TEXTDOMAIN'.mo.

### 3.1.3 Comments

In a non-interactive shell, or an interactive shell in which the
'interactive_comments' option to the 'shopt' builtin is enabled (*note
The Shopt Builtin::), a word beginning with '#' causes that word and all
remaining characters on that line to be ignored. An interactive shell
without the 'interactive_comments' option enabled does not allow
comments. The 'interactive_comments' option is on by default in
interactive shells. *Note Interactive Shells::, for a description of
what makes a shell interactive.

## 3.2 Shell Commands

A simple shell command such as 'echo a b c' consists of the command
itself followed by arguments, separated by spaces.

More complex shell commands are composed of simple commands arranged
together in a variety of ways: in a pipeline in which the output of one
command becomes the input of a second, in a loop or conditional
construct, or in some other grouping.

### 3.2.1 Reserved Words

Reserved words are words that have special meaning to the shell. They
are used to begin and end the shell's compound commands.

The following words are recognized as reserved when unquoted and the
first word of a command (see below for exceptions):

'if'    'then'  'elif'  'else'  'fi'      'time'
'for'   'in'    'until' 'while' 'do'      'done'
'case'  'esac'  'coproc''select''function'
'{'     '}'     '[['    ']]'    '!'

'in' is recognized as a reserved word if it is the third word of a
'case' or 'select' command. 'in' and 'do' are recognized as reserved
words if they are the third word in a 'for' command.

### 3.2.2 Simple Commands

A simple command is the kind of command encountered most often. It's
just a sequence of words separated by 'blank's, terminated by one of the
shell's control operators (*note Definitions::). The first word
generally specifies a command to be executed, with the rest of the words
being that command's arguments.

The return status (*note Exit Status::) of a simple command is its
exit status as provided by the POSIX 1003.1 'waitpid' function, or 128+N
if the command was terminated by signal N.

### 3.2.3 Pipelines

A 'pipeline' is a sequence of one or more commands separated by one of
the control operators '|' or '|&'.

The format for a pipeline is
[time [-p]] [!] COMMAND1 [ | or |& COMMAND2 ] ...

The output of each command in the pipeline is connected via a pipe to
the input of the next command. That is, each command reads the previous
command's output. This connection is performed before any redirections
specified by the command.

If '|&' is used, COMMAND1's standard error, in addition to its
standard output, is connected to COMMAND2's standard input through the
pipe; it is shorthand for '2>&1 |'. This implicit redirection of the
standard error to the standard output is performed after any
redirections specified by the command.

The reserved word 'time' causes timing statistics to be printed for
the pipeline once it finishes. The statistics currently consist of
elapsed (wall-clock) time and user and system time consumed by the
command's execution. The '-p' option changes the output format to that
specified by POSIX. When the shell is in POSIX mode (*note Bash POSIX
Mode::), it does not recognize 'time' as a reserved word if the next
token begins with a '-'. The 'TIMEFORMAT' variable may be set to a
format string that specifies how the timing information should be
displayed. *Note Bash Variables::, for a description of the available
formats. The use of 'time' as a reserved word permits the timing of
shell builtins, shell functions, and pipelines. An external 'time'
command cannot time these easily.

When the shell is in POSIX mode (*note Bash POSIX Mode::), 'time' may
be followed by a newline. In this case, the shell displays the total
user and system time consumed by the shell and its children. The
'TIMEFORMAT' variable may be used to specify the format of the time
information.

If the pipeline is not executed asynchronously (*note Lists::), the
shell waits for all commands in the pipeline to complete.

Each command in a pipeline is executed in its own subshell, which is
a separate process (*note Command Execution Environment::). If the
'lastpipe' option is enabled using the 'shopt' builtin (*note The Shopt
Builtin::), the last element of a pipeline may be run by the shell
process.

The exit status of a pipeline is the exit status of the last command
in the pipeline, unless the 'pipefail' option is enabled (*note The Set
Builtin::). If 'pipefail' is enabled, the pipeline's return status is
the value of the last (rightmost) command to exit with a non-zero
status, or zero if all commands exit successfully. If the reserved word
'!' precedes the pipeline, the exit status is the logical negation of
the exit status as described above. The shell waits for all commands in
the pipeline to terminate before returning a value.

### 3.2.4 Lists of Commands

A 'list' is a sequence of one or more pipelines separated by one of the
operators ';', '&', '&&', or '||', and optionally terminated by one of
';', '&', or a 'newline'.

Of these list operators, '&&' and '||' have equal precedence,
followed by ';' and '&', which have equal precedence.

A sequence of one or more newlines may appear in a 'list' to delimit
commands, equivalent to a semicolon.

If a command is terminated by the control operator '&', the shell
executes the command asynchronously in a subshell. This is known as
executing the command in the BACKGROUND, and these are referred to as
ASYNCHRONOUS commands. The shell does not wait for the command to
finish, and the return status is 0 (true). When job control is not
active (*note Job Control::), the standard input for asynchronous
commands, in the absence of any explicit redirections, is redirected
from '/dev/null'.

Commands separated by a ';' are executed sequentially; the shell
waits for each command to terminate in turn. The return status is the
exit status of the last command executed.

AND and OR lists are sequences of one or more pipelines separated by
the control operators '&&' and '||', respectively. AND and OR lists are
executed with left associativity.

An AND list has the form
COMMAND1 && COMMAND2

COMMAND2 is executed if, and only if, COMMAND1 returns an exit status of
zero (success).

An OR list has the form
COMMAND1 || COMMAND2

COMMAND2 is executed if, and only if, COMMAND1 returns a non-zero exit
status.

The return status of AND and OR lists is the exit status of the last
command executed in the list.

### 3.2.5 Compound Commands

Compound commands are the shell programming language constructs. Each
construct begins with a reserved word or control operator and is
terminated by a corresponding reserved word or operator. Any
redirections (*note Redirections::) associated with a compound command
apply to all commands within that compound command unless explicitly
overridden.

In most cases a list of commands in a compound command's description
may be separated from the rest of the command by one or more newlines,
and may be followed by a newline in place of a semicolon.

Bash provides looping constructs, conditional commands, and
mechanisms to group commands and execute them as a unit.

#### 3.2.5.1 Looping Constructs

Bash supports the following looping constructs.

Note that wherever a ';' appears in the description of a command's
syntax, it may be replaced with one or more newlines.

'until'
The syntax of the 'until' command is:

until TEST-COMMANDS; do CONSEQUENT-COMMANDS; done

Execute CONSEQUENT-COMMANDS as long as TEST-COMMANDS has an exit
status which is not zero. The return status is the exit status of
the last command executed in CONSEQUENT-COMMANDS, or zero if none
was executed.

'while'
The syntax of the 'while' command is:

while TEST-COMMANDS; do CONSEQUENT-COMMANDS; done

Execute CONSEQUENT-COMMANDS as long as TEST-COMMANDS has an exit
status of zero. The return status is the exit status of the last
command executed in CONSEQUENT-COMMANDS, or zero if none was
executed.

'for'
The syntax of the 'for' command is:

for NAME [ [in [WORDS ...] ] ; ] do COMMANDS; done

Expand WORDS (*note Shell Expansions::), and execute COMMANDS once
for each member in the resultant list, with NAME bound to the
current member. If 'in WORDS' is not present, the 'for' command
executes the COMMANDS once for each positional parameter that is
set, as if 'in "$@"' had been specified (*note Special
Parameters::).

The return status is the exit status of the last command that
executes. If there are no items in the expansion of WORDS, no
commands are executed, and the return status is zero.

An alternate form of the 'for' command is also supported:

for (( EXPR1 ; EXPR2 ; EXPR3 )) ; do COMMANDS ; done

First, the arithmetic expression EXPR1 is evaluated according to
the rules described below (*note Shell Arithmetic::). The
arithmetic expression EXPR2 is then evaluated repeatedly until it
evaluates to zero. Each time EXPR2 evaluates to a non-zero value,
COMMANDS are executed and the arithmetic expression EXPR3 is
evaluated. If any expression is omitted, it behaves as if it
evaluates to 1. The return value is the exit status of the last
command in COMMANDS that is executed, or false if any of the
expressions is invalid.

The 'break' and 'continue' builtins (*note Bourne Shell Builtins::)
may be used to control loop execution.

#### 3.2.5.2 Conditional Constructs


'if'
The syntax of the 'if' command is:

if TEST-COMMANDS; then
CONSEQUENT-COMMANDS;
[elif MORE-TEST-COMMANDS; then
MORE-CONSEQUENTS;]
[else ALTERNATE-CONSEQUENTS;]
fi

The TEST-COMMANDS list is executed, and if its return status is
zero, the CONSEQUENT-COMMANDS list is executed. If TEST-COMMANDS
returns a non-zero status, each 'elif' list is executed in turn,
and if its exit status is zero, the corresponding MORE-CONSEQUENTS
is executed and the command completes. If 'else
ALTERNATE-CONSEQUENTS' is present, and the final command in the
final 'if' or 'elif' clause has a non-zero exit status, then
ALTERNATE-CONSEQUENTS is executed. The return status is the exit
status of the last command executed, or zero if no condition tested
true.

'case'
The syntax of the 'case' command is:

case WORD in
[ [(] PATTERN [| PATTERN]...) COMMAND-LIST ;;]...
esac

'case' will selectively execute the COMMAND-LIST corresponding to
the first PATTERN that matches WORD. The match is performed
according to the rules described below in *note Pattern Matching::.
If the 'nocasematch' shell option (see the description of 'shopt'
in *note The Shopt Builtin::) is enabled, the match is performed
without regard to the case of alphabetic characters. The '|' is
used to separate multiple patterns, and the ')' operator terminates
a pattern list. A list of patterns and an associated command-list
is known as a CLAUSE.

Each clause must be terminated with ';;', ';&', or ';;&'. The WORD
undergoes tilde expansion, parameter expansion, command
substitution, arithmetic expansion, and quote removal (*note Shell
Parameter Expansion::) before matching is attempted. Each PATTERN
undergoes tilde expansion, parameter expansion, command
substitution, and arithmetic expansion.

There may be an arbitrary number of 'case' clauses, each terminated
by a ';;', ';&', or ';;&'. The first pattern that matches
determines the command-list that is executed. It's a common idiom
to use '*' as the final pattern to define the default case, since
that pattern will always match.

Here is an example using 'case' in a script that could be used to
describe one interesting feature of an animal:

echo -n "Enter the name of an animal: "
read ANIMAL
echo -n "The $ANIMAL has "
case $ANIMAL in
horse | dog | cat) echo -n "four";;
man | kangaroo ) echo -n "two";;
*) echo -n "an unknown number of";;
esac
echo " legs."


If the ';;' operator is used, no subsequent matches are attempted
after the first pattern match. Using ';&' in place of ';;' causes
execution to continue with the COMMAND-LIST associated with the
next clause, if any. Using ';;&' in place of ';;' causes the shell
to test the patterns in the next clause, if any, and execute any
associated COMMAND-LIST on a successful match, continuing the case
statement execution as if the pattern list had not matched.

The return status is zero if no PATTERN is matched. Otherwise, the
return status is the exit status of the COMMAND-LIST executed.

'select'

The 'select' construct allows the easy generation of menus. It has
almost the same syntax as the 'for' command:

select NAME [in WORDS ...]; do COMMANDS; done

The list of words following 'in' is expanded, generating a list of
items. The set of expanded words is printed on the standard error
output stream, each preceded by a number. If the 'in WORDS' is
omitted, the positional parameters are printed, as if 'in "$@"' had
been specified. The 'PS3' prompt is then displayed and a line is
read from the standard input. If the line consists of a number
corresponding to one of the displayed words, then the value of NAME
is set to that word. If the line is empty, the words and prompt
are displayed again. If 'EOF' is read, the 'select' command
completes. Any other value read causes NAME to be set to null.
The line read is saved in the variable 'REPLY'.

The COMMANDS are executed after each selection until a 'break'
command is executed, at which point the 'select' command completes.

Here is an example that allows the user to pick a filename from the
current directory, and displays the name and index of the file
selected.

select fname in *;
do
echo you picked $fname \($REPLY\)
break;
done

'((...))'
(( EXPRESSION ))

The arithmetic EXPRESSION is evaluated according to the rules
described below (*note Shell Arithmetic::). If the value of the
expression is non-zero, the return status is 0; otherwise the
return status is 1. This is exactly equivalent to
let "EXPRESSION"
*Note Bash Builtins::, for a full description of the 'let' builtin.

'[[...]]'
[[ EXPRESSION ]]

Return a status of 0 or 1 depending on the evaluation of the
conditional expression EXPRESSION. Expressions are composed of the
primaries described below in *note Bash Conditional Expressions::.
Word splitting and filename expansion are not performed on the
words between the '[[' and ']]'; tilde expansion, parameter and
variable expansion, arithmetic expansion, command substitution,
process substitution, and quote removal are performed. Conditional
operators such as '-f' must be unquoted to be recognized as
primaries.

When used with '[[', the '<' and '>' operators sort
lexicographically using the current locale.

When the '==' and '!=' operators are used, the string to the right
of the operator is considered a pattern and matched according to
the rules described below in *note Pattern Matching::, as if the
'extglob' shell option were enabled. The '=' operator is identical
to '=='. If the 'nocasematch' shell option (see the description of
'shopt' in *note The Shopt Builtin::) is enabled, the match is
performed without regard to the case of alphabetic characters. The
return value is 0 if the string matches ('==') or does not match
('!=') the pattern, and 1 otherwise. Any part of the pattern may
be quoted to force the quoted portion to be matched as a string.

An additional binary operator, '=~', is available, with the same
precedence as '==' and '!='. When it is used, the string to the
right of the operator is considered a POSIX extended regular
expression and matched accordingly (using the POSIX 'regcomp' and
'regexec' interfaces usually described in regex(3)). The return
value is 0 if the string matches the pattern, and 1 otherwise. If
the regular expression is syntactically incorrect, the conditional
expression's return value is 2. If the 'nocasematch' shell option
(see the description of 'shopt' in *note The Shopt Builtin::) is
enabled, the match is performed without regard to the case of
alphabetic characters. Any part of the pattern may be quoted to
force the quoted portion to be matched as a string. Bracket
expressions in regular expressions must be treated carefully, since
normal quoting characters lose their meanings between brackets. If
the pattern is stored in a shell variable, quoting the variable
expansion forces the entire pattern to be matched as a string.

The pattern will match if it matches any part of the string.
Anchor the pattern using the '^' and '$' regular expression
operators to force it to match the entire string. The array
variable 'BASH_REMATCH' records which parts of the string matched
the pattern. The element of 'BASH_REMATCH' with index 0 contains
the portion of the string matching the entire regular expression.
Substrings matched by parenthesized subexpressions within the
regular expression are saved in the remaining 'BASH_REMATCH'
indices. The element of 'BASH_REMATCH' with index N is the portion
of the string matching the Nth parenthesized subexpression.

For example, the following will match a line (stored in the shell
variable LINE) if there is a sequence of characters anywhere in the
value consisting of any number, including zero, of characters in
the 'space' character class, zero or one instances of 'a', then a
'b':
[[ $line =~ [[:space:]]*(a)?b ]]

That means values like 'aab' and ' aaaaaab' will match, as will a
line containing a 'b' anywhere in its value.

Storing the regular expression in a shell variable is often a
useful way to avoid problems with quoting characters that are
special to the shell. It is sometimes difficult to specify a
regular expression literally without using quotes, or to keep track
of the quoting used by regular expressions while paying attention
to the shell's quote removal. Using a shell variable to store the
pattern decreases these problems. For example, the following is
equivalent to the above:
pattern='[[:space:]]*(a)?b'
[[ $line =~ $pattern ]]

If you want to match a character that's special to the regular
expression grammar, it has to be quoted to remove its special
meaning. This means that in the pattern 'xxx.txt', the '.' matches
any character in the string (its usual regular expression meaning),
but in the pattern '"xxx.txt"' it can only match a literal '.'.
Shell programmers should take special care with backslashes, since
backslashes are used both by the shell and regular expressions to
remove the special meaning from the following character. The
following two sets of commands are _not_ equivalent:
pattern='\.'

[[ . =~ $pattern ]]
[[ . =~ \. ]]

[[ . =~ "$pattern" ]]
[[ . =~ '\.' ]]

The first two matches will succeed, but the second two will not,
because in the second two the backslash will be part of the pattern
to be matched. In the first two examples, the backslash removes
the special meaning from '.', so the literal '.' matches. If the
string in the first examples were anything other than '.', say 'a',
the pattern would not match, because the quoted '.' in the pattern
loses its special meaning of matching any single character.

Expressions may be combined using the following operators, listed
in decreasing order of precedence:

'( EXPRESSION )'
Returns the value of EXPRESSION. This may be used to override
the normal precedence of operators.

'! EXPRESSION'
True if EXPRESSION is false.

'EXPRESSION1 && EXPRESSION2'
True if both EXPRESSION1 and EXPRESSION2 are true.

'EXPRESSION1 || EXPRESSION2'
True if either EXPRESSION1 or EXPRESSION2 is true.

The '&&' and '||' operators do not evaluate EXPRESSION2 if the
value of EXPRESSION1 is sufficient to determine the return value of
the entire conditional expression.

#### 3.2.5.3 Grouping Commands


Bash provides two ways to group a list of commands to be executed as a
unit. When commands are grouped, redirections may be applied to the
entire command list. For example, the output of all the commands in the
list may be redirected to a single stream.

'()'
( LIST )

Placing a list of commands between parentheses causes a subshell
environment to be created (*note Command Execution Environment::),
and each of the commands in LIST to be executed in that subshell.
Since the LIST is executed in a subshell, variable assignments do
not remain in effect after the subshell completes.

'{}'
{ LIST; }

Placing a list of commands between curly braces causes the list to
be executed in the current shell context. No subshell is created.
The semicolon (or newline) following LIST is required.

In addition to the creation of a subshell, there is a subtle
difference between these two constructs due to historical reasons. The
braces are 'reserved words', so they must be separated from the LIST by
'blank's or other shell metacharacters. The parentheses are
'operators', and are recognized as separate tokens by the shell even if
they are not separated from the LIST by whitespace.

The exit status of both of these constructs is the exit status of
LIST.

### 3.2.6 Coprocesses

A 'coprocess' is a shell command preceded by the 'coproc' reserved word.
A coprocess is executed asynchronously in a subshell, as if the command
had been terminated with the '&' control operator, with a two-way pipe
established between the executing shell and the coprocess.

The format for a coprocess is:
coproc [NAME] COMMAND [REDIRECTIONS]

This creates a coprocess named NAME. If NAME is not supplied, the
default name is COPROC. NAME must not be supplied if COMMAND is a
simple command (*note Simple Commands::); otherwise, it is interpreted
as the first word of the simple command.

When the coprocess is executed, the shell creates an array variable
(*note Arrays::) named 'NAME' in the context of the executing shell.
The standard output of COMMAND is connected via a pipe to a file
descriptor in the executing shell, and that file descriptor is assigned
to 'NAME'[0]. The standard input of COMMAND is connected via a pipe to
a file descriptor in the executing shell, and that file descriptor is
assigned to 'NAME'[1]. This pipe is established before any redirections
specified by the command (*note Redirections::). The file descriptors
can be utilized as arguments to shell commands and redirections using
standard word expansions. Other than those created to execute command
and process substitutions, the file descriptors are not available in
subshells.

The process ID of the shell spawned to execute the coprocess is
available as the value of the variable 'NAME'_PID. The 'wait' builtin
command may be used to wait for the coprocess to terminate.

Since the coprocess is created as an asynchronous command, the
'coproc' command always returns success. The return status of a
coprocess is the exit status of COMMAND.

### 3.2.7 GNU Parallel

There are ways to run commands in parallel that are not built into Bash.
GNU Parallel is a tool to do just that.

GNU Parallel, as its name suggests, can be used to build and run
commands in parallel. You may run the same command with different
arguments, whether they are filenames, usernames, hostnames, or lines
read from files. GNU Parallel provides shorthand references to many of
the most common operations (input lines, various portions of the input
line, different ways to specify the input source, and so on). Parallel
can replace 'xargs' or feed commands from its input sources to several
different instances of Bash.

For a complete description, refer to the GNU Parallel documentation.
A few examples should provide a brief introduction to its use.

For example, it is easy to replace 'xargs' to gzip all html files in
the current directory and its subdirectories:
find . -type f -name '*.html' -print | parallel gzip
If you need to protect special characters such as newlines in file
names, use find's '-print0' option and parallel's '-0' option.

You can use Parallel to move files from the current directory when
the number of files is too large to process with one 'mv' invocation:
printf '%s\n' * | parallel mv {} destdir

As you can see, the {} is replaced with each line read from standard
input. While using 'ls' will work in most instances, it is not
sufficient to deal with all filenames. 'printf' is a shell builtin, and
therefore is not subject to the kernel's limit on the number of
arguments to a program, so you can use '*' (but see below about the
'dotglob' shell option). If you need to accommodate special characters
in filenames, you can use

printf '%s\0' * | parallel -0 mv {} destdir

as alluded to above.

This will run as many 'mv' commands as there are files in the current
directory. You can emulate a parallel 'xargs' by adding the '-X'
option:
printf '%s\0' * | parallel -0 -X mv {} destdir

(You may have to modify the pattern if you have the 'dotglob' option
enabled.)

GNU Parallel can replace certain common idioms that operate on lines
read from a file (in this case, filenames listed one per line):
while IFS= read -r x; do
do-something1 "$x" "config-$x"
do-something2 < "$x"
done < file | process-output

with a more compact syntax reminiscent of lambdas:
cat list | parallel "do-something1 {} config-{} ; do-something2 < {}" |
process-output

Parallel provides a built-in mechanism to remove filename extensions,
which lends itself to batch file transformations or renaming:
ls *.gz | parallel -j+0 "zcat {} | bzip2 >{.}.bz2 && rm {}"
This will recompress all files in the current directory with names
ending in .gz using bzip2, running one job per CPU (-j+0) in parallel.
(We use 'ls' for brevity here; using 'find' as above is more robust in
the face of filenames containing unexpected characters.)  Parallel can
take arguments from the command line; the above can also be written as

parallel "zcat {} | bzip2 >{.}.bz2 && rm {}" ::: *.gz

If a command generates output, you may want to preserve the input
order in the output. For instance, the following command
{
echo foss.org.my ;
echo debian.org ;
echo freenetproject.org ;
} | parallel traceroute
will display as output the traceroute invocation that finishes first.
Adding the '-k' option
{
echo foss.org.my ;
echo debian.org ;
echo freenetproject.org ;
} | parallel -k traceroute
will ensure that the output of 'traceroute foss.org.my' is displayed
first.

Finally, Parallel can be used to run a sequence of shell commands in
parallel, similar to 'cat file | bash'. It is not uncommon to take a
list of filenames, create a series of shell commands to operate on them,
and feed that list of commands to a shell. Parallel can speed this up.
Assuming that 'file' contains a list of shell commands, one per line,

parallel -j 10 < file

will evaluate the commands using the shell (since no explicit command is
supplied as an argument), in blocks of ten shell jobs at a time.

## 3.3 Shell Functions

Shell functions are a way to group commands for later execution using a
single name for the group. They are executed just like a "regular"
command. When the name of a shell function is used as a simple command
name, the list of commands associated with that function name is
executed. Shell functions are executed in the current shell context; no
new process is created to interpret them.

Functions are declared using this syntax:
FNAME () COMPOUND-COMMAND [ REDIRECTIONS ]

or

function FNAME [()] COMPOUND-COMMAND [ REDIRECTIONS ]

This defines a shell function named FNAME. The reserved word
'function' is optional. If the 'function' reserved word is supplied,
the parentheses are optional. The BODY of the function is the compound
command COMPOUND-COMMAND (*note Compound Commands::). That command is
usually a LIST enclosed between { and }, but may be any compound command
listed above, with one exception: If the 'function' reserved word is
used, but the parentheses are not supplied, the braces are required.
COMPOUND-COMMAND is executed whenever FNAME is specified as the name of
a command. When the shell is in POSIX mode (*note Bash POSIX Mode::),
FNAME must be a valid shell NAME and may not be the same as one of the
special builtins (*note Special Builtins::). In default mode, a
function name can be any unquoted shell word that does not contain '$'.
Any redirections (*note Redirections::) associated with the shell
function are performed when the function is executed. A function
definition may be deleted using the '-f' option to the 'unset' builtin
(*note Bourne Shell Builtins::).

The exit status of a function definition is zero unless a syntax
error occurs or a readonly function with the same name already exists.
When executed, the exit status of a function is the exit status of the
last command executed in the body.

Note that for historical reasons, in the most common usage the curly
braces that surround the body of the function must be separated from the
body by 'blank's or newlines. This is because the braces are reserved
words and are only recognized as such when they are separated from the
command list by whitespace or another shell metacharacter. Also, when
using the braces, the LIST must be terminated by a semicolon, a '&', or
a newline.

When a function is executed, the arguments to the function become the
positional parameters during its execution (*note Positional
Parameters::). The special parameter '#' that expands to the number of
positional parameters is updated to reflect the change. Special
parameter '0' is unchanged. The first element of the 'FUNCNAME'
variable is set to the name of the function while the function is
executing.

All other aspects of the shell execution environment are identical
between a function and its caller with these exceptions: the 'DEBUG' and
'RETURN' traps are not inherited unless the function has been given the
'trace' attribute using the 'declare' builtin or the '-o functrace'
option has been enabled with the 'set' builtin, (in which case all
functions inherit the 'DEBUG' and 'RETURN' traps), and the 'ERR' trap is
not inherited unless the '-o errtrace' shell option has been enabled.
*Note Bourne Shell Builtins::, for the description of the 'trap'
builtin.

The 'FUNCNEST' variable, if set to a numeric value greater than 0,
defines a maximum function nesting level. Function invocations that
exceed the limit cause the entire command to abort.

If the builtin command 'return' is executed in a function, the
function completes and execution resumes with the next command after the
function call. Any command associated with the 'RETURN' trap is
executed before execution resumes. When a function completes, the
values of the positional parameters and the special parameter '#' are
restored to the values they had prior to the function's execution. If a
numeric argument is given to 'return', that is the function's return
status; otherwise the function's return status is the exit status of the
last command executed before the 'return'.

Variables local to the function may be declared with the 'local'
builtin. These variables are visible only to the function and the
commands it invokes. This is particularly important when a shell
function calls other functions.

Local variables "shadow" variables with the same name declared at
previous scopes. For instance, a local variable declared in a function
hides a global variable of the same name: references and assignments
refer to the local variable, leaving the global variable unmodified.
When the function returns, the global variable is once again visible.

The shell uses DYNAMIC SCOPING to control a variable's visibility
within functions. With dynamic scoping, visible variables and their
values are a result of the sequence of function calls that caused
execution to reach the current function. The value of a variable that a
function sees depends on its value within its caller, if any, whether
that caller is the "global" scope or another shell function. This is
also the value that a local variable declaration "shadows", and the
value that is restored when the function returns.

For example, if a variable VAR is declared as local in function
FUNC1, and FUNC1 calls another function FUNC2, references to VAR made
from within FUNC2 will resolve to the local variable VAR from FUNC1,
shadowing any global variable named VAR.

The following script demonstrates this behavior. When executed, the
script displays

In func2, var = func1 local

func1()
{
local var='func1 local'
func2
}

func2()
{
echo "In func2, var = $var"
}

var=global
func1

The 'unset' builtin also acts using the same dynamic scope: if a
variable is local to the current scope, 'unset' will unset it; otherwise
the unset will refer to the variable found in any calling scope as
described above. If a variable at the current local scope is unset, it
will remain so until it is reset in that scope or until the function
returns. Once the function returns, any instance of the variable at a
previous scope will become visible. If the unset acts on a variable at
a previous scope, any instance of a variable with that name that had
been shadowed will become visible.

Function names and definitions may be listed with the '-f' option to
the 'declare' ('typeset') builtin command (*note Bash Builtins::). The
'-F' option to 'declare' or 'typeset' will list the function names only
(and optionally the source file and line number, if the 'extdebug' shell
option is enabled). Functions may be exported so that subshells
automatically have them defined with the '-f' option to the 'export'
builtin (*note Bourne Shell Builtins::).

Functions may be recursive. The 'FUNCNEST' variable may be used to
limit the depth of the function call stack and restrict the number of
function invocations. By default, no limit is placed on the number of
recursive calls.

## 3.4 Shell Parameters

A PARAMETER is an entity that stores values. It can be a 'name', a
number, or one of the special characters listed below. A VARIABLE is a
parameter denoted by a 'name'. A variable has a VALUE and zero or more
ATTRIBUTES. Attributes are assigned using the 'declare' builtin command
(see the description of the 'declare' builtin in *note Bash Builtins::).

A parameter is set if it has been assigned a value. The null string
is a valid value. Once a variable is set, it may be unset only by using
the 'unset' builtin command.

A variable may be assigned to by a statement of the form
NAME=[VALUE]
If VALUE is not given, the variable is assigned the null string. All
VALUEs undergo tilde expansion, parameter and variable expansion,
command substitution, arithmetic expansion, and quote removal (detailed
below). If the variable has its 'integer' attribute set, then VALUE is
evaluated as an arithmetic expression even if the '$((...))' expansion
is not used (*note Arithmetic Expansion::). Word splitting is not
performed, with the exception of '"$@"' as explained below. Filename
expansion is not performed. Assignment statements may also appear as
arguments to the 'alias', 'declare', 'typeset', 'export', 'readonly',
and 'local' builtin commands (DECLARATION commands). When in POSIX mode
(*note Bash POSIX Mode::), these builtins may appear in a command after
one or more instances of the 'command' builtin and retain these
assignment statement properties.

In the context where an assignment statement is assigning a value to
a shell variable or array index (*note Arrays::), the '+=' operator can
be used to append to or add to the variable's previous value. This
includes arguments to builtin commands such as 'declare' that accept
assignment statements (DECLARATION commands). When '+=' is applied to a
variable for which the INTEGER attribute has been set, VALUE is
evaluated as an arithmetic expression and added to the variable's
current value, which is also evaluated. When '+=' is applied to an
array variable using compound assignment (*note Arrays::), the
variable's value is not unset (as it is when using '='), and new values
are appended to the array beginning at one greater than the array's
maximum index (for indexed arrays), or added as additional key-value
pairs in an associative array. When applied to a string-valued
variable, VALUE is expanded and appended to the variable's value.

A variable can be assigned the NAMEREF attribute using the '-n'
option to the 'declare' or 'local' builtin commands (*note Bash
Builtins::) to create a NAMEREF, or a reference to another variable.
This allows variables to be manipulated indirectly. Whenever the
nameref variable is referenced, assigned to, unset, or has its
attributes modified (other than using or changing the nameref attribute
itself), the operation is actually performed on the variable specified
by the nameref variable's value. A nameref is commonly used within
shell functions to refer to a variable whose name is passed as an
argument to the function. For instance, if a variable name is passed to
a shell function as its first argument, running
declare -n ref=$1
inside the function creates a nameref variable REF whose value is the
variable name passed as the first argument. References and assignments
to REF, and changes to its attributes, are treated as references,
assignments, and attribute modifications to the variable whose name was
passed as '$1'.

If the control variable in a 'for' loop has the nameref attribute,
the list of words can be a list of shell variables, and a name reference
will be established for each word in the list, in turn, when the loop is
executed. Array variables cannot be given the nameref attribute.
However, nameref variables can reference array variables and subscripted
array variables. Namerefs can be unset using the '-n' option to the
'unset' builtin (*note Bourne Shell Builtins::). Otherwise, if 'unset'
is executed with the name of a nameref variable as an argument, the
variable referenced by the nameref variable will be unset.

### 3.4.1 Positional Parameters

A POSITIONAL PARAMETER is a parameter denoted by one or more digits,
other than the single digit '0'. Positional parameters are assigned
from the shell's arguments when it is invoked, and may be reassigned
using the 'set' builtin command. Positional parameter 'N' may be
referenced as '${N}', or as '$N' when 'N' consists of a single digit.
Positional parameters may not be assigned to with assignment statements.
The 'set' and 'shift' builtins are used to set and unset them (*note
Shell Builtin Commands::). The positional parameters are temporarily
replaced when a shell function is executed (*note Shell Functions::).

When a positional parameter consisting of more than a single digit is
expanded, it must be enclosed in braces.

### 3.4.2 Special Parameters

The shell treats several parameters specially. These parameters may
only be referenced; assignment to them is not allowed.

'*'
($*) Expands to the positional parameters, starting from one. When
the expansion is not within double quotes, each positional
parameter expands to a separate word. In contexts where it is
performed, those words are subject to further word splitting and
filename expansion. When the expansion occurs within double
quotes, it expands to a single word with the value of each
parameter separated by the first character of the 'IFS' special
variable. That is, '"$*"' is equivalent to '"$1C$2C..."', where C
is the first character of the value of the 'IFS' variable. If
'IFS' is unset, the parameters are separated by spaces. If 'IFS'
is null, the parameters are joined without intervening separators.

'@'
($@) Expands to the positional parameters, starting from one. In
contexts where word splitting is performed, this expands each
positional parameter to a separate word; if not within double
quotes, these words are subject to word splitting. In contexts
where word splitting is not performed, this expands to a single
word with each positional parameter separated by a space. When the
expansion occurs within double quotes, and word splitting is
performed, each parameter expands to a separate word. That is,
'"$@"' is equivalent to '"$1" "$2" ...'. If the double-quoted
expansion occurs within a word, the expansion of the first
parameter is joined with the beginning part of the original word,
and the expansion of the last parameter is joined with the last
part of the original word. When there are no positional
parameters, '"$@"' and '$@' expand to nothing (i.e., they are
removed).

'#'
($#) Expands to the number of positional parameters in decimal.

'?'
($?)  Expands to the exit status of the most recently executed
foreground pipeline.

'-'
($-, a hyphen.)  Expands to the current option flags as specified
upon invocation, by the 'set' builtin command, or those set by the
shell itself (such as the '-i' option).

'$'
($$) Expands to the process ID of the shell. In a '()' subshell,
it expands to the process ID of the invoking shell, not the
subshell.

'!'
($!)  Expands to the process ID of the job most recently placed
into the background, whether executed as an asynchronous command or
using the 'bg' builtin (*note Job Control Builtins::).

'0'
($0) Expands to the name of the shell or shell script. This is set
at shell initialization. If Bash is invoked with a file of
commands (*note Shell Scripts::), '$0' is set to the name of that
file. If Bash is started with the '-c' option (*note Invoking
Bash::), then '$0' is set to the first argument after the string to
be executed, if one is present. Otherwise, it is set to the
filename used to invoke Bash, as given by argument zero.

## 3.5 Shell Expansions

Expansion is performed on the command line after it has been split into
'token's. There are seven kinds of expansion performed:

* brace expansion
* tilde expansion
* parameter and variable expansion
* command substitution
* arithmetic expansion
* word splitting
* filename expansion

The order of expansions is: brace expansion; tilde expansion,
parameter and variable expansion, arithmetic expansion, and command
substitution (done in a left-to-right fashion); word splitting; and
filename expansion.

On systems that can support it, there is an additional expansion
available: PROCESS SUBSTITUTION. This is performed at the same time as
tilde, parameter, variable, and arithmetic expansion and command
substitution.

After these expansions are performed, quote characters present in the
original word are removed unless they have been quoted themselves (QUOTE
REMOVAL).

Only brace expansion, word splitting, and filename expansion can
increase the number of words of the expansion; other expansions expand a
single word to a single word. The only exceptions to this are the
expansions of '"$@"' and '$*' (*note Special Parameters::), and
'"${NAME[@]}"' and '${NAME[*]}' (*note Arrays::).

After all expansions, 'quote removal' (*note Quote Removal::) is
performed.

### 3.5.1 Brace Expansion

Brace expansion is a mechanism by which arbitrary strings may be
generated. This mechanism is similar to FILENAME EXPANSION (*note
Filename Expansion::), but the filenames generated need not exist.
Patterns to be brace expanded take the form of an optional PREAMBLE,
followed by either a series of comma-separated strings or a sequence
expression between a pair of braces, followed by an optional POSTSCRIPT.
The preamble is prefixed to each string contained within the braces, and
the postscript is then appended to each resulting string, expanding left
to right.

Brace expansions may be nested. The results of each expanded string
are not sorted; left to right order is preserved. For example,
bash$ echo a{d,c,b}e
ade ace abe

A sequence expression takes the form '{X..Y[..INCR]}', where X and Y
are either integers or single characters, and INCR, an optional
increment, is an integer. When integers are supplied, the expression
expands to each number between X and Y, inclusive. Supplied integers
may be prefixed with '0' to force each term to have the same width.
When either X or Y begins with a zero, the shell attempts to force all
generated terms to contain the same number of digits, zero-padding where
necessary. When characters are supplied, the expression expands to each
character lexicographically between X and Y, inclusive, using the
default C locale. Note that both X and Y must be of the same type.
When the increment is supplied, it is used as the difference between
each term. The default increment is 1 or -1 as appropriate.

Brace expansion is performed before any other expansions, and any
characters special to other expansions are preserved in the result. It
is strictly textual. Bash does not apply any syntactic interpretation
to the context of the expansion or the text between the braces.

A correctly-formed brace expansion must contain unquoted opening and
closing braces, and at least one unquoted comma or a valid sequence
expression. Any incorrectly formed brace expansion is left unchanged.

A { or ',' may be quoted with a backslash to prevent its being
considered part of a brace expression. To avoid conflicts with
parameter expansion, the string '${' is not considered eligible for
brace expansion, and inhibits brace expansion until the closing '}'.

This construct is typically used as shorthand when the common prefix
of the strings to be generated is longer than in the above example:
mkdir /usr/local/src/bash/{old,new,dist,bugs}
or
chown root /usr/{ucb/{ex,edit},lib/{ex?.?*,how_ex}}

### 3.5.2 Tilde Expansion

If a word begins with an unquoted tilde character ('~'), all of the
characters up to the first unquoted slash (or all characters, if there
is no unquoted slash) are considered a TILDE-PREFIX. If none of the
characters in the tilde-prefix are quoted, the characters in the
tilde-prefix following the tilde are treated as a possible LOGIN NAME.
If this login name is the null string, the tilde is replaced with the
value of the 'HOME' shell variable. If 'HOME' is unset, the home
directory of the user executing the shell is substituted instead.
Otherwise, the tilde-prefix is replaced with the home directory
associated with the specified login name.

If the tilde-prefix is '~+', the value of the shell variable 'PWD'
replaces the tilde-prefix. If the tilde-prefix is '~-', the value of
the shell variable 'OLDPWD', if it is set, is substituted.

If the characters following the tilde in the tilde-prefix consist of
a number N, optionally prefixed by a '+' or a '-', the tilde-prefix is
replaced with the corresponding element from the directory stack, as it
would be displayed by the 'dirs' builtin invoked with the characters
following tilde in the tilde-prefix as an argument (*note The Directory
Stack::). If the tilde-prefix, sans the tilde, consists of a number
without a leading '+' or '-', '+' is assumed.

If the login name is invalid, or the tilde expansion fails, the word
is left unchanged.

Each variable assignment is checked for unquoted tilde-prefixes
immediately following a ':' or the first '='. In these cases, tilde
expansion is also performed. Consequently, one may use filenames with
tildes in assignments to 'PATH', 'MAILPATH', and 'CDPATH', and the shell
assigns the expanded value.

The following table shows how Bash treats unquoted tilde-prefixes:

'~'
The value of '$HOME'
'~/foo'
'$HOME/foo'

'~fred/foo'
The subdirectory 'foo' of the home directory of the user 'fred'

'~+/foo'
'$PWD/foo'

'~-/foo'
'${OLDPWD-'~-'}/foo'

'~N'
The string that would be displayed by 'dirs +N'

'~+N'
The string that would be displayed by 'dirs +N'

'~-N'
The string that would be displayed by 'dirs -N'

Bash also performs tilde expansion on words satisfying the conditions
of variable assignments (*note Shell Parameters::) when they appear as
arguments to simple commands. Bash does not do this, except for the
DECLARATION commands listed above, when in POSIX mode.

### 3.5.3 Shell Parameter Expansion

The '$' character introduces parameter expansion, command substitution,
or arithmetic expansion. The parameter name or symbol to be expanded
may be enclosed in braces, which are optional but serve to protect the
variable to be expanded from characters immediately following it which
could be interpreted as part of the name.

When braces are used, the matching ending brace is the first '}' not
escaped by a backslash or within a quoted string, and not within an
embedded arithmetic expansion, command substitution, or parameter
expansion.

The basic form of parameter expansion is ${PARAMETER}. The value of
PARAMETER is substituted. The PARAMETER is a shell parameter as
described above (*note Shell Parameters::) or an array reference (*note
Arrays::). The braces are required when PARAMETER is a positional
parameter with more than one digit, or when PARAMETER is followed by a
character that is not to be interpreted as part of its name.

If the first character of PARAMETER is an exclamation point (!), and
PARAMETER is not a NAMEREF, it introduces a level of indirection. Bash
uses the value formed by expanding the rest of PARAMETER as the new
PARAMETER; this is then expanded and that value is used in the rest of
the expansion, rather than the expansion of the original PARAMETER.
This is known as 'indirect expansion'. The value is subject to tilde
expansion, parameter expansion, command substitution, and arithmetic
expansion. If PARAMETER is a nameref, this expands to the name of the
variable referenced by PARAMETER instead of performing the complete
indirect expansion. The exceptions to this are the expansions of
${!PREFIX*} and ${!NAME[@]} described below. The exclamation point must
immediately follow the left brace in order to introduce indirection.

In each of the cases below, WORD is subject to tilde expansion,
parameter expansion, command substitution, and arithmetic expansion.

When not performing substring expansion, using the form described
below (e.g., ':-'), Bash tests for a parameter that is unset or null.
Omitting the colon results in a test only for a parameter that is unset.
Put another way, if the colon is included, the operator tests for both
PARAMETER's existence and that its value is not null; if the colon is
omitted, the operator tests only for existence.

'${PARAMETER:-WORD}'
If PARAMETER is unset or null, the expansion of WORD is
substituted. Otherwise, the value of PARAMETER is substituted.

'${PARAMETER:=WORD}'
If PARAMETER is unset or null, the expansion of WORD is assigned to
PARAMETER. The value of PARAMETER is then substituted. Positional
parameters and special parameters may not be assigned to in this
way.

'${PARAMETER:?WORD}'
If PARAMETER is null or unset, the expansion of WORD (or a message
to that effect if WORD is not present) is written to the standard
error and the shell, if it is not interactive, exits. Otherwise,
the value of PARAMETER is substituted.

'${PARAMETER:+WORD}'
If PARAMETER is null or unset, nothing is substituted, otherwise
the expansion of WORD is substituted.

'${PARAMETER:OFFSET}'
'${PARAMETER:OFFSET:LENGTH}'
This is referred to as Substring Expansion. It expands to up to
LENGTH characters of the value of PARAMETER starting at the
character specified by OFFSET. If PARAMETER is '@', an indexed
array subscripted by '@' or '*', or an associative array name, the
results differ as described below. If LENGTH is omitted, it
expands to the substring of the value of PARAMETER starting at the
character specified by OFFSET and extending to the end of the
value. LENGTH and OFFSET are arithmetic expressions (*note Shell
Arithmetic::).

If OFFSET evaluates to a number less than zero, the value is used
as an offset in characters from the end of the value of PARAMETER.
If LENGTH evaluates to a number less than zero, it is interpreted
as an offset in characters from the end of the value of PARAMETER
rather than a number of characters, and the expansion is the
characters between OFFSET and that result. Note that a negative
offset must be separated from the colon by at least one space to
avoid being confused with the ':-' expansion.

Here are some examples illustrating substring expansion on
parameters and subscripted arrays:

$ string=01234567890abcdefgh
$ echo ${string:7}
7890abcdefgh
$ echo ${string:7:0}

$ echo ${string:7:2}
78
$ echo ${string:7:-2}
7890abcdef
$ echo ${string: -7}
bcdefgh
$ echo ${string: -7:0}

$ echo ${string: -7:2}
bc
$ echo ${string: -7:-2}
bcdef
$ set -- 01234567890abcdefgh
$ echo ${1:7}
7890abcdefgh
$ echo ${1:7:0}

$ echo ${1:7:2}
78
$ echo ${1:7:-2}
7890abcdef
$ echo ${1: -7}
bcdefgh
$ echo ${1: -7:0}

$ echo ${1: -7:2}
bc
$ echo ${1: -7:-2}
bcdef
$ array[0]=01234567890abcdefgh
$ echo ${array[0]:7}
7890abcdefgh
$ echo ${array[0]:7:0}

$ echo ${array[0]:7:2}
78
$ echo ${array[0]:7:-2}
7890abcdef
$ echo ${array[0]: -7}
bcdefgh
$ echo ${array[0]: -7:0}

$ echo ${array[0]: -7:2}
bc
$ echo ${array[0]: -7:-2}
bcdef

If PARAMETER is '@', the result is LENGTH positional parameters
beginning at OFFSET. A negative OFFSET is taken relative to one
greater than the greatest positional parameter, so an offset of -1
evaluates to the last positional parameter. It is an expansion
error if LENGTH evaluates to a number less than zero.

The following examples illustrate substring expansion using
positional parameters:

$ set -- 1 2 3 4 5 6 7 8 9 0 a b c d e f g h
$ echo ${@:7}
7 8 9 0 a b c d e f g h
$ echo ${@:7:0}

$ echo ${@:7:2}
7 8
$ echo ${@:7:-2}
bash: -2: substring expression < 0
$ echo ${@: -7:2}
b c
$ echo ${@:0}
./bash 1 2 3 4 5 6 7 8 9 0 a b c d e f g h
$ echo ${@:0:2}
./bash 1
$ echo ${@: -7:0}


If PARAMETER is an indexed array name subscripted by '@' or '*',
the result is the LENGTH members of the array beginning with
'${PARAMETER[OFFSET]}'. A negative OFFSET is taken relative to one
greater than the maximum index of the specified array. It is an
expansion error if LENGTH evaluates to a number less than zero.

These examples show how you can use substring expansion with
indexed arrays:

$ array=(0 1 2 3 4 5 6 7 8 9 0 a b c d e f g h)
$ echo ${array[@]:7}
7 8 9 0 a b c d e f g h
$ echo ${array[@]:7:2}
7 8
$ echo ${array[@]: -7:2}
b c
$ echo ${array[@]: -7:-2}
bash: -2: substring expression < 0
$ echo ${array[@]:0}
0 1 2 3 4 5 6 7 8 9 0 a b c d e f g h
$ echo ${array[@]:0:2}
0 1
$ echo ${array[@]: -7:0}


Substring expansion applied to an associative array produces
undefined results.

Substring indexing is zero-based unless the positional parameters
are used, in which case the indexing starts at 1 by default. If
OFFSET is 0, and the positional parameters are used, '$0' is
prefixed to the list.

'${!PREFIX*}'
'${!PREFIX@}'
Expands to the names of variables whose names begin with PREFIX,
separated by the first character of the 'IFS' special variable.
When '@' is used and the expansion appears within double quotes,
each variable name expands to a separate word.

'${!NAME[@]}'
'${!NAME[*]}'
If NAME is an array variable, expands to the list of array indices
(keys) assigned in NAME. If NAME is not an array, expands to 0 if
NAME is set and null otherwise. When '@' is used and the expansion
appears within double quotes, each key expands to a separate word.

'${#PARAMETER}'
The length in characters of the expanded value of PARAMETER is
substituted. If PARAMETER is '*' or '@', the value substituted is
the number of positional parameters. If PARAMETER is an array name
subscripted by '*' or '@', the value substituted is the number of
elements in the array. If PARAMETER is an indexed array name
subscripted by a negative number, that number is interpreted as
relative to one greater than the maximum index of PARAMETER, so
negative indices count back from the end of the array, and an index
of -1 references the last element.

'${PARAMETER#WORD}'
'${PARAMETER##WORD}'
The WORD is expanded to produce a pattern and matched according to
the rules described below (*note Pattern Matching::). If the
pattern matches the beginning of the expanded value of PARAMETER,
then the result of the expansion is the expanded value of PARAMETER
with the shortest matching pattern (the '#' case) or the longest
matching pattern (the '##' case) deleted. If PARAMETER is '@' or
'*', the pattern removal operation is applied to each positional
parameter in turn, and the expansion is the resultant list. If
PARAMETER is an array variable subscripted with '@' or '*', the
pattern removal operation is applied to each member of the array in
turn, and the expansion is the resultant list.

'${PARAMETER%WORD}'
'${PARAMETER%%WORD}'
The WORD is expanded to produce a pattern and matched according to
the rules described below (*note Pattern Matching::). If the
pattern matches a trailing portion of the expanded value of
PARAMETER, then the result of the expansion is the value of
PARAMETER with the shortest matching pattern (the '%' case) or the
longest matching pattern (the '%%' case) deleted. If PARAMETER is
'@' or '*', the pattern removal operation is applied to each
positional parameter in turn, and the expansion is the resultant
list. If PARAMETER is an array variable subscripted with '@' or
'*', the pattern removal operation is applied to each member of the
array in turn, and the expansion is the resultant list.

'${PARAMETER/PATTERN/STRING}'

The PATTERN is expanded to produce a pattern just as in filename
expansion. PARAMETER is expanded and the longest match of PATTERN
against its value is replaced with STRING. The match is performed
according to the rules described below (*note Pattern Matching::).
If PATTERN begins with '/', all matches of PATTERN are replaced
with STRING. Normally only the first match is replaced. If
PATTERN begins with '#', it must match at the beginning of the
expanded value of PARAMETER. If PATTERN begins with '%', it must
match at the end of the expanded value of PARAMETER. If STRING is
null, matches of PATTERN are deleted and the '/' following PATTERN
may be omitted. If the 'nocasematch' shell option (see the
description of 'shopt' in *note The Shopt Builtin::) is enabled,
the match is performed without regard to the case of alphabetic
characters. If PARAMETER is '@' or '*', the substitution operation
is applied to each positional parameter in turn, and the expansion
is the resultant list. If PARAMETER is an array variable
subscripted with '@' or '*', the substitution operation is applied
to each member of the array in turn, and the expansion is the
resultant list.

'${PARAMETER^PATTERN}'
'${PARAMETER^^PATTERN}'
'${PARAMETER,PATTERN}'
'${PARAMETER,,PATTERN}'
This expansion modifies the case of alphabetic characters in
PARAMETER. The PATTERN is expanded to produce a pattern just as in
filename expansion. Each character in the expanded value of
PARAMETER is tested against PATTERN, and, if it matches the
pattern, its case is converted. The pattern should not attempt to
match more than one character. The '^' operator converts lowercase
letters matching PATTERN to uppercase; the ',' operator converts
matching uppercase letters to lowercase. The '^^' and ',,'
expansions convert each matched character in the expanded value;
the '^' and ',' expansions match and convert only the first
character in the expanded value. If PATTERN is omitted, it is
treated like a '?', which matches every character. If PARAMETER is
'@' or '*', the case modification operation is applied to each
positional parameter in turn, and the expansion is the resultant
list. If PARAMETER is an array variable subscripted with '@' or
'*', the case modification operation is applied to each member of
the array in turn, and the expansion is the resultant list.

'${PARAMETER@OPERATOR}'
The expansion is either a transformation of the value of PARAMETER
or information about PARAMETER itself, depending on the value of
OPERATOR. Each OPERATOR is a single letter:

'U'
The expansion is a string that is the value of PARAMETER with
lowercase alphabetic characters converted to uppercase.
'u'
The expansion is a string that is the value of PARAMETER with
the first character converted to uppercase, if it is
alphabetic.
'L'
The expansion is a string that is the value of PARAMETER with
uppercase alphabetic characters converted to lowercase.
'Q'
The expansion is a string that is the value of PARAMETER
quoted in a format that can be reused as input.
'E'
The expansion is a string that is the value of PARAMETER with
backslash escape sequences expanded as with the '$'...''
quoting mechanism.
'P'
The expansion is a string that is the result of expanding the
value of PARAMETER as if it were a prompt string (*note
Controlling the Prompt::).
'A'
The expansion is a string in the form of an assignment
statement or 'declare' command that, if evaluated, will
recreate PARAMETER with its attributes and value.
'K'
Produces a possibly-quoted version of the value of PARAMETER,
except that it prints the values of indexed and associative
arrays as a sequence of quoted key-value pairs (*note
Arrays::).
'a'
The expansion is a string consisting of flag values
representing PARAMETER's attributes.

If PARAMETER is '@' or '*', the operation is applied to each
positional parameter in turn, and the expansion is the resultant
list. If PARAMETER is an array variable subscripted with '@' or
'*', the operation is applied to each member of the array in turn,
and the expansion is the resultant list.

The result of the expansion is subject to word splitting and
filename expansion as described below.

### 3.5.4 Command Substitution


Command substitution allows the output of a command to replace the
command itself. Command substitution occurs when a command is enclosed
as follows:
$(COMMAND)
or
`COMMAND`

Bash performs the expansion by executing COMMAND in a subshell
environment and replacing the command substitution with the standard
output of the command, with any trailing newlines deleted. Embedded
newlines are not deleted, but they may be removed during word splitting.
The command substitution '$(cat FILE)' can be replaced by the equivalent
but faster '$(< FILE)'.

When the old-style backquote form of substitution is used, backslash
retains its literal meaning except when followed by '$', '`', or '\'.
The first backquote not preceded by a backslash terminates the command
substitution. When using the '$(COMMAND)' form, all characters between
the parentheses make up the command; none are treated specially.

Command substitutions may be nested. To nest when using the
backquoted form, escape the inner backquotes with backslashes.

If the substitution appears within double quotes, word splitting and
filename expansion are not performed on the results.

### 3.5.5 Arithmetic Expansion

Arithmetic expansion allows the evaluation of an arithmetic expression
and the substitution of the result. The format for arithmetic expansion
is:

    $(( EXPRESSION ))

The expression is treated as if it were within double quotes, but a
double quote inside the parentheses is not treated specially. All
tokens in the expression undergo parameter and variable expansion,
command substitution, and quote removal. The result is treated as the
arithmetic expression to be evaluated. Arithmetic expansions may be
nested.

The evaluation is performed according to the rules listed below
(note Shell Arithmetic). If the expression is invalid, Bash prints a
message indicating failure to the standard error and no substitution
occurs.


### 3.5.6 Process Substitution

Process substitution allows a process's input or output to be referred
to using a filename. It takes the form of

    <(LIST)
    or
    >(LIST)

The process LIST is run asynchronously, and its input or output appears
as a filename. This filename is passed as an argument to the current
command as the result of the expansion. If the '>(LIST)' form is used,
writing to the file will provide input for LIST. If the '<(LIST)' form
is used, the file passed as an argument should be read to obtain the
output of LIST. Note that no space may appear between the '<' or '>'
and the left parenthesis, otherwise the construct would be interpreted
as a redirection. Process substitution is supported on systems that
support named pipes (FIFOs) or the '/dev/fd' method of naming open
files.

When available, process substitution is performed simultaneously with
parameter and variable expansion, command substitution, and arithmetic
expansion.

### 3.5.7 Word Splitting

The shell scans the results of parameter expansion, command substitution, and arithmetic expansion that did not occur within double quotes for word splitting.

The shell treats each character of `IFS` as a delimiter, and splits the results of the other expansions into words using these characters as field terminators.

If IFS is unset (`IFS=` or `unset IFS`), or its value is exactly `$' \t\n'`, the default, then sequences of SPACE, TAB, and NL at the beginning and end of the results of the previous expansions are ignored, and any sequence of IFS characters not at the beginning or end serves to delimit words.

If IFS has a value other than the default, then sequences of the whitespace characters (SPACE, TAB, NL) are ignored at the beginning and end of the word, as long as the whitespace character is in the value of IFS - an *IFS whitespace character*.

Any character in IFS that is not IFS whitespace, along with any adjacent IFS whitespace characters, delimits a field. 

A sequence of IFS whitespace characters is also treated as a delimiter. 

>If the value of IFS is *null* (`IFS=$'\0'`), no word splitting occurs.

*Explicit null arguments* ("" or '') are retained and passed to commands as empty strings.

Unquoted *implicit null arguments*, resulting from the expansion of parameters that have no values, are removed. 

If a parameter with no value is expanded within double quotes, a null argument results and is retained and passed to a command as an empty string. 

When a *quoted null argument* appears as part of a word whose expansion is non-null, the null argument is removed; that is, the word `-d''` becomes `-d` after word splitting and null argument removal.

>Note that if no expansion occurs, no splitting is performed.

### 3.5.8 Filename Expansion

After word splitting, unless the `-f` option has been set (`set -f`), Bash scans each word for the characters `*`, `?`, and `[`.

If one of these characters appears, and is not quoted, then the word is regarded as a *PATTERN*, and replaced with an alphabetically sorted list of filenames matching the pattern.

If `nullglob` shopt is unset, and no matches are found, the word is left alone. 
If `nullglob` shopt is set, and no matches are found, the word is removed.

If `failglob` shopt is set, and no matches are found, an error message is printed and the command is not executed.

If `nocaseglob` shopt is set, the match is performed without regard to the case of alphabetic characters.

When a pattern is used for filename expansion, the character `.` at the start of a filename or immediately following a slash must be matched explicitly, unless the shell option `dotglob` is set.

The special filenames `.` and `..` must always be matched explicitly, even if `dotglob` is set. In other cases, the `.` character is not treated specially.

When matching a filename, the slash character (as a dir separator) must always be matched explicitly by a SLASH in the pattern, but in other matching contexts it can be matched by a special pattern character as described below.

See `shopt` builtin for options: nocaseglob, nullglob, failglob, and dotglob.

The `GLOBIGNORE` shell variable may be used to restrict the set of file names matching a pattern. If GLOBIGNORE is set, each matching file name that also matches one of the patterns in GLOBIGNORE is removed from the list of matches.

If `nocaseglob` option is set, the matching against the patterns in GLOBIGNORE is performed without regard to case.

The filenames '.' and '..' are always ignored when GLOBIGNORE is set and not null. However, setting GLOBIGNORE to a non-null value has the effect of enabling the `dotglob` shell option, so all other filenames beginning with a `.` will match. To get the old behavior of ignoring filenames beginning with a `.`, make `.*` one of the patterns in GLOBIGNORE. The `dotglob` option is disabled when GLOBIGNORE is unset.


#### 3.5.8.1 Pattern Matching

Any character that appears in a pattern, other than the *special pattern characters* described below, matches itself.

The NUL character may not occur in a pattern. 

A BACKSLASH escapes the following character; the escaping backslash is discarded when matching. 

The *special pattern characters* must be quoted if they are to be matched literally.

The *special pattern characters* have the following meanings:

- `*` (star) matches any string, including the empty string. When the `globstar` shell option is enabled, and `*` is used in a filename expansion context, two adjacent `*` used as a single pattern will match all files and zero or more directories and subdirectories (`/etc/**/*.sh`). If followed by a `/`, two adjacent `*` will match only dirs and subdirs (`/etc/**/`).

- `?` matches any single character (what `.` does in regex); e.g. `ls ?????` would list 5-letter FS items.

- `[…]` (range, bracket expression) matches any one of the enclosed characters. A pair of characters separated by a dash denotes a *range expression*; any character that falls between those two characters, inclusive, using the current locale's collating sequence and character set, is matched. If the first character following the `[` is a `!` or `^` then any character not enclosed is matched. A `-` may be matched by including it as the first or last character in the set. A `]` may be matched by including it as the first character in the set. The sorting order of characters in range expressions is determined by the current locale and the values of the `LC_COLLATE` and `LC_ALL` shell variables, if set.

For example, in the default C locale, [a-dx-z] is equivalent to [abcdxyz].

Many *locales* sort characters in dictionary order, and in these locales [a-dx-z] is typically not equivalent to [abcdxyz]; it might be equivalent to e.g. [aBbCcDdxXyYz].

To obtain the traditional interpretation of ranges in *bracket expressions*, you can force the use of the C locale by setting the `LC_COLLATE` or `LC_ALL` environment variable to the value 'C', or enable the `globasciiranges` shopt.

Within brackets, **CHARACTER CLASSES** can be specified using the syntax [:CLASS:], where CLASS is one of the classes defined by POSIX:

    alpha     upper     lower
    alnum     digit     xdigit
    word      space     blank
    punct     graph     print
    cntrl     ascii

For example, [[:word:]], [![:blank:]], [[:digit:]., _]

A character class matches any character belonging to that class.

The `word` character class matches letters, digits, and underscore.

Within brackets, an **EQUIVALENCE CLASS** can be specified using the syntax [=C=], which matches all characters with the same collation weight (as defined by the current locale) as the character C.

Within brackets, the syntax [.SYMBOL.] matches the **collating symbol** SYMBOL.

If the `extglob` shell option is enabled using the shopt builtin, several extended pattern matching operators are recognized. In the following description, a PATTERN-LIST is a list of one or more *patterns* separated by `|`. *Composite patterns* may be formed using one or more of the following sub-patterns:

- `?(PATTERN-LIST)` Matches 0 or 1 occurrence of the given patterns
- `*(PATTERN-LIST)` Matches 0 or more occurrences of the given patterns
- `+(PATTERN-LIST)` Matches 1 or more occurrences of the given patterns
- `@(PATTERN-LIST)` Matches 1 of the given patterns
- `!(PATTERN-LIST)` Matches anything except one of the given patterns (?!)

Complicated extended pattern matching against long strings is slow, especially when the patterns contain *alternations* and the strings contain multiple matches. Using separate matches against shorter strings, or using arrays of strings instead of a single long string, may be faster.

#### 3.5.9 Quote Removal

After the preceding expansions, all unquoted occurrences of the characters BACKSLASH (`\`), SQUOTE (`'`), and DQUOTE (`"`) that did not result from one of the above expansions are removed.

### 3.6 Redirections

Before a command is executed, its input and output may be REDIRECTED
using a special notation interpreted by the shell. Redirection allows
commands' file handles to be duplicated, opened, closed, made to refer
to different files, and can change the files the command reads from and
writes to. Redirection may also be used to modify file handles in the
current shell execution environment. The following redirection
operators may precede or appear anywhere within a simple command or may
follow a command. Redirections are processed in the order they appear,
from left to right.

Each redirection that may be preceded by a file descriptor number may
instead be preceded by a word of the form {VARNAME}. In this case, for
each redirection operator except >&- and <&-, the shell will allocate a
file descriptor greater than 10 and assign it to {VARNAME}. If >&- or
<&- is preceded by {VARNAME}, the value of VARNAME defines the file
descriptor to close. If {VARNAME} is supplied, the redirection persists
beyond the scope of the command, allowing the shell programmer to manage
the file descriptor's lifetime manually.

In the following descriptions, if the file descriptor number is
omitted, and the first character of the redirection operator is '<', the
redirection refers to the standard input (file descriptor 0). If the
first character of the redirection operator is '>', the redirection
refers to the standard output (file descriptor 1).

The word following the redirection operator in the following
descriptions, unless otherwise noted, is subjected to brace expansion,
tilde expansion, parameter expansion, command substitution, arithmetic
expansion, quote removal, filename expansion, and word splitting. If it
expands to more than one word, Bash reports an error.

Note that the order of redirections is significant. For example, the
command
ls > DIRLIST 2>&1
directs both standard output (file descriptor 1) and standard error
(file descriptor 2) to the file DIRLIST, while the command
ls 2>&1 > DIRLIST
directs only the standard output to file DIRLIST, because the standard
error was made a copy of the standard output before the standard output
was redirected to DIRLIST.

Bash handles several filenames specially when they are used in
redirections, as described in the following table. If the operating
system on which Bash is running provides these special files, bash will
use them; otherwise it will emulate them internally with the behavior
described below.

'/dev/fd/FD'
If FD is a valid integer, file descriptor FD is duplicated.

'/dev/stdin'
File descriptor 0 is duplicated.

'/dev/stdout'
File descriptor 1 is duplicated.

'/dev/stderr'
File descriptor 2 is duplicated.

'/dev/tcp/HOST/PORT'
If HOST is a valid hostname or Internet address, and PORT is an
integer port number or service name, Bash attempts to open the
corresponding TCP socket.

'/dev/udp/HOST/PORT'
If HOST is a valid hostname or Internet address, and PORT is an
integer port number or service name, Bash attempts to open the
corresponding UDP socket.

A failure to open or create a file causes the redirection to fail.

Redirections using file descriptors greater than 9 should be used
with care, as they may conflict with file descriptors the shell uses
internally.

#### 3.6.1 Redirecting Input

Redirection of input causes the file whose name results from the
expansion of WORD to be opened for reading on file descriptor 'n', or
the standard input (file descriptor 0) if 'n' is not specified.

The general format for redirecting input is:
[N]<WORD

#### 3.6.2 Redirecting Output


Redirection of output causes the file whose name results from the
expansion of WORD to be opened for writing on file descriptor N, or the
standard output (file descriptor 1) if N is not specified. If the file
does not exist it is created; if it does exist it is truncated to zero
size.

The general format for redirecting output is:
[N]>[|]WORD

If the redirection operator is '>', and the 'noclobber' option to the
'set' builtin has been enabled, the redirection will fail if the file
whose name results from the expansion of WORD exists and is a regular
file. If the redirection operator is '>|', or the redirection operator
is '>' and the 'noclobber' option is not enabled, the redirection is
attempted even if the file named by WORD exists.

#### 3.6.3 Appending Redirected Output


Redirection of output in this fashion causes the file whose name results
from the expansion of WORD to be opened for appending on file descriptor
N, or the standard output (file descriptor 1) if N is not specified. If
the file does not exist it is created.

The general format for appending output is:
[N]>>WORD

#### 3.6.4 Redirecting Standard Output and Standard Error


This construct allows both the standard output (file descriptor 1) and
the standard error output (file descriptor 2) to be redirected to the
file whose name is the expansion of WORD.

There are two formats for redirecting standard output and standard
error:
&>WORD
and
>&WORD
Of the two forms, the first is preferred. This is semantically
equivalent to
>WORD 2>&1
When using the second form, WORD may not expand to a number or '-'.
If it does, other redirection operators apply (see Duplicating File
Descriptors below) for compatibility reasons.

#### 3.6.5 Appending Standard Output and Standard Error


This construct allows both the standard output (file descriptor 1) and
the standard error output (file descriptor 2) to be appended to the file
whose name is the expansion of WORD.

The format for appending standard output and standard error is:
&>>WORD
This is semantically equivalent to
>>WORD 2>&1
(see Duplicating File Descriptors below).

#### 3.6.6 Here Documents


This type of redirection instructs the shell to read input from the
current source until a line containing only WORD (with no trailing
blanks) is seen. All of the lines read up to that point are then used
as the standard input (or file descriptor N if N is specified) for a
command.

The format of here-documents is:
[N]<<[-]WORD
HERE-DOCUMENT
DELIMITER

No parameter and variable expansion, command substitution, arithmetic
expansion, or filename expansion is performed on WORD. If any part of
WORD is quoted, the DELIMITER is the result of quote removal on WORD,
and the lines in the here-document are not expanded. If WORD is
unquoted, all lines of the here-document are subjected to parameter
expansion, command substitution, and arithmetic expansion, the character
sequence '\newline' is ignored, and '\' must be used to quote the
characters '\', '$', and '`'.

If the redirection operator is '<<-', then all leading tab characters
are stripped from input lines and the line containing DELIMITER. This
allows here-documents within shell scripts to be indented in a natural
fashion.

### 3.6.7 Here Strings

A variant of here documents, the format is:
[N]<<< WORD

The WORD undergoes tilde expansion, parameter and variable expansion,
command substitution, arithmetic expansion, and quote removal. Filename
expansion and word splitting are not performed. The result is supplied
as a single string, with a newline appended, to the command on its
standard input (or file descriptor N if N is specified).

### 3.6.8 Duplicating File Descriptors

The redirection operator
[N]<&WORD
is used to duplicate input file descriptors. If WORD expands to one or
more digits, the file descriptor denoted by N is made to be a copy of
that file descriptor. If the digits in WORD do not specify a file
descriptor open for input, a redirection error occurs. If WORD
evaluates to '-', file descriptor N is closed. If N is not specified,
the standard input (file descriptor 0) is used.

The operator
[N]>&WORD
is used similarly to duplicate output file descriptors. If N is not
specified, the standard output (file descriptor 1) is used. If the
digits in WORD do not specify a file descriptor open for output, a
redirection error occurs. If WORD evaluates to '-', file descriptor N
is closed. As a special case, if N is omitted, and WORD does not expand
to one or more digits or '-', the standard output and standard error are
redirected as described previously.

### 3.6.9 Moving File Descriptors

The redirection operator
[N]<&DIGIT-
moves the file descriptor DIGIT to file descriptor N, or the standard
input (file descriptor 0) if N is not specified. DIGIT is closed after
being duplicated to N.

Similarly, the redirection operator
[N]>&DIGIT-
moves the file descriptor DIGIT to file descriptor N, or the standard
output (file descriptor 1) if N is not specified.

### 3.6.10 Opening File Descriptors for Reading and Writing

The redirection operator
[N]<>WORD
causes the file whose name is the expansion of WORD to be opened for
both reading and writing on file descriptor N, or on file descriptor 0
if N is not specified. If the file does not exist, it is created.

## 3.7 Executing Commands

### 3.7.1 Simple Command Expansion

When a simple command is executed, the shell performs the following
expansions, assignments, and redirections, from left to right, in the
following order.

1. The words that the parser has marked as variable assignments (those
preceding the command name) and redirections are saved for later
processing.

2. The words that are not variable assignments or redirections are
expanded (*note Shell Expansions::). If any words remain after
expansion, the first word is taken to be the name of the command
and the remaining words are the arguments.

3. Redirections are performed as described above (*note
Redirections::).

4. The text after the '=' in each variable assignment undergoes tilde
expansion, parameter expansion, command substitution, arithmetic
expansion, and quote removal before being assigned to the variable.

If no command name results, the variable assignments affect the
current shell environment. Otherwise, the variables are added to the
environment of the executed command and do not affect the current shell
environment. If any of the assignments attempts to assign a value to a
readonly variable, an error occurs, and the command exits with a
non-zero status.

If no command name results, redirections are performed, but do not
affect the current shell environment. A redirection error causes the
command to exit with a non-zero status.

If there is a command name left after expansion, execution proceeds
as described below. Otherwise, the command exits. If one of the
expansions contained a command substitution, the exit status of the
command is the exit status of the last command substitution performed.
If there were no command substitutions, the command exits with a status
of zero.

### 3.7.2 Command Search and Execution

After a command has been split into words, if it results in a simple
command and an optional list of arguments, the following actions are
taken.

1. If the command name contains no slashes, the shell attempts to
locate it. If there exists a shell function by that name, that
function is invoked as described in *note Shell Functions::.

2. If the name does not match a function, the shell searches for it in
the list of shell builtins. If a match is found, that builtin is
invoked.

3. If the name is neither a shell function nor a builtin, and contains
no slashes, Bash searches each element of '$PATH' for a directory
containing an executable file by that name. Bash uses a hash table
to remember the full pathnames of executable files to avoid
multiple 'PATH' searches (see the description of 'hash' in *note
Bourne Shell Builtins::). A full search of the directories in
'$PATH' is performed only if the command is not found in the hash
table. If the search is unsuccessful, the shell searches for a
defined shell function named 'command_not_found_handle'. If that
function exists, it is invoked in a separate execution environment
with the original command and the original command's arguments as
its arguments, and the function's exit status becomes the exit
status of that subshell. If that function is not defined, the
shell prints an error message and returns an exit status of 127.

4. If the search is successful, or if the command name contains one or
more slashes, the shell executes the named program in a separate
execution environment. Argument 0 is set to the name given, and
the remaining arguments to the command are set to the arguments
supplied, if any.

5. If this execution fails because the file is not in executable
format, and the file is not a directory, it is assumed to be a
SHELL SCRIPT and the shell executes it as described in *note Shell
Scripts::.

6. If the command was not begun asynchronously, the shell waits for
the command to complete and collects its exit status.

### 3.7.3 Command Execution Environment

The shell has an EXECUTION ENVIRONMENT, which consists of the following:

* open files inherited by the shell at invocation, as modified by
redirections supplied to the 'exec' builtin

* the current working directory as set by 'cd', 'pushd', or 'popd',
or inherited by the shell at invocation

* the file creation mode mask as set by 'umask' or inherited from the
shell's parent

* current traps set by 'trap'

* shell parameters that are set by variable assignment or with 'set'
or inherited from the shell's parent in the environment

* shell functions defined during execution or inherited from the
shell's parent in the environment

* options enabled at invocation (either by default or with
command-line arguments) or by 'set'

* options enabled by 'shopt' (*note The Shopt Builtin::)

* shell aliases defined with 'alias' (*note Aliases::)

* various process IDs, including those of background jobs (*note
Lists::), the value of '$$', and the value of '$PPID'

When a simple command other than a builtin or shell function is to be
executed, it is invoked in a separate execution environment that
consists of the following. Unless otherwise noted, the values are
inherited from the shell.

* the shell's open files, plus any modifications and additions
specified by redirections to the command

* the current working directory

* the file creation mode mask

* shell variables and functions marked for export, along with
variables exported for the command, passed in the environment
(*note Environment::)

* traps caught by the shell are reset to the values inherited from
the shell's parent, and traps ignored by the shell are ignored

A command invoked in this separate environment cannot affect the
shell's execution environment.

Command substitution, commands grouped with parentheses, and
asynchronous commands are invoked in a subshell environment that is a
duplicate of the shell environment, except that traps caught by the
shell are reset to the values that the shell inherited from its parent
at invocation. Builtin commands that are invoked as part of a pipeline
are also executed in a subshell environment. Changes made to the
subshell environment cannot affect the shell's execution environment.

Subshells spawned to execute command substitutions inherit the value
of the '-e' option from the parent shell. When not in POSIX mode, Bash
clears the '-e' option in such subshells.

If a command is followed by a '&' and job control is not active, the
default standard input for the command is the empty file '/dev/null'.
Otherwise, the invoked command inherits the file descriptors of the
calling shell as modified by redirections.

### 3.7.4 Environment

When a program is invoked it is given an array of strings called the
ENVIRONMENT. This is a list of name-value pairs, of the form
'name=value'.

Bash provides several ways to manipulate the environment. On
invocation, the shell scans its own environment and creates a parameter
for each name found, automatically marking it for EXPORT to child
processes. Executed commands inherit the environment. The 'export' and
'declare -x' commands allow parameters and functions to be added to and
deleted from the environment. If the value of a parameter in the
environment is modified, the new value becomes part of the environment,
replacing the old. The environment inherited by any executed command
consists of the shell's initial environment, whose values may be
modified in the shell, less any pairs removed by the 'unset' and 'export
-n' commands, plus any additions via the 'export' and 'declare -x'
commands.

The environment for any simple command or function may be augmented
temporarily by prefixing it with parameter assignments, as described in
note Shell Parameters. These assignment statements affect only the
environment seen by that command.

If the '-k' option is set (note The Set Builtin), then all
parameter assignments are placed in the environment for a command, not
just those that precede the command name.

When Bash invokes an external command, the variable '$_' is set to
the full pathname of the command and passed to that command in its
environment.

### 3.7.5 Exit Status

The exit status of an executed command is the value returned by the
WAITPID system call or equivalent function. Exit statuses fall between
0 and 255, though, as explained below, the shell may use values above
125 specially. Exit statuses from shell builtins and compound commands
are also limited to this range. Under certain circumstances, the shell
will use special values to indicate specific failure modes.

For the shell's purposes, a command which exits with a zero exit
status has succeeded. A non-zero exit status indicates failure. This
seemingly counter-intuitive scheme is used so there is one well-defined
way to indicate success and a variety of ways to indicate various
failure modes. When a command terminates on a fatal signal whose number
is N, Bash uses the value 128+N as the exit status.

If a command is not found, the child process created to execute it
returns a status of 127. If a command is found but is not executable,
the return status is 126.

If a command fails because of an error during expansion or
redirection, the exit status is greater than zero.

The exit status is used by the Bash conditional commands (note Conditional Constructs) and some of the list constructs (note Lists).

All of the Bash builtins return an exit status of zero if they
succeed and a non-zero status on failure, so they may be used by the
conditional and list constructs. All builtins return an exit status of
2 to indicate incorrect usage, generally invalid options or missing
arguments.

### 3.7.6 Signals

When Bash is interactive, in the absence of any traps, it ignores
'SIGTERM' (so that 'kill 0' does not kill an interactive shell), and
'SIGINT' is caught and handled (so that the 'wait' builtin is
interruptible). When Bash receives a 'SIGINT', it breaks out of any
executing loops. In all cases, Bash ignores 'SIGQUIT'. If job control
is in effect (*note Job Control::), Bash ignores 'SIGTTIN', 'SIGTTOU',
and 'SIGTSTP'.

Non-builtin commands started by Bash have signal handlers set to the
values inherited by the shell from its parent. When job control is not
in effect, asynchronous commands ignore 'SIGINT' and 'SIGQUIT' in
addition to these inherited handlers. Commands run as a result of
command substitution ignore the keyboard-generated job control signals
'SIGTTIN', 'SIGTTOU', and 'SIGTSTP'.

The shell exits by default upon receipt of a 'SIGHUP'. Before
exiting, an interactive shell resends the 'SIGHUP' to all jobs, running
or stopped. Stopped jobs are sent 'SIGCONT' to ensure that they receive
the 'SIGHUP'. To prevent the shell from sending the 'SIGHUP' signal to
a particular job, it should be removed from the jobs table with the
'disown' builtin (*note Job Control Builtins::) or marked to not receive
'SIGHUP' using 'disown -h'.

If the 'huponexit' shell option has been set with 'shopt' (*note The
Shopt Builtin::), Bash sends a 'SIGHUP' to all jobs when an interactive
login shell exits.

If Bash is waiting for a command to complete and receives a signal
for which a trap has been set, the trap will not be executed until the
command completes. When Bash is waiting for an asynchronous command via
the 'wait' builtin, the reception of a signal for which a trap has been
set will cause the 'wait' builtin to return immediately with an exit
status greater than 128, immediately after which the trap is executed.

## 3.8 Shell Scripts

A shell script is a text file containing shell commands. When such a
file is used as the first non-option argument when invoking Bash, and
neither the '-c' nor '-s' option is supplied (*note Invoking Bash::),
Bash reads and executes commands from the file, then exits. This mode
of operation creates a non-interactive shell. The shell first searches
for the file in the current directory, and looks in the directories in
'$PATH' if not found there.

When Bash runs a shell script, it sets the special parameter '0' to
the name of the file, rather than the name of the shell, and the
positional parameters are set to the remaining arguments, if any are
given. If no additional arguments are supplied, the positional
parameters are unset.

A shell script may be made executable by using the 'chmod' command to
turn on the execute bit. When Bash finds such a file while searching
the '$PATH' for a command, it spawns a subshell to execute it. In other
words, executing
filename ARGUMENTS
is equivalent to executing
bash filename ARGUMENTS

if 'filename' is an executable shell script. This subshell
reinitializes itself, so that the effect is as if a new shell had been
invoked to interpret the script, with the exception that the locations
of commands remembered by the parent (see the description of 'hash' in
*note Bourne Shell Builtins::) are retained by the child.

Most versions of Unix make this a part of the operating system's
command execution mechanism. If the first line of a script begins with
the two characters '#!', the remainder of the line specifies an
interpreter for the program and, depending on the operating system, one
or more optional arguments for that interpreter. Thus, you can specify
Bash, 'awk', Perl, or some other interpreter and write the rest of the
script file in that language.

The arguments to the interpreter consist of one or more optional
arguments following the interpreter name on the first line of the script
file, followed by the name of the script file, followed by the rest of
the arguments supplied to the script. The details of how the
interpreter line is split into an interpreter name and a set of
arguments vary across systems. Bash will perform this action on
operating systems that do not handle it themselves. Note that some
older versions of Unix limit the interpreter name and a single argument
to a maximum of 32 characters, so it's not portable to assume that using
more than one argument will work.

Bash scripts often begin with '#! /bin/bash' (assuming that Bash has
been installed in '/bin'), since this ensures that Bash will be used to
interpret the script, even if it is executed under another shell. It's
a common idiom to use 'env' to find 'bash' even if it's been installed
in another directory: '#!/usr/bin/env bash' will find the first
occurrence of 'bash' in '$PATH'.
