# Wait

When the `fork` is called, the parent process typically must `wait` for the child processes to finish, otherwise if the parent process finishes before the child, in Linux, all of the child processes will be automatically terminated by the operating system.
