# Writing bash functions

Bash function may have several forms. 
The identifying characteristics
- the `function` keyword
- name followed by the empty pair of parentheses


Concerning the keyword

name () compound-command [redirections] 

function name [()] compound-command [redirections]

The function keyword can be omitted only if parentheses are present.

Alternatively, we can also omit the parentheses if we use the function keyword.

The body can be any compound command, while redirections are also optional and performed when the function is executed.
