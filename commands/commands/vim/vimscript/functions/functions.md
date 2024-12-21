# Vimscript :: Functions

- naming convention
- function
- user function
- builtin function
- lambda expression
- passing functions around (fucntion name as string)
- calling functions
- function parameters
- function arguments
- scope of parameters/args (p:arg)
- variadic functions (`...`, `a:000`)
- args as arg-sequence
- args in a list
- function attributes (`dict`, `abort`, ...)
- functions in Vim9
- partial function
- :def vs :func (new vs legacy functions)
- vim9script with :func
- calling legacy :func from :def
- default params
- rest param
- unpacking a list



## Functions

In legacy script, the definition of a function starts with the `fu[nction]` keyword. Adding a bang, `function!,` means the existing function is first deleted before a newly sourced definition of the function with the same name is added. Definition end with `endfu[nction]`.

User functions must start with a capital letter.

## Naming convention

- user function names must begin with an uppercase letter.
- funcref var to such function must also begin with an uppercase letter.
- without any prefix, global prefix `g:` is assumed, `Global()` => `g:Global`
- prefix function name with `s:` to place it in the script scope
- script-scoped function names may begin with a lowercase

```vim
fun GlobalFn() | endfun
fun g:GlobalFn() | endfun
fun s:ScriptScoped() | endfun
fun s:scriptScoped() | endfun
```


## Funcref

Functions are NOT first-class values in Vimscript, they cannot be referred to by their bare name (like in e.g. JS). Instead, to pass a function around, we must first create a funcref (function reference) to it.

A *funcref* is a variable that refers to a function. It is created by passing a function's name **as a string** to either `function()` or `funcref()` (there are some differences between these two).

A Funcref can refer to user or builtin functions.



## Calling a function


- `:call {f} {args}` command calls a function {f}, discarding the return value. The args to the function are given one by one.

- `call({f}, [args])` function calls a function, discarding the return value. The args to the function are given as a List.

## Defining a user function

```vim
function! EchoQuote()
  " indent is optional
  echo 'Defining a user function. Must start with a capital.'
endfunction
```

## Calling a user function

We must first source the script where the user function is defined (e.g. `source %`), and then we can call it, e.g. from the cmdline:

```vim
:EchoQuote()        " wrong
:call EchoQuote()   " ok
```
