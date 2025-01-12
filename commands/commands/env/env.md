# coreutils :: env

## 23.2. env: Run a command in a modified environment

`env` runs a command with a modified environment.

SYNOPSES:

     env       [OPTION]... [NAME=VALUE]... [COMMAND [ARGS]...]
     env -[v]S'[OPTION]... [NAME=VALUE]... [COMMAND [ARGS]...]'
     env

env is commonly used on first line of scripts (shebang line):

     #!/usr/bin/env COMMAND
     #!/usr/bin/env -[v]S[OPTION]... [NAME=VALUE]... COMMAND [ARGS]...


Operands of the form 'VAR=VALUE' set the environment variable VAR to value VALUE. VALUE may be empty, `VARIABLE='`. Setting a variable to an empty value is different from unsetting it. These operands are evaluated left-to-right, so if two operands mention the same variable the earlier is ignored.

Environment variable names can be empty [?!], and can contain any characters other than '=' and ASCII NUL. However, it is wise to limit yourself to names that consist solely of underscores, digits, and ASCII letters, and that begin with a non-digit, as applications like the shell do not work well with other names.

The first operand that does not contain the character '=' specifies the program to invoke; it is searched for according to the 'PATH' environment variable. Any remaining arguments are passed as arguments to that program. The program should not be a special built-in utility (see note about Special built-in utilities).

Modifications to `PATH` take effect prior to searching for COMMAND. Use caution when reducing PATH; behavior is not portable when PATH is undefined or omits key directories such as /bin.

In the rare case that a utility contains a '=' in the name, the only way to disambiguate it from a variable assignment is to use an intermediate command for COMMAND, and pass the problematic program name via ARGS. 
For example, if `./prog=` is an executable in the current PATH:

```bash
env prog= true                      # runs 'true', with prog= in environment
env ./prog= true                    # runs 'true', with ./prog= in environment
env -- prog= true                   # runs 'true', with prog= in environment
env sh -c '\prog= true'             # runs 'prog=' with argument 'true'
env sh -c 'exec "$@"' sh prog= true # also runs 'prog='
```

If no command name is specified following the environment specifications, the resulting environment is printed, like `printenv`.

For the following examples, suppose the environment passed to `env` contains `LOGNAME=rms`, `EDITOR=emacs` and `PATH=.:/gnubin:/hacks`

```bash
# Output the current environment
$ env | LC_ALL=C sort
EDITOR=emacs
LOGNAME=rms
PATH=.:/gnubin:/hacks

# Run foo with a reduced environment, preserving only the original
# PATH to avoid problems in locating foo
env - PATH="$PATH" foo

# Run foo with the environment containing LOGNAME=rms, EDITOR=emacs and
# PATH=.:/gnubin:/hacks which guarantees that foo was found in the file
# system rather than as a builtin.
env foo

# Run nemacs with the environment containing LOGNAME=foo,
# EDITOR=emacs, PATH=.:/gnubin:/hacks and DISPLAY=gnu:0
env DISPLAY=gnu:0 LOGNAME=foo nemacs

# Attempt to run the program '/energy/--' (as that is the only possible
# path search result); if the command exists, the environment will contain
# LOGNAME=rms and PATH=/energy and the arguments will be
# 'e=mc2', 'bar', and 'baz'.
env -u EDITOR PATH=/energy -- e=mc2 bar baz
```


## 23.2.1 General options

The program accepts the following options (also see Common options). 
*Options must precede operands*.

'-0'
'--null'
     Output a zero byte (ASCII NUL) at the end of each line, rather than
     a newline.  This option enables other programs to parse the output
     even when that output would contain data with embedded newlines.

'-u NAME'
'--unset=NAME'
     Remove variable NAME from the environment, if it was in the
     environment.

'-'
'-i'
'--ignore-environment'
     Start with an empty environment, ignoring the inherited
     environment.

'-C DIR'
'--chdir=DIR'
     Change the working directory to DIR before invoking COMMAND.  This
     differs from the shell built-in 'cd' in that it starts COMMAND as a
     subprocess rather than altering the shell's own working directory;
     this allows it to be chained with other commands that run commands
     in a different context.  For example:

          # Run 'true' with /chroot as its root directory and /srv as its working
          # directory.
          chroot /chroot env --chdir=/srv true
          # Run 'true' with /build as its working directory, FOO=bar in its
          # environment, and a time limit of five seconds.
          env --chdir=/build FOO=bar timeout 5 true

'--default-signal[=SIG]'
     Unblock and reset signal SIG to its default signal handler.
     Without SIG all known signals are unblocked and reset to their
     defaults.  Multiple signals can be comma-separated.  The following
     command runs 'seq' with SIGINT and SIGPIPE set to their default
     (which is to terminate the program):

          env --default-signal=PIPE,INT seq 1000 | head -n1

     In the following example, we see how this is not possible to do
     with traditional shells.  Here the first trap command sets SIGPIPE
     to ignore.  The second trap command ostensibly sets it back to its
     default, but POSIX mandates that the shell must not change
     inherited state of the signal - so it is a no-op.

          trap '' PIPE && sh -c 'trap - PIPE ; seq inf | head -n1'

     Using '--default-signal=PIPE' we can ensure the signal handling is
     set to its default behavior:

          trap '' PIPE && sh -c 'env --default-signal=PIPE seq inf | head -n1'

