# UDev

https://en.wikipedia.org/wiki/Udev

udev and /dev

**udev** (userspace /dev) is a device manager for the Linux kernel.

As the successor of `devfsd` and hotplug, udev primarily manages device nodes in the `/dev` directory. At the same time, udev also handles all user space events raised when hardware devices are added into the system or removed from it, including firmware loading as required by certain devices.

Rationale
It is an operating system's kernel that is responsible for providing an abstract interface of the hardware to the rest of the software. Being a monolithic kernel, the Linux kernel does exactly that: device drivers are part of the Linux kernel, and make up more than half of its source code.[2] Hardware can be accessed through system calls or over their device nodes.

To be able to deal with peripheral devices that are hotplug-capable in a user-friendly way, a part of handling all of these hotplug-capable hardware devices was handed over from the kernel to a daemon running in user-space. Running in user space serves security and stability purposes.

Design
Device drivers are part of the Linux kernel, in which their primary functions include device discovery, detecting device state changes, and similar low-level hardware functions. After loading a device driver into memory from the kernel, detected events are sent out to the userspace daemon udevd. It is the device manager, udevd, that catches all of these events and then decides what shall happen next. For this, udevd has a very comprehensive set of configuration files, which can all be adjusted by the computer administrator, according to their needs.

In case a new storage device is connected over USB, udevd is notified by the kernel and itself notifies the udisksd-daemon. That daemon could then mount the file systems.
In case a new Ethernet cable is plugged into the Ethernet NIC, udevd is notified by the kernel and itself notifies the NetworkManager-daemon. The NetworkManager-daemon could start dhclient for that NIC, or configure according to some manual configuration.
The complexity of doing so forced application authors to re-implement hardware support logic. Some hardware devices also required privileged helper programs to prepare them for use. These often have to be invoked in ways that could be awkward to express with the Unix permissions model (for example, allowing users to join wireless networks only if they are logged into the video console). Application authors resorted to using setuid binaries or run service daemons to provide their own access control and privilege separation, potentially introducing security holes each time.[3]

HAL was created to deal with these challenges, but is now deprecated in most Linux distributions, its functionality being replaced by udevd.

Overview

Unlike traditional Unix systems, where the device nodes in the /dev directory have been a static set of files, the Linux udev device manager dynamically provides only the nodes for the devices actually present on a system. Although devfs used to provide similar functionality, Greg Kroah-Hartman cited a number of reasons[4] for preferring udev over devfs:

udev supports persistent device naming, which does not depend on, for example, the order in which the devices are plugged into the system. The default udev setup provides persistent names for storage devices. Any hard disk is recognized by its unique filesystem id, the name of the disk and the physical location on the hardware it is connected to.
udev executes entirely in user space, as opposed to devfs's kernel space. One consequence is that udev moved the naming policy out of the kernel and can run arbitrary programs to compose a name for the device from the device's properties, before the node is created; there, the whole process is also interruptible and it runs with a lower priority.
The udev, as a whole, is divided into three parts:

Library libudev that allows access to device information; it was incorporated into the systemd 183 software bundle.[5]
User space daemon udevd that manages the virtual /dev.
Administrative command-line utility udevadm for diagnostics.
The system gets calls from the kernel via netlink socket. Earlier versions used hotplug, adding a link to themselves in /etc/hotplug.d/default with this purpose.
