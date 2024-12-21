# Expression evaluation

[eval.txt](https://vimhelp.org/eval.txt.html)

Expression evaluation is a feature that can be disabled at compile time; if this has been done, the `:version` command will show `-eval` flag.

This file is mainly about the legacy Vim script. Where the syntax or semantics differ a remark is given.

## TOC

- 1. Variables
  - 1.1 Variable types
  - 1.2 Function references
  - 1.3 Lists
  - 1.4 Dictionaries
  - 1.5 Blobs
  - 1.6 More about variables
- 2. Expression syntax
- 3. Internal variable
- 4. Builtin Functions
- 5. Defining functions
- 6. Curly braces names
- 7. Commands
- 8. Exception handling
- 9. Examples
- 10. Vim script version
- 11. No +eval feature
- 12. The sandbox
- 13. Textlock
- 14. Vim script library

## 1. Variables

### 1.1 Variable types

There are 10 types of variables:
1. Number
2. Float
3. String
4. List
5. Dictionary
6. Funcref
7. Special
8. Job
9. Channel
10. Blob

There are 10 types of variables:

#### Number
A 32 or 64 bit signed number. 
The number of bits is available in `v:numbersize`. 
Number has 4 representations: binary, octal, decimal, hex. 
With print, Vim automatically converts other representations to decimal. 
Example: 0b1011, 0177, 0o177, -123, 0x10. 
Division is integer division, :echo 5 / 2 gives 2

#### Float
A floating point number. 
Dot point notation and scientific representation. 
Vim coerces numbers to floats in arithmetic. 
Example: 123.456, 1.15e-6, -1.1e3

#### String
A NUL terminated string of 8-bit unsigned characters (bytes). 
Examples: "ab\txx\"--", 'x-z''a,c'
Surrounded by double-quotes or single-quotes. 
squotes display characters literally. 
dquotes accept special characters. see [:h expr-quote]
Concatenation is dot. 
String functions:
- strlen(string), str2nr(string), str2float(string)
- substitute(haystack, needle, replacement, flags)
- getline(linenr)  …Get text at line number
- see [:h string-functions]

```vim
" Vim coerces strings to numbers in arithmetic
" by parsing the prefixed number:
:echo "2abc" + 3          " 5
:echo "abc2" + 3          " 3
:echo "2abc" + "3def"     " 5
:echo "2.5abc" + "3def"   " 5
" force string-to-number coercion:
:echo "4" + 0             " 4
" Dot coerces a number into a string:
:echo 12 . "donuts"       " "12donuts"
:echo 12.0 . "donuts"     " THROWS ERROR

:if "12donuts"|echo "Yum"|endif    " truthy condition
:if "donuts12"|echo "Yum"|endif    " falsy condition

" substitute(haystack, needle, replacement, flags)
" flags: (g)lobal
:echo substitute("haystack", "hay", "call", "g")       " callstack
:echo substitute(getline(5), "chocolate", "glazed", "g")
```

#### List

List is an ordered sequence of items. 
List are 0-indexed. Out-of-bounds index throws. Neg indices reverse-index. 
Slice [n:m]. 
Use + to concatenate and mutate a list. 
List functions:
- len(list), insert(list, index), remove(list, index)
- map(), filter()
- see [:h list-functions]

```vim
" lists scoped to current buffer
:let b:xs1 = [1,2,3]
:let b:xs2 = ['a', 'b', 'c']
:let b:xs3 = [1,'a', 3.14]
:let b:xs4 = [1, 2, ['a', 'b']]
:let b:xs5 = [1,2,[3,4]]
:let b:xs6 = ["sweet", "dreams"]

" index lists
:let b:sweet = ["sweet", "dreams"][0]
:let b:dreams = ["sweet", "dreams"][-1]

" slice list and strings
:echo "choco"[1:3]
:echo "choco"[:3]
:echo "choco"[1:]

" append
:let b:xs6 += ["are"]

" function that return nothing must use ':call'
:call insert(xs6, "made")
:call remove(xs6, 1)

" v:val is a special var available when iterating a list or dict
" with map() or filter(). It represents the current item.
:call filter(xs6, 'v:val !~ "choco"')

" destructure: use (;) to assign the rest of elems
:let [x, y; xs] = xs6

" mutate multiple list items directly:
:let favoriteFlavor = ["chocolate", "glazed", "plain"]
:let favoriteFlavor[2:] = ["strawberry", "chocolate"]
:echo favoriteFlavor " ['chocolate', 'glazed', 'strawberry', 'chocolate']
```



#### Dictionary
An associative, unordered array of key-value pairs, but can be empty. 
Uses strings for keys; coerces number keys to strings.
Dictionary Functions:
- len()
- has_key()
- empty() (works for all data types: list, dict, string, number, float, etc.)
- remove()
- items()
- filter(), map()
- see [:h dict-functions]

```vim
{'blue': "#0000ff", 'red': "#ff0000"}
#{blue: "#0000ff", red: "#ff0000"}

:let breakfastNo = {1: "7am", 2: "9am", "11ses": "11am"}
:echo breakfastNo
" {'1': '7am', '2': '9am', '11ses': '11am'}

" use #{} notation to elide quotes around keys.
" But then keys must be identifier-compatible (plus dash char).
:let meal = #{breakfast: "waffles", lunch: "pancakes", dinner: "donuts"}
:echo meal
" {'lunch': 'pancakes', 'breakfast': 'waffles', 'dinner': 'donuts'}

" dict access with brackets or dot notation
:let breakfast = meal['breakfast']
:let lunch = meal.lunch

" v:key special var contains the current key
:let breakfastNo = {1: "7am", 2: "9am", "11ses": "11am"}
:call filter(breakfastNo, 'v:key > 1')
```



#### Funcref
A reference to a function. 
Example: function("strlen")
It can be bound to a dictionary and arguments, it then works like a Partial.

```vim
function("Callback", [arg], myDict)
```

#### Special

- `v:false`
- `v:true`
- `v:none`
- `v:null`

0 is falsy, all non-0 values are truthy.


#### Job

Used for a job, see job_start().

#### Channel

Used for a channel, see ch_open().

#### Blob

Binary Large Object. Stores any sequence of bytes.
Example: `0zFF00ED015DAF`. `0z` is an empty Blob.


### 1.2 Function references

A *Funcref* variable is obtained with the `function()` function, the `funcref()` function, (in Vim9 script) the name of a function, or created with the lambda expression. It can be used in an expression in the place of a function name, before the parenthesis around the arguments, to invoke the function it refers to.

Vim9 script:
```vim
:var Fn = MyFunc
:echo Fn()
```

Legacy script:
```vim
:let Fn = function("MyFunc")
:echo Fn()
```

#### function()

`function()` partial E700 E923

>function({name} [, {arglist}] [, {dict}])

Returns a *Funcref variable* that refers to a function {name}. 
{name} can be the name of a user defined function or an internal function. 

{name} can also be a Funcref or a partial:

* When it is a *partial*, the dict stored in it will be used and the {dict} arg is not allowed. e.g.

```vim
let FuncWithArg = function(dict.Func, [arg])
let Broken = function(dict.Func, [arg], dict)
```

* When it is a *Funcref*, the function will be found by {name}, also when it was redefined later. Use funcref() to keep the same function.


When {arglist} or {dict} is present this *creates a partial*, which means the argument list and/or the dictionary is stored in the Funcref and will be used when the Funcref is called.


The arguments are passed to the function in front of other arguments, but after any argument from method. Example:

```vim
func Callback(arg1, arg2, name)
" ...
let Partial = function('Callback', ['one', 'two'])
" ...
call Partial('name')

" Invokes the function as if it was called by:
call Callback('one', 'two', 'name')
```

With a method:
```vim
func Callback(one, two, three)
" ...
let Partial = function('Callback', ['two'])
" ...
eval 'one'->Partial('three')

" Invokes the function as if it was called by:
call Callback('one', 'two', 'three')
```


The `function()` call can be nested to add more arguments to the Funcref. 
The extra arguments are appended to the list of arguments. Example: 

```vim
func Callback(arg1, arg2, name)
"...
let Func = function('Callback', ['one'])
let Func2 = function(Func, ['two'])
"...
call Func2('name')

" Invokes the function as with: 
call Callback('one', 'two', 'name')
```



The Dictionary is only useful when calling a "dict" function. 
In that case the {dict} is passed in as "self". Example: 

```vim
function Callback() dict
echo "called for " .. self.name
endfunction
"...
let context = {"name": "example"}
let Func = function('Callback', context)
"...
call Func() " echos: called for example
```



The use of `function()` is not needed when there are no extra arguments; these two are equivalent, if Callback() is defined as `context.Callback()`:

```vim
let Func = function('Callback', context)
let Func = context.Callback
```


The argument list and the Dictionary can be combined:

```vim
function Callback(arg1, count) dict
"...
let context = {"name": "example"}
let Func = function('Callback', ['one'], context)
"...
call Func(500)

" Invokes the function as with:
call context.Callback('one', 500)
```

Returns 0 on error.

Can also be used as a method:

```vim
GetFuncname()->function([arg])
```

#### funcref()

>funcref({name} [, {arglist}] [, {dict}])

Just like `function()`, but the returned Funcref will lookup the function by reference, not by name. This matters when the function {name} is redefined later.

Unlike function(), {name} must be an existing user function. It only works for an *autoloaded function* if it has already been loaded (to avoid mistakenly loading the autoload script when only intending to use the function name, use `function()` instead).

{name} cannot be a builtin function.

Returns 0 on error.

Can also be used as a method:

```vim
GetFuncname()->funcref([arg])
```


### 1.3 Lists
### 1.4 Dictionaries
### 1.5 Blobs
### 1.6 More about variables
