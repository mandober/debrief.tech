# Exit Status

The exit status of an executed command is the value returned by the waitpid system call or equivalent function. 
Exit statuses fall between 0 and 255, though the shell may use values above 125 specially. 
Exit statuses from shell builtins and compound commands are also limited to this range. 
Under certain circumstances, the shell will use special values to indicate specific failure modes.

For the shell's purposes, a command which exits with a zero exit status has succeeded. 
An exit status of zero indicates success. 
A non-zero exit status indicates failure. 
When a command terminates on a fatal signal N, bash uses the value of 128+N as the exit status.

If a command is not found, the child process created to execute it returns a status of 127. 
127: command not found
If a command is found but is not executable, the return status is 126.
126: wrong permissions

If a command fails because of an error during expansion or redirection, the exit status is greater than zero.

Shell builtin commands return a status of 0 (true) if successful,
and non-zero (false) if an error occurs while they execute. 
All builtins return an exit status of 2 to indicate incorrect usage.
0: success
1: failiure
2: incorrect usage

Bash itself returns the exit status of the last command executed, 
unless a syntax error occurs, in which case it exits with a non-zero value.





*Bash does not consider variable assignment as command, so the previous command's return/exit status is preserved after assignments.*

However, an assignement with the `declare` keyword *is* considered a command, so the evaluated return/exit code in that case is the assignement itself and not the command executed in the sub-shell:

```bash
# palin assignment
DUMMY=$( grep r00t /etc/passwd 2>&1 )

declare DUMMY=$( grep r00t /etc/passwd 2>&1 )
echo $?
# 0


# this are in fact 2 lines:
declare var=$( echo "error" 2>&1 )

# first, the declarations
declare var
echo $? # 0

declare v-a-r 2>/dev/null
echo $? # 1
```
