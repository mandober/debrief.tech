# Variable assignment

*Variable assignment* is done using **assignment statement** of the form:    
<kbd>LHS=RHS</kbd>

- the shell first expands the VALUE, then assigns the expansion to NAME
- If VALUE is omitted, the empty string is assigned to NAME


name=$((133#16))
echo $n


Before being assigned to the variable, value undergoes:
1. tilde expansion
2. parameter expansion
3. command substitution
4. arithmetic expansion
5. quote removal 

* The variable assignments affect the current shell environment.
* Assignment to readonly variables causes an error and the command exits non-zero.

A variable assignment (key=value pair) that precedes a command name doesn't affect the current environment, it only has influence in the subshell in which the command is to be executed.

USER=tempo echo $USER   -> tempo (changed only for echo's environment, which is destoryed as soon as echo is finished)



NUMBERS
base10  broj=14      echo $broj -> 14
base2    broj=$[2#010110111]  -> 183
base8    broj=$[8#34]    -> 28
base10  broj=$[10#54]    -> 54
base16  broj=$[16#ff]    -> 255





*Bash does not consider variable assignment as command, so the previous command's return/exit status is preserved after assignments.*

However, an assignement with the `declare` keyword *is* considered a command, so the evaluated return/exit code in that case is the assignement itself and not the command executed in the sub-shell:
