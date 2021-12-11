# Redirection


# Redirection Summary




## Links
https://tiswww.case.edu/php/chet/bash/bashref.html#Redirections
https://www.gnu.org/software/coreutils/manual/html_node/I_002fO-redirection.html#I_002fO-redirection



# Redirections


Before a command is executed, its input and output may be redirected using *redirection operators*.

Redirection allows commands' file handles to be duplicated, opened, closed, made to refer to different files, and can change the files the command reads from and writes to.

Redirection may be used to modify file handles in the current *shell execution environment*.

redirection operators may appear anywhere within a simple command.

redirection operators are processed as they are read, from left to right.



---


Each redirection that may be preceded by a file descriptor number may instead be preceded by a word of the form {varname}. 
In this case, for each redirection operator except >&- and <&-, 
the shell will allocate a file descriptor greater than or equal to 10 and assign it to varname. 
If >&- or <&- is preceded by {varname}, the value of varname defines the file descriptor to close.

In the following descriptions, if the file descriptor number is omitted, and the first character of the redirection operator is <, the redirection refers to the standard input (file descriptor 0). If the first character of the redirection operator is >, the redirection refers to the standard output (file descriptor 1).

* The word following the redirection operator in the following descriptions, unless otherwise noted, is subjected to:
  brace expansion, tilde expansion, parameter and variable expansion, command substitution, 
  arithmetic expansion, quote removal, pathname expansion, and word splitting.
* If it expands to more than one word, bash reports an error.

Note that the order of redirections is significant. For example, the command ls > dirlist 2>&1
redirects both standard output and standard error to the file dirlist, while the command ls 2>&1 > dirlist
redirects only the standard output to file dirlist, because the standard error was 
duplicated from the standard output before the standard output was redirected to dirlist.


Bash handles several filenames specially when they are used in redirections, as described in the following table:

/dev/fd/fdn		If fdn is a valid integer, file descriptor fd is duplicated. /dev/fd/1
/dev/stdin 		File descriptor 0 is duplicated.
/dev/stdout 		File descriptor 1 is duplicated.
/dev/stderr 		File descriptor 2 is duplicated.
/dev/tcp/host/port 	bash attempts to open the corresponding TCP socket 1
/dev/udp/host/port 	bash attempts to open the corresponding UDP socket 1
1 If host is a valid hostname or IP address, and port is an integer port number or service name

* A failure to open or create a file causes the redirection to fail.
* Redirections using file descriptors greater than 9 should be used with care, 
  as they may conflict with file descriptors the shell uses internally. Also, I think, FD5 for some reason.



---


Each redirection that may be preceded by a file descriptor number may instead be preceded by a word of the form {varname}. In this case, for each redirection operator except >&- and <&-, the shell will allocate a file descriptor greater than 10 and assign it to {varname}. If >&- or <&- is preceded by {varname}, the value of varname defines the file descriptor to close. If {varname} is supplied, the redirection persists beyond the scope of the command, allowing the shell programmer to manage the file descriptor himself.

In the following descriptions, if the file descriptor number is omitted, and the first character of the redirection operator is ‘<’, the redirection refers to the standard input (file descriptor 0). If the first character of the redirection operator is ‘>’, the redirection refers to the standard output (file descriptor 1).

The word following the redirection operator in the following descriptions, unless otherwise noted, is subjected to brace expansion, tilde expansion, parameter expansion, command substitution, arithmetic expansion, quote removal, filename expansion, and word splitting. If it expands to more than one word, Bash reports an error.

Note that the order of redirections is significant. For example, the command

ls > dirlist 2>&1
directs both standard output (file descriptor 1) and standard error (file descriptor 2) to the file dirlist, while the command

ls 2>&1 > dirlist
directs only the standard output to file dirlist, because the standard error was made a copy of the standard output before the standard output was redirected to dirlist.

Bash handles several filenames specially when they are used in redirections, as described in the following table. If the operating system on which Bash is running provides these special files, bash will use them; otherwise it will emulate them internally with the behavior described below.

/dev/fd/fd
If fd is a valid integer, file descriptor fd is duplicated.

/dev/stdin
File descriptor 0 is duplicated.

/dev/stdout
File descriptor 1 is duplicated.

/dev/stderr
File descriptor 2 is duplicated.

/dev/tcp/host/port
If host is a valid hostname or Internet address, and port is an integer port number or service name, Bash attempts to open the corresponding TCP socket.

/dev/udp/host/port
If host is a valid hostname or Internet address, and port is an integer port number or service name, Bash attempts to open the corresponding UDP socket.

A failure to open or create a file causes the redirection to fail.

Redirections using file descriptors greater than 9 should be used with care, as they may conflict with file descriptors the shell uses internally.
