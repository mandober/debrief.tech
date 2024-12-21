# Index :: Shell taxonomy

- *nomenclature*, a set of rules used for forming the names or terms in a particular field of sciences; a set of names or terms.
- *taxonomy*, a classification in a hierarchical system; a particular technique used to make a classification.



Command kinds (commands by scope)
- Internal commands
- External commands

Command namespaces
- aliases
- shell words
  - shell tokens
  - reserved words
  - shell operators
  - metacharacters
  - keywords
- functions
- builtins
- programs


Commands by priority (command name resolution)
- Internal commands
  - bash aliases
  - special POSIX builtins (only in POSIX mode)
  - bash keywords
  - bash functions
  - bash builtins
- External commands
  - programs


Shorthands
- CNR     Command name resolution
- ANR     Alias name resolution
- FNR     Function name resolution
- BNR     Builtin name resolution
- PNR     Program name resolution
- RedOp   Redirection operator
- AritExp Arithmetic expansion
- ParExp  Parameter expansion
- TilExp  Tilde expansion
- WoSp    Word splitting

- Bb  Bash builtin
- Bs  Bash builtin inherited from Bourne shell, sh
- Rw  Bash reserved word
- Kw  Bash keyword
- Mc  Bash metachar
- Sb  Bash shopt (shell options)
- So  Bash setopt (bash set options)




Programs by type
- executables
  - binaries, compiled programs
  - executable shell scripts
- sourceables
  - shell scripts
