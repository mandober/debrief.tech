# Device file

https://en.wikipedia.org/wiki/Device_file

In Unix-like operating systems, a device file, device node, or special file is an interface to a *device driver* that appears in a file system as if it were an ordinary file.

These special files allow an application program to interact with a device by using its device driver via standard input/output system calls. Using standard system calls simplifies many programming tasks, and leads to consistent user-space I/O mechanisms regardless of device features and functions.

## Contents

- 1. Overview
- 2. Unix-like systems
  - 2.1. Character devices
  - 2.2. Block devices
  - 2.3. Pseudo-devices
  - 2.4. Node creation
  - 2.5. Naming conventions
  - 2.6. devfs
- 3. IOCS
- 4. Implementations

## Overview

Device files usually provide simple interfaces to standard devices (printers, serial ports), but can also be used to access specific unique resources on those devices, such as disk partitions. Additionally, device files are useful for accessing system resources that have no connection with any actual device, such as data sinks and random number generators.

There are two general kinds of device files in Linux:

Device special files
- character special files
- block special files

The difference between them lies in how much data is read and written by the OS and hardware. These together can be called *device special files* in contrast to *named pipes*, which are not connected to a device but are not ordinary files either.

In some Unix-like systems, most device files are managed as part of a *virtual file system* traditionally mounted at /dev, possibly associated with a controlling daemon, which monitors hardware addition and removal at run time, making corresponding changes to the device file system if that's not automatically done by the kernel, and possibly invoking scripts in system or user space to handle special device needs.

The FreeBSD, DragonFly BSD and Darwin have a dedicated file system *devfs*; device nodes are managed automatically by this file system, in kernel space.

Linux used to have a similar *devfs* implementation, but it was abandoned later, and then removed since version 2.6.17. Linux now primarily uses a user space implementation known as *udev*, but there are many variants.

In Unix systems which support chroot process isolation, such as Solaris Containers, typically each *chroot environment* needs its own /dev; these mount points will be visible on the host OS at various nodes in the global file system tree.

By restricting the device nodes populated into chroot instances of /dev, hardware isolation can be enforced by the chroot environment (a program can not meddle with hardware that it can neither see nor name - an even stronger form of access control than file system permissions).

## Unix-like systems

Device nodes correspond to resources that the kernel has already allocated. 

Unix identifies those resources by a major number and a minor number, both stored as part of the structure of a node. The assignment of these numbers occurs uniquely in different OSs and on different computer platforms.

Generally, the major number identifies the device driver and the minor number identifies a particular device (possibly out of many) that the driver controls: in this case, the system may pass the minor number to a driver. 

As with other special file types, the computer system accesses device nodes using standard system calls and treats them like regular computer files.

Two standard types of device files exist; unfortunately their names are rather counter-intuitive for historical reasons, and explanations of the difference between the two are often incorrect as a result.

### Character devices

*Character special files* or *character devices* (or raw devices) provide unbuffered, direct access to the hardware device.

They do not necessarily allow programs to read or write single characters at a time, although that is up to the device in question.

The character device for a HDD, for example, will normally require that all reads and writes be aligned to block boundaries and most certainly will not allow reading a single byte.

Character devices are sometimes known as *raw devices* to avoid the confusion surrounding the fact that a character device for a piece of block-based hardware will typically require programs to read and write aligned blocks.

### Block devices

*Block special files* or *block devices* provide buffered access to hardware devices, and provide some abstraction from their specifics.

Unlike character devices, block devices will always allow the programmer to read or write a block of any size (including single characters/bytes) and any alignment. 

The downside is that because block devices are buffered, the programmer does not know how long it will take before written data is passed from the kernel's buffers to the actual device, or indeed in what order two separate writes will arrive at the physical device. 

Additionally, if the same hardware exposes both character and block devices, there is a risk of data corruption due to clients using the character device being unaware of changes made in the buffers of the block device.

Most OSs create both block and character devices to represent hardware like HDDs, but Linux notably does not - it creates only block devices. To get the effect of a character device from a block device on Linux, one must open the device with the Linux-specific O_DIRECT flag.

### Pseudo-devices

Device nodes on Unix-like systems do not necessarily have to correspond to physical devices. Nodes that lack this correspondence are called *pseudo-devices*. They provide various functions handled by the OS. 

