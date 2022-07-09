 bash | man | builtins

wait

wait [-n] [n ...]

Wait for each specified child process and return its termination status. Each n may be a process ID or a job specification; if a job spec is given, all processes in that job's pipeline are waited for. If n is not given, all currently active child processes are waited for, and the return status is zero. If the -n option is supplied, wait waits for any job to terminate and returns its exit status. If n specifies a non-existent process or job, the return status is 127. Otherwise, the return status is the exit status of the last process or job waited for.

