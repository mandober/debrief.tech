# Bash Builtin: complete

complete -pr [-DE] [NAME ...]
complete [-abcdefgjksuv] 
         [-o comp-option] 
         [-DE]
         [-A action]
         [-G globpat]
         [-W wordlist]
         [-F function]
         [-C command]
         [-X filterpat] 
         [-P prefix]
         [-S suffix] 
         NAME [NAME ...]


## First form

complete -pr [-DE] [NAME ...]

Specify how args to each name should be completed.



(no option)
Existing completion specs are printed in a reusable way

`-p`
Existing completion specs are printed in a reusable way

`-r NAME`
Removes a completion specs for each name

`-r`
Removes all completions 

`-D`
Remaining options and actions should apply to the *default command completion*, which is a completion attempted on a command for which no completion has previously been defined.

`-E`
indicates that the remaining options and actions should apply to *empty command completion*, i.e. completion attempted on a blank line.


## Second form


```
complete [-abcdefgjksuv] 
         [-o comp-option] 
         [-DE]
         [-A action]
         [-G globpat]
         [-W wordlist]
         [-F function]
         [-C command]
         [-X filterpat] 
         [-P prefix]
         [-S suffix] 
         NAME [NAME ...]
```

The arguments to the -G, -W, and -X options, and if necessary the -P and -S options, should be quoted to protect them from expansion before the complete builtin is invoked.


**complete -o compopt**

The compopt controls several aspects of the compspec's behavior beyond the simple generation of completions:

`bashdefault`
  Perform the rest of the default bash completions if the compspec generates no matches.

`default`
  Use readline's default filename completion if the compspec generates no matches.

`filenames`
  Tell readline that the compspec generates filenames, so it can perform any filename-specific processing (like adding a slash to directory names, quoting special characters, or suppressing trailing spaces). Intended to be used with shell functions.

`dirnames`
  Perform directory name completion if the compspec generates no matches.

`plusdirs`
  After any matches defined by the compspec are generated, directory name completion is attempted and any matches are added to the results of the other actions.

`noquote`
  Tell readline not to quote the completed words if they are filenames 	(quoting filenames is the default).

`nospace`
  Tell readline not to append a space (the default) to words completed at the end of the line.

`nosort`
  forces readline to not sort the completion matches (new in bash 4.4)



**complete -A action**

The action may be one of the following names to generate a list of possible completions:

compgen -v, -A variable
compgen -e, -A export
compgen -a, -A alias
compgen     -A arrayvar	    indexed arrays only
compgen     -A function
compgen -c, -A command
compgen -k, -A keyword
compgen -b, -A builtin      print all builtins
compgen     -A disabled     disabled builtins
compgen     -A enabled      enabled builtins
compgen -j, -A job          jobs (if job control is active)
compgen     -A running      running jobs (if job control is active)
compgen     -A stopped      stopped jobs (if job control is active)
compgen -d, -A directory
compgen -f, -A file
compgen -g, -A group
compgen -u, -A user
compgen     -A hostname     as they are in the `$HOSTFILE` file
compgen -s, -A service
compgen     -A setopt       arguments to the `set -o`
compgen     -A shopt
compgen     -A signal       signal names
compgen     -A binding       readline key binding names
compgen     -A helptopic    help topics as accepted by the help builtin


  -b, -A builtin
  -d, -A directory
  -f, -A file
  -v, -A variable
  -e, -A export		exported vars
  -a, -A alias
  -k, -A keyword		bash keywords (for, if, case ...)
  -c, -A command
  -g, -A group
  -u, -A user
  -j, -A job   		jobs (if job control is active)
  -s, -A service
      -A arrayvar	 	indexed arrays (not assoc.arrays)
      -A function
      -A disabled		disabled builtins
      -A enabled 		enabled builtins
      -A setopt 		valid arguments for the set -o option
      -A shopt  		shell option names as accepted by the shopt builtin.
      -A hostname		hostnames (as taken from HOSTFILE shell variable)
      -A running 		running jobs (if job control is active)
      -A stopped 		stopped jobs (if job control is active)
      -A binding 		readline key binding names
      -A helptopic	help topics as accepted by the help builtin
      -A signal 		signal names


examples:
  complete -A variable echo
  complete -A shopt shopt
  complete -A signal kill
  complete -A enabled builtin
  complete -A function load



**complete -F function**

The shell function function is executed in the current shell environment. 
When the function is executed, 
     the 1. argument ($1) is the name of the command whose arguments are being completed, 
     the 2. argument ($2) is the word being completed, and 
     the 3. argument ($3) is the word preceding the word being completed on the current command line. 
When it finishes, the possible completions are retrieved from the value of the COMPREPLY array variable.
example: complete -F _known_hosts xvncviewer


**complete -W wordlist**

The wordlist is split using the characters in the IFS special variable as delimiters, and each resultant word is expanded. 
The possible completions are the members of the resultant list which match the word being completed.
example: complete -W "ubuntu minty arch1604 rhel6 rhel7 centos6 centos7 debian suse fedoras24" ssh


**complete -G globpat**

The pathname expansion pattern globpat is expanded to generate the possible completions.


**complete -C command**

command is executed in a subshell environment, and its output is used as the possible completions.


**complete -X filterpat**

filterpat is a pattern as used for pathname expansion. 
It is applied to the list of possible completions generated by the preceding 
options and arguments, and each completion matching filterpat is removed from the list. 
A leading ! in filterpat negates the pattern; in this case, any completion not matching filterpat is removed.


**complete -P PREFIX**

PREFIX is added at the beginning of each possible completion after all other options have been applied.

Examples:

```bash
complete -A stopped -P '"%' -S '"' bg

complete -A variables -P '"${' -S '}"' echo
```

stopped jobs are prefixed and suffixed when completing bg: `bg "%sleep"`


**complete -S suffix**

suffix is appended to each possible completion after all other options have been applied.





RETURN VALUE

is true unless 
- an invalid option is supplied, 
- an option other than -p or -r is supplied without a name argument, 
- an attempt is made to remove a completion specification for a name for which no specification exists, or 
- an error occurs adding a completion specification.
