# Compound Commands

In most cases a list in a command's description may be separated from the rest of the command by one or more newlines, and may be followed by a newline in place of a semicolon.

Expressions may be combined using the following operators:   
(listed in decreasing order of precedence)

`( expr )`
Returns the value of expression. This may be used to override the normal precedence of operators.

`! expr`
True if expression is false.

`expr1 && expr2`
True if both expression1 and expression2 are true.

`expr1 || expr2`
True if either expression1 or expression2 is true.

**Short-circuiting** or **lazy-evaluation**    
- `&&` and `||` operators do not evaluate RHS if the value of LHS is sufficient to determine the return value of the entire expression.
- false `&&` ?? = false
- true `||`  ?? = true



## subshell list

(list)
list is executed in a subshell environment. 
Variable assignments and builtin commands that affect the shell's 
environment do not remain in effect after the command completes. 
The RETURN STATUS is the exit status of list.

## Group command

`{ list; }`

list is simply executed in the current shell environment. 
This is known as a group command.
list must be terminated with a newline or semicolon. 
The RETURN STATUS is the exit status of list. 

Note that unlike the *metacharacters* `(` and `)`, `{` and `}` are *reserved words* and must occur where a reserved word is permitted to be recognized.

Since they do not cause a word break, they must be separated from list by whitespace or another shell metacharacter.

```bash
# with a subshell list extra spaces are optional:
(cmd)
# either works cuz ( ) are metachars
( cmd )

# but since { } are keywords, they must be terminated

# with a semicolon:
{ cmd; }

# or with a NL:
{
  cmd
  #  ^ invisible NL terminator
}
```
