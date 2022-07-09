# Command Substitution

**Command substitution** is the name for the sequence of steps that are embodied into a cthe shell performs 


> Command substitution should generally be reserved for external commands. When used with a builtin command, it is very slow. That is why the -v option was added to printf.



Command substitution occurs when a command is enclosed as follows:

$(command) or `command`

Bash performs the expansion by executing command in a subshell environment and replacing the command substitution with the standard output of the command, with any trailing newlines deleted. Embedded newlines are not deleted, but they may be removed during word splitting. The command substitution $(cat file) can be replaced by the equivalent but faster $(< file).

When the old-style backquote form of substitution is used, backslash retains its literal meaning except when followed by ‘$’, ‘`’, or ‘\’. The first backquote not preceded by a backslash terminates the command substitution. When using the $(command) form, all characters between the parentheses make up the command; none are treated specially.

Command substitutions may be nested. To nest when using the backquoted form, escape the inner backquotes with backslashes.

If the substitution appears within double quotes, word splitting and filename expansion are not performed on the results.


---

When a subshell finishes its task, delegated to it by the main shell process, it is decommisioned, but down with the subshell goes all the useful data.

The subshell is explicitly created by wrapping a list of commands in parenthesis, `(...)`. Left only at that, if none of the commands within do something to output text, either to stdout or stderr, it would be hard to notice the subshell's fast lifecycle.




creates a subshell (e.g. due to a pipe or to execute an external command) to aid with executution, when the subshell 





There are two forms:
$(command)  or  `command`

Bash performs the expansion by executing command and replacing the command substitution 
with the standard output of the command, with any trailing new‐lines deleted.
Embedded newlines are not deleted, but they may be removed during word splitting. 

The command substitution $(cat file) can be replaced by the equivalent but faster $(< file)

When the old-style backquote form of substitution is used, 
backslash retains its literal meaning except when followed by $, `, or \
The first backquote not preceded by a backslash terminates the command substitution 

When using the $(command) form, all characters between the 
parentheses make up the command; none are treated specially.

Command substitutions may be nested. 
To nest when using the backquoted form, escape the inner backquotes with backslashes.

If the substitution appears within double quotes, word 
splitting and pathname expansion are not performed on the results.

---

## Command Substitution

https://en.wikipedia.org/wiki/Command_substitution

Command substitution is a facility that allows a command to be run and its output to be pasted back on the command line as arguments to another command.

Command substitution first appeared in the Bourne shell, introduced with Version 7 Unix in 1979, and has remained a characteristic of all later Unix shells.

The feature has since been adopted in other programming languages as well, including Perl, PHP, Ruby, Powershell. It also appears in Microsoft's CMD.EXE in the FOR command and the ( ) command.
