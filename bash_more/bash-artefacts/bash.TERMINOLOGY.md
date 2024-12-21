# Bash :: Terminology 

## bash-features
Bash features are the standard facilities and faculties that come with the bash shell, as opposed to the user-created functionality built on top of it.

## bash-concepts
User-created functionality built on top of the bash shell in order to introduce new or to augment existing bash features. They are contrasted by standard bash features, `bash-features`, which include the facilities and faculties that are available out of the box.

## bash-alias
Bash shell alias. In bash, aliases are expanded first when processing a command line.

## bash-function
Bash shell function

## bash-hook
A shell function set up to execute on a particular event.

## cmdline-expansion
Every cmdline-content is processed, which involves expanding shell words into shell actions.

## cmdline-phase
Processing the command line goes through several phases, some of which are repeated until everything is expanded.

## cmdline-content
In general, a command line is the active screen line, ready to accept user input. More specifically, command-line-contents is used to designate the current command line text content.

## shell-action
## shell-token
The cmdline-content process expands the words into actionable shell tokens that may designate an bash-keyword, alias, function, builtin, command.

## bash-keyword
## bash-metachar
## bash-punctuation
readline-functions and readline-variables

## bash-symbol
The bash-keywords, bash-metachars, bash-builtins that have symbolic names.
