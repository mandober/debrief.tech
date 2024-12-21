## Session ID

In Linux, a **Session ID**, `SID`, is a unique identifier that represents a session. A *session* is a collection of one or more *process groups*.

Process groups are typically initiated and controlled by a terminal or controlling process. 

The session is started by a process known as the session leader. The **session leader** is usually the first process that creates the session, often the shell or the login process (like getty). The PID of the session leader becomes the SID for that session.

A new session is created when a process invokes the `setsid()` system call. This process becomes the session leader, and its PID is used as the SID. When a session is created, it also creates a new process group with the same ID.

A session can be associated with the controlling terminal. The **controlling terminal** is the tty which provides input and output for the processes within the session. The session leader is typically the process that acquires a controlling terminal when the session is created.

*A session can contain multiple process groups*. These groups are related and managed together within the session, particularly in relation to job control and signal handling. Each process in a session can belong to only one process group, and all process groups within the session share the same SID.

When the user logs onto the system, the login shell becomes the session leader, and all processes spawned from the login shell belong to the same session. The shell that runs after login inherits this session. All commands and processes initiated by the shell are part of this session. If the user logs out, the session ends, and all processes within the session are typically terminated.

Job control is managed at the session level, allowing users to switch between foreground and background jobs, suspend jobs, or kill jobs using signals.

Signals can be sent to all processes within a session, making it easier to manage processes in bulk, especially for tasks like logging out or terminating user sessions.

The SID helps the system keep track of which terminal or session a particular set of processes is associated with, enabling features like `^Z` (to suspend) or `^C` (to interrupt a process).
