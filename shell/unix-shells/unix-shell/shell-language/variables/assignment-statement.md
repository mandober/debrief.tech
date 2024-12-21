# Shell :: Assignment statement

- In general, an *assignment* looks like `NAME=VALUE`. It is a name-value pair.
- Such pair is an *assignment statement* when it appears by itself on a line
- such line may appear in a shell script or the command line
- however, an assignment is not considered to be a command, so it lacks exit status, it doesn't trigger debug or error traps, 

# Assignment

Shell variable assignments (i.e., words of the form `NAME=VALUE`) are a kind of simple command themselves (except they are not).

Assignment statements can either precede a command name or stand alone on a command line:
- If they precede a command, the variables are passed to the executed command in its environment.
- If they precede a built-in command or shell function, they persist, with a few exceptions, only as long as the builtin or function executes.
- If they're not followed by a command name, the assignment statements modify the current shell's state.



In bash, an assignment statement has the general form `NAME=VALUE`.

Bash insists that `NAME` must be identifier-compatible.

The equals sign is a separator between the left-hand side containing a NAME and the right-hand side containing a VALUE. The shell is very strict about the spacing around the equals sign - there must be none.

The form `NAME=` is a degenerate version of an assignment statement that assigns the empty string to NAME; the empty string is also called *null* value.

The `declare` bash builtin can be used to only declare a variable without assigning it a value (for whatever reson).

The `VALUE` part is somewhat tricky to type. It could be typed as string, and most of the time it would be fine to do so. Numbers are expressed as strings, even when a variable has the 'i' attribute

The `declare` bash builtin can produce various listings of shell variables. For each shell varaible, it lists its NAME, attributes, VALUE.

```
declare -- BASH_VERSION="5.1.16(1)-release"
declare -ar BASH_VERSINFO=
declare -A BASH_ALIASES=()
declare -i x="45"
```

The shell differentiates between
- undeclared (non-existing) variable
- (declared) variable with null value
- (declared) variable with non-null value

Classes of variables
- shell variables
  - environment variables
  - exported variables
  - inherited variables
- parameters
  - special parameters
  - positional parameters
- user variables
- by properties
  - vars with special properties
- by type
  - string
  - delimiter-separated list of values
    - dirs
- by origin
  - sh variables
  - bash variables
- functions vs variables

## Builtins that handle variables

declare
unset
export
readonly
set
