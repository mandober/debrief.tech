 bash | man | builtins

disown

disown [-ar] [-h] [jobspec ...]

* Without options, remove each jobspec from the table of active jobs. 
* If jobspec is not present, and neither the -a nor the -r option is supplied, the current job is used. 
* If the -h option is given, each jobspec is not removed from the table, 
  but marked so that SIGHUP isn't sent to the job if the shell receives SIGHUP
* If no jobspec is supplied, the -a option means to remove or mark all jobs;
  -r option without jobspec argument restricts operation to running jobs. 
The return value is 0 unless a jobspec does not specify a valid job.
