coprocess

A coprocess is a shell command preceded by the coproc reserved word. 

A coprocess is executed asynchronously in a subshell, as if the command had been terminated with 
the & control operator, with a two-way pipe established between the executing shell and the coprocess.

coproc [NAME] command [redirections]

* This creates a coprocess named NAME
* If NAME is not supplied, the default name is COPROC
* NAME must not be supplied if command is a simple command; otherwise, it is interpreted as the first word of the simple command. 

When the coprocess is executed, the shell creates an array variable named NAME in the context of the executing shell.
* The stdout of command is connected via a pipe to FD in the executing shell, and that FD is assigned to NAME[0]
* The stdin of command is connected via a pipe to a FD in the executing shell, and that FD is assigned to NAME[1]
* This pipe is established before any redirections specified by the command. 

The FD can be utilized as arguments to shell commands and redirections using standard word expansions. 
The FD are not available in subshells. 
The process ID of the shell spawned to execute the coprocess is available as the value of the variable NAME_PID
The wait builtin command may be used to wait for the coprocess to terminate.

RETURN STATUS
* Since the coprocess is created as an asynchronous command, the coproc command always returns success. 
* The return status of a coprocess is the exit status of command.
