# Loader

A **loader** is the part of a kernel that reads the contents of an executable file from the secondary storage (disk) into the main memory (RAM), preparing it for execution. The kernel then runs the program by passing control to the loaded program's `code` segment.

## Unix

On Unices, the loader is the handler for syscall `execve()` that performs:
- validation by checking permissions, memory requirements, etc.
- reading the program image into main memory
- placing potential command-line arguments on the stack
- initializing registers, e.g. stack base pointer, stack frame pointer
- jumping to the program's entry point, usually labeled `_start`

## Windows

The Windows loader is the handler for `LdrInitializeThunk` function (from `ntdll.dll`) that performs:
- initializes DLL structures, i.e. critical sections, module lists
- validates the executable it is about to load
- creates heap via `RtlCreateHeap` function
- allocates a block for environment variables
- appends the executable and the `ntdll` to the module list
- reads `kernel32.dll` to get needed functions, e.g. `BaseThreadInitThunk`
- loads the executable's imports recursively, like required DLLs
- raises the system's breakpoints (if in debug mode)
- initializes DLLs
- collects garbage
- calls `NtContinue` to begin running the executable

## Dynamic linking loaders

**Dynamic linker** is the part of the kernel that loads and links external shared libraries (`.so` on Unices, `.dll` on Windows), needed by an executable at runtime by copying their content into RAM and then binds those shared libraries dynamically to the running process (filling jump tables, relocating pointers). This approach is also called *dynamic linking* or *late linking*. The concrete OS and the executable format determine the dynamic linker's functions and implementation.

### Dynamic-link library on Windows

Dynamic-link library (DLL) is Microsoft's implementation of shared libraries on Windows. The file format for DLLs (`.dll` and `.ocx` files) is the same as for Windows `.exe` files, i.e. it is the *portable executable* (PE) format. Like executables, DLLs can contain code, data, and resources, in any combination.

### Unix

In many Unix-like systems, most of the machine code that makes up the dynamic linker is actually an external executable that the kernel loads and executes; when an executable file is loaded, the kernel reads the path of the dynamic linker from it and then attempts to load and execute this binary. The pathname of the dynamic linker is part of the kernel's application binary interface (ABI). At link time, the path of the dynamic linker that should be used is embedded into the executable image.

### Linux

On Linux, which uses the Executable and Linkable Format (ELF) for executables and dynamic libraries (`.so`), the path of the dynamic linker that should be used is embedded at link-time into the executable. The dynamic linker can be influenced (during the program's linking or execution) by altering the `LD_LIBRARY_PATH` and `LD_PRELOAD` environment variables which hold the paths to directories that contain shared libraries. For example, by changing the path of `LD_PRELOAD`, the `zlibc` (`uncompress.so`) shared library can be loaded, providing transparent decompression; this would allow reading of pre-compressed (gzipped) file data on BSD and Linux systems as if the files were not compressed, essentially allowing a user to add transparent compression to the underlying filesystem, although with some caveats.
