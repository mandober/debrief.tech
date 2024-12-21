# Special-Purpose Filesystems

https://en.wikipedia.org/wiki/Synthetic_file_system
https://en.wikipedia.org/wiki/Virtual_file_system

Not all filesystems represent storage on physical media. Most versions of Unix have filesystems that serve as system interfaces. That is, rather than serving only as a means to store data on a device, a filesystem can represent system information, such as process IDs and kernel diagnostics. This idea goes back to the /dev mechanism, which is an early model of using files for I/O interfaces.

- bpffs
- configfs
- devfs
- devpts
- debugfs
- FUSE
- hugetlbfs
- pipefs
- procfs
- securityfs
- sockfs
- sysfs
- tmpfs
- udev (systemd)
- Kmscon

## kernfs
In the Linux kernel, kernfs is a set of functions that contain the functionality required for creating the *pseudo file systems* used internally by various kernel subsystems so that they may use virtual files. For example, sysfs provides a set of virtual files by exporting information about hardware devices and associated device drivers from the kernel's device model to user space.

## procfs
Mounted on `/proc`. The name "proc" is an abbreviation for process. Each numbered directory inside /proc refers to the ID of a current process on the system; the files in each directory represent various aspects of that process. The directory `/proc/self` represents the current process. The Linux proc filesystem includes a great deal of additional kernel and hardware information in files like `/proc/cpuinfo`. Keep in mind that the kernel design guidelines recommend moving information unrelated to processes out of /proc into `/sys`, so system information in /proc might not be the most current interface.

The `/proc` idea came from the 8th edition of research Unix, implemented by Tom J. Killian and accelerated when Bell Labs (including many of the original Unix designers) created Plan 9 - a research OS that took filesystem abstraction to a whole new level.

The proc filesystem (procfs) is a special filesystem that presents information about processes and other system information in a hierarchical file-like structure, providing a more convenient and standardized method for dynamically accessing process data held in the kernel than traditional tracing methods or direct access to kernel memory. Typically, it is mapped to a mount point named `/proc` at boot time.

## sysfs
Mounted on `/sys`

## initramfs
initrd (initial ramdisk) is a scheme for loading a temporary root file system into memory, to be used as part of the Linux startup process. initrd and initramfs (from INITial RAM File System) refer to two different methods of achieving this. Both are commonly used to make preparations before the real root file system can be mounted.

## tmpfs
Mounted on `/run` and other locations. With tmpfs, you can use your physical memory and swap space as temporary storage. You can mount tmpfs where you like, using the `size` and `nr_blocks` long options to control the maximum size. However, be careful not to pour things constantly into a tmpfs location, because your system will eventually run out of memory and programs will start to crash.

tmpfs (short for Temporary File System) is a temporary file storage paradigm. It is intended to appear as a mounted file system, but data is stored in volatile memory instead of a persistent storage device. A similar construction is a RAM disk, which appears as a virtual disk drive and hosts a disk file system.

## squashfs
A type of read-only filesystem where content is stored in a compressed format and extracted on demand through a loopback device. One example use is in the snap package management system that mounts packages under the /snap directory.

## overlayfs
A filesystem that merges directories into a composite. Containers often use overlay filesystems.

## devpts
is a virtual filesystem directory available in the Linux kernel since version 2.1.93 (April 1998). It is normally mounted at `/dev/pts` and contains solely devices files which represent slaves to the multiplexing master located at `/dev/ptmx` which in turn is used to implement terminal emulators.

## configfs
is a RAM-based virtual file system provided by the 2.6 Linux kernel.

## debugfs
debugfs is a special file system available in the Linux kernel since version 2.6.10-rc3. It was written by Greg Kroah-Hartman.

## FUSE
Filesystem in Userspace (FUSE) is a software interface for Unix and Unix-like computer operating systems that lets non-privileged users create their own file systems without editing kernel code. This is achieved by running file system code in user space while the FUSE module provides only a bridge to the actual kernel interfaces.
