# Linux :: Kernel

**Kernel** (a core part of an operating system) controls the resources of the computer, management of processes, communication with various hardware devices, providing an execution environment for processes to run. 

Kernel tasks
- hardware management and abstraction
  - abstracting hardware
  - communication with hardware
  - controling system resources
- memory management subsystem
  - virtual memory
  - paging
- processes
  - process management subsystem
  - process/thread creation and termination
  - execution environment
  - process (task) scheduling
  - IPC
  - IRQ handling
  - signal handling
  - system calls
  - I/O scheduler
- I/O subsystem
  - TTY subsystem
  - device drivers
  - VFS
  - file systems
  - block device drivers
  - generic block layer
  - network protocols
    - network device drivers
    - packet scheduler
- dispatcher


Kernel runs with the higest privileges and thus it can do whatever. Software outside the kernel is said to run in userspace. It is this ring of protection exactly that makes it easy to delineate what kernel is (and just state that software running in kernel mode comprises a kernel) vs non-kernel software, which is everything else (non-kernel code).

However, how can we classify that other, non-kernel software? For example, an operating system certainly doesn't coincide with "everything else" (ahem, although some OSs are so loaded they may fool you). What are some important differences between an OS and a kernel? What are the responsibilities of an OS vs those of the kernel? Despite the lack of strict definitions, some things can be inferred just by considering any Linux/GNU distribution. The Linux kernel does not deal with the boot procedure, init system, command-line shell, graphical environment, desktop environment, display system (X.org or Wayland). Everything that seems low-level or collosal but the kernel throws away, we can pick up and put in the OS bag!

Operating system's parts and tasks ∖ kernel parts and tasks = diff
- boot procedure, boot loader (GRUB, Limine, clover, rEFInd, …)
- shell (bash, zsh, …)
- init system (systemd, openrc, …)
- graphical environment, GUI, display system (X.org, Wayland)
- desktop environment (Gnome, KDE, …)
- concrete file system implementations (extX, btrfs, zfs, …)
- pakage manager (apt, yum, dfn, …)

We have to stop at some point including stuff as part of an OS, and that point should be at applications, "those programs that are more benefitial to the user then to the system". Such programs should go in the third category - user land *commodity software* (I feel good about "commodity").

And just as you watch the topics starting to form clusters as they gravitate toward Kernel vs OperatingSystem vs CommoditySoftware nodes, some evil hack reminds you about virtualization… There's always a man behind the man [behind the man]ᐩ behind the man… behind the throne.

Q: Is supervisor/hypervisor another node (software category)? Where does it fit, is it even more privileged then kernel? Does it do like parenthesis and surrounds everything else?

**Hypervisor** is a program whose purpose is control and multiplexing of hardware for other kernels. Typically runs at an even higher privileged level than a kernel, which was invented for this purpose. Allows sharing a single hardware between multiple operating systems or instances thereof. Where hypervisors differ from kernels is their interface - kernel expose a system call programming interface, such as POSIX, while the hypervisor interface (as in what the OS running as a guest observes) mainly looks as simply a "naked" CPU and hardware, with optional deviations of this principle possible for the sake of performance in the shape of para-virtualization. If we again take our example services from above, scheduling within a hypervisor is not different than in essence from a kernel (except the scheduled entities are OS virtual CPU and not singular programs) but a hypervisor will not typically expose a file system interface at all, instead exposing what looks like a raw storage device, such as disk to the guest OS it controls. A good example of a hypervisor is KVM, which is interesting in that it is a hypervisor which is built into a kernel (the kernel being Linux).

Microkernels vs hypervisors, 2008
https://microkerneldude.org/2008/04/03/microkernels-vs-hypervisors/
