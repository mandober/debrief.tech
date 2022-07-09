GNU bash, version 4.4.12

Usage:  bash [GNU long option] [option] ...
        bash [GNU long option] [option] script-file ...

GNU long options:
        --debug
        --debugger
        --dump-po-strings
        --dump-strings
        --help
        --init-file
        --login
        --noediting
        --noprofile
        --norc
        --posix
        --protected
        --rcfile
        --restricted
        --verbose
        --version
        --wordexp

Shell options:
        -ilrsD or -c command or -O shopt_option   (invocation only)
        -abefhkmnptuvxBCHP or -o option

Type `bash -c "help set"' for more information about shell options.
Type `bash -c help' for more information about shell builtin commands.
Use the `bashbug' command to report bugs.

bash home page: <http://www.gnu.org/software/bash>
General help using GNU software: <http://www.gnu.org/gethelp/>


SYNOPSIS
bash [options] [command_string | file]
bash [long-opt] [-ir] [-abefhkmnptuvxdBCDHP] [-o option] [-O shopt_option] [argument ...]
bash [long-opt] [-abefhkmnptuvxdBCDHP] [-o option] [-O shopt_option] -c string [argument ...]
bash [long-opt] -s [-abefhkmnptuvxdBCDHP] [-o option] [-O shopt_option] [argument ...]


OPTIONS - BRIEF
-i					interactive shell
-l  --login			login shell
-c					exec commands read from operand
-s					exec commands read from stdin
-D  --dump-strings		gettext portable object
    --dump-po-strings		gettext portable object
    --debugger			extended debugging mode
    --init-file FILE		custom initialization
    --noediting			no readline
    --noprofile			no profile 
    --norc				no rc
    --rcfile FILE		custom rc
    --posix
-r  --restricted
-O shopt_option
+O shopt_option
-   --
-v  --verbose
    --version
    --help


OPTIONS - DESCRIPTIONS

All of the single-character shell options documented in the description 
of the set builtin command can be used as options when the shell is invoked. 

In addition, bash interprets the following options when it is invoked.
* Long options must appear on the command line before the single-character options to be recognized.

-i			shell is interactive
-l   --login	bash invoked as a login shell
bash -l -i

-c
If the -c option is present, then commands are read from the first non-option argument command_string. 
If there are arguments after the command_string, they are assigned to the positional parameters, starting with $0.
bash -c 'echo 123'

-s
If present, or if no args remain after option processing, then commands are read from the stdin. 
This option allows the positional parameters to be set when invoking an interactive shell.

-D, --dump-strings
A list of all double-quoted strings preceded by $ is printed on the standard output. 
These are the strings that are subject to language translation when the current locale 
is not C or POSIX. This implies the -n option; no commands will be executed.

--dump-po-strings
Equivalent to -D, but the output is in the GNU gettext PO (portable object) file format

--debugger
Arrange for the debugger profile to be executed before the shell starts. Turns on extended debugging mode. (shopt -s extdebug)

--init-file FILE
Execute commands from file instead of the standard personal initialization

--rcfile FILE
file ~/.bashrc if the shell is interactive

--noediting
Do not use the GNU readline library to read command lines when the shell is interactive

--noprofile
Do not read either the system-wide startup file /etc/profile or any of the personal initialization files 
~/.bash_profile, ~/.bash_login, or ~/.profile. By default, bash reads these files when it is invoked as a login shell 

--norc
Don't read and execute the personal initialization file ~/.bashrc if the shell is interactive. 
This option is on by default if the shell is invoked as sh.

--posix
Change the behavior of bash where the default operation differs from the POSIX standard to match the standard (posix mode). 

-r, --restricted
The shell becomes restricted.

[-/+]O [shopt_option]
shopt_option is one of the shell options accepted by the shopt builtin. 
* If shopt_option is present, -O sets the value of that option; +O unsets it. 
* If shopt_option is not supplied, the names and values of the shell 
  options accepted by shopt are printed on the standard output.
* If the invocation option is +O, the output is displayed in a format that may be reused as input.
bash +O; bash -O

-, --   
A double dash (--) signals the end of options and disables further option processing. 
Any arguments after the -- are treated as filenames and arguments. 
An argument of - is equivalent to --

--help
Display a usage message on standard output and exit successfully

-v, --verbose
verbose

--version
Show version information for this instance of bash on the standard output and exit successfully.



ARGUMENTS
If arguments remain after option processing, and neither the -c nor the -s option has been supplied, 
the first argument is assumed to be the name of shell script. 
bash script.bash

If bash is invoked in this fashion, $0 is set to the name of the file,
and the positional parameters are set to the remaining arguments. 
Bash reads and executes commands from this file, then exits. 

Bash's exit status is the exit status of the last command executed in the script. 
If no commands are executed, the exit status is 0. An attempt is first made to open the 
file in the current directory, and, if no file is found, then the shell searches the 
directories in PATH for the script.




