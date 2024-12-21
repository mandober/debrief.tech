# Index :: Variables

## Declaration and definition

>A **declaration** is the introduction of a new name (identifier) in the current equivalent.

Importantly, a declaration does not imply anything about a value - a newly introduced name may be assigned a value or not. 


>A **definition** is the assignment of a value to a (declared) name.

A definition means that an existing (already declared) name is assigned a value. This is also called *binding*, i.e. a name is *bound* to a value.

Definition subsumes declaration - saying that a variable is defined presupposes that it was declared. But not vice versa: declaration does not imply anything about definition: we jsut cannot know. That is why we cannot just say "declared variables" to mean variables that are declared but not given a value. Instead, to refer to such variables we must use the phrase *declared-only variables*.

>A **declared-only variable** or **unset variable** is a variable that was declared but not assigned a value.

Perphaps confusingly, a declared variable is also said to have a *defined* name, i.e. the name of a variable is defined, but variable is not. 

Declaration has to do with names (identifiers); it is the announcement of a new name in the current scope (e.g. the name is entered into a symbols table, and whether it is defined or not is immaterial). Definition has to do with a value and binding - whether a name is assigned (bound to) a value.

- *declared variable* = existing variable that may or may not have a value
- *defined variable* = (existing) variable that has a value
- *undeclared variable* = unknown variable
- *undefined variable* = possibly declared variable but without a value


In bash, declaration and definition pertains only to variables. 

Like in most programming languages, it is possible to declare and define a variable in a single step. It is also possible to do it in separate steps.


Variables in bash
- non-existing, unknown, unknown identifier
- declared-only, unset, undefined
- defined, set


>In bash, a *declared-only variable* is in some situations treated the same as a non-existing variable!

A declared-only variable is actually bound to *null* (the empty string), and some forms of variable substitutions treat such variables the same as non-existing variable.

Variable substitution forms come in pairs: one form distinguishes between declared-only and non-existing variables, and another form does not.




A variable may be declared using the `declare` builtin (e.g. `declare NAME`). 

A variable being *declared* only implies that it was declared and says nothing about whether it was assigned a value or not. All existing variables are declared - most are assigned a value but perhaps some are not. On the other hand, *defined variables* are both declared and assigned a value. In the negative, *undeclared variables* include only non-existing, unknown, variables. *Undefined (or unset) variables* include both existing but declared-only (without a value) and non-existing variables.


- all variables in bash are shell variables
- env vars are exported shell vars


- var may be declared, and additionally also defined, using the 'declare' builtin, `declare VAR`
- assignment statement defined
