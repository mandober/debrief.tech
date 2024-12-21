# Job control

Each program executed by the shell is started in a new process. For example, the shell creates 3 processes to execute the following pipeline of commands (which displays a list of files in the current working directory sorted by file size) `ls -l | sort -k5n | less`.

All major shells, except the Bourne shell, provide an interactive feature called *job control*, which allows the user to simultaneously execute and manipulate multiple commands or pipelines. In job-control capable shells, all of the processes in a pipeline are placed in a new **process group**, aka a job.

In case of a simple command, a new process group containing just a single process is created. Each process in a process group has the same **process group identifier**, which is the same as the PID of one of the processes in the group, called the **group leader**.

The kernel allows for various actions, notably the delivery of signals, to be performed on all members of a process group by targetting the group leader.

A **session** is a collection of process groups (jobs). All processes in a session have the same *session identifier* (SID).

A **session leader** is the process that created the session, and its PID becomes the SID.

All process groups created by the shell belong to the same session as the shell, which acts as a session leader.

Sessions usually have an associated *controlling terminal*. The controlling terminal is established when the session leader process first opens a terminal device. For a session created by a login interactive shell, this is the terminal at which the user has logged in.

A terminal may be the controlling terminal of at most one session.

As a consequence of opening the controlling terminal, the session leader becomes the controlling process for the terminal. The controlling process receives a SIGHUP signal if a terminal disconnect occurs (e.g. if the terminal window is closed).

At any point, one process group in a session is the *foreground process group* (foreground job), which reads the input from the terminal and may write to it.

If the user sends the interrupt character (^C) or the suspend character (^Z) to the controlling terminal, then the *terminal driver* sends a signal that kills (in case of ^C) or suspends (in case of ^Z) the foreground process group.

A session can have any number of background process groups (background jobs), which may be created by terminating a command with the ampersand symbol.

Job-control shells provide commands for listing all jobs, sending signals to jobs, and moving jobs between the foreground and background.
