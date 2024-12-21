# Bash Style, Conventions and Doctrine

- shebang: `#!/usr/bin/env bash`



# στιλ

ϕoω βαρ βαζ

παραμϵτϵρ, λoκαλ παραμ, γλoβαλ παραμ, αρραυ παραμ, αριτημoσ νυμβϵρ ναμβϵρ
ϕυνξτιoν ϕανκξν χυλoϕoν δϵϕoλτ παρσινγ πασσ βυ Vαλυϵ πασσ βυ ναμϵ νoμϵν
βαση σηϵλ σχϵλ γνυ γϵτoπτ σνακϵ_κϵισ Πασκαλ Kασϵ νϵσϵσϵρι ϵχπρϵσσιoν
ινπυτ oυτπυτ ρϵτυρν σκαλαρ

- var-scalar use *pass-by-name* and *pass-by-value*
- var-array use *pass-by-name*
- positional-params use gnu `getopt` for parsing
- function-name uses snake_case
- var-global uses snake_case
- var-locals use a single lowercase letter or a two word name in camelCase
- one function per file
- by default, unless the user has supplied a var-name i.e. param-output, functions "return" their value by assigning it to a var-global with the same name. This may be used for scalars as well because command substitution is slow. However, this is limited to sourceables only.
- input parameters, param-input, are not assigned to a function's local vars, var-local, if not necessary. The intermediate vars are skipped whenever possible using the bash's intrinsic variable, `$_` var-latest, that holds the value of the last arg of the most recently evaluated expression. (you'd retrive that value on the cmdline with <kbd>Alt+.</kbd>)



## Variables

Variables are passed around using *pass-by-value* and *pass-by-name*.

**Pass-by-value** is the standard way: the name of a parameter prefixed with a dollar sign triggers the *parameter expansion*, such that the variable's value takes the place of its name (on the command line or in a script).

A command always sees its positional parameters as string literals; it can never know what the actual command line data was.

Bash picks up the raw command line and processes it performing expansions and substitutions before it feeds it to a command. From a command's perspective, the processed command line looks like a sequence of string literals. A command will never know if these strings came as a result of expansions or if they were literals all along.

This may not make much difference for scalar values, since their single-unit payload will be delivered in any case, but it makes all the difference for var-arrays.


## Arrays

Arrays must use *pass-by-name* semantics. This relias on upon a convention that must be respected by the caller.

While a function that accepts an array passed in using *pass-by-value* is possible, using such function would be extremly inconvenient (you would have to write all those braces and brackets). It would be limited to accept just a single array because if it were to accept more, it wouldn't be able to tell where one array ends and another begins. Similarly, it wouldn't be able to use options without introducing ambiguity between an option and an array's element.

```bash
concat "${arr1[@]}" "${arr2[@]}"
```

For example, in this *pass-by-value* call above, the function is not able to discern anything about the origin of parameters. We can sympathise with the function's dillema through the transcript of the anthropomorphized dramatisation: "were there two [arrays] or one? Perhaps even several, some of which empty. Hmmm, but were they arrays really? Scalar variables are notorious for collective expansions. Maybe it was the damn literals all along."


## Functions

Bash has *dynamic scoping*, which can be made evident by having a sequence of functions call one another. The global scope is the top level scope, outside any function.


```bash
x=top

a(){ 
  echo $x
}

b(){
  echo $x
}


echo $x;
```


- functions have *dynamic scoping*:
- a local func var can overshadow a global one
- in functions, *local variable names* are either
  - using a single lowercased letter, or
  - using at least 2 words, in PascalCase


## Returning values
- functions can only return status code, as a u8 integer 0-255
- so the value is "returned" by echoing it to stdout (or some other FD) and then capturing it on the caller's end.
- since command substitution is for arrays impossible, the resu



# βόμβα στυλ

- vorsprung durch bashism
- avoid 30+ years old constructs
- project hatered onto single brackets
- reject compatibility, ridicule portability
- force unreasonable dependencies
- fixate on the latest bash features regardless of purpose
- encourage posix non-conformity
- make explode bash v.3
- detest .sh suffix
