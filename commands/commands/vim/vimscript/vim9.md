# Vim 9 Script

[vim9.txt](https://vimhelp.org/vim9.txt.html)

Vim9 script commands and expressions: this file is about the new syntax and features in Vim9 script. Most expression help is in [eval.txt].

## TOC

1. What is Vim9 script
2. Differences
3. New style functions
4. Types
5. Namespace, Import and Export
6. Classes and interfaces
9. Rationale


## 1. What is Vim9 script

Legacy script is slow, each line is parsed every time it is executed. The main goal of Vim9 script is to drastically improve performance by compiling commands into instructions that can be efficiently executed. An increase in execution speed of 10 to 100 times can be expected. The secondary goal is to avoid Vim-specific constructs and get closer to commonly used programming languages, such as JavaScript, TypeScript and Java.

The performance improvements can only be achieved by not being 100% backwards compatible. For example, making function arguments available in the 'a:' dict adds quite a lot of overhead. In a Vim9 function this dictionary is not available. Other differences are more subtle, such as how errors are handled.

The Vim9 script syntax and semantics are used in:
- a function defined using `:def` command
- a script file where the first command is `vim9script`
- an autocommand defined in the context of the above
- a command prefixed with the `vim9cmd` *command modifier*

When using `:function` in a Vim9 script, the legacy syntax is used, with the highest scriptversion. However, since this is confusing it is discouraged.

Vim9 script and legacy Vim script can be mixed. There is no requirement to rewrite old scripts, they keep working as before. Although you may want to use a few `:def` functions for code that needs to be fast.

>:vim9[cmd] {cmd}
Evaluate and execute {cmd} using Vim9 script syntax and semantics. Useful when typing a command, as well as in a legacy script or function.

>:leg[acy] {cmd}
Evaluate and execute {cmd} using legacy script syntax and semantics. Only useful in a Vim9 script or in a `:def` function. Note that {cmd} cannot use local variables, since it is parsed with legacy expression syntax.


## 2. Differences

### Overview

A brief summary of differences between Vim9 and legacy script:
- comments start with `#`
- using a backslash for line continuation is hardly ever needed
- white space is required in many places to improve readability
- declare new variables with `:var`
- assign values to variables without `:let`
- constants can be declared with `:final` and `:const`
- `:final` cannot be used as an abbreviation of `:finally`
- variables and functions are in *script-local scope by default*
- Functions are declared with argument types and return type
- Call functions without `:call`
- You cannot use old Ex commands:
    :Print
    :append
    :change
    :d          directly followed by 'd' or 'p'.
    :insert
    :k
    :mode
    :open
    :s          with only flags
    :t
    :xit
- some commands (esp. those for flow control) cannot be shortened
- cannot use curly-braces names
- range before a command must be prefixed with a colon
    `:%s/this/that`
- Executing a register with `@r` doesn't work; prepend a colon or use `:exe`
    `:exe @a`
- Unless mentioned specifically, the highest scriptversion is used
- When defining an exp mapping, the exp will be evaluated in the context of the script where it was defined
- When indexing a string the index is counted in characters, not bytes
- Some possibly unexpected differences, see vim9-gotchas


```vim
# comment

# many places do not need backslashes for line continuation
echo `abc"
  .. "def"

# declare new var
var count = 0

# var assignment
count += 3

# constant
const names = ['Betty', 'Peter']  # cannot be changed

# constant
final matches = []                # add to the list later

# Functions are declared with argument types and return type
def CallMe(count: number, message: string): bool

# Call functions without :call
writefile(['done'], 'file.txt')
```

### New style of comments

In Vi, `#` is a command to list text with numbers. In Vim9 script you can use `:number` for that.

    :101 number

To improve readability there must be a space between a command and the #
that starts a comment:

    var name = value # comment
    var name = value# error!

Do not start a comment with `#{`, it looks like the legacy dictionary literal and produces an error where this might be confusing. `#{{` or `#{{{` are OK, these can be used to start a fold.

When starting to read a script file Vim doesn't know it is Vim9 script until the vim9script command is found. Until that point you would need to use legacy comments:

    " legacy comment
    vim9script
    # Vim9 comment

That looks ugly, better put vim9script in the very first line: 

    vim9script
    # Vim9 comment


In legacy Vim script, `#` is also used for the *alternate file name*. In Vim9
script you need to use `%%` instead. Instead of `##`, use `%%%` (stands for all
arguments).


### Vim9 functions

#### Compiled functions

A function defined with `:def` is compiled. Execution is many times faster, often 10 to 100 times. Many errors are already found when compiling, before the function is executed. The syntax is strict, to enforce code that is easy to read and understand.

**Compilation** is done when any of these is encountered:
- the first time the function is called
- when `:defcompile` is encountered after the function was defined
- `:disassemble` is used for the function
- a function that is compiled calls the function or uses it as a function reference (so that the argument and return types can be checked)

If compilation fails it is not tried again on the next call, instead this error is given: `"E1091: Function is not compiled: {name}"`.

Compilation will fail when encountering a user command that has not been created yet. In this case you can use `execute()` to invoke it at runtime.

```vim
def Deferred()
  execute('DefinedLater')
enddef
```

#### Restrictions of def

A `:def` function
- has **no attributes** ("range", "abort", "dict" or "closure")
- is always a closure
- cannot be a "dict" function
- does not get a range passed
- always aborts on an error (unless `:silent!` was used for the command or the error was caught a `:try` block)

You can use a **Vim9 class** instead of a "dict function". 

You can also pass the dictionary explicitly:

```vim
def DictFunc(self: dict<any>, arg: string)
  echo self[arg]
enddef

var ad = {item: 'value', func: DictFunc}
ad.func(ad, 'item')
```

#### Calling lagacy functions

You can **call a legacy dict function**:

```vim
func Legacy() dict
  echo self.value
endfunc

def CallLegacy()
  var d = {func: Legacy, value: 'text'}
  d.func()
enddef
```

#### Types

The **argument types** and **return type** need to be specified. When `any` is used, type checking will then be done at runtime, like with legacy functions. Arguments are accessed by name, without `a:`, just like in other languages. There is no `a:` dictionary or `a:000` list anymore.

#### Variadics

**Variable arguments** (aka the rest operator) must be the last argument, with a name and a list type (like in JS). For example, a list of numbers:

```vim
def Rest(...xs: list<number>)
  for x in xs
    echo x
  endfor
enddef

Rest(1,2,3)    # ERROR: no spacing
Rest(1, 2, 3)  # Ok
```

#### Default pramas

**Optional arguments with default values**    
When a function param is optional (i.e. it has a default value), passing `v:none` as the argument results in using the default value. This is useful when you want to leave a param at default but it comes before other params.

```vim
def MyFunc(one = 'one', last = 'last')
  echo one last
enddef

MyFunc()                # both args use their default values
MyFunc('FIRST')         # second arg uses its default value
MyFunc(v:none, 'LAST')  # first arg uses its default value
```

#### Discarding args

**Ignored argument**
The param `_` can be used to ignore an argument. It can be used multiple times. No type needs to be given.

```vim
# key arg is ignored
map(numberList, (_, v) => v * 2)
```

### Functions and vars are script-local by default

When using `:function` or `:def` to specify a new function at the script level in a Vim9 script, the function is local to the script (like using the `s:` prefix in legacy script).

To define a global function or variable the `g:` prefix must be used.

For functions in a script that is to be imported, and in an autoload script, the `export` keyword must be used for those to be used elsewhere.

```vim
def ThisFunction()          # script-local
def g:ThatFunction()        # global
export def Function()       # for import and import autoload
```

Detail: this is because 'Inner' will actually become a function reference to a function with a generated name.

* It is not possible to define a script-local function in a function.

You can define a local function and assign it to a script-local Funcref (it must have been declared at the script level).

* It is possible to define a global function by using the `g:` prefix.

When referring to a function, and no 's:' or 'g:' prefix is used, Vim will search for the function:
- in the function scope, in block scopes
- in the script scope


* Imported functions are found with the prefix from the `:import` command.

Since a script-local function reference can be used without 's:', its name must start with an upper case letter, even when using the 's:' prefix.

In legacy scripts, 's:funcref' could be used, because it could not be referred to with 'funcref'. In Vim9 script it can, therefore 's:Funcref' must be used to avoid that the name interferes with builtin functions.


#### Vim9 namespace

The use of the `s:` prefix is not supported at the Vim9 script level. 
All functions and variables without a prefix are script-local.

In :def functions the use of `s:` depends on the script:
- in a legacy script, script-local vars and functions use 's:'
- in a Vim9 script, they do not use 's:'

This matches what you see in the rest of the file.

In legacy functions, the use of 's:' for script items is required, as before. 
No matter if the script is Vim9 or legacy - because you can define a legacy function even in Vim9 script if you use the `function!` syntax (not only).

In all cases, the function must be defined before used:
- when it is called
- when `:defcompile` causes it to be compiled
- when code that calls it is being compiled (to figure out the return type)

The result is that functions and variables without a namespace can usually be found in the script, either defined there or imported. 

Global functions and variables could be defined anywhere (good luck finding out where! You can often see where it was last set using `:verbose`).


*Global functions* can still be defined and deleted at nearly any time. 

In Vim9 script, script-local functions are defined once when the script is sourced and cannot be deleted or replaced by itself (but can be by re-sourcing).

When compiling a function and a function call is encountered for a function that is not (yet) defined, the `FuncUndefined` autocommand is not triggered. 

You can use an autoload function if needed, or call a legacy function and have `FuncUndefined` triggered there.

Reloading a Vim9 script clears functions and variables by default.

#### Vim9 reload

When loading a legacy Vim script a second time nothing is removed, the commands will replace existing variables and functions, create new ones, and leave removed things hanging around.

When loading a Vim9 script a second time all existing script-local functions and variables are deleted, thus you start with a clean slate. This is useful if you are developing a plugin and want to try a new version. If you renamed something you don't have to worry about the old name still hanging around.

If you do want to keep items, use

    vim9script noclear

You want to use this in scripts that use the `finish` command to bail out at some point when loaded again; e.g. when a buffer local option is set to a function, the function doesn't need to be defined more than once: 

```vim
vim9script noclear

setlocal completefunc=SomeFunc

if exists('*SomeFunc')
  finish
endif

def SomeFunc()
  # ...
```

### Variable declarations with `:var`, `:final` and `:const`

### Constants

### Omitting `:call`

Functions can be called without `:call`. Using it is still possible, but this is discouraged.

```vim
writefile(lines, 'file')
call writefile(lines, 'file')
:call writefile(lines, 'file')
```

### Omitting `:eval`

A method call without `eval` is possible, so long as the start is an identifier or can't be an Ex command. For a function either `(` or `->` must be following, without a line break:

```vim
myList->add(123)
g:myList->add(123)
[1, 2, 3]->Process()
{a: 1, b: 2}->Process()
"foobar"->Process()
("foobar")->Process()
'foobar'->Process()
('foobar')->Process()
```

In the rare case there is ambiguity between a function name and an Ex command, prepend `:` to make clear you want to use the Ex command.

For example, there is both the `:substitute` command and the `substitute()` function. When the line starts with `substitute(` this will use the function. Prepend a colon to use the command instead: `:substitute(pattern(replacement(`.


**Negation vs shell commands**

If the expression starts with `!` this is interpreted as a shell command, not as a negation of a condition.

```vim
# this is a shell command
!shellCommand->something

# wrap exp in parens to use ! for negation
(!expression)->Method()
```


While variables need to be defined before they can be used, *functions can be called before being defined*. This is required to allow for cyclic dependencies between functions. It is slightly less efficient, since the function has to be looked up by name. And a typo in the function name will only be found when the function is called.


### Omitting `function()`

A user defined function can be used as a function reference in an expression without `function()`. The argument types and return type will then be checked. The function must already have been defined.

When using `function()`, the resulting type is `func`, a function with any number of arguments and any return type (including `void`).

>The function can be defined later if the argument is in quotes.

```vim
def Id(x)
  return x
enddef

var Funcref = Id             # Ok, but 'Id' must already be defined
var Funcref = function(Id)   # Ok, but 'Id' must already be defined
                             # also function() is redundant
var Funcref = function('K')  # Ok, 'K' may be defined later

def K(x, y)
  return x
enddef
```

### Lambdas

Lambdas now use `=>` instead of legacy `->`.

In legacy script there can be confusion between using `->` for a method call vs a lambda. Also, when a `{` is found the parser needs to figure out if it is the start of a lambda or a dictionary, which is now more complicated because of the use of (argument) types.

To avoid these problems Vim9 script uses a syntax for lambdas similar to JS:

```vim
" legacy
let Lambda = {arg -> exp}

let I = {a -> a}
call I(1)

let K₁ = {a, b -> a}
call K₁(1, 2)

let K₂ = {a -> {b -> a}}
call K₂(1)(2)


vim9script
var Lambda = (arg) => exp
var Lambda = (arg): type => exp
```


No line break is allowed in the arguments of a lambda up to and including the `=>` (so that Vim can tell the difference between an expression in parentheses
and lambda arguments).

```vim
"# This is OK
filter(list, (k, v) =>
  v > 0)

"# This does not work
filter(list, (k, v)
  => v > 0)

"# This also does not work
filter(list, (k,
  v) => v > 0)

"# use backslash to concatenate the lines like before
filter(list, (k,
  \ v)
  \ => v > 0)
```


**Vim9 lambda arguments**

In legacy scripts, a lambda could be called with any number of extra arguments as there was no way to warn for not using them.
>In Vim9 script, the number of arguments must match.

To accept any number of arguments use `...xs` or `..._` to ignore them:

```vim
var Callback = (..._) => 'anything'
echo Callback(1, 2, 3)
```


**Inline functions**

A vim9 lambda can contain statements inside its body `{}`

```vim
var Lambda = (arg) => {
  g:was_called = 'yes'
  return expression
}
```

This can be useful for a timer
```vim
var count = 0
var timer = timer_start(500, (_) => {
    count += 1
    echom 'Handler called ' .. count
  }, {repeat: 3})
```


Only a comment can follow the opening brace (`{`). The ending brace (`}`) must be the first char on a line; it can be followed by other characters.

```vim
var d = mapnew(dict, (k, v): string => {
    return 'value'
  })
```


**command-block**

A block, `{…}`, can also be used for defining a user command. 
Inside the block Vim9 syntax will be used.

If the statements include a dictionary, its closing bracket must not be written at the start of a line. Otherwise, it would be parsed as the end of the block.

```vim
"# THIS DOES NOT WORK:
command NewCommand {
      g:mydict = {
        'key': 'value',
      }  # ERROR: it is recognized as the end of the block
    }

"# Put the closing brace after the last item to avoid this:
command NewCommand {
      g:mydict = {
        'key': 'value' }
    }
```

Rationale: The `}` cannot be after a command because it would require parsing the commands to find it. For consistency with that no command can follow the `{`. Unfortunately this means using `() => { command }` doesn't work, line breaks are always required.

**vim9-curly**

To avoid the `{` of a dictionary literal to be recognized as a statement block wrap it in parentheses (à la JS):

```vim
"# Returning a dict
var Lambda = (arg) => ({key: 42})

"# Also to disambiguate the start of a command block
({
    key: value
 })->method()
```

### Automatic line continuation

**vim9-line-continuation**
In many cases it is obvious that an expression continues on the next line - in
those cases there is no need to prefix the line with a backslash.

```vim
" list can span multiple lines
var mylist = [
    'one',
    'two',
  ]

" dict can span multiple lines
var mydict = {
    one: 1,
    two: 2,
  }

" function call can span multiple lines
var result = Func(
    arg1,
    arg2
  )
```

For **binary operators in expressions**, not in `[]`, `{}`, `()`, a line break is possible just before or after the operator.

```vim
var text = lead
  .. middle
  .. end

var total = start +
  end -
  correction

var result = positive
  ? PosFunc(arg)
  : NegFunc(arg)
```

For a method call using `->` and a member using `.`, a line break is allowed before it:

```vim
var result = GetBuilder()
  ->BuilderSetWidth(333)
  ->BuilderSetHeight(777)
  ->BuilderBuild()

var result = MyDict
  .member
```

For commands that have an argument that is a list of commands, the `|` *character at the start of the line indicates line continuation*:

```vim
autocmd BufNewFile *.match if condition
  |   echo 'match'
  | endif
```

Note that this means that in a **heredoc**, first line cannot start with a bar:

```vim
var lines =<< trim END
  | this does not work
END
```

Either use an empty line at the start or temporarily add `C` flag to `cpoptions`

```vim
set cpo+=C

var lines =<< trim END
  | this works
END

set cpo-=C
```

If the **heredoc** is inside a function, `cpoptions` must be set before `:def` and restored after the `:enddef`.


In places where line continuation with a backslash is still needed, such as when splitting up a long Ex command, comments can start with `#\ `

```vim
syn region Text
  \ start='foo'
  #\ comment
  \ end='bar'
```


Like with legacy script `"\ ` is used. This is also needed when line continuation is used without a backslash and a line starts with a bar.

```vim
au CursorHold * echom 'BEFORE bar'
  #\ some comment
  | echom 'AFTER bar'
```

To make it possible for the operator at the start of the line to be
recognized, it is required to put a colon before a range.  This example will
add "start" and "print": 
 var result = start
 + print
Like this: 
 var result = start + print

This will assign "start" and print a line: 
 var result = start
 :+ print

After the range an Ex command must follow.  Without the colon you can call a
function without :call, but after a range you do need it: 
 MyFunc()
 :% call MyFunc()

Note that the colon is not required for the +cmd argument: 
 edit +6 fname

It is also possible to split a function header over multiple lines, in between
arguments: 
 def MyFunc(
  text: string,
  separator = '-'
  ): string

Since a continuation line cannot be easily recognized the parsing of commands
has been made stricter.  E.g., because of the error in the first line, the
second line is seen as a separate command: 
 popup_create(some invalid expression, {
    exit_cb: Func})
Now "exit_cb: Func})" is actually a valid command: save any changes to the
file "_cb: Func})" and exit.  To avoid this kind of mistake in Vim9 script
there must be white space between most command names and the argument.
E1144

However, the argument of a command that is a command won't be recognized.  For
example, after "windo echo expr" a line break inside "expr" will not be seen.


Notes:
- "enddef" cannot be used at the start of a continuation line, it ends the
  current function.
- No line break is allowed in the LHS of an assignment.  Specifically when
  unpacking a list :let-unpack. This is OK: 
 [var1, var2] =
  Func()
  This does not work: 
 [var1,
     var2] =
  Func()
- No line break is allowed in between arguments of an :echo, :execute and
  similar commands.  This is OK: 
 echo [1,
  2] [3,
   4]
  This does not work: 
 echo [1, 2]
  [3, 4]
- In some cases it is difficult for Vim to parse a command, especially when
  commands are used as an argument to another command, such as :windo.  In
  those cases the line continuation with a backslash has to be used.

### White space

Vim9 script enforces proper use of white space.

```vim
" This is no longer allowed
var name=234 # Error!
var name= 234 # Error!
var name =234 # Error!

" There must be white space before and after the "="
var name = 234  # OK
```

* White space is **required** before `#` that starts a comment after a command:

```vim
var name = 234# Error!
var name = 234 # OK
```

White space is required around most operators.

* White space is **required** in a sublist (list slice) around `:`, except at the start and end:

```vim
otherlist = mylist[v : count]  "# v:count has a different meaning
otherlist = mylist[:]          "# make a copy of the List
otherlist = mylist[v :]
otherlist = mylist[: v]
```

* White space is **not allowed** between a function name and the `(`

```vim
Func (arg)     "# Error!

Func
    \ (arg)    "# Error!

Func
      (arg)    "# Error!

Func(arg)      "# OK

Func(
      arg)     "# OK

Func(
      arg      "# OK
      )
```

* White space is **not allowed** in a `:set` command between the option name and when the following char is one of: `&`, `!`, `<`, `=`, `+=`, `-=` or `^=`.

### No curly braces expansion

curly-braces-names cannot be used.

### Command modifiers are not ignored

* using a *command modifier* for a command that does not use it gives an error.
* using a command modifier without a following command is now an error.

### Dictionary literals

### No `:xit`, `:t`, `:k`, `:append`, `:change` or `:insert`

### Comparators

The `ignorecase` option doesn't influence anymore the comparison of strings. Thus `=~` works the same as `=~#`; and similar.

`is` and `isnot` (expr-is and expr-isnot) when used on strings now return false. In legacy scripts, they just compare the strings, in Vim9 script they now check identity, and *strings are copied when used*, thus *two strings are never the same* (this might change someday if strings are not copied but reference counted).

### Abort after error

In legacy script, when an error is encountered, Vim continues to execute
following lines.  This can lead to a long sequence of errors and need to type
CTRL-C to stop it.  In Vim9 script execution of commands stops at the first
error.

    vim9script
    var x = does-not-exist
    echo 'not executed'


### For loop


### Conditions and expressions



In Vim9 script one can use the following predefined values: 
- true   (same as v:true)
- false  (same as v:false)
- null   (same as v:null)
- null_blob
- null_channel
- null_class
- null_dict
- null_function
- null_job
- null_list
- null_object
- null_partial
- null_string



### What to watch out for

Vim9 was designed to be closer to often used programming languages, but at the same time tries to support the legacy Vim commands. Some compromises had to be made. Here is a summary of what might be unexpected.

### Other differences 


## 3. New style functions

>:def[!] {name}([arguments])[: {return-type}]

Define a new function by the name {name}. The {name} must be less than 100 bytes long.

The body of the function follows in the next lines, until the matching :enddef.

The type of value used with :return must match {return-type}. When {return-type} is omitted or is `void` the function is not expected to return anything.

{arguments} is a sequence of zero or more argument declarations.
There are 3 forms:
- `{name}: {type}`
- `{name} = {value}`
- `{name}: {type} = {value}`

The first form is a mandatory argument, the caller must always provide them. 
The second and third form are optional arguments. 
When the caller omits an argument the {value} is used. 

The function will be compiled into instructions when called, or when `:disassemble` or `:defcompile` is used. Syntax and type errors will be produced at that time.

It is possible to nest `:def` inside another `:def` or `:function` up to about 50 levels deep.

[!] is used as with `:function`. Note that script-local functions cannot be deleted or redefined later in Vim9 script. They can only be removed by reloading the same script.


## 4. Types
## 5. Namespace, Import and Export
## 6. Classes and interfaces
## 9. Rationale
