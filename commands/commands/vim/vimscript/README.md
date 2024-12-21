# Vimscript

https://vimhelp.org/usr_41.txt.html

- 41.1 Introduction
- 41.2 Variables
- 41.3 Expressions
- 41.4 Conditionals
- 41.5 Executing an expression
- 41.6 Using functions
- 41.7 Defining a function
- 41.8 Lists and Dictionaries
- 41.9 White space
- 41.10 Line continuation
- 41.11 Comments
- 41.12 Fileformat

## 41.1 Introduction

Vim script comes in two flavors: legacy and Vim9. While legacy script is particular for Vim, Vim9 script looks more like other languages, such as JS.

```vim
vim9script

" vars use 'var' declarator.
" vars are scoped to a script.
var i = 1

" global vars do not use 'var' declarator.
g:globalVar = "global var's value"

" while loop
" C-C (C-Break on Windows) to break out of infinite loops
while i < 5
  echo "count is" i
  i += 1
endwhile

" for loop
for i in range(1, 4)
  echo $"count is {i}"   " ← yey, string interpolation
endfor

" delete a global var - errors if var doesn't exist
unlet g:globalVar

" delete a global var - no error if var doesn't exist
unlet! g:globalVar

var counter = 0

" v9 functions are typed (↙ return type)
def g:GetCount(): number
  counter += 1
  return counter
enddef

" v9 is typed

" to only declare vars (and init then later), must type them
var name: string
var age: number

" initialize the declared typed vars
if male
  name = "Peter"
  age = 42
else
  name = "Elisa"
  age = 45
endif
```

To use Vim9 script, the first line must contain 'vim9script' declaration. It is recommended to put it at the very fist line, before any comments.

## 41.2 Variables

`:let` lists all global vars in Vim's command-line.

Vars are script-scoped in V9. To make a global var use `g:` prefix and assign a value to it directly, without using `var`, e.g. `g:global_var = 5`.

There are other kinds of variables with prefixes like b:, v:, w:, etc.

You cannot `unlet` script-local vars in Vim9 script, only in legacy script. If you worry a script-local var is consuming too much memory, set it to an empty or null value.

Dquoted strings can contain special characters
- \t         <Tab>
- \n         <NL>
- \r         <CR>, <Enter>
- \e         <Esc>
- \b         <BS>
- \"         " (dquote)
- \\         \ (backslash)

- \<Esc>     <Esc>
- \<C-W>     CTRL-W

