ulimit [-HSTabcdefilmnpqrstuvx [limit]]

Provides control over the resources available to the shell and 
to processes started by it, on systems that allow such control.

The -H and -S options specify that the hard or soft limit is set for the given resource. 
-S   soft limit - a soft limit may be increased up to the value of the hard limit
-H   hard limit - a hard limit cannot be increased by a non-root user once it is set
  
* If neither -H nor -S is specified, both the soft and hard limits are set.

* The value of limit can be a number in the unit specified for the resource or a special value:
  hard - current hard limit
  soft - current soft limit
  unlimited- no limit

* If limit is omitted, the current value of the soft limit of the resource is printed, unless the -H option is given.
  When more than one resource is specified, the limit name and unit are printed before the value.

Other options are interpreted as follows:
-a   all current limits
-b   max size of socket buffer
-c   max size of core files created
-d   max size of process's data segment
-e   max scheduling priority (nice)
-f   max size of files written by the shell and its children  *default
-i   max number of pending signals
-l   max size that may be locked into memory
-m   max resident (memory) set size (many systems do not honor this limit)
-n   max number of open FDs (most systems do not allow this value to be set)
-p   max size of pipe in 512-byte blocks (this may not be set)
-q   max number of bytes in POSIX message queues
-r   max real-time scheduling priority
-s   max size of stack
-t   max amount of cpu time in seconds
-T   The maximum number of Threads
-u   The maximum number of processes available to a single user
-v   The maximum amount of virtual memory available to the shell and, on some systems, to its children
-x   The maximum number of file lox (locks)



* If limit is given, and the -a option is not used, limit is the new value of the specified resource. 
* If no option is given, then -f is assumed.
* Values are in 1024-byte increments, except for: 
  -t which is in seconds 
  -p which is in units of 512-byte blocks and
  -T, -b, -n, and -u, which are unscaled values 

RETURN STATUS is 0 unless an invalid option or argument 
is supplied, or an error occurs while setting a new limit.


b	socket buffer	(unit)
c	core file size	(Kb)
d	data seg size   (Kb)
e	nice			(Kb)
f	file size		(Kb)
i	pending sig	(Kb)
l	locks			(Kb)
m	res. memory	(Kb)
n	open FDs		(unit)
p	pipe size		(512b)
q	message queues	(Kb)
r	real-time scheduling priority (Kb)
s	stack size		(Kb)
t	cpu time		(sec)
T	threads		(unit)
u	max user proces (unit)
v	virtual memory 	(Kb)
x	file locks		(Kb)



-a   all current limits
-b   max 	socket buffer
-c   max 	core files created
-d   max 	process's data segment
-f   max 	files written by the shell and its children
-p   max 	pipe in 512-byte blocks
-s   max 	stack
-m   max 	resident memory set
-l   max 	that may be locked into memory
-x   max 	file lox (locks)
-t   max 	amount of cpu time in seconds
-e   max 	scheduling priority (nice)
-r   max 	real-time scheduling priority
-i   max 	pending signals
-n   max 	open FDs
-q   max 	bytes in POSIX message queues
-T   max 	Threads
-u   max 	user processes
-v   max 	virtual memory




EXAMPLES:

# Disable core files
ulimit -S -c 0 > /dev/null 2>&1

# max 100 user processes
ulimit -u -S 200 -H 300












