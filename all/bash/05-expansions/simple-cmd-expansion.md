## Simple command expansion

When a simple command is read, the shell performs expansions, assignments and redirections, from left to right.

* The words, marked by the parser as var-assignments (those preceding the command name) and redirections are saved for later processing, the others undergo expansion. Following expansion, the first word on the command line is presumed to be a command name, the remaining ones positional parameters.

* Redirections are performed.

* Before being assigned, the `value` in each `key=value` pair undergoes:
  - TE, tilde expansion
  - PE, parameter expansion
  - CS, command substitution
  - AE, arithmetic expansion
  - QR, quote removal


* If no command name results, the variable assignments affect the current shell environment. 
  Otherwise, the variables are added to the environment of the executed command and do not affect the current shell environment. 
  If any of the assignments attempts to assign a value to a readonly variable, an error occurs, and the command exits with a non-zero status.

* If no command name results, redirections are performed, but do not affect the current shell environment. 
  A redirection error causes the command to exit with a non-zero status.

* If there is a command name left after expansion, execution proceeds as described below. 
  Otherwise, the command exits. If one of the expansions contained a command substitution, 
  the exit status of the command is the exit status of the last command substitution performed. 
  If there were no command substitutions, the command exits with a status of zero.



## Simple command expansion

http://wiki.bash-hackers.org/syntax/grammar/parser_exec 

This step happens after the initial command line splitting.

The expansion of a simple command is done in four steps 
(interpreting the simple command from left to right):

1. The words the parser has marked as variable assignments and redirections are saved for later processing.
   * variable assignments precede the command name and have the form VAR=VAL
   * redirections can appear anywhere in the simple command

2. The rest of the words are expanded. If any words remain after expansion, 
   the first word is taken to be the name of the command and the remaining words are the arguments.

3. Redirections are performed.

4. The text after the = in each variable assignment undergoes tilde expansion, 
   parameter expansion, command substitution, arithmetic expansion, 
   and quote removal before being assigned to the variable.


★ If no command name results after expansion:

   * The variable assignments affect the current shell environment.
        This is what happens when you enter only a variable assignment at the command prompt.
        Assignment to readonly variables causes an error and the command exits non-zero.
   * Redirections are performed, but do not affect the current shell environment.
        that means, a > FILE without any command will be performed: the FILE will be created!
   * The command exits
        - with an exit code indicating the redirection error, if any
        - with the exit code of the last command-substitution parsed, if any
        - with exit code 0 (zero) if no redirection error happened and no command substitution was done

★ Otherwise, if a command name results:

   * The variables saved and parsed are added to the environment of 
     the executed command (and thus do not affect the current environment)
     - Assignment to readonly variables causes an error and the command exits with a non-zero error code.
     - Assignment errors in non-POSIX modes cause the enclosing commands (e.g. loops) to completely terminate
     - Assignment errors in (non-interactive) POSIX mode cause the entire script to terminate



Simple command execution

If a parsed simple command contains no slashes, the shell attempts to locate and execute it:
* shell functions
* shell builtin commands
* check own hash table
* search along PATH

As of Bash Version 4, when a command search fails, the shell executes a shell function 
named command_not_found_handle() using the failed command as arguments. 
This can be used to provide user friendly messages or install software packages etc. 
Since this function runs in a separate execution environment, you can't really influence 
the main shell with it (changing directory, setting variables).




# Simple Command Expansion


When a simple command is executed, the shell performs the following expansions, assignments, and redirections, from left to right.

The words that the parser has marked as variable assignments (those preceding the command name) and redirections are saved for later processing.
The words that are not variable assignments or redirections are expanded (see Shell Expansions). If any words remain after expansion, the first word is taken to be the name of the command and the remaining words are the arguments.
Redirections are performed as described above (see Redirections).
The text after the ‘=’ in each variable assignment undergoes tilde expansion, parameter expansion, command substitution, arithmetic expansion, and quote removal before being assigned to the variable.
If no command name results, the variable assignments affect the current shell environment. Otherwise, the variables are added to the environment of the executed command and do not affect the current shell environment. If any of the assignments attempts to assign a value to a readonly variable, an error occurs, and the command exits with a non-zero status.

If no command name results, redirections are performed, but do not affect the current shell environment. A redirection error causes the command to exit with a non-zero status.

If there is a command name left after expansion, execution proceeds as described below. Otherwise, the command exits. If one of the expansions contained a command substitution, the exit status of the command is the exit status of the last command substitution performed. If there were no command substitutions, the command exits with a status of zero.
