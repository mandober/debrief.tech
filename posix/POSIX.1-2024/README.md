# POSIX.1-2024 standard

https://pubs.opengroup.org/onlinepubs/9799919799/

POSIX.1-2024 is simultaneously IEEE Std 1003.1™ - 2024 and The Open Group Standard Base Specifications, Issue 8.

POSIX.1-2024 defines a standard operating system interface and environment, including a command interpreter (or "shell"), and common utility programs to support applications portability at the source code level.

Volumes
- 1. [Base Definitions](./1-base-definitions.md)
- 2. [System Interfaces](./2-system-interfaces.md)
- 3. [Shell and Utilities](./3-shell-and-utilities.md)
- 4. [Rationale](./4-rationale.md)


POSIX.1-2024 is intended to be used by both application developers and system implementors and comprises four major components (each in an associated volume):
- General terms, concepts, and interfaces 
  common to all volumes of this standard, including 
  utility conventions and C-language header definitions, 
  (included in the Base Definitions volume).
- Definitions for system service functions and subroutines, 
  language-specific system services for the C programming language, 
  function issues, including portability, error handling, and error recovery, 
  (included in the System Interfaces volume).
- Definitions for a standard source code-level interface 
  to command interpretation services (a "shell") and 
  common utility programs for application programs 
  (included in the Shell and Utilities volume).
- Extended rationale 
  that did not fit well into the rest of the document structure, 
  which contains historical information concerning the contents of POSIX.1-2024 
  and why features were included or discarded by the standard developers, 
  (included in the Rationale (Informative) volume).

The following areas are outside the scope of POSIX.1-2024:
- Graphics interfaces
- Database management system interfaces
- Record I/O considerations
- Object or binary code portability
- System configuration and resource availability

POSIX.1-2024 describes the external characteristics and facilities that are of importance to application developers, rather than the internal construction techniques employed to achieve these capabilities. Special emphasis is placed on those functions and facilities that are needed in a wide variety of commercial applications.

Keywords
- basic regular expression (BRE)
- extended regular expression (ERE)
- argument
- synchronous
- asynchronous
- batch job
- batch system
- builtin, built-in utility
- byte
- child
- command language interpreter
- CPU
- FIFO
- input/output (I/O)
- job control
- file access control mechanism
- network
- parent
- shell
- stream
- string
- system
- thread
- application program interface (API)
- portable operating system interface (POSIX™)
- X/Open System Interface (XSI)
