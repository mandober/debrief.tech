# Arithmetic Expressions

`((expression))`

Return status:
- 0: if the value of the expression is non-zero
- 1: otherwise 
- equivalent to `let` expressions


## Arithmetic Evaluation
- fixed-width integers, no overflow checks
- division by 0 is trapped and flagged as an error
- operators, precedence, associativity and values are as in *C*


List of **arithmetic operators** (in decreasing precedence):
- `i++`, `i--`      post-increment, post-decrement
- `++i`, `--i`      pre-increment, pre-decrement
- `-`, `+`          unary minus, unary plus
- `!`, `~`          logical negation, bitwise negation
- `**`              exponentiation
- `*`, `/`, `%`     multiplication, division, remainder
- `+`, `-`          addition, subtraction
- `<<`, `>>`        left bitwise shifts, right bitwise shifts
- `<= >= < >`       relational (comparison) operators: le, ge, lt, gt
- `== !=`           equality and inequality
- `&`               bitwise AND
- `^`               bitwise XOR
- `|`               bitwise OR
- `&&`              logical AND
- `||`              logical OR
- `e ? e : e`       ternary operator
- `= *= /= %=`      assignment, mul-, div-, mod- assignments
- `+= -= <<= >>=`   compound assignments: add-, sub-, lbs-, rbs-
- `&= ^= |=`        compound assignments: AND, XOR, OR
- `expr1 , expr2`   comma operator


- parameter expansion is done before expression evaluation
- shell vars allowed as **arithmetic operands**, need not use the dollar sigil
- null or unsets var evaluate to 0 when passed-by-name (no dollar sign)
- var's value is evaluated as arith. expr when referenced, or when a var with the integer attribute, `declare -i`, is assigned a value.
- null evaluates to 0
- shell var need not have int attribute to be used in arith. expression
- operators are evaluated in order of precedence
- parentheses used for grouping to override precedence rules


## Number Bases

Bash interprets some literal notations specially:
- octals: have leading 0, e.g. 0177
- hex: leading `0x` or `0X`
- otherwise, numbers have form: `[base#]D`, where `base` is an optional decimal bumber, in range **2-64**, and `D` are digits in that base.

Rules
- if no base, base defaults to base 10
- digits used (in this order): `0-9`, `a-z`, `A-Z`, `@`, `_`
- if *base<=36*, lower and uppercase are the same, they repr bases *10-35*
- arith. expr is always displayed in decimal, regardless of the base



Constants are literal values, e.g. 1, 3567, 4326
Bash interprets some literals specially:
- 0…  is octal
- 0x… is hex
- 0X… is hex
- `BASE#n` is the number `n` in base `BASE`

```bash
echo $(( 2020 ))
echo $(( 077 ))                     # 7*8+7 = 
echo $(( 0xff ))                    # 255
echo $(( 2#00111011 ))              # 0x3b = 3*16+11=59
declare -i x=2#10001000; echo $x    # 136
```

base      | b3 | b4 | b5 | b6 | b7 | b8 | b10 | b16 | b32 | b36 | b64
----------|----|----|----|----|----|----|-----|-----|-----|-----|-----
binary    |ter |nib |pen |sex |spt |oct | dec | hex | 32  | 64  |
----------|----|----|----|----|----|----|-----|-----|-----|-----|-----
0000:0001 | 02 | 03 | 04 | 05 | 06 | 07 | `1` |   1 |   1 |   1 |   1
0000:0010 | 11 | 12 | 13 | 14 | 15 | 16 | `4` |   4 |   4 |   4 |   4
0000:0010 | 11 | 12 | 13 | 14 | 15 | 16 | `8` |   8 |   8 |   4 |   4
0000:0010 | 11 | 12 | 13 | 14 | 15 | 16 | `12`|   c |   4 |   4 |   4
0000:0010 | 11 | 12 | 13 | 14 | 15 | 16 | `16`|  10 |   4 |   4 |   4
0000:0010 | 11 | 12 | 13 | 14 | 15 | 16 | `32`|  20 |   4 |   4 |   4
0000:0010 | 11 | 12 | 13 | 14 | 15 | 16 | `64`|  40 |   4 |   4 |   4



