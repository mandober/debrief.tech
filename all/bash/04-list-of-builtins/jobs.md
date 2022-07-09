 bash | man | builtins

jobs

jobs [-lnprs] [ JOBSPEC ... ]
jobs -x command [ args ... ]

The first form lists the active jobs. 

OPTIONS:
-l   List process IDs in addition to the normal information.
-n   Display information only about jobs that have changed status since the user was last notified of their status.
-p   List only the process ID of the job's process group leader.
-r   Display only running jobs.
-s   Display only stopped jobs.
-x   If the -x option is supplied, jobs replaces any JOBSPEC found in command or args with the 
     corresponding process group ID, and executes command passing it args, returning its exit status.

* If JOBSPEC is given, output is restricted to information about that job. 
* The return status is 0 unless an invalid option is encountered or an invalid JOBSPEC is supplied.
