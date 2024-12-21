# Inter-process communication

https://en.wikipedia.org/wiki/Inter-process_communication

>IPC are OS mechanisms that processes use to exchange and manage shared data.

Typically, applications can use IPC categorized as clients and servers, where client requests data and server responds to client requests. Many applications are both clients and servers, as commonly seen in distributed computing.

When the software relies on something outside of its own code to know what to do next or when to do it, we need to think about IPC. Unix accounted for this long ago, expecting that software would originate from diverse sources. In the same tradition, Linux provides many of the same interfaces for IPC and some new ones. The Linux kernel features several IPC methods, and the `util-linux` package contains the `ipcmk`, `ipcrm`, `ipcs`, and `lsipc` commands for monitoring and managing IPC messages.
