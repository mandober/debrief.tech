# 1. Introduction

POSIX.1-2024 › 
  - 1. Base definitions
  - 2. System intefaces
  - 3. *Shell and Utilities*
    - 1. *Introduction*
    - 2. Shell Command Language
    - 3. Utilities
  - 4. Rationale


https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap01.html

The Shell and Utilities volume of POSIX.1-2024 describes the commands and utilities offered to application programs by POSIX-conformant systems.

### 1.1 Relationship to Other Documents

#### 1.1.1 System Interfaces

This subsection describes some of the features provided by the System Interfaces volume of POSIX.1-2024 that are assumed to be globally available on all systems conforming to this volume of POSIX.1-2024. This subsection does not attempt to detail all of the features defined in the System Interfaces volume of POSIX.1-2024 that are required by all of the utilities defined in this volume of POSIX.1-2024; the utility and function descriptions point out additional functionality required to provide the corresponding specific features needed by each.

The following subsections describe frequently used concepts. Many of these concepts are described in the Base Definitions volume of POSIX.1-2024. Utility and function description statements override these defaults when appropriate.

##### 1.1.1.1 Process Attributes

The following process attributes, as described in the System Interfaces volume of POSIX.1-2024, are assumed to be supported for all processes in this volume of POSIX.1-2024:
- Controlling Terminal
- Current Working Directory
- Effective Group ID
- Effective User ID
- File Descriptors
- File Mode Creation Mask
- Process Group ID
- Process ID
- Real Group ID
- Real User ID
- Root Directory
- Saved Set-Group-ID
- Saved Set-User-ID
- Session Membership
- Supplementary Group IDs

A conforming implementation may include additional process attributes.

##### 1.1.1.2 Concurrent Execution of Processes

The following functionality of the fork() function defined in the System Interfaces volume of POSIX.1-2024 shall be available on all systems conforming to this volume of POSIX.1-2024:

Independent processes shall be capable of executing independently without either process terminating.

A process shall be able to create a new process with all of the attributes referenced in 1.1.1.1 Process Attributes , determined according to the semantics of a call to the fork() function defined in the System Interfaces volume of POSIX.1-2024 followed by a call in the child process to one of the exec functions defined in the System Interfaces volume of POSIX.1-2024.

##### 1.1.1.3 File Access Permissions

The file access control mechanism described by XBD 4.7 File Access Permissions shall apply to all files on an implementation conforming to this volume of POSIX.1-2024.

##### 1.1.1.4 File Read, Write, and Creation

If a file that does not exist is to be written, it shall be created as described below, unless the utility description states otherwise.

When a file that does not exist is created, the following features defined in the System Interfaces volume of POSIX.1-2024 shall apply unless the utility or function description states otherwise:

The user ID of the file shall be set to the effective user ID of the calling process.
The group ID of the file shall be set to the effective group ID of the calling process or the group ID of the directory in which the file is being created.
If the file is a regular file, the permission bits of the file shall be set to: S_IROTH | S_IWOTH | S_IRGRP | S_IWGRP | S_IRUSR | S_IWUSR
(see the description of File Modes in XBD 14. Headers , <sys/stat.h>) except that the bits specified by the file mode creation mask of the process shall be cleared. If the file is a directory, the permission bits shall be set to: S_IRWXU | S_IRWXG | S_IRWXO

except that the bits specified by the file mode creation mask of the process shall be cleared.

The last data access, last data modification, and last file status change timestamps of the file shall be updated as specified in XBD 4.12 File Times Update .

If the file is a directory, it shall be an empty directory; otherwise, the file shall have length zero.

If the file is a symbolic link, the effect shall be undefined unless the {POSIX2_SYMLINKS} variable is in effect for the directory in which the symbolic link would be created.

Unless otherwise specified, the file created shall be a regular file.
When an attempt is made to create a file that already exists, the utility shall take the action indicated in Actions when Creating a File that Already Exists corresponding to the type of the file the utility is trying to create and the type of the existing file, unless the utility description states otherwise.


    Table: Actions when Creating a File that Already Exists


##### 1.1.1.5 File Removal

When a directory that is the root directory or current working directory of any process is removed, the effect is implementation-defined. If file access permissions deny access, the requested operation shall fail. Otherwise, when a file is removed:

