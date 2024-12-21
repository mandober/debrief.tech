# ELisp :: TERMS

evaluation
forms
  Lisp expressions are in parens where car is the active elem, a function
  (fn arg1 arg2 arg3)
  `car` returns the first elem of a list
  `cdr` returns all but the first
  normal form: eval car, then eval each cdr elem, then apply car to cdr
  special form (fns, macros, assignment, ..., definitions)
quote, `(quote 1 2 3)` prevents evaluation
single quote, `'(1 2 3)` prevents evaluation
backtick, ``(x ,x)` prevents evaluation, allowing eval of elems with `,`

list
cons cell (a . b)
cons list '(1 2 3) - tick prevents eval
`nil` - empty list; `nil` is the same as `'()`
`cons` appends new elem to a list, `cons 1 nil`
*alist* - association list, ((key1 . val1) (k2 . v2) (k3 . v3) ...)
*plist* - property list, (key1 prop1 k2 p2 k3 p3 ...)

symbol
symbol can contain almost any character (some must be escaped)
symbols as names of Lisp objects

variable
variable type (no types)
variable name (symbol as name)
assignment, `(setq x 1)`
variables and functions live in separate namespaces

function
function namespace: `#`
function reference, `#'apply`
function definition, `defun`
function variables (formal parameters)
&optional parameters
&rest parameters
function body
anonymous function
function call
`funcall` - apply a fn by ref, `#'fn`, to an arg, `(funcall #'1+ 3)`
`apply` - apply a fn by ref, `#'fn`, to a list of args, `(apply #'+ '(1 2 3))`
`+` is a fn, `'+` is fn by ref, `#'+` is fn by ref searched in the fn namespace
if there is no eponymous var, `'fn` ref will do (but risky)

macro (Lisp macro)
macro definition, `defmacro`
macro call
macro expansion
anonymous macro


## Functions
- `1+` is the succ fn
- `1-` is the pred fn
- funcall
- apply
- list
- quote
- cons
- car
- cdr
- butlast = init
- 