## Bases

- literal number can be specified in the form: `<BASE>#<DIGITS>`
- arith. expressions is always displayed in decimal, regardless of the base
- if no base, base 10 is assumed (except with prefixes)
- the base ranges 2-64

base range | digit symbols       | system
-----------|---------------------|----------
2-10       | 0 1                 | binary
2-10       | 0 1 2               | ternary
2-10       | 0 1 2 3             | quaternary
2-10       | 0 1 2 3 4           | quinary
2-10       | 0 1 2 3 4 5         | senary
2-10       | 0 1 2 3 4 5 6       | septenary
2-10       | 0 1 2 3 4 5 6 7     | octal
2-10       | 0 1 2 3 4 5 6 7 8   | nonary
2-10       | 0 1 2 3 4 5 6 7 8 9 | decimal



| 2     | binary     | dyadic    | quadratic |
| 3     | ternary    | triadic   | cubic     |
| 4     | quaternary | tetradic  | quartic   |
| 5     | quinary    | pentadic  | quintic   |
| 6     | senary     | hexadic   | sextic    |
| 7     | septenary  | heptadic  | septic    |
| 8     | octonary   | ogdoadic  | octic     |
| 9     | novenary   | enneadic  | nonic     |
| 10    | denary     | decadic   | decic     |
| 11    | undenary   | endecadic |           |
| 12    | duodenary  | dodecadic |           |
| 20    | vigenary   | icosadic  |           |
| n > 2 | multary    | polyadic  |           | 
| vary  |            | variadic  |           | 


| ninth    | nonary      | enato-    |
| tenth    | decimary    | decato-   |
| eleventh | undecimary  | endecato- |
| twelfth  | duodecimary | dodecato- |




class|symbols| #dc| mb | digits          | bases
-----|-------|----|----|-----------------|-------
I    |0-9    | 10 | 10 | 0-9             | 2-10
II   |a-z    | 26 | 36 | 0-9 a-z         | 
III  |A-Z    | 26 | 62 | 0-9 a-z A-Z     | 
IV   |@      |  1 | 63 | 0-9 a-z A-Z @   |
V    |_      |  1 | 64 | 0-9 a-z A-Z @ _ |

classes: 5
total symbols: 64



## Shell variables

- Shell var can be used as operands, even without the integer attribute (-i)
- If var is empty/null/unset, its reference evaluates to 0
- If var has a value that looks like a valid expression (number or operation), the expression is re-evaluated to reference, e.g. the named parameters

for example:

  test=string
  string=3
  echo $((test))
  # will output "3"!

* Of course, in the end, when it finally evaluates to something that is not a valid 
  arithmetic expression (newlines, ordinary text, …) then you'll get an error.
* When variables are referenced, the notation 1 + $X is equivalent to the notation 1 + X, both are allowed.
* When variables are referenced like $X, the rules of parameter expansion apply and are performed before the expression is evaluated. 
  Thus, a construct like ${MYSTRING:4:3} is valid inside an arithmetic expression.
  test=123
  echo $(( ${test:0:2} - 4 ))  # 8

Truth
Unlike command exit and return codes, arithmetic expressions evaluate to logical "true" when they are not 0. 
When they are 0, they evaluate to "false". 
The arithmetic evaluation compound command reverses the "truth" of an arithmetic expression to match the "truth" of command exit codes:
* if the arithmetic expression brings up a value not 0 (arithmetic true), it returns 0 (shell true)
* if the arithmetic expression evaluates to 0 (arithmetic false), it returns 1 (shell false)

That means, the following if-clause will execute the else-thread:
if ((0)); then
  echo "true"
else
  echo "false"
fi



Operators:

<ID> = <EXPR>  normal assignment
<ID> *= <EXPR>  equivalent to <ID> = <ID> * <EXPR>
<ID> /= <EXPR>  equivalent to <ID> = <ID> / <EXPR>
<ID> %= <EXPR>  equivalent to <ID> = <ID> % <EXPR>
<ID> += <EXPR>  equivalent to <ID> = <ID> + <EXPR>
<ID> -= <EXPR>  equivalent to <ID> = <ID> - <EXPR>

