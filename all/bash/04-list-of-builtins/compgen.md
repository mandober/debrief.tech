# Bash Builtin: compgen

compgen [option] [WORD]

Generate possible completion matches for WORD according to the options, which may be any option accepted by the `complete` builtin with the exception of `-p` and `-r`, and write the matches to the standard output.


* When using the -F or -C options, the various shell variables set by the 
  programmable completion facilities, while available, will not have useful values. 
  The matches will be generated in the same way as if the programmable completion code had generated them 
  directly from a completion specification with the same flags.
* If WORD is specified, only those completions matching word will be displayed

Return Value:
- 0: true
- 1: if invalid option is supplied, or no matches were generated


complete -pr [-DE] [NAME]
complete [-abcdefgjksuv] 
         [-o comp-option] [-DE]
         [-A action]
         [-G globpat]
         [-W wordlist]
         [-F function]
         [-C command]
         [-X filterpat]
         [-P prefix]
         [-S suffix]
        NAME



*Actions*
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
