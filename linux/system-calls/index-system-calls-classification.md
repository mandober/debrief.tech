# Index :: Syscal classification


Kinds of syscalls
- POSIX approved
- Linux-only

Properties of syscalls
- blocking system call
- non-blocking system call

Threading models
- many-to-one model,  N:1
- one-to-one model,   1:1
- many-to-many model, N:M
- hybrid model

System call categories (domains)
- Process control
- File management
- Device management
- Information maintenance
- Communication
- Protection

## System call categories

System calls can be grouped roughly into 6 major categories:
- 1. Process control
  - create process (fork)
  - terminate process (kill)
  - load
  - execute (exec)
  - get/set process attributes
  - wait for time
  - wait event
  - signal event
  - allocate memory (malloc)
  - free memory (free)
- 2. File management
  - create file
  - delete file
  - open file
  - close file
  - read file
  - write file
  - seek (reposition file pointer)
  - get/set file attributes
- 3. Device management
  - request device
  - release device
  - read, write, reposition
  - get/set device attributes
  - logically attach or detach devices
- 4. Information maintenance
  - get/set total system information (incl time, date, computer name)
  - get/set process, file, device metadata (incl author, opener, ctime)
- 5. Communication
  - create, delete communication connection
  - send, receive messages
  - transfer status information
  - attach or detach remote devices
- 6. Protection
  - get/set file permissions