<ID> <<= <NUM>  equivalent to <ID> = <ID> << <NUMBER>
<ID> >>= <NUM>  equivalent to <ID> = <ID> >> <NUMBER>
<ID> &= <EXPR>  equivalent to <ID> = <ID> & <EXPR>
<ID> ^= <EXPR>  equivalent to <ID> = <ID> ^ <EXPR>
<ID> |= <EXPR>  equivalent to <ID> = <ID> | <EXPR>


Calculations
Operator  Description
*    multiplication
/    division
%    remainder (modulo)
+    addition
-    subtraction
**    exponentiation

Comparisons
Operator  Description
<    comparison: less than
>    comparison: greater than
<=    comparison: less than or equal
>=    comparison: greater than or equal
==    equality
!=    inequality

Bit operations
Operator  Description
~    bitwise negation
<<    bitwise shifting (left)
>>    bitwise shifting (right)
&    bitwise AND
^    bitwise exclusive OR (XOR)
|    bitwise OR

Logical
Operator  Description
!    logical negation
&&    logical AND
||    logical OR

Misc
Operator  Description
id++    post-increment of the variable id (not required by POSIX®)
id--    post-decrement of the variable id (not required by POSIX®)
++id    pre-increment of the variable id (not required by POSIX®)
--id    pre-decrement of the variable id (not required by POSIX®)
+    unary plus
-    unary minus

<EXPR> ? <EXPR> : <EXPR>  conditional (ternary) operator
<EXPR> , <EXPR>  expression list
( <EXPR> )  subexpression (to force precedence)


Precedence

The operator precedence is as follows (highest → lowest):
    Postfix (id++, id--)
    Prefix (++id, --id)
    Unary minus and plus (-, +)
    Logical and bitwise negation (!, ~)
    Exponentiation (**)
    Multiplication, division, remainder (*, /, %)
    Addition, subtraction (+, -)
    Bitwise shifts (<<, >>)
    Comparison (<, >, <=, >=)
    (In-)equality (==, !=)
    Bitwise AND (&)
    Bitwise XOR (^)
    Bitwise OR (|)
    Logical AND (&&)
    Logical OR (||)
    Ternary operator (<EXPR> ? <EXPR> : <EXPR>)
    Assignments (=, *=, /=, %=, +=, -=, <<=, >>=, &=, ^=, |=)
    Expression list operator (<EXPR> , <EXPR>)

The precedence can be adjusted using subexpressions of the form ( <EXPR> ) at any time. 
These subexpressions are always evaluated first.



Arithmetic expansion

Arithmetic expansion
$(( <EXPRESSION> ))
$[ <EXPRESSION> ] deprecated
The arithmetic expression <EXPRESSION> is evaluated and expands to the result. 
The output of the arithmetic expansion is guaranteed to be one word and a digit in Bash.
$(()) form doesn't accept quoted variable names.

Variables used inside the arithmetic expansion, as in all
arithmetic contexts, can be used with or without variable expansion:

x=1
echo $(( x ))       # Good.
echo $(( $x ))      # Ok. Avoid expansions within arithmetic. Use variables directly.
echo $(( "$x" ))    # Error. There is no quote-removal in arithmetic contexts. It expands to $(("1")), which is an invalid arithmetic expression.
echo $(( x[0]))    # Good.
echo $(( ${x[0]} )) # Ok. Nested expansion again.
echo $(( ${x[$(( ${x[!$x]} - $x ))]} )) # Same as above but more ridiculous.
echo $(( $x[0] ))   # Error. This expands to $((1[0])), an invalid expression.


Arithmetic evaluation

(( <EXPRESSION> ))
Evaluates the arithmetic expression <EXPRESSION>.

* No word-splitting or pathname expansion

If the expression evaluates to 0 then the exit code of the expression is set to 1 (FALSE). 
If the expression evaluates to something else than 0, then the exit code of the expression is set to 0 (TRUE). 

The functionality basically is equivalent to what the 'let' builtin command does. 
The arithmetic evaluation compound command should be preferred.

$ (( b = a, (a += 3) + $((a = 1)), b++ ))
$ echo "$a $b $?"   # 4 2 0
