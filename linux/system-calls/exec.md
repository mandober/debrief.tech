# System calls :: exec family

https://en.wikipedia.org/wiki/Exec_(system_call)

`exec` is a functionality of an operating system that runs an executable file in the context of an already existing process, replacing the previous executable. This act is also referred to as an *overlay*.

`exec{l,v}{,e,p}`

It is especially important in Unix-like systems, although it also exists elsewhere. As no new process is created, the process identifier (PID) does not change, but the machine code, data, heap and stack of the process are replaced by those of the new program.

The exec call is available for many programming languages including compilable languages and some scripting languages. In shells, the *exec builtin* command replaces the shell process with the specified program.

## Nomenclature

Interfaces to exec and its implementations vary. Depending on programming language it may be accessible via one or more functions, and depending on operating system it may be represented with one or more actual system calls. For this reason exec is sometimes described as a *family of functions*.

Standard names of exec family of functions in C are, `exec{l,v}{,e,p}`
- exec`l`
- exec`le`
- exec`lp`
- exec`v`
- exec`ve`
- exec`vp`

(there is no "exec" itself) The Linux kernel has one corresponding system call named `execve`, whereas all aforementioned functions are user-space wrappers around it.

Higher-level languages usually provide one call named 'exec'.

## Unix, POSIX, and other multitasking systems

### C language prototypes

The POSIX standard declares exec functions in the `unistd.h` header file.

```c
int execv   (char const *path, char const *argv[]);
int execvp  (char const *file, char const *argv[]);
int execl   (char const *path, char const *arg0, ...);
int execlp  (char const *file, char const *arg0, ...);
int execle  (char const *path, char const *arg0, ..., char const *envp[]);
int execve  (char const *path, char const *argv[],    char const *envp[]);
int fexecve (int fd,           char *const argv[],    char *const envp[]);
```

In some implementations these functions have a leading underscore (e.g. `_execl`).

The base of each is 'exec' (execute), followed by one or more letters:
- `e` Array of pointers to *envars* is explicitly passed to new process
- `l` Command-line args are passed individually (a list) to the function
- `v` Command-line args are passed to the function as an array of pointers
- `p` Uses PATH to find the file named in the file argument to be executed

* path   
The argument specifies the path name of the file to execute as the new process image. Arguments beginning at `arg0` are pointers to arguments to be passed to the new process image. The `argv` value is an array of pointers to arguments.

* arg0    
The first arg, `arg0`, should be the name of the executable file - usually the same value as `path`. Some programs may incorrectly rely on this arg providing the location of the executable, but there is no guarantee of this nor is it standardized across platforms.

* envp    
Argument `envp` is an array of pointers to environment settings. The exec calls named ending with `-e` alter the environment for the new process image by passing a list of environment settings through the `envp` argument. This argument is an array of character pointers; each element (except for the final element) points to a null-terminated string defining an environment variable.

Each null-terminated string has the form `name=value`, where *name* is the env var 'name', and *value* is the value of that variable. The final element of the `envp` array must be null.

>In execl, execlp, execv, and execvp calls, the new process image inherits the current environment variables.

### Effects

A file descriptor open when an exec call is made remains open in the new process image, unless was fcntled with FD_CLOEXEC or opened with O_CLOEXEC (the latter was introduced in POSIX.1-2001). This aspect is used to specify the standard streams (stdin, stdout and stderr) of the new program.

A successful overlay destroys the previous memory address space of the process, and all its memory areas, that were not shared, are reclaimed by the operating system. Consequently, all its data that were not passed to the new program, or otherwise saved, become lost.

### Return value

A successful exec replaces the current process image, so it cannot return anything to the program that made the call. Processes do have an exit status, but that value is collected by the parent process.

If an exec function does return to the calling program, an error occurs, the return value is −1, and errno is set to one of the following values:
- `E2BIG`   The argument list exceeds the system limit.
- `EACCES`  The specified file has a locking or sharing violation.
- `ENOENT`  The file or path name not found.
- `ENOMEM`  Not enough memory is available to execute the new process image.

## Shells

http://man7.org/linux/man-pages/man3/exec.3.html

Many Unix shells also offer a builtin exec command that replaces the shell process with the specified program. Wrapper scripts often use this command to run a program (either directly or through an interpreter or virtual machine) after setting environment variables or other configuration. By using exec, the resources used by the shell program do not need to stay in use after the program is started.

The exec command can also perform a redirection. In some shells (bash) it is even possible to use the exec command for redirection only, without making an actual overlay.

## Alternatives

The traditional Unix system does not have the functionality to create a new process running a new executable program in one step, which explains the importance of exec for Unix programming.

Other systems may use `spawn` as the main tool for running executables. Its result is equivalent to the fork-exec sequence of Unix-like systems.

POSIX supports the `posix_spawn` routines as an optional extension that usually is implemented using `vfork`.

## See also
- Chain loading, overlaying in system programming
  https://en.wikipedia.org/wiki/Chain_loading
- exit (system call), terminate a process
  https://en.wikipedia.org/wiki/Exit_(system_call)
- fork (system call), make a new process (but with the same executable)
  https://en.wikipedia.org/wiki/Fork_(system_call)
- clone(), the way to create new threads
  https://en.wikipedia.org/wiki/Fork_(system_call)#Linux_clone_syscall
- PATH (variable), related to semantics of the `*path` argument
  https://en.wikipedia.org/wiki/PATH_(variable)
- POSIX exec
  https://pubs.opengroup.org/onlinepubs/9699919799/functions/exec.html
