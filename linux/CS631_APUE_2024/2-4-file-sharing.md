# Week 2 Segment 4 File Sharing

Since UNIX is a multi-user/multi-tasking system, it is conceivable (and useful) if more than one process can act on a single file simultaneously. In order to understand how this is accomplished, we need to examine some kernel data structures which relate to files.

- each **process table entry** has a table of file descriptors which contains:
  - *file descriptor flags* (e.g. FD_CLOEXEC, see fcntl(2))
  - pointer to a *file table entry*
- kernel maintains a **file table**; each entry contains:
  - file status flags (O_APPEND, O_SYNC, O_RDONLY, etc.)
  - current file offset
  - pointer to a *v-node table entry*
- **v-node table** contains:
  - v-node information
  - i-node information
    - such as current file size
