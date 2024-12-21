# 4. Builtins

https://www.gnu.org/software/bash/manual/html_node/Shell-Builtin-Commands.html#Shell-Builtin-Commands

* Builtins
  - Bourne Shell Builtins
    Builtin commands inherited from the Bourne Shell
  - Bash Builtins
    Table of builtins specific to Bash
  - Modifying Shell Behavior
    Builtins to modify shell attributes and optional behavior
  - Special Builtins
    Builtin commands classified specially by POSIX

* Bourne Shell Builtins
* Bash Builtins
* Modifying Shell Behavior
* Special Builtins


## About builtins

Builtin commands are contained within the shell itself. When the name of a builtin command is used as the first word of a simple command (see Simple Commands), the shell executes the command directly, without invoking another program. Builtin commands are necessary to implement functionality impossible or inconvenient to obtain with separate utilities.

This section briefly describes the builtins which Bash inherits from the Bourne Shell, as well as the builtin commands which are unique to or have been extended in Bash.

Several builtin commands are described in other chapters: builtin commands which provide the Bash interface to the job control facilities (see Job Control Builtins), the directory stack (see Directory Stack Builtins), the command history (see Bash History Builtins), and the programmable completion facilities (see Programmable Completion Builtins).

Many of the builtins have been extended by POSIX or Bash.

Unless otherwise noted, each builtin command documented as accepting options preceded by '-' accepts '--' to signify the end of the options. The :, true, false, and test/[ builtins do not accept options and do not treat '--' specially. The exit, logout, return, break, continue, let, and shift builtins accept and process arguments beginning with '-' without requiring '--'. Other builtins that accept arguments but are not specified as accepting options interpret arguments beginning with '-' as invalid options and require '--' to prevent this interpretation.
