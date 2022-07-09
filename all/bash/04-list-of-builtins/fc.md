# bash builtins: fc

fc [-e ENAME] [-lnr] [FIRST] [LAST]
fc -s [PAT=REP] [CMD]


## First Form

`fc [-e ENAME] [-lnr] [FIRST] [LAST]`

The first form selects a range of commands from FIRST to LAST from the history list and displays or edits and re-executes them. FIRST and LAST may be specified as a string (to locate the LAST command beginning with that string) or as a number (an index into the history list, where a negative number is used as an offset from the current command number).

If LAST is not specified it is set to the current command for listing (so that `fc -l -10` prints the last 10 commands) and to FIRST otherwise.

If FIRST is not specified it's set to previous command for editing and -16 for listing.

Options:
- `-n`  suppresses the command numbers when listing
- `-r`  reverses the order of the commands
- `-l`  commands are listed on stdout. Or, editor given by ENAME is invoked
- editor lookup: `ENAME` > `FCEDIT` > `EDITOR` > `vi`
- When editing is complete, the edited commands are echoed and executed.

Return value:
* return value is 0 unless an invalid option is encountered or 
  FIRST or LAST specify history lines out of range.
* If `-e` is supplied, return value is the value of the last command executed or failure if an error occurs with temp file of commands.


## Second Form

`fc -s [PAT=SUBST] [cmd]`

In the second form, command is re-executed after each instance of PAT is replaced by SUBST. Command is intepreted the same as first above.

A useful alias to use with this is `r="fc -s"`, so that typing `r cc` runs the last command beginning with 'cc' and typing 'r' re-executes the last command.

Return status:
* that of the command re-executed, unless cmd does not specify a valid history line, in which case `fc` returns failure (1).
