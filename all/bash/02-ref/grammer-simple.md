SHELL GRAMMAR

grammar summary:
* a simple command 	is just a command and its arguments and redirections
* a pipeline 		is one or more simple command probably connected in a pipe
* a list 			is one or more pipelines connected by special operators
* a compound command is a list or a special command that forms a new meta-command
* a function 		definition makes a compound command available under a new name, and a separate environment


simple command

A simple command is a sequence of:
- optional variable assignments followed by
- blank-separated words and redirections, and 
- terminated by a control operator
  IFS=: read -a array < FILE

* The first word specifies the command to be executed, and is passed as argument zero. 
* The remaining words are passed as arguments to the invoked command. 

RETURN VALUE of a simple command is its exit status, 
or 128+n if the command is terminated by signal n.


Pipeline

A pipeline is a sequence of one or more commands separated by one of the control operators | or |&

The format for a pipeline is:
[time [-p]] [!] command [ [|||&] command2 ... ]
command | command2
time command |& command2

The standard output of command is connected via a pipe to the standard input of command2       	env | sort
* This connection is performed before any redirections specified by the command. 
* If |& is used, command's standard error, in addition to its standard output, 			    	declare -p |& tee "out_and_err.txt"
  is connected to command2's standard input through the pipe; it is shorthand for 2>&1 |      	declare -p 2>&1 | tee "out_and_err.txt"
  This implicit redirection of the standard error to the standard 
  output is performed after any redirections specified by the command.

* Each command in a pipeline is executed as a separate process (i.e. in a subshell)

RETURN STATUS 
of a pipeline is the exit status of the last command, unless the pipefail option is enabled.
* If pipefail is enabled, the pipeline's return status is the value of the last (rightmost) 
  command to exit with a non-zero status, or zero if all commands exit successfully.
* If the reserved word ! precedes a pipeline, the exit status of that
  pipeline is the logical negation of the exit status as described above. 
* The shell waits for all commands in the pipeline to terminate before returning a value.

time
if the time reserved word precedes a pipeline, the elapsed as well as user and 
system time consumed by its execution are reported when the pipeline terminates.
* The -p option changes the output format to that specified by POSIX.
  When the shell is in posix mode, it does not recognize time as a 
  reserved word if the next token begins with a `-'.
* The TIMEFORMAT variable may be set to a format string that 
  specifies how the timing information should be displayed.
* When the shell is in posix mode, time may be followed by a newline. 
  In this case, the shell displays the total user and system time consumed by the shell and its children. 
  The TIMEFORMAT variable may be used to specify the format of the time information.


Lists

A list is a sequence of one or more pipelines separated by one of the operators ;, &, &&, or ||, 
and optionally terminated by one of ;, &, or <newline>. 

* Of these list operators, && and || have equal precedence, followed by ; and &, which have equal precedence.
  A sequence of one or more newlines may appear in a list instead of a semicolon to delimit commands.

* If a command is terminated by the control operator &, 
  shell executes the command in the background in a subshell. 
  The shell does not wait for the command to finish, and the return status is 0.

* Commands separated by a ; are executed sequentially; 
  the shell waits for each command to terminate in turn.
  The return status is the exit status of the last command executed.

AND and OR lists
AND and OR lists are sequences of one of more pipelines 
separated by the && and || control operators, respectively.
AND and OR lists are executed with left associativity i.e. short-circuted 
(left side is evaluated, and if true, right side is not evaluated at all)

AND list
AND list has the form: command1 && command2
command2 is executed if, and only if, command1 returns an exit status of zero
(left side is evaluated, and if false, right side is not evaluated at all)

OR list
OR list has the form:	command1 || command2
command2 is executed if, and only if, command1 returns a non-zero exit status.
The return status of AND and OR lists is the exit status of the last command executed in the list.
(left side is evaluated, and if true, right side is not evaluated at all)
