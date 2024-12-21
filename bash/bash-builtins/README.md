# Bash :: Builtins

Bash builtins are classified by origin into those inherited from the Bourne shell and those originating with bash itself.
Bash builtins total      (61)
- Bourne shell builtins  (28)
- Bash specific builtins (33)

Builtins significant to POSIX
- intrinsic POSIX builtins (must be available)
- special POSIX builtins (wrt command search)

Builtins by purpose
- Directory stack
- Job control
- Programmable completions
- Configuration
  - set
  - shopt
- Declaration or assignment builtins
  - declare
  - local
  - export
  - readonly
  - unset


Synonymous builtins
- `declare` and `typeset`
- `.` and `source`
- `mapfile` and `readarray`


Builtins synonymous with commands
- `[`    vs `/bin/[`
- `test` vs `/bin/test`
- ...


Internal builtins description flags
- special_builtin, POSIX special builtin
- declaration builtins (assignment builtin)
- posix_builtin, special wrt POSIX command search order
- localvar_builtin, builtin creates local variables
- arrayref_builtin, builtin takes array references as args
- builtin_enabled
- builtin_deleted
- static_builtin, builtin is not dynamically loaded


Builtins may be dis/enabled and new builtins may be coded/compiled by users
- enabled (using `enabled` builtin)
- disabled
- loaded (after compiling newly coded bultin files)
- factory builtin (come with bash)
- builtins installed (added) by users
- static
- dynamically loaded
