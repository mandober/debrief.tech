# Process group

In Linux, a **process group** is a set of one or more processes, treated as a single unit, for certain operations, particularly those related to *job control* and *signal handling*.

Process groups are important for controlling processes, especially in terminal environments where there may be multiple jobs running simultaneously in the background. However, there is always one job (process) running in the foreground, which receives the commands and other events (signals) by default.

### Process Group ID
Each process group is identified by a unique *Process Group ID*, `PGID`, which equals the PID of the group's leader. All processes in a group share the same `PGID`, which allows tracking the group.

### Process leader
The process that creates the group is called the **process leader**, and its PID is used as the PGID for the entire group. The leader is usually responsible for initiating the process group and is often the parent of other processes in the group.

### Job control
In the context of terminals, job control allows users to control multiple jobs. A process group can run in background or foreground. The shell can then target entire groups when sending signals (like `SIGTTOU` when a bg job tries to write to terminal, provided it is disallowed to do so).

### Signal Handling
Signals (such as `SIGTERM`, `SIGKILL`, `SIGINT`) can be sent to a process group, affecting all processes within the group. For example, sending a `SIGTERM` to a process group would terminate all processes in that group. This is particularly useful in terminal environments, where a command like `Ctrl+C` (which sends `SIGINT`) can interrupt all processes associated with the current job.

### Foreground and Background Process Groups
The terminal usually manages a foreground process group (the group currently interacting with the terminal) and one or more background process groups (those running in the background). Only the foreground process group can receive input from the terminal.

### Creating and Managing Process Groups
Process groups are typically created by a shell or another controlling process. When a new process is forked, it can either join the parent's process group or create a new one. The `setpgid()` system call can be used to change the process group of a process, allowing for fine control over how processes are grouped.


## Example Scenario

Imagine you're using a shell to start a command that runs a script, which in turn starts several subprocesses. The shell might create a process group for the command, and all subprocesses spawned by the script will belong to the same process group. If you press `Ctrl+C`, the shell sends a `SIGINT` to the entire process group, effectively stopping all related processes at once.

Practical importance
- Job Control: users can easily manage background and foreground tasks in a terminal.
- Signal Management: Simplifies sending signals to groups of related processes, ensuring coordinated behavior.
- Process Management: Helps in organizing processes hierarchically, making system administration and debugging more straightforward.
