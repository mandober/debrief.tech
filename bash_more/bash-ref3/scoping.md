# Scoping

Scopes
- global scope
- function-local scope
- temporary-var, subshell-var scope

Almost everything is bash has global scope.

Variables are by default global, but functions may have "local" variables. Bash has **dynamic scoping**, which means that the scoping ruled for visibility of function-local variables do not relay on how the code is authored (that is lexical scoping) but on the call order.

A function starts resoving a variable by searching its own scope, then it looks at variables in the caller function - the callee sees all the callers variables. The search continues down the stack call-chain all the way up to the global scope. This means that bash doesn't have true local vars - vars that stay private and visible only inside the function that declared them.

A variable declared at the top level is global, and a var declared in a function definition may be function local if it uses `local`, or equivallently, `declare` bultin.

The advantage of the `local` bultin is its explicitness, as the term clearly states what kind of scope the declared variable is getting itself into. But a  disadvantage is that the `local` can only be used inside a function.

If it happens, as it often does, that its containing line is copy-pasted in a non-function scope (and there is only one other scope in bash - the global scope), the code would fail.

On the other hand, the `declare` builtin will declare a conext-sensitive variable. Just by replacing the word `local` with `declare`, the meaning stays the same.


means the same when it is used inside a function, while in a non-function context, no error occurs because `declare` is more general than the `local` builtin, in that it declars *context-local variables*: inside a function context it declaresa *local-var*, but outside it, the only other context is global, so it `declare` declares a *global-var*.

-local var, only the context happens to be top-level i.e. global context, hence the declaration of a global var.
`declare` declares

By default, variables are global.


Internally, Bash uses *hash tables* to store and retrieve shell variables, and *linked lists* of these hash tables to implement *variable scoping*.

There are different *variable scopes* for *shell function calls* and *temporary scopes for variables* set by assignment statements preceding a command.

When the assignment statements precede a *builtin*, the shell has to keep track of the correct order in which to resolve variable references, and the *linked scopes* allow bash to do that. There can be a surprising number of scopes to traverse depending on the execution nesting level.
