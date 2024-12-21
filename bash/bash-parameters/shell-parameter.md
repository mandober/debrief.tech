# 3.4 Shell Parameters

https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameters

## Parameters

>A **shell parameter** (or just parameter) is a named entity that stores a value.

A parameter has a name and a value.

Parameters are divided into 3 classes according to the type of their name:
- varaibles: names are identifiers
- special parameters: names are single symbols ($@, $$, $!, $-, …)
- positional parameters: names are integers ($0, $1, …)

>A *parameter is set* if it has been assigned a non-null value, e.g. `VAR=1`.

>A *parameter is unset* if it is not declared or if it was assigned a null value (empty string), e.g. `VAR=`.


## Variables

>A **variable** is a parameter denoted by a identifier. That is, variables are parameters that have alphanumeric (more-less) names.

A variable has a
- name
- value
- attributes

A *variable is set* if it has been assigned a non-null value, e.g. `VAR=1`.

A *variable is unset* if it wasn't declared (unknown name), or if it was assigned null (empty string), e.g. `VAR=`.

Only name is a required property - value and attributes are optional.

## Function and variables

**Functions** and variables are separate entities that live in separate *namespace*. However, functions are sometimes manipulated as if they were variables - the declaration builtins especially do this.

A function and a variable may have the same name - there is no problem cos they live in separate namespaces. However, using the `export` builtin on a variable, e.g. `export NAME` is clear, but if there is a function also named `NAME`, the form `export -f NAME` is used to export that function. But knowing that environment is a set of KEY=VALUE pairs, the question arises how are functions then handled. Namely, a function name cannot be a KEY cos it might conflict with the variable with the same name. Bash actually, "encodes" the function named `FNAME` as something like `BASH_FUNC%%_FNAME` when exporting it.

        BASH_FUNC%%_FNAME='{ BODY; }'

I'm not sure about the details, but I think Bash packs the function in something like above in order to export it as a key=value pair. Then, in th enew environment Bash unpacks it into the familiar format.

Moreover, functions also appear as attributes: `declare` builtin must be asked to list functions expplicitly - it lists variables with no options. Specifying the option `-f` or `-F` to declare makes it list functions. In fact, `declare -f` will list all functions including their bodies (definition), and `declare -F` will list function names only. In the lists, variables without attributes have `--` in the place where attributes go; indexed arrays have `-a` there, and functions have `-f`. So, `-f` may be considered as a quasi attribute that functions have.


### Variable name

Only name is a required property - a variable cannot exist without a name. Names of variables must conform to the rules for identifiers (familiar from many PLs).


### Variable value


### Variable attributes

attributes: [linuxcatrIlfAg]

- `i` integer
- `a` indexed array
- `A` associative array
- `n` nameref
- `x` export
- `r` readonly
- `I` copy attributes (only valid in a function, i.e. nested scope)
- `g` global (only valid in a function)
- `l` lowercase
- `u` uppercase
- `c` titlecase (undocumented)
- `t` trace (functions only)
- `f` function (quasi attribute)
- `-` plain value (quasi attribute)

buildins
- `local` (only valid in a function)
- `export`
- `readonly`
- `unset`


Attributes are primarily assigned using the `declare` builtin (but also with `export`, `readonly`, `local`, `unset`).

The *null string* is a valid value. 
Once a variable is set (declared), it may be unset only by using the `unset` builtin (unless it has readonly attribute).

A variable is assigned a value using the statement of the form

    name=[value]

**Assignment statement** has the form `name=value`, although value may not be given.

If value is not given, the variable is assigned the null string.

    name=
    or
    declare name


All values undergo
- tilde expansion
- parameter (variable) expansion
- command substitution
- arithmetic expansion
- quote removal

If a variable has the *integer attribute*, its value is evaluated as an arithmetic expression even outside `$((…))`.

Word splitting and filename expansion are not performed.

Assignment statements may appear as args to **declaration builtins**:
- declare/typeset
- export
- readonly
- local
- alias

When in POSIX mode, these declaration builtins may appear in a command after one or more instances of the `command` builtin and retain these assignment statement properties.

## Compound assignment

In the context where an assignment statement is assigning a value to a shell variable or array index, the `+=` *operator* can be used to **append** (in string context) or **add** (in integer context) to the variable's current value.

```bash
# in string context, values are concat
nums='one two'
nums+='three four'

# in arithmetic context, values are added
num=4
num+=6

# in indexed array context, new element(s) are inserted
arr=(one two)
arr+=(three four)

# in ass. array context, new key-value pairs are inserted
declare -A ass=(one uno two due)
ass+=( three tre four quinque )
# or, equivalently
ass+=( [three]=tre [four]=quinque )
```

This includes arguments to builtins such as `declare` that accept assignment statements (declaration commands).

When `+=` is applied to a variable for which the *integer attribute* has been set, value is evaluated as an arithmetic expression and added to the variable's current value, which is also evaluated. 

When `+=` is applied to an *array* variable using *compound assignment*, (the variable's value is not unset - as it would be with `=`), but new element(s) are inserted into the array.

For *indexed arrays*, `arr+=( foo bar )`, inserts two new elements: foo at index that is one greater than the array's max index, and similarly for bar.

For *associative arrays*, `ass+=( three tre four quinque )`, inserts two new key-value pairs: `[three]=tre` and `[four]=quinque`.

When applied to a *string-valued variable*, value is expanded and appended to the existing variable's value.

## References

reference
referant
referee

A variable can be assigned the *nameref attribute* using the `-n` option to the `declare` or `local` builtins to create a *nameref* or *reference* to another variable.

This allows variables to be manipulated *indirectly*. 

Whenever the *nameref variable* is referenced, assigned to, unset, or has its attributes modified (other than using or changing the nameref attribute itself), the operation is actually performed on the *referring variable* (var specified by the nameref variable's value).

A nameref is commonly used in shell functions to refer to a variable whose name is passed as an argument to the function. For instance, if a variable name is passed to a function as first arg, then `declare -n ref=$1` inside the function creates a nameref variable `ref` whose value is the variable name passed in `$1`. References and assignments to `ref`, and changes to its attributes, are treated as references, assignments, and attribute modifications to the variable whose name was passed as `$1`.

If the *control variable* (iterating variable) in a *for loop* has the nameref attribute, *the list of words can be a list of shell variables*, and a name reference will be established for each word in the list, in turn, when the loop is executed.

Array variables cannot be given the nameref attribute. However, nameref variables can reference array variables and subscripted array variables.

Namerefs can be unset using the `-n` option to the `unset` builtin. Otherwise, if unset is executed with the name of a nameref variable as an argument, the variable referenced by the nameref variable will be unset.


[positional parameters](./positional-parameters.md)
[special-parameters](./special-parameters.md)
