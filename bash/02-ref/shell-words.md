# SHell words

In bash, a *word* appearing in the command line may stand for numerous things. 
This is an attempt at their classification. 
(`typeof` util tries to qualify the supplied word according to this index)

WORDs:
* NAME, `shell-name`
* Parameters `param-name`, `param`
- positional parameter ($1, $2, $*, $@) `param-pos`
- special bash parameter ($$, $-, $#, #!, $_) `param-spec`
- bash parameter, `param-bash` (BASH, BASH_VERSION, BASH_COMMAND)
- variable, variable name, variable identifier, `var`, `param-var`
- exported parameter 
- user variable
- unset (supposing that WORD would be a var but it's unset?)

* Variables, `vars`, and Types
- environment variables, `enwar`, `var-env`
- `var-scalar`
- number
  - boolean (if number is 0 or 1)
  - Integer
  - float
- string
  - char
  - text
  - CSL (colon-separated list)
- array, `var-array`
  - indexed
  - associative

* bash tokens, shell tokens
  - parameter
  - alias
  - function
  - keyword
  - symbols, special chars (<, <<, <<<, &, |, ;)
  - builtin
  - settings
    - shopt
    - setopt

* Positional Parameters
  - option arity
    - option with required arg
    - option with optional arg
  - option type
    - long options
    - short options
  - operands
  - markers
    - `--`
    - `-`
    
* FS element
  - file name
  - dir name

* FILES
  - program
  - script
  - dotfile
  - config

