shopt: compatibility

xpg_echo
sourcepath
gnu_errfmt
restricted_shell
compat31
compat32
compat40
compat41
compat42
compat43

xpg_echo
If set, the echo builtin expands backslash-escape sequences by default.
$ echo 'abc\ndef'
abc\ndef
$ echo $'abc\ndef'
abc
def
$ shopt -s xpg_echo
$ echo 'abc\ndef'
abc
def

sourcepath
If set, the source (.) builtin uses the value of PATH to find the directory containing 
the file supplied as an argument. This option is enabled by default.

gnu_errfmt
If set, shell error messages are written in the standard GNU error message format.

restricted_shell
The shell sets this option if it is started in restricted mode. The value may not be changed. 
This is not reset when the startup files are executed, allowing the startup files to discover whether or not a shell is restricted.


compat31
If set, bash changes its behavior to that of version 3.1 with respect to quoted arguments to 
the [[ conditional command's =~ operator and locale-specific string comparison when using 
the [[ conditional command's < and > operators. Bash versions prior to bash-4.1 use ASCII
collation and strcmp(3); bash-4.1 and later use the current locale's collation sequence and strcoll(3).

compat32
If set, bash changes its behavior to that of version 3.2 with respect to locale-specific 
string comparison when using the [[ conditional command's < and > operators (see previous item).

compat40
If set, bash changes its behavior to that of version 4.0 with respect to locale-specific string 
comparison when using the [[ conditional command's < and > operators (see description of compat31) 
and the effect of interrupting a command list. Bash versions 4.0 and later interrupt the list as if 
the shell received the interrupt; previous versions continue with the next command in the list.

compat41
If set, bash, when in posix mode, treats a single quote in a double-quoted parameter expansion as 
a special character. The single quotes must match (an even number) and the characters between the 
single quotes are considered quoted. This is the behavior of posix mode through version 4.1.  The 
default bash behavior remains as in previous versions.

compat42
If set, bash does not process the replacement string in the pattern substitution word expansion using quote removal.

compat43
- If set, bash does not print a warning message if an attempt is made to use a quoted compound array assignment as an argument to declare
  bash4.3: declare -ar BASH_VERSINFO='([0]="4" [1]="3" [2]="48" [3]="1" [4]="release" [5]="x86_64-pc-linux-gnu")'
  bash4.4: declare -ar BASH_VERSINFO=([0]="4" [1]="4" [2]="12" [3]="3" [4]="release" [5]="x86_64-pc-linux-gnu")
- makes word expansion errors non-fatal errors that cause the current command to fail 
  (the default behavior in 4.4 is to make them fatal errors that cause the shell to exit) 
- does not reset the loop state when a shell function is executed 
  (this allows break or continue in a shell function to affect loops in the caller's context)


