# initramfs

https://en.wikipedia.org/wiki/Initial_ramdisk

In Linux, `initrd` (initial ramdisk) is a scheme for loading a temporary root file system into memory, to be used as part of the Linux startup process.

`initrd` and `initramfs` (from INITial RAM File System) refer to two different methods of achieving this. Both are commonly used to make preparations before the real root file system can be mounted.


Other documentation
http://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge
https://fedoraproject.org/wiki/Features/UsrMove
http://lists.busybox.net/pipermail/busybox/2010-December/074114.html



## tiny-initramfs

https://github.com/chris-se/tiny-initramfs

This is a very minimalistic `initramfs` implementation for booting Linux systems. It has nearly no features, but is very small and very fast. It is written purely in C, but uses only parts of the standard library.

There are 3 primary use cases:
- It is designed for systems where an initramfs is typically not necessary (block device drivers + root file system compiled into the kernel, no separate `/usr` file system), but where an initramfs is required for microcode upgrades. Instead of having to use a full initramfs, which is larger (more time spent in the boot loader loading it) and slower (because it does more), tiny-initramfs will add next to no overhead.
- In cases where UUID-based boot is wanted not a full initramfs.
- In systems with a *split /usr file system*, it is necessary to mount that in the initramfs already, else subtle problems may occur. If `/usr` resides on a simple block device already known to the kernel (without user space helpers such as *udev*), tiny-initramfs provides a mechanism with very little overhead to mount it before the system is started.


http://www.musl-libc.org/
http://www.fefe.de/dietlibc/
