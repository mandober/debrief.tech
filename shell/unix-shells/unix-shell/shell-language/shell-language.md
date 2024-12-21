# Shell language

Shell is primarily a command interpreter - it interprets and executes eexisting comamnds - but it also provides a rudimentary programming language used as scripting and glue language.

Using bash as a programming language is possible but very painful since many elementary concept don't exist. A major pain point is that shell functions (unjustifiedly called functions) only return a single type, `u8`. Moreover, the semantics of the return value is fixed - it is supposed to indicate whether the function finished successfully or not.

A function consists of (multiple) commands, and like with all compound commands it is not so straightforward to tell whether the execution was error free or not. The `-e` option of the `set` builtin was imagined as a "safe mode" for scripts, making the shell bail out on encountering an error. However, it turned out tricky to call out all the error situations, so this safety mode switch got a list of exceptions (exceptions of exceptions).