Last two are examples: `"\<name>"` form is used to include the special key. See [expr-quote](https://vimhelp.org/eval.txt.html#expr-quote) for the full list of special items in a string

## 41.3 Expressions

https://vimhelp.org/eval.txt.html#expression-syntax

Numbers, strings and variables are expressions by themselves. Thus everywhere an expression is expected, you can use them. Other basic items in an expression:
- $NAME     environment variable
- &name     option value
- @r        register contents

```vim
echo "The value of 'tabstop' is" &ts
echo "Your home directory is" $HOME
if @a == 'text'
```

The `&name` form can be used to set, modify, restore an option.

```vim
var save_ic = &ignorecase
set noic
s/The Start/The Beginning/
&ic = save_ic
```

This makes sure the "The Start" pattern is used with 'ignorecase' option off; still, it keeps the value that the user had set.

* Expressions

```vim
echo nr > 5 ? "a" : "b"   " ternary conditional

expr3 || expr3            " logical OR
expr4 && expr4            " logical AND

expr5 =~ expr5            " regexp matches
expr5 !~ expr5            " regexp doesn't match

expr5 ==? expr5           " case-insensitive string equality
expr5 ==# expr5           " case-sensitive string equality

expr5 == expr5            " equality
expr5 != expr5            " inequality
expr5 ! = expr5            " i.e. bang equals

expr7 + expr7             " number addition

expr6 << expr6            " bitwise left shift
expr6 >> expr6            " bitwise right shift

expr5 is expr5            " List, Dict, Blob: same instance
expr5 isnot expr5         " List, Dict, Blob: distinct instance

list1 + list2             " list concatenation
blob1 + blob2             " blob concatenation

'a' .. 'b'                " string concatenation
echo "my " .. name        " string concatenation
echo $"my: {name}"        " string interpolatation

echo "count is" i         " but this also works for vars
echo "count is" $HOME     " but this also works for env vars
echo "textwidth is" &tw   " but this also works for options

<type>expr9               " type check and conversion (Vim9 only)

[expr1, ...]              " List
{expr1: expr1, ...}       " Dictionary
#{key: expr1, ...}        " legacy Dictionary

expr10[expr1 : expr1]     " slicing a string
expr10[expr1 : expr1]     " slicing a list

(expr1)                   " nested expression
variable                  " internal variable
va{ria}ble                " internal variable with curly braces

&option                   " option value
$VAR                      " environment variable
@r                        " contents of register 'r'

str12[exp1]               " indexing a string
list1[exp1]               " indexing a List
expr10.name               " access Dict item

expr10->name(expr1, ...)  " method call
expr10(expr1, ...)        " function call with Funcref variable

function(expr1, ...)      " function call
func{ti}on(expr1, ...)    " function call with curly braces

{args -> expr1}           " lambda expression legacy
(args) => expr1           " lambda expression Vim9
```

* Legacy lambdas
https://vimhelp.org/eval.txt.html#lambda

```vim
" mapping with legacy lambdas
:echo map([1, 2, 3], {idx, val -> val + 1})    " [2, 3, 4]
:echo sort([3,7,2,1,4], {a, b -> a - b})       " [1, 2, 3, 4, 7]
```

* Lambdas in Vim9
https://vimhelp.org/vim9.txt.html#vim9-lambda

Vim9 script uses similar syntax to JS for lambdas (different than the syntax for legacy lambdas):

    var Lambda = (arg) => expr
    var Lambda = (arg): type => expr

No line break is allowed in lambda's args up to and including the `=>` (so that Vim can tell the difference between an expr in parens and lambda args), but you can still use a backslash to escape a NL.

Vim9 lambdas require the same number of declared params and args. There is a JS-like 'rest' operator `...` to accept any number of args.

```vim
" mapping with Vim9 lambdas
var d = mapnew(dict, (k, v): string => {
  return 'value'
})

" JS-like rest operator.
" Use _ as a throwaway var.
" Names of user functions must start with a capital.
" (this var still binds a lambda so there you go)
var Callback = (..._) => 'always this'

" if body is not a single exp, wrap it in braces.
" no return here coz side-effecting echo.
var count = 0
timer = timer_start(500, (_) => {
  count += 1
  echom 'Handler called ' .. count
}, {repeat: 3})

" To avoid the opening brace of dict literal to be parsed as
" the start of the statement block, wrap it in parens (à la JS):
var Lambda = (arg) => ({key: 42})
" parens-wrapping also goes for command blocks as well:
({
  key: value
})->method()
```




* Interpolated string
https://vimhelp.org/eval.txt.html#interpolated-string

* string concatenation

```vim
echo 'abc' 'def'          " ‹abc def› with space in between!

'a' .. 'b'                " string concatenation
echo "my " .. name        " string concatenation
echo $"my: {name}"        " string interpolatation

```

* The "falsy" operator (null-coercion):

```vim
" falsy operator
echo name ?? "unknown"    " this errors is 'name' undefined
echo 0 ?? ?? 0 ?? "ok"
echo 0 ?? 0   " 0
echo 0 ?? 5   " 5
echo 4 ?? 0   " 4
echo 4 ?? 5   " 4

" not the same as this (0 is falsey, other nums are truthy)
echo 0 || 0   " 0
echo 0 || 5   " 1
echo 4 || 0   " 1
echo 4 || 5   " 1
```

## 41.4 Conditionals

    if {condition}
      {statements}
    else
      {statements}
    endif

Only when the expression {condition} evaluates to true or one will {statements} be executed. If they are not executed they must still be valid commands. If they contain garbage, Vim won't be able to find the matching 'endif'. The second {statements} block is only executed if the first one isn't.

```vim
if &term == "xterm"
if v:version >= 800
```

## 41.5 Executing an expression








## 41.6 Using functions
## 41.7 Defining a function
## 41.8 Lists and Dictionaries
## 41.9 White space
## 41.10 Line continuation
## 41.11 Comments
## 41.12 Fileformat
