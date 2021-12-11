# bash keywords: time

time: time [-p] pipeline

Report time consumed by pipeline's execution.

Execute PIPELINE and print a summary of the real time, user CPU time,
and system CPU time spent executing PIPELINE when it terminates.

Options:
-p        print the timing summary in the portable Posix format

The value of the TIMEFORMAT variable is used as the output format.
EXIT STATUS: The return status is the return status of PIPELINE.