Some of the most commonly used (character-based) pseudo-devices include:

- `/dev/null` Discards all input; provides EOF when read
- `/dev/zero` Discards all input; produces a stream of nulls when read
- `/dev/{stdin,stdout,stderr}` Access the process's standard streams
- `/dev/fd/n` Accesses the process's file descriptor `n`
- `/dev/full` Stream of nulls when read; "disk full" error (ENOSPC) when writen
- `/dev/{,a,u}random` Produces bytes generated by kernel's cryptographically secure pseudorandom number generator. Exact behavior varies by implementation, sometimes has variants /dev/urandom or /dev/arandom.

### Node creation

Nodes are created with `mknod` system call or CLI program with the same name. Nodes can be moved or deleted by the usual filesystem system calls (rename, unlink) and commands (mv, rm).

Some Unix versions include a script named `makedev` to create all necessary devices in /dev. It only makes sense on systems whose devices are statically assigned major numbers (e.g. by means of hardcoding it in their kernel module).

Some other Unix systems such as FreeBSD use kernel-based device node management via devfs only and do not support manual node creation. mknod(2) system call and mknod(8) command exist to keep compatibility with POSIX, but manually created device nodes outside devfs will not function at all.

### Naming conventions

The following prefixes are used for the names of some devices in the `/dev` hierarchy, to identify the type of device:
- `lp`          line printers
- `pt`          pseudo-terminals
- `tty`         terminals

Additional prefixes have become common in some OSs:
- tty           terminals
  - ttyS        platform serial port driver
  - ttyUSB      USB serial converters, modems, etc.
- SCSI driver and libATA (modern PATA/SATA driver), USB, and other devices
  - sd:         mass-storage driver (block device)
    - sda:      first registered device
    - sdb:      second registered device
    - sdc:      third registered devices
  - ses:        Enclosure driver
  - sg:         generic SCSI layer
  - sr:         ROM driver (data-oriented optical drive; scd is alias)
  - st:         magnetic tape driver
- mem:          Main memory (char device)
- fb:           frame buffer
- nbd:          Network block device
- parport, pp:  parallel ports
- fd:           floppy disks
- NVMe driver
  - nvme0:      1st registered device's device controller (char device)
  - nvme0n1:    1st registered device's 1st namespace (block device)
  - nvme0n1p1:  1st registered device's 1st namespace 1st partition (blk dev)
- hd:           classical IDE driver (previously used for ATA HDDs)
  - hda:        master on first ATA channel (id'ed by major 3, minor 0)
  - hdb:        slave device on first ATA channel
  - hdc:        master device on second ATA channel
  - hdd:        slave device on second ATA channel
- MMC driver
  - mmcblk:     storage driver for MMC media (SD cards, eMMC chips, …)
  - mmcblk0:    first registered device
  - mmcblk0p1:  first registered device, first partition


The canonical list of the prefixes used in Linux can be found in the *Linux Device List*, the official registry of allocated device numbers and /dev directory nodes: https://web.archive.org/web/20160424173724/https://www.kernel.org/doc/Documentation/devices.txt

For most devices, this prefix is followed by a number uniquely identifying the particular device. For hard drives, a letter is used to identify devices and is followed by a number to identify partitions. Thus a file system may "know" an area on a disk as /dev/sda3, for example, or "see" a networked terminal session as associated with /dev/pts/14.

On disks using the typical PC master boot record, the device numbers of primary and the optional extended partition are numbered 1 through 4, while the indexes of any logical partitions are 5 and onwards, regardless of the layout of the former partitions (their parent extended partition does not need to be the fourth partition on the disk, nor do all four primary partitions have to exist).

Device names are usually not portable between different system variants, e.g. on some BSD systems, IDE devices are named /dev/wd0, /dev/wd1, etc.

### devfs

devfs is a specific implementation of a device file system on Unix-like OSs, used for presenting device files. The underlying mechanism of implementation may vary, depending on the OS.

Maintaining these special files on a physically-implemented file system such as a hard drive is inconvenient, and as it needs kernel assistance anyway, the idea arose of a special-purpose logical file system that is not physically stored.

Defining when devices are ready to appear is not trivial. The devfs approach is for the device driver to request creation and deletion of devfs entries related to the devices it enables and disables.
