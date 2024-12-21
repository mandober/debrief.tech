# Bash :: Glossary


shell parameters
special parameters
positional parameters
parameter name
name
shell variables
assignment statement, variable assignment
compound assignment syntax
variable attribute
dollar-single-quotes
dollar-double-quotes
declaration builtins
transformation operators

## Assignment statement
Assignment statements pertain to variables only, since only variables can be assigned to. An assignment (statement) is a `VAR=VALUE` pair. The so-called declaration builtins take assignment statements as arguments.

## Keyword parameters
Shell variables may be given values when a shell procedure is invoked. An argument to a shell procedure of the form NAME=VALUE causes VALUE to be assigned to NAME before execution of the procedure begins. The value of NAME in the invoking shell is not affected. Such names are sometimes called keyword parameters.

## Parameters
Parameters are containers for values. There are 3 kinds of parameters in bash: positional, special and variables.

## Special parameter
Special parameters have distinctive names which consist of a single symbol. Special parameters can only be referenced, never assigned to.

## Positional parameter
A positional parameter is a parameter whose name is a number (except 0). Positional parameters can only be referenced, never assigned to.

## Variables
Variables are parameters whose names are identifiers.


## Declaration builtins
Declaration builtins are `alias`, `declare` (typeset), `export`, `readonly`, `local`. Declaration builtins take assignment statements as operands.

## Operand
All commands have a subject - that on which they operate, or pertain to, or deal with. For example, the operand of the `ls` are directories, the operand of the `ps` are processes (PIDs), the operand of the `chmod` are FS items. Operands are also called *non-option arguments*.

## Options
Command arguments are classified as options and operands (non-options). Almost all commands accept a number of options which affect their behavior. Options come in two flavors: short and long options.

## Degenerate command
A command that consists only of assignment statements and redirections. In deviant commands, assignment statements* are performed before redirections.

## Temporary environment augmentation
The environment for any simple command or function may be augmented temporarily by prefixing it with parameter assignments. These assignment statements affect only the environment seen by that command.

If the `keyword` *setopt* is set (`set -k` or `set -o keyword`), then all parameter assignments are placed in the environment for a command, not just those that precede the command name (e.g. `a=1 COMMAND b=2 c=3`).

When Bash invokes an external command, the variable `$_` is set to the full pathname of the command and passed to that command in its environment.

## Compound assignment syntax
Compound assignment syntax: `name+=val`. 
Arrays are assigned to using *compound assignments* of the form `arr=(a b … )`

## Interactive shell
An interactive shell is one whose input and output are connected to a terminal.
