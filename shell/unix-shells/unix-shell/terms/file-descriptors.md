# FDs

- std fds: stdin, stdout, stderr

- When stdout of a process is printed on a tty, the output is printed line by line, without any delay. When stdout of a process is redirected to a file or piped to another process' stdin, buffering occurs to reduce the number of I/O operations. This increases performance in some cases, but also prevents the second process to receive the output in real-time. As a result, the second process will receive the output less often, in big batches, instead of frequently line-by-line.

- Only the fg process (has the focus) receives keyboard events. To communicate with a bg process signals can be used.

- output may changes when it's going to a pipe rather than a terminal (tty)
- use the `read` builtin to capture the stdout/stderr of the previous command in a pipeline

- **pty** is a kernel-level object which processes can write data to and read data from, a bit like a pipe. Unlike a pipe, data moves through a single pty in both directions. When you use a program in a shell pipeline, up to 3 pipes are created for the process' standard streams (stdin, stdout and stderr). A pty also does more than a pipe: it keeps track of the window size (rows and columns of characters) and notifies child processes (with a SIGWINCH signal) when the size changes. In *cooked mode*, it does some preprocessing of data sent from the parent process; for instance, the byte 0x03 (entered as `^C`) causes SIGINT to be sent to the child process.

Many command line programs behave differently if they detect that stdin or stdout is connected to a terminal instead of a pipe (using `isatty()`), because this normally means that they're being used interactively by a human user. They may format output differently (e.g. `ls` lists files in columns) or prompt the user to confirm actions. 



* stdio buffering
https://www.pixelbeat.org/programming/stdio_buffering/

* Unix buffering delays output to stdout, ruins your day
https://www.turnkeylinux.org/blog/unix-buffering