Its directory entry shall be removed from the file system.
The link count of the file shall be decremented.
If the file is an empty directory (see XBD 3.119 Empty Directory ):
If no process has the directory open, the space occupied by the directory shall be freed and the directory shall no longer be accessible.
If one or more processes have the directory open, the directory contents shall be preserved until all references to the file have been closed.
If the file is a directory that is not empty, the last file status change timestamp shall be marked for update.
If the file is not a directory:
If the link count becomes zero:
If no process has the file open, the space occupied by the file shall be freed and the file shall no longer be accessible.
If one or more processes have the file open, the file contents shall be preserved until all references to the file have been closed.
If the link count is not reduced to zero, the last file status change timestamp shall be marked for update.
The last data modification and last file status change timestamps of the containing directory shall be marked for update.

##### 1.1.1.6 File Time Values

All files shall have the three time values described by XBD 4.12 File Times Update .

##### 1.1.1.7 File Contents

When a reference is made to the contents of a file, pathname, this means the equivalent of all of the data placed in the space pointed to by buf when performing the read() function calls in the following operations defined in the System Interfaces volume of POSIX.1-2024:

while (read (fildes, buf, nbytes) > 0)
    ;
If the file is indicated by a pathname pathname, the file descriptor shall be determined by the equivalent of the following operation defined in the System Interfaces volume of POSIX.1-2024:

fildes = open (pathname, O_RDONLY);
The value of nbytes in the above sequence is unspecified; if the file is of a type where the data returned by read() would vary with different values, the value shall be one that results in the most data being returned.

If the read() function calls would return an error, it is unspecified whether the contents of the file are considered to include any data from offsets in the file beyond where the error would be returned.

##### 1.1.1.8 Pathname Resolution

The pathname resolution algorithm, described by XBD 4.16 Pathname Resolution , shall be used by implementations conforming to this volume of POSIX.1-2024; see also XBD 4.8 File Hierarchy .

##### 1.1.1.9 Changing the Current Working Directory

When the current working directory (see XBD 3.94 Current Working Directory ) is to be changed, unless the utility or function description states otherwise, the operation shall succeed unless a call to the chdir() function defined in the System Interfaces volume of POSIX.1-2024 would fail when invoked with the new working directory pathname as its argument.

##### 1.1.1.10 Establish the Locale

The functionality of the setlocale() function defined in the System Interfaces volume of POSIX.1-2024 shall be available on all systems conforming to this volume of POSIX.1-2024; that is, utilities that require the capability of establishing an international operating environment shall be permitted to set the specified category of the international environment.

##### 1.1.1.11 Actions Equivalent to Functions

Some utility descriptions specify that a utility performs actions equivalent to a function defined in the System Interfaces volume of POSIX.1-2024. Such specifications require only that the external effects be equivalent, not that any effect within the utility and visible only to the utility be equivalent.

#### 1.1.2 Concepts Derived from the ISO C Standard

##### 1.1.2.1 Arithmetic Precision and Operations

##### 1.1.2.2 Mathematical Functions

### 1.2 Utility Limits

### 1.3 Grammar Conventions

### 1.4 Utility Description Defaults

### 1.5 Considerations for Utilities in Support of Files of Arbitrary Size

### 1.6 Built-In Utilities

Any of the standard utilities may be implemented as regular built-in utilities within the command language interpreter. This is usually done to increase the performance of frequently used utilities or to achieve functionality that would be more difficult in a separate environment. The intrinsic utilities described in Intrinsic Utilities below are frequently provided as regular built-ins.

However, all of the standard utilities other than:
- The special built-ins described in (2.15) Special Built-In Utilities
- The intrinsic utilities named in Intrinsic Utilities, except for `kill`

shall be implemented, regardless of whether they are also implemented as regular built-ins, in a manner so that they can be accessed via the `exec` family of functions as defined in the System Interfaces volume of POSIX.1-2024 and can be invoked directly by those standard utilities that require it (env, find, nice, nohup, time, xargs).

### 1.7 Intrinsic Utilities

As described in (2.9.1.4 Command Search and Execution), *intrinsic utilities are not subject to a PATH search during command search and execution*.

Intrinsic Utilities:
- alias
- bg
- cd
- command
- fc
- fg
- getopts
- hash
- jobs
- kill
- read
- type
- ulimit
- umask
- unalias
- wait


Whether any additional utility is considered an intrinsic utility is implementation-defined. Because applications are unable to override an intrinsic utility with a utility from PATH , implementations should not make any utility an intrinsic utility beyond the utilities in Intrinsic Utilities .
