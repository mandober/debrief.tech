history
globbing
debugging
mode
jobs
misc
   history
-H histexpand
-f noglob
-B braceexpand
-n noexec
-u nounset
-t onecmd
-e errexit
-E errtrace
-x xtrace
-v verbose
-T functrace
   pipefail
-p privileged
   posix
   vi
   emacs
-i interactive
-b notify
-m monitor
-C noclobber
-h hashall
-a allexport
-k keyword
-p physical
   nolog (auto set)
   ignoreeof
   igncr (cygwin)



history

history
Enable command history. This option is on by default in interactive shells.

histexpand (H)
Enable ! style history substitution. This option is on by default when the shell is interactive.


globbing

noglob (f)
Disable pathname expansion; e.g. disables * to expand to all files in cwd.

braceexpand (B)
The shell performs brace expansion. This is on by default.


debugging

verbose (v)
Print shell input lines as they are read.

xtrace (x)
After expanding each simple command, for command, case command, select command, or arithmetic for command,
display the expanded value of PS4, followed by the command and its expanded arguments or associated word list.

errtrace (E)
If set, any trap on ERR is inherited by shell functions, command substitutions, and commands 
executed in a subshell environment. The ERR trap is normally not inherited in such cases.

functrace (T)
If set, any traps on DEBUG and RETURN are inherited by shell functions, 
command substitutions, and commands executed in a subshell environment. 
The DEBUG and RETURN traps are normally not inherited in such cases.

noexec (n)
Read commands but do not execute them. This may be used to check a shell 
script for syntax errors. This is ignored by interactive shells.

onecmd (t)
Exit after reading and executing one command.

nounset (u)
Treat unset variables and parameters other than the special parameters "@" and "*" as error 
when performing parameter expansion. If expansion is attempted on an unset variable or parameter, 
the shell prints an error message, and, if not interactive, exits with a non-zero status.

errexit (e)
Exit immediately if:
  - pipeline (which may consist of a single simple command)
  - list
  - compound command
exits with a non-zero status.

The shell does not exit:
- if the command that fails is part of the command list immediately following a while or until keyword
- if the command that fails is part of the test following the if or elif reserved words
- if the command that fails is part of any command executed in a && or || list except the command following the final && or ||
- if the command that fails is any command in a pipeline but the last
- if the command's return value is being inverted with !
- if a compound command other than a subshell returns a non-zero status 
  because a command failed while -e was being ignored, the shell does not exit. 

* A trap on ERR, if set, is executed before the shell exits. 
  This option applies to the shell environment and each subshell environment separately, 
  and may cause subshells to exit before executing all the commands in the subshell. 
* If a compound command or shell function executes in a context where -e is being ignored, 
  none of the commands executed within the compound command or function body will be affected 
  by the -e setting, even if -e is set and a command returns a failure status. 
* If a compound command or shell function sets -e while executing in a context where -e is ignored, 
  that setting will not have any effect until the compound command or the command containing the function call completes.

pipefail
If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero 
status, or zero if all commands in the pipeline exit successfully. This option is disabled by default.


mode

privileged (p)
Turn on privileged mode:
* $ENV and $BASH_ENV files are not processed
* shell functions are not inherited from the environment
* SHELLOPTS, BASHOPTS, CDPATH, and GLOBIGNORE variables, if they appear in the environment, are ignored. 
* if the shell is started with the effective user (group) id not equal to the real user (group) id, and 
   the -p option is not supplied, these actions are taken and the effective user id is set to the real user 
   id. If the -p option is supplied at startup, the effective user id is not reset. Turning this option off 
   causes the effective user and group ids to be set to the real user and group ids.

posix
Change the behavior of bash where the default operation differs
from the POSIX standard to match the standard (posix mode).

emacs
Use an emacs-style command line editing interface. This is enabled by default when the shell is interactive, 
unless the shell is started with the --noediting option. This also affects the editing interface used for read -e.

vi
Use a vi-style command line editing interface. This also affects the editing interface used for read -e.

inteactive
i letter will apprear in $- if shell is inteactive, this option is automatically set by shell.
bash 4.4: set -i is no longer valid, as in other shells.



jobs

notify (b)
Report the status of terminated background jobs immediately, rather than before the next primary prompt. This is effective only when job control is enabled.

monitor (m)
Monitor mode when job control is enabled. This option is on by default for interactive shells on systems that support it. All 
processes run in a separate process group. When a background job completes, the shell prints a line containing its exit status.



misc

hashall (h)
Remember the location of commands as they are looked up for execution. This is enabled by default. BASH_CMDS holds current hash set.

noclobber (C)
If set, bash does not overwrite an existing file with the >, >&, and <> redirection operators. 
This may be overridden when creating output files by using the redirection operator >| instead of >.

ignoreeof
The effect is as if the shell command IGNOREEOF=10 had been executed.

allexport (a)
Automatically mark vars and functions which are modified or created for export to envi-
ronment of subsequent commands. So no need to specify export for each var to export it.

keyword (k)
All arguments in the form of assignment statements are placed in the environment for a command, not just those that precede the command name.
Practiaclly enables assignments to appear aftert command, not just before it. It's rarely used anymore. It was used for compatibility with legacy shells.
$ bash LC_ALL=C   
# env.var. that are listed AFTER the command are enabled by turning this option on

nolog
Currently ignored.

igncr (cygwin)
Force bash to ignore \r (in windows line endings \r\n), independently of cygwin's mount style. It controls regular scripts, command substitution 
and sourced files. Cygwin text mounts automatically work with either line ending style, because the \r is stripped before bash reads the file.

physical (P)
If set, the shell does not resolve symbolic links when executing commands such as cd that change the current working directory. It uses the physical 
directory structure instead. By default, bash follows the logical chain of directories when performing commands which change the current directory.
For example, when set +P, if /usr/sys is a symbolic link to /usr/local/sys then:
    $ ls /usr/sys
    lrwxrwxrwx 1 ivan 30 Sep 15 15:45 /usr/sys -> /usr/local/sys
    $ cd /usr/sys; echo $PWD
    /usr/sys
    $ cd ..; pwd
    /usr

when set -P, then:
    $ cd /usr/sys; echo $PWD
    /usr/local/sys
    $ cd ..; pwd
    /usr/local



