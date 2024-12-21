# Pseudoterminal

https://en.wikipedia.org/wiki/Pseudoterminal

A pseudoterminal (pty) is a pair of pseudo-device endpoints (which are files) which establish *asynchronous bidirectional communication (IPC) channel* (with two ports) between two or more processes.

One pseudo-device in the pair, *the master*, provides means by which a terminal emulator (or remote login server) process controls the slave. The other pseudo-device, *the slave*, emulates a hardware serial port device, and is used by terminal-oriented programs (such as shells) as a processes to read/write data back from/to master endpoint. A PTY is similar to a bidirectional pipe.

`Devpts` is a Linux kernel virtual file system containing pseudoterminal devices.

Linux implementation is based on System V-style terminals (commonly referred as UNIX 98 pseudoterminals) and provides POSIX and SUS API in the form of a `posix_openpt()` function since 1998.

The Windows Console was extended to have a PTY interface called ConPTY in 2018: 
https://devblogs.microsoft.com/commandline/windows-command-line-introducing-the-windows-pseudo-console-conpty/

## Applications

Roles of a terminal emulator process:
- interaction with the user
- feeding the text input to the master pseudo-device for use by the shell connected to the slave pseudo-device
- reading the text output from the master pseudo-device and showing it to users

The terminal emulator process must also handle terminal control commands (e.g. for resizing the screen).

Widely used terminal emulators include xterm, GNOME Terminal, Konsole, Terminal.

Remote login servers such as SSH and Telnet play the same role but communicate with a remote user instead of a local one.

Screen and Tmux are used to add a session context to a pseudoterminal, making for a much more robust and versatile solution. They provide *terminal persistence*, allowing the user to disconnect from one computer and later connect from another computer, continuing where they left off.

## Variants

In the BSD PTY system, the slave device file, which generally has a name of the form `/dev/tty[p-za-e][0-9a-f]`, supports all system calls applicable to text terminal devices. Thus, it supports login sessions.

The master device file, which generally has a name of the form `/dev/pty[p-za-e][0-9a-f]`, is the endpoint for communication with the terminal emulator. With this [p-za-e] naming scheme, there can be at most 256 tty pairs.

Also, finding the first free pty master can be racy unless a locking scheme is adopted. For that reason, recent BSD operating systems, such as FreeBSD, implement Unix98 PTYs.

BSD PTYs have been rendered obsolete by *Unix98 ptys* whose naming system does not limit the number of pseudo-terminals and access to which occurs without danger of race conditions. `/dev/ptmx` is the *pseudo-terminal master multiplexer*. Opening it returns a file descriptor of a master node and causes an associated slave node `/dev/pts/N` to be created.


* Containers, pseudo TTYs, and backward compatibility
https://lwn.net/Articles/688809/

## Pseudoterminal files

https://www.ibm.com/docs/en/zos/2.2.0?topic=files-pseudoterminal
Last Updated: 2021-03-22

Pseudoterminals (pseudo-TTYs) are used by users and applications to gain access to the shell. A pseudo-TTY is a pair of character special files, a master file and a corresponding slave file. The master file is used by a networking application (such as rlogin). The corresponding slave file is used by the shell or the user's process to read and write terminal data.

The convention for the names of the pseudo-TTY pair is:
- /dev/ptypNNNN for the master (major 1)
- /dev/ttypNNNN for the slave (major 2)

The NNNN is between 0000 and one less than the MAXPTYS value.

When a user logs in using rlogin or telnet to initialize a shell, the system selects an available pair of these files. The pair represents the connection. The maximum number of pairs is 10000. You can specify an appropriate number of pairs in the MAXPTYS parameter.

The default controlling terminal can be accessed through the `/dev/tty` special file.

Pseudo-TTY files are dynamically created by the system when they are first referenced.


>What is `/dev/console`?
>What is `/dev/fdN`?
