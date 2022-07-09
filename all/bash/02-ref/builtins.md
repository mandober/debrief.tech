# Bash Builtins

Along with *metacharacters* and *bash keywords*, *bash builtins* form the third major relm of the *fundamental bash tokens*. 

Builtin commands are implemented internally by the shell so that they could be executed in the same shell environment, and not in a subshell.

When the name of a builtin command is used as the first word of a simple command, the shell executes the command directly, without invoking another program.

Builtin commands are necessary to implement functionality impossible or inconvenient to obtain with separate utilities.

Some builtins Bash inherits from the Bourne Shell, and some are unique to or have been extended in Bash.


Several builtin commands are described in other chapters: 
- job control
- directory stack
- command history
- programmable completions

Many of the builtins have been extended by POSIX or Bash.


Unless otherwise noted, each builtin command documented as accepting options preceded by ‘-’ accepts ‘--’ to signify the end of the options.

The `:`, `true`, `false`, and `test/[` builtins do not accept options and do not treat `--` specially.

The `exit`, `logout`, `return`, `break`, `continue`, `let`, and `shift` builtins accept and process arguments beginning with `-` without requiring `--`.

Other builtins that accept arguments but are not specified as accepting options interpret arguments beginning with `-` as invalid options and require `--` to prevent this interpretation.





## Special Builtins

For historical reasons, the POSIX standard has classified several builtins as special. In POSIX mode, the special builtins differ from other builtins in these respects:
* Special builtins are found before shell functions during command lookup.
* If a special builtin returns an error status, a non-interactive shell exits.
* Assignment statements preceding the command stay in effect in the shell environment after the command completes.
* POSIX forbids shadowing the special builtins with an eponymous function (but not with an eponymous alias).

When Bash is not executing in POSIX mode, these builtins behave no differently than the rest of the Bash builtins.

The POSIX special builtins:
- .
- :
- break
- continue
- eval
- exec
- exit
- export
- readonly
- return
- set
- unset
- shift
- trap