'--ignore-signal[=SIG]'
     Ignore signal SIG when running a program.  Without SIG all known
     signals are set to ignore.  Multiple signals can be
     comma-separated.  The following command runs 'seq' with SIGINT set
     to be ignored - pressing 'Ctrl-C' will not terminate it:

          env --ignore-signal=INT seq inf > /dev/null

     'SIGCHLD' is special, in that '--ignore-signal=CHLD' might have no
     effect (POSIX says it's unspecified).

     Most operating systems do not allow ignoring 'SIGKILL', 'SIGSTOP'
     (and possibly other signals).  Attempting to ignore these signals
     will fail.

     Multiple (and contradictory) '--default-signal=SIG' and
     '--ignore-signal=SIG' options are processed left-to-right, with the
     latter taking precedence.  In the following example, 'SIGPIPE' is
     set to default while 'SIGINT' is ignored:

          env --default-signal=INT,PIPE --ignore-signal=INT

'--block-signal[=SIG]'
     Block signal(s) SIG from being delivered.

'--list-signal-handling'
     List blocked or ignored signals to stderr, before executing a
     command.

'-v'
'--debug'
     Show verbose information for each processing step.

          $ env -v -uTERM A=B uname -s
          unset:    TERM
          setenv:   A=B
          executing: uname
             arg[0]= 'uname'
             arg[1]= '-s'
          Linux

     When combined with '-S' it is recommended to list '-v' first, e.g.
     'env -vS'string''.

'-S STRING'
'--split-string=STRING'
     process and split STRING into separate arguments used to pass
     multiple arguments on shebang lines.  'env' supports FreeBSD's
     syntax of several escape sequences and environment variable
     expansions.  See below for details and examples.

   Exit status:

     0   if no COMMAND is specified and the environment is output
     125 if 'env' itself fails
     126 if COMMAND is found but cannot be invoked
     127 if COMMAND cannot be found
     the exit status of COMMAND otherwise

23.2.2 '-S'/'--split-string' usage in scripts
---------------------------------------------

The '-S'/'--split-string' options enable using multiple arguments on the
first one of scripts (shebang line, '#!').

   When a script's interpreter is in a known location, scripts typically

contain the absolute file name in their first line:

Shell script:         #!/bin/sh
                      echo hello

Perl script:          #!/usr/bin/perl
                      print "hello\n";

Python script:        #!/usr/bin/python3
                      print("hello")


   When a script's interpreter is in a non-standard location in the
'PATH' environment variable, it is recommended to use 'env' on the first
line of the script to find the executable and run it:

Shell script:         #!/usr/bin/env bash
                      echo hello

Perl script:          #!/usr/bin/env perl
                      print "hello\n";

Python script:        #!/usr/bin/env python3
                      print("hello")


   Most operating systems (e.g.  GNU/Linux, BSDs) treat all text after
the first space as a single argument.  When using 'env' in a script it
is thus not possible to specify multiple arguments.

   In the following example:
     #!/usr/bin/env perl -T -w
     print "hello\n";

   The operating system treats 'perl -T -w' as one argument (the
program's name), and executing the script fails with:

     /usr/bin/env: 'perl -T -w': No such file or directory

   The '-S' option instructs 'env' to split the single string into
multiple arguments.  The following example works as expected:

     $ cat hello.pl
     #!/usr/bin/env -S perl -T -w
     print "hello\n";

     $ chmod a+x hello.pl
     $ ./hello.pl
     hello

   And is equivalent to running 'perl -T -w hello.pl' on the command
line prompt.

Testing and troubleshooting
...........................

To test 'env -S' on the command line, use single quotes for the '-S'
string to emulate a single paramter.  Single quotes are not needed when
using 'env -S' in a shebang line on the first line of a script (the
operating system already treats it as one argument).

   The following command is equivalent to the 'hello.pl' script above:

     $ env -S'perl -T -w' hello.pl

   To troubleshoot '-S' usage add the '-v' as the first argument (before
'-S').

   Using '-vS' on a shebang line in a script:
  
   $ cat hello-debug.pl
     #!/usr/bin/env -vS perl -T -w
     print "hello\n";

     $ chmod a+x hello-debug.pl
     $ ./hello-debug.pl
     split -S:  'perl -T -w'
      into:    'perl'
          &    '-T'
          &    '-w'
     executing: perl
        arg[0]= 'perl'
        arg[1]= '-T'
        arg[2]= '-w'
        arg[3]= './hello-debug.pl'
     hello

   Using '-vS' on the command line prompt (adding single quotes):

     $ env -vS'perl -T -w' hello-debug.pl
     split -S:  'perl -T -w'
      into:    'perl'
          &    '-T'
          &    '-w'
     executing: perl
        arg[0]= 'perl'
        arg[1]= '-T'
        arg[2]= '-w'
        arg[3]= 'hello-debug.pl'
     hello

23.2.3 '-S'/'--split-string' syntax
-----------------------------------

Splitting arguments by whitespace
.................................

Running 'env -Sstring' splits the STRING into arguments based on
unquoted spaces or tab characters.

   In the following contrived example the 'awk' variable 'OFS' will be
'<space>xyz<space>' as these spaces are inside double quotes.  The other
space characters are used as argument separators:

     $ cat one.awk
     #!/usr/bin/env -S awk -v OFS=" xyz " -f
     BEGIN {print 1,2,3}

     $ chmod a+x one.awk
     $ ./one.awk
     1 xyz 2 xyz 3

   When using '-S' on the command line prompt, remember to add single
quotes around the entire string:

     $ env -S'awk -v OFS=" xyz " -f' one.awk
     1 xyz 2 xyz 3

Escape sequences
................

'env' supports several escape sequences.  These sequences are processed
when unquoted or inside double quotes (unless otherwise noted).  Single
quotes disable escape sequences except '\'' and '\\'.

'\c'    Ignore the remaining characters in the string.  Cannot be used
        inside double quotes.

'\f'    form-feed character (ASCII 0x0C)

'\n'    new-line character (ASCII 0x0A)

'\r'    carriage-return character (ASCII 0x0D)

'\t'    tab character (ASCII 0x09)

'\v'    vertical tab character (ASCII 0x0B)

'\#'    A hash '#' character.  Used when a '#' character is needed as
        the first character of an argument (see 'comments' section
        below).

'\$'    A dollar-sign character '$'.  Unescaped '$' characters are used
        to expand environment variables (see 'variables' section
        below).

'\_'    Inside double-quotes, replaced with a single space character.
        Outside quotes, treated as an argument separator.  '\_' can be
        used to avoid space characters in a shebang line (see examples
        below).

'\"'    A double-quote character.

'\''    A single-quote character.  This escape sequence works inside
        single-quoted strings.

'\\'    A backslash character.  This escape sequence works inside
        single-quoted strings.


   The following 'awk' script will use tab character as input and output
field separator (instead of spaces and tabs):

     $ cat tabs.awk
     #!/usr/bin/env -S awk -v FS="\t" -v OFS="\t" -f
     ...

Comments
........

The escape sequence '\c' (used outside single/double quotes) causes
'env' to ignore the rest of the string.

   The '#' character causes 'env' to ignore the rest of the string when
it appears as the first character of an argument.  Use '\#' to reverse
this behavior.




     $ env -S'printf %s\n A B C'
     A
     B
     C

     $ env -S'printf %s\n A# B C'
     A#
     B
     C

     $ env -S'printf %s\n A #B C'
     A

     $ env -S'printf %s\n A \#B C'
     A
     #B
     C

     $ env -S'printf %s\n A\cB C'
     A

   NOTE: The above examples use single quotes as they are executed on
the command-line.

Environment variable expansion
..............................

The pattern '${VARNAME}' is used to substitute a value from the
environment variable.  The pattern must include the curly braces
('{','}').  Without them 'env' will reject the string.  Special shell
variables (such as '$@', '$*', '$$') are not supported.

   If the environment variable is empty or not set, the pattern will be
replaced by an empty string.  The value of '${VARNAME}' will be that of
the executed 'env', before any modifications using
'-i'/'--ignore-environment'/'-u'/'--unset' or setting new values using
'VAR=VALUE'.

   The following python script prepends '/opt/custom/modules' to the
python module search path environment variable ('PYTHONPATH'):

$ cat custom.py
     #!/usr/bin/env -S PYTHONPATH=/opt/custom/modules/:${PYTHONPATH} python
     print "hello"
     ...

   The expansion of '${PYTHONPATH}' is performed by 'env', not by a
shell.  If the curly braces are omitted, 'env' will fail:

     $ cat custom.py
     #!/usr/bin/env -S PYTHONPATH=/opt/custom/modules/:$PYTHONPATH python
     print "hello"
     ...

     $ chmod a+x custom.py
     $ custom.py
     /usr/bin/env: only ${VARNAME} expansion is supported, error at: $PYTHONPATH pytho\
n

   Environment variable expansion happens before clearing the
environment (with '-i') or unsetting specific variables (with '-u'):

     $ env -S'-i OLDUSER=${USER} env'
     OLDUSER=gordon

   Use '-v' to diagnose the operations step-by-step:

     $ env -vS'-i OLDUSER=${USER} env'
     expanding ${USER} into 'gordon'
     split -S:  '-i OLDUSER=${USER} env'
      into:    '-i'
          &    'OLDUSER=gordon'
          &    'env'
     cleaning environ
     setenv:   OLDUSER=gordon
     executing: env
        arg[0]= 'env'
     OLDUSER=gordon
     