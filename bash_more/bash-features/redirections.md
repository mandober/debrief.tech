REDIRECTION

INPUT
cmd 0< FILE 		use the contents of FILE when command reads from STDIN.
cmd < FILE 			same as previous, since FD0 (STDIN) is the default for the < operator.


OUTPUT
cmd n> TARGET		redirects FD number n to the TARGET.
				The TARGET, if existing file, is truncated before writing to it, unless noclobber is set - causing redirection to fail. 
cmd n>| TARGET		You can force the override by setting the redirection operator to >| instead of >

cmd > FILE	 		Send the STDOUT of command to FILE.
cmd 1> FILE 		Since STDOUT is FD1, that's the number we put in front of the 
				redirection operator, because FD1 is the default for the > operator.

ERROR
cmd 2> FILE		Send the STDERR of command to FILE.


OUTPUT and ERROR
cmd &> file		Send STDOUT and STDERR of command to FILE. Less portable.
cmd >& file		Same as above, but less preffered.
cmd > file 2>&1	 	Same as others, but more portable: redirect stdOUT to file, copy FD1 (stdOUT) to FD2 (stdERR), 
				meaning, redirect stdERR to the same file where stdOUT has been redirected.

cmd >>& file	    	Append the stdOUT and stdERR to the named FILE.
cmd 2>&1 | TARGET  	Redirects the stdERR for a command through a pipe.
cmd &| TARGET      	Synonym for 2>&1 | which redirects the stdERR for a command through a pipe.


swap stdout and stderr
# swap and pipe
( cmd 3>&1 1>&2- 2>&3- ) | cmd2
# swap
cmd 3>&1 1>&2- 2>&3-
- copy fd3 to where fd1 points to
- move fd1 to where fd2 points to
- move fd2 to where fd3 points to, close fd3 



Supress
Supress stdOUT:				Append stdOUT:
command > /dev/null			command >> file
Supress stdERR:				Append stdERR:
command 2> /dev/null			command 2>> file
Supress both:				Append both:
command &> /dev/null			command &>> file
command > /dev/null 2>&1

Whenever you reference a descriptor, to point to its current target file, 
then you use a `&' followed by a the descriptor number:
this executes the echo-command and redirects its normal output (stdOUT) to the standard error (stdERR) target
i.e. redirects output to stdOUT to stdERR instead: echo "There was an error" 1>&2
# send function's output to stdERR: func() { ...; } 1>&2

The redirection operation can be anywhere in a simple command, so these examples are equivalent:
cat in1.txt in2.txt > out.txt   same as   cat > out.txt in1.txt in2.txt   same as   > out.txt cat in1.txt in2.txt


exec
exec also allow us to manipulate the file descriptors. 
If you don't specify a program, the redirection after exec modifies the file descriptors of the current shell.
For instance, to log all the errors the commands in your script produce,
just add exec 2>errors.txt at the beginning of the script, and than use >&2 to output errors to that file.


CAPTURE FD
To save STDOUT, command's output, to a variable:
var=$(cmd)

If an error occurs cmd will complain about it (in terminal),
but that complaint WILL NOT be captured. 
To silent the cmd's complaint, STDERR, use:
var=$(cmd 2>/dev/null)
in which case probably nothing will be capture 
(because of the said error, i.e. FD1 will be null because of error).

To save both STDOUT and STDERR to a variable:
var="$(cmd 2>&1)"

To save just STDERR to a variable:
var="$(cmd 2>&1 >/dev/null)"
var="$(cmd 2>&1 1>/dev/null)"

To save just FD3 to a variable:
fd3="$(cmd 3>&1 1>/dev/null 2>&1)"
fd3="$(cmd 3>&1 2>/dev/null 1>&2)"
fd3="$(cmd 3>&1 1>/dev/null 2>/dev/null)"

Or to save any combination of streams, they have to be moved to STDOUT
To save both FD2 and FD3 to a variable:
var="$(cmd 2>&1 3>&1 1>/dev/null)"


Save each stream TO SEPARETE VAR

std1=$(cmd 2>/dev/null 3>&2)
std2=$(cmd 2>&1 1>/dev/null 3>&1)
std3=$(cmd 3>&1 1>/dev/null 2>&1)


LINKS
http://stackoverflow.com/questions/13806626/capture-both-stdout-and-stderr-in-bash 

# open fd3 for read write and point it to file
exec 3<>/tmp/foo
# write to it
echo "hiii" 1>&3
# close fd 3.
exec 3>&-

exec 3>&1
echo "hiii" 1>&3
exec 3>&-
