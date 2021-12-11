# Bash Hooks

Handles or hooks are functions that, if available in the env, bash treats specially.


Handles:
- `command_not_found_handle`
- BUILTIN_builtin_load (enable -f)
- BUILTIN_builtin_unload (enable -f)
- cd (cd)
- PROMPT_COMMAND


`cd`
Executed whenever the current working directory is changed.

`PROMPT_COMMAND`
(precmd iz zsh) executed before each prompt is displayed.

`command_not_found_handle`
in the interactive mode Bash calls this function when a command lookup fails; it passes the lookup command as the first arg. This is used in Ubuntu to prompt the user to install the missing app.



## Potential hooks

`preexec`   
is executed before each interactive command is executed, with the interactive command as its argument.



- BASH_ENV, ENV
- MAIL, MAILPATH, MAILCHECK
- PS0, PS1, PS2, PS3, PS4



## BASH_ENV
If set, the value (subject to parameter expansion, command substitution, arithmetic expansion) is interpreted as a file location to a file that **will be sourced in the same child env as the script about to be executed**. The file must be referenced using the absolute path.
`export BASH_ENV=$HOME/pre-script-hook.bash`

## ENV
The same as `BASH_ENV` but only valid in POSIX mode. Also, it has been said that the file must contain only key=value pairs.



Using MAIL, MAILPATH and MAILCHECK to monitor file changes

## MAIL
If this parameter is set to a file name and the MAILPATH variable is not set, bash informs the user of the arrival of mail in the specified file. It can be used to monitor any file for changes. To monitor several files see MAILPATH.
`MAIL=$HOME/.bashrc`


## MAILPATH
Colon-separated list of file names to be checked for mail. The message to be printed when mail arrives in a particular file may be specified by separating the file name from the message with a "?" When used in the text of the message, "$_" expands to the name of the current mail file.
`MAILPATH='/var/mail/bfox?"You have mail":~/shell-mail?"$_ has mail!"'`

Bash supplies a default value for this variable, but the location of the user mail files that it uses is system dependent, e.g. "/var/mail/$USER"
`MAILPATH='$HOME/.bashrc?$_ changed!:$HOME?Dir $_ changed!'`


## MAILCHECK
Specifies how often (in seconds) bash checks for mail. The default is 60 seconds. When it is time to check for mail, the shell does so before displaying the primary prompt. If this variable is unset or set to a value that is not a number greater than or equal to zero, the shell disables mail checking.
`MAILCHECK=120`
