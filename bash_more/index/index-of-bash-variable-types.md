# Bash :: Parameters

Types of paramters
- shell parameters
  - environment variables (HOME)
  - shell variables (HOME)
  - bash variables (BASH_VERSION)
  - user variables
- positional parameters (1, …, 9)
  - invoking bash
  - executing a script
  - sourcing a script
  - invoking a function
- special parameters (`*`, `@`, `#`, `?`, `-`, `$`, `!`, `0`) and `_` ($_)


- integer (-i)
- reference (-n nameref)
- indexed array (-a)
- associative array (-A)




- parameter expansion
- variable expansion
- array parameters
  - indexed-array parameter
  - associative-array parameter

# Bash :: Index :: Variables

Shell variables have
- a name, `foo=abc`
- a value, `bar=42`
- expansions
  - refer to a var (expand it): `${foo}`, `${foo}`
  - variable expansions
    - patterns ...
- attributes
  - integer `declare -n int`
  - indirection e.g. `declare -n ref=bar`
- expansions
  `${foo}`

may also be referenced by name without using the parameter expansion syntax.


* Variables
  - shell variables
  - bash variables
    - sh variables (inherited from sh shell)
  - env variables
    - exported variables
  - user variables
  - bash attributes for variables
  - parameters


- explicit pattern: `${α}`
  where `α` is an identifier, the name of variable (variable name), a label
  identifier, name, label, binding
- implicit pattern: `$α`
