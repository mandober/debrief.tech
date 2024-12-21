# Shell variables

*Shell variables*, or just *variables*, are named containers for values, similarly to variables in programming languages, but with lots of edge cases.

A *shell variable* is a `NAME=VALUE` pair; more precisely, it is a NAME possibly associated with a value (to account for `NAME=`, which is a NAME with null value); most precisely, it is a NAME, possibly assigned a value and a set of attributes.

## Variable declaration

First, a **declaration** means introducing a new name into the current environment without defining it - without assigning it a value. A shell variable may be declared using the `declare` or `typeset`bash builtins (they are each other's aliases).

```bash
declare varx
# in the 'declare -p' listing shown as
# declare -- varx
```

Declaring a variable using `declare` makes it a command. **Defining a variable** using NAME=VALUE pair is not considered a command (means no exit status among other things).




Variables in the shell serve a similar purpose as those in PLs; they share the *naming rules*.

The properties of shell variables: name, value, attribute.

Many traditional properties of variables (type, scope) are relied through *attributes*, to a degree. 

For one, shell variables are *untyped* - the *values are just "names"* - but a variable declared with the 'i' (for integer) attribute will only accept numbers as its values; on the other hand, an existing variable that holds a string value can also be given the 'i' attribute, and it will also accept only integers as values - in the future. Its current value, however, will remain a string (the same string).

Shell variables become *environment variables* when given the 'x' attribute. *Exported variables* always include environment variables, but assignments written before the command are made available to a child process as well; `set -o keyword` permits assignments to appear after a command, not only before it. These are also known as one-shot assignments.

*Inherited variables* are shell variable that a child process recives from the parent process; these include env vars and one-shot assignments.
