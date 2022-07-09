# Arithmetic

arithmetic
arithmetic context
arithmetic context kinds
C parsing rules in arithmetic context
arithmetic expression
arithmetic expansion
arithmetic substitution
arithmetic command
arithmetic command's exit code
let
expr
integer, MAX_INT, MIN_INT
C operators


## Interger type

Bash arithmetic only works with integer numbers.

32-bit signed integer
- In earlier versions of bash, the integer type was 32-bit signed `long`
- the range was: $$(-2^{31})\ - \ (2^{31}\!\!\!-\!1)$$
- -2,147,483,648 - 2,147,483,647
- Overflow gave erroneous results.

64-bit signed integer
- Since bash v.2.05b, integer type became the C's `intmax_t`
- it is a signed 64-bit integer
- range: $$(-2^{63})\ -\ (2^{63}-1)$$
- range: -9,223,372,036,854,775,808 - 9,223,372,036,854,775,807
- MIN_INT = -2**63   = -9,223,372,036,854,775,808
- MAX_INT = 2**63 - 1 = 9,223,372,036,854,775,807


An **arithmetic expression** is an expression, involving operations on numbers, that is evaluated in an *arithmetic context* by the C-like expression parser.

An **arithmetic context** is a specifically designated place in code with the relaxed shell parsing rules, more adapted to mathematical operations.

**The rules of arithmetic context**, available operators and their precedece:
- whitespaces become irrelevant
- variable expansion doesn't require the dollar sign
- many special characters have a different role
  - `*` is the multiplication operator (not a glob)
  - `**` is the exponentiation operator (not a glob)
  - `^` bitwise XOR
  - `%` modulus
  - `=` is assignment
  - `==` is comparison
- all of the C's bitwise operators are available
- ternary operator is available, `((a = b > c ? d : e))`
- the comma operator: all subexpressions are evalueted and the last is returned



There are several **kinds of arithmetic contexts** available:

* the double parens, <kbd>((...))</kbd>, which performs the evaluation but doesn't return the results. However it may be used for side-effects, `((++i, j++, a=++i))`

* the double parens **ari
thmetic substitution**, <kbd>$((...))</kbd>, returns the results that may be assign, `a=$((y + z))`

* the subscript of an indexed array, <kbd>arr[...]</kbd>, is also the arithmetic context, i.e. the inside of the brackets: `arr[a=5,++i,j=a+i]=42`

* arguments to <kbd>let</kbd> builtin, `let "a = b + c, i++"`



## Variable expansion in an arithmetic context

Variables may also be used in arithmetic (math) contexts, but unlike in other contexts, variable expansion (i.e. dereferencing a variable) doesn't have to be marked with the dollar sign (although it can be). This is only an option for proper variables, i.e. parameters whose name is an identifier. Other parameters, like the special shell params (`$?`, `$!`, `$$`) and the positional params (`$1`, `$@`) still need to be referenced with the dollar prefix.

Also, if a proper variable expansion is further manipulated bu using the additional expansion capabilities, such as slicing, search and replace and other conversions, then the variable also needs to be prefixed with a dollar sign. The same goes for dereferencing array elements.

If a variable's expansion results in a possible arithmetic expression (if it just looks like a possible math expression), then that result is evaluated. In fact, it is recursively re-evaluated until:
- an integer is produced
- an empty value is found: empty or uninitialized vars evaluate to 0
- anything else, which can't be evaluated as a math expr, produces an error




## Arithmetic command

An **arithmetic command** is an arithmetic expression that is used where a command would normally appear. It has an exit status, which is derived from the C rules: *0 is false, anything else is true*.

Therefore, an arith. command, e.g. `((x = y = 0))`, has several things going on. It has assignments as a side-effect, and the overall result of this expr is 0, because in the arithmetic contexts assignments are expressions (and not statements). The overall result of the expression becomes its exit code.

And this is where the trouble arises: in an arithmetic context 0 represents a falsey value i.e. `false`, while any non-zero value represents a truthy value i.e. `true`. However, in the shell it's the opposite.

The exit status of the aritm. expr is `false`, which, translated by the shell becomes exit code 1.

In case this arithmetic command was a LHS member of the AND list, the RHS command would not even be evaluated (becasue the AND short-circuits), which might not be what was expected.

```bash
# If the overall result of the arith expr is 0, the exit code of arith command
# is 0, and 0 is a falsey value in arith.contexts. However, it is the opposite
# in the shell: non-zero value means false, while 0 means true/success.
((x = 6 - 2 * 3)) && echo ok || echo error
# error
echo $x
# 0

# However, if the overall result is non-zero, everything is as expected
((x = 8 - 2 * 3)) && echo ok || echo error
# ok
echo $x
# 2
```

The first example above prints "error" even though it seems nothing went wrong.

> Whenever an arithemetic command's evaluation produces zero, its exit status is false, which the shell interprets as the exit status 1.


Most commonly, arithmetic commands are used in `if` or `while` statements:

```bash
if ((x < 4)); then 
  echo "Too small, try again"
fi
```

Because arithmetic context uses *C parsing rules*, `=` is strictly used for assignment and `==` for comparison.

Numeric constants in a arithmetic context follow C rules:
- 0x{N} is hex, e.g. 0x7f
- 0{N} is octal, e.g. 070 
- {N} is decimal

If there's a `{BASE}#` prefix, then BASE is interpreted as a decimal which determines the base (radix) of this number.

WARNING: The rule that a number with leading zero is octal may cause unexpected hartache.

```bash
(( $(date +%d) < 7 )) && echo 0 || echo 1
# death by octal
```


When using inputs that may have leading zeroes, you should strip those away before exposing them in a arithmetic context.

The easiest way is to force a base 10 evaluation:

day=$(date +%d)
day=$((10#$day))


See the man page for other uses of base# in arithmetic expressions.






## Let builtin

The `let` builtin: `let arg [arg ...]`

- the `let` builtin evaluates each ARG as an arithmetic expression
- evaluation is done in fixed-width integers with no check for overflow
- division by 0 is trapped and flagged as an error
- list of operators and precedence is the same as in other arithetic contexts

Shell variables are allowed as operands. The name of the variable is replaced by its value (coerced to a fixed-width integer) within an expression. The variable need not have its integer attribute turned on to be used in an expression. Operators are evaluated in order of precedence. Sub-expressions in parentheses are evaluated first and may override the precedence rules.

Exit Status:
- 1: if the last ARG evaluates to 0, let returns 1
- 0: otherwise it return 0

Wrapping the expressions passed to the `let` in double quotes,


watch out if you prepend key=value pairs to a command
despite that let is a builtin, these prefixed pairs will not
be visible after


```bash
# let builtin

# watch out if you prepend key=value pairs to a command
# despite that let is a builtin, these prefixed pairs will not
# be visible after
b=3 c=5 let "a = b + c, i++"
echo "a:$a, b:$b, c:$c, i:$i"  # a:8, b:, c:, i:1

b=3 c=5; let "a = b + c, i++"
echo "a:$a, b:$b, c:$c, i:$i"  # a:8, b:3, c:5, i:2
```
