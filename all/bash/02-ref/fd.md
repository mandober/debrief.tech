# File Descriptor

**File Descriptor** (FD) is an abstract handle for an I/O resource such as a
file, pipe, socket.

File descriptors are a part of the POSIX API.

A file descriptor is a non-negative integer, generally represented in the C programming language as the type int (negative values being reserved to indicate "no value" or an error condition).

Each Unix process (except perhaps a daemon) should expect to have three standard POSIX file descriptors, corresponding to the three standard streams:


Integer | Name | <unistd.h> symbolic constant | <stdio.h> file stream

0	Standard input	STDIN_FILENO	stdin
1	Standard output	STDOUT_FILENO	stdout
2	Standard error	STDERR_FILENO	stderr



## File Pointer
Each file open for IO operation is associated with a file pointer that holds an offset in bytes relative to the beginning of the file (BOF). The content of a file, especially in terms of IO operations, is considered as a stream of bytes that runs continously from the BOF to the EOF.

A **file pointer** (FP) is an offset, in bytes, relative to the BOF. Every open file has an associated file pointer, which starts at 0 when the file is opened.

For instance, when a file is opened using the output redirection operator, `cmd > file`, the file gets truncuted, so its FP is zero. After the content is written, the FP records the position in the file. If the new content is added during the same command, the text will get appended starting from the position held in the file pointer. If then another, read operation, starts reading from the same file, it will get its own file pointer that will track the read position.



## Links

https://en.wikipedia.org/wiki/File_descriptor
https://www.gnu.org/software/libc/manual/html_node/Descriptors-and-Streams.html
https://www.tutorialspoint.com/assembly_programming/assembly_file_management.htm
