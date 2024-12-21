# POSIX 2024 TOC

Volumes
- 1. [Base Definitions](./1-base-definitions.md)
- 2. [System Interfaces](./2-system-interfaces.md)
- 3. [Shell and Utilities](./3-shell-and-utilities.md)
- 4. [Rationale](./4-rationale.md)


- 1. *Base Definitions*
  - 1. Introduction
  - 2. Conformance
  - 3. Definitions
  - 4. General Concepts
  - 5. File Format Notation
  - 6. Character Set
  - 7. Locale
  - 8. Environment Variables
  - 9. Regular Expressions
  - 10. Directory Structure and Devices
  - 11. General Terminal Interface
  - 12. Utility Conventions
  - 13. Namespace and Future Directions
  - 14. Headers

- 2. *System Interfaces*
  - 1. Introduction
  - 2. General Information
    - 2.1 Use and Implementation of Interfaces
    - 2.2 The Compilation Environment
    - 2.3 Error Numbers
    - 2.4 Signal Concepts
    - 2.5 Standard I/O Streams
    - 2.6 File Descriptor Allocation
    - 2.7 XSI Interprocess Communication
    - 2.8 Realtime
    - 2.9 Threads
    - 2.10 Sockets
    - 2.11 Data Types
    - 2.12 Status Information
  - 3. System Interfaces
    - (1243 interfaces)

- 3. *Shell and Utilities*
  - 1. Introduction
  - 2. Shell Command Language
    - 2.1 Shell Introduction
    - 2.2 Quoting
      - 2.2.1 Escape Character (Backslash)
      - 2.2.2 Single-Quotes
      - 2.2.3 Double-Quotes
      - 2.2.4 Dollar-Single-Quotes
    - 2.3 Token Recognition
      - 2.3.1 Alias Substitution
    - 2.4 Reserved Words
      - 2.5 Parameters and Variables
      - 2.5.1 Positional Parameters
      - 2.5.2 Special Parameters
      - 2.5.3 Shell Variables
    - 2.6 Word Expansions
      - 2.6.1 Tilde Expansion
      - 2.6.2 Parameter Expansion
      - 2.6.3 Command Substitution
      - 2.6.4 Arithmetic Expansion
      - 2.6.5 Field Splitting
      - 2.6.6 Pathname Expansion
      - 2.6.7 Quote Removal
    - 2.7 Redirection
      - 2.7.1 Redirecting Input
      - 2.7.2 Redirecting Output
      - 2.7.3 Appending Redirected Output
      - 2.7.4 Here-Document
      - 2.7.5 Duplicating an Input File Descriptor
      - 2.7.6 Duplicating an Output File Descriptor
      - 2.7.7 Open File Descriptors for Reading and Writing
    - 2.8 Exit Status and Errors
      - 2.8.1 Consequences of Shell Errors
      - 2.8.2 Exit Status for Commands
    - 2.9 Shell Commands
      - 2.9.1 Simple Commands
      - 2.9.2 Pipelines
      - 2.9.3 Lists
      - 2.9.4 Compound Commands
      - 2.9.5 Function Definition Command
    - 2.10 Shell Grammar
      - 2.10.1 Shell Grammar Lexical Conventions
      - 2.10.2 Shell Grammar Rules
    - 2.11 Job Control
    - 2.12 Signals and Error Handling
    - 2.13 Shell Execution Environment
    - 2.14 Pattern Matching Notation
      - 2.14.1 Patterns Matching a Single Character
      - 2.14.2 Patterns Matching Multiple Characters
      - 2.14.3 Patterns Used for Filename Expansion
    - 2.15 Special builtins
      - break
      - colon
      - continue
      - dot
      - eval
      - exec
      - exit
      - export
      - readonly
      - return
      - set
      - shift
      - times
      - trap
      - unset
  - 3. Utilities (155)
    - admin
    - alias
    - ar
    - asa
    - at
    - awk
    - basename
    - batch
    - bc
    - bg
    - c17
    - cal
    - cat
    - cd
    - cflow
    - chgrp
    - chmod
    - chown
    - cksum
    - cmp
    - comm
    - command
    - compress
    - cp
    - crontab
    - csplit
    - ctags
    - cut
    - cxref
    - date
    - dd
    - delta
    - df
    - diff
    - dirname
    - du
    - echo
    - ed
    - env
    - ex
    - expand
    - expr
    - false
    - fc
    - fg
    - file
    - find
    - fold
    - fuser
    - gencat
    - get
    - getconf
    - getopts
    - gettext
    - grep
    - hash
    - head
    - iconv
    - id
    - ipcrm
    - ipcs
    - jobs
    - join
    - kill
    - lex
    - link
    - ln
    - locale
    - localedef
    - logger
    - logname
    - lp
    - ls
    - m4
    - mailx
    - make
    - man
    - mesg
    - mkdir
    - mkfifo
    - more
    - msgfmt
    - mv
    - newgrp
    - ngettext
    - nice
    - nl
    - nm
    - nohup
    - od
    - paste
    - patch
    - pathchk
    - pax
    - pr
    - printf
    - prs
    - ps
    - pwd
    - read
    - readlink
    - realpath
    - renice
    - rm
    - rmdel
    - rmdir
    - sact
    - sccs
    - sed
    - sh
    - sleep
    - sort
    - split
    - strings
    - strip
    - stty
    - tabs
    - tail
    - talk
    - tee
    - test
    - time
    - timeout
    - touch
    - tput
    - tr
    - true
    - tsort
    - tty
    - type
    - ulimit
    - umask
    - unalias
    - uname
    - uncompress
    - unexpand
    - unget
    - uniq
    - unlink
    - uucp
    - uudecode
    - uuencode
    - uustat
    - uux
    - val
    - vi
    - wait
    - wc
    - what
    - who
    - write
    - xargs
    - xgettext
    - yacc
    - zcat

- 4. *Rationale*
  - A. Rationale for Base Definitions
  - B. Rationale for System Interfaces
  - C. Rationale for Shell & Utilities
  - D. Portability Considerations (Informative)
  - E. Subprofiling Considerations (Informative)