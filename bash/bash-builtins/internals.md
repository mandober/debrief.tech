# Bash :: Builtins

Bash :: Builtins



builtin_enabled
builtin_deleted
static_builtin
special_builtin
assignment_builtin
posix_builtin
localvar_builtin
arrayref_builtin


Flags describing various things about a builtin

```c
#define BUILTIN_ENABLED    0x01  /* builtin is enabled. */
#define BUILTIN_DELETED    0x02  /* has been deleted with enable -d. */
#define STATIC_BUILTIN     0x04  /* builtin is not dynamically loaded. */
#define SPECIAL_BUILTIN    0x08  /* is a Posix special builtin. */
#define ASSIGNMENT_BUILTIN 0x10  /* builtin takes assignment statements. */
#define POSIX_BUILTIN      0x20  /* special to Posix command search order */
#define LOCALVAR_BUILTIN   0x40  /* builtin creates local variables */
#define ARRAYREF_BUILTIN   0x80  /* builtin takes array references as args */
```

https://github.com/bminor/bash/blob/142bbdd89e4d5bb62aea4469d1d2c24cf470afd8/builtins.h#L42
