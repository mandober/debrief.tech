test

test expr
[ expr ]

Return a status of 0 (true) or 1 (false) depending on the evaluation of the conditional expression expr. Each operator and operand must be a separate argument. Expressions are composed of the primaries described above under CONDITIONAL EXPRESSIONS. test does not accept any options, nor does it accept and ignore an argument of -- as signifying the end of options.

Expressions may be combined using the following operators, listed in decreasing order of precedence. 
The evaluation depends on the number of arguments; see below. 
Operator precedence is used when there are five or more arguments.

! expr 		True if expr is false.
( expr )		Returns the value of expr. This may be used to override the normal precedence of operators.
expr1 -a expr2	True if both expr1 and expr2 are true.
expr1 -o expr2 	True if either expr1 or expr2 is true.


test and [ evaluate conditional expressions using 
a set of rules based on the number of arguments:

0 arguments
The expression is false.
test $null

1 argument
The expression is true if and only if the argument is not null.
test $var

2 arguments
* If the first argument is !, the expression is true if the second argument is null.
  test ! $null
* If the first argument is one of the unary conditional operators the expression is true if the unary test is true.
  test ++$null
* If the first argument is not a valid unary conditional operator, the expression is false.

3 arguments
The following conditions are applied in the order listed:
* If the second argument is one of the binary conditional operators the result of the 
  expression is the result of the binary test using the first and third arguments as operands. 
  test $one + $two

* The -a and -o operators are considered binary operators when there are three arguments.
  test $one -a $two

* If the first argument is !, the value is the negation of the two-argument test using the second and third arguments.
  test ! $one $two

* If the first argument is exactly ( and the third argument is exactly ), the result 
  is the one-argument test of the second argument. Otherwise, the expression is false.
  test ( $one )

4 arguments
If the first argument is !, the result is the negation of the three-argument expression composed of the remaining arguments.
  test ! $one $two $three
Otherwise, the expression is parsed and evaluated according to precedence using the rules listed above.

5 or more arguments
The expression is parsed and evaluated according to precedence using the rules listed above.

When used with test or [, the < and > operators sort lexicographically using ASCII ordering.



