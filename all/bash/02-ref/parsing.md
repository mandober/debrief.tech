# Processing a command line

Read Source Input Parse Expand Substitute Execute


In case of a **simple command**, bash always reads at least one complete line of input before executing any commands on that line.

Bash reads all lines that constitute the **compound command** before executing it.

> Bash expands aliases when a command is read, not when it is executed.
Therefore, an *alias definition* appearing on the same line as another command, does not take effect until the next line of input is read. The commands following the alias definition on that line are not affected by the new alias.

Aliases are expanded when a function is read, not when executed, 
because a *function definition is itself a command*.

As a consequence, aliases defined in a function definition are not available until after that function is executed.


To be safe, always put alias definitions on a separate line, and do not use alias in compound commands.
