# Index :: Shell words


**Input** is a stream of characters.

**Lexical analysis** breaks the input stream into *tokens* that represent the smallest units with a meaning. (The term "token" is more general then "word" since the latter implies letters while the former better conveys the fact that a symbol or a group of symbols can also carry meaning).




slashify_in_quotes          SLASH TICK DOLLAR DQUOTE NL   \ ` $ " \n
slashify_in_here_document   SLASH TICK DOLLAR             \ ` $
shell_meta_chars            ( ) < > ; & |
shell_break_chars           ( ) < > ; & | SPACE TAB NL
shell_quote_chars           DQUOTE TICK SQUOTE  " ` '
shell_exp_chars             $ < >
ext_glob_chars              @ * + ? !
shell_glob_chars            * ? [ ] ^


CWORD           nothing special; an ordinary character
CSHMETA         shell meta character
CSHBRK          shell break character
CBACKQ          back quote
CQUOTE          shell quote character
CSPECL          special character that needs quoting
CEXP            shell expansion character
CBSDQUOTE       characters escaped by backslash in double quotes
CBSHDOC         characters escaped by backslash in here doc
CGLOB           globbing characters
CXGLOB          extended globbing characters
CXQUOTE         cquote + backslash
CSPECVAR        single-character shell variable name
CSUBSTOP        values of OP for ${word[:]OPstuff}
CBLANK          whitespace (blank) character


- character 
- metacharacters 
- break characters 
- string 
- token 
- name 

- *string*: sequence of characters
- *name*: sequence of alphanum characters
  - ASCII identifier [a-zA-Z_][a-zA-Z0-9_]
  - Unicode identifier [Ul Lc _][Ul Lc Di _]
- *words*: strings delimited by break characters, `( | ) & < ; > SPACE TAB NL`.


- *word*: sequence of characters considered to be a single unit
- *list*: sequence of one or more commands or pipelines
- *parameter*: an entity that stores a value; positional and special parameters
- *variable*: parameter denoted by a *name*


## Pattern Matching

Pattern matching is used in bash in
- `[[ … ]]` conditionals
- patterns in case statement
- pathname expansion
- parameter expansion

- `?` one
- `+` one or more
- `*` zero or more

- […]     char class
- [^…]    class complement
- [x-z]   range

- POSIX classes:
  [[:alnum:]]    [[:alpha:]]    [[:ascii:]]    [[:blank:]]
  [[:lower:]]    [[:upper:]]    [[:digit:]]    [[:space:]]
  [[:punct:]]    [[:cntrl:]]    [[:graph:]]    [[:print:]]

Note: the first pair of brackets denotes a class of characters, the second (inner) braket pair is (along with colons) part of POSIX syntax for class names.

Examples
- [[:alpha:]_ ]   Matches alphabetic character or underscore or space
- [^[:ascii:]]    Matches non-ASCII characters


## Special Parameters

  $* $@ $# $- $$ $0 $! $? $_

Parameters providing various information about the shell state
- $*  positional parameters
- $@  positional parameters
- $#
- $-  shopt
- $$  bash PID
- $0  cmd name
- $!  bash PID
- $?  last exit code
- $_  previous command

## Parameter expansion

  ${param-default}
  ${param=default}
  ${param+alternate}
  ${param?error}

Treat empty as unset

  ${param:-default}
  ${param:=default}
  ${param:+alternate}
  ${param:?error}


- List names of vars matching a prefix: ${!pa*} or "${!pa@}"
- List array keys: ${!name[*]} or "${!name[@]}"
- Expand to length: ${#param}
- Indirect expansion: ${!param}

```bash
var=122

# indirect var expansion
par=var
echo ${!par}
#: 122

# with a nameref
declare -n ref=var
echo $ref
#: 122
```

- Substitute first match, ${param/pattern/string}
- Substitute all matches, ${param//pattern/string}
- Substitute from left,   ${param##pattern/string}
- Substitute from left,   ${param/#pattern/string}
- Substitute from right,  ${param/%pattern/string}
- Substitute from right,  ${param%%pattern/string}


Since bash 5.2: new shell option: patsub_replacement. When enabled, a `&` in the replacement string of the pattern substitution expansion is replaced by the portion of the string that matched the pattern. Backslash will escape the `&` and insert a literal `&`.



## Parameter expansion - substrings

substrings extraction

  ${param:offset}
  ${param:offset:length}

Removal from beginning

  ${param#pat}
  ${param##pat}

Removal from end

  ${param%pat}
  ${param%%pat}

## Parameter transformation operators

- `@A` since v5.1 prints a declare command that sets the var's attributes if var has attributes but is unset
- `@a` since v5.1 prints attributes for unset array variables
- `@E`
- `@K` displays associative arrays as key-value pairs
- `@k` like `@K` but expands the result to separate words after word splitting
- `@L` convert to lowercase
- `@P`
- `@Q`
- `@q`
- `@U` convert to uppercase
- `@u` convert first character to uppercase


Since bash 5.2 invalid parameter transformation operators are now invalid word expansions, and so cause fatal errors in non-interactive shells.


Since bash 5.2, `declare` and `local` have `-I` option that inherits attributes and value from a variable with the same name at a previous scope.


## Associative arrays

Since bash 5.1 can be defined as

```bash
declare -A aq=(one 1 two 2)
# which is the same as
declare -A ar=([one]=1 [two]=2)

declare -p aq ar
#: declare -A aq=([two]="2" [one]="1" )
#: declare -A ar=([two]="2" [one]="1" )
```


## Indexed arrays

Assign an array by elements:
 array=( zero one two "three and more" )

Add an element to an array:
 array+=( "four and beyond" )

Recreate array with spaces in elements as underscores:
 array=( "${array[@]// /_}" )

Recreate array only with elements from index 2 to 4:
 array=( "${array[@]:2:3}" )

Print element at index 1 of array:
 echo "${array[1]}"

Print array indexes:
 echo ${!array[@]}

Convert a var into array var:

```bash
reg=123
declare -p reg
#: declare -- reg="123"
reg[1]=45
declare -p reg
#: declare -a reg=([0]="123" [1]="45")
```



```bash
# read (redirect) a file as command subst
echo "$(< /etc/os-release)"

# exit code 1
(( 0 ))
# exit code 0
(( 1 ))
(( 100 ))
```

Bash can actually complete (generate) a list of files into a nested brace expansion format with `M-{`. For example, go to `/dev` to try it.


## Misc

Here-docs and here-strings now use pipes for the expanded document if it's smaller than the pipe buffer size, reverting to temporary files if it's larger.

Bash posix mode now treats assignment statements preceding shell function definitions the same as in its default mode, since POSIX has changed and no longer requires those assignments to persist after the function returns.
