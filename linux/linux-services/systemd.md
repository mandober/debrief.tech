# systemd

* systemd
https://systemd.io/

* systemd announcement
https://0pointer.de/blog/projects/systemd.html

* Materials for FOSDEM'20 talk:
Uplift your Linux systems programming skills with systemd and D-Bus
https://github.com/lvsl/fosdem-2020-go-dbus-systemd/
https://www.youtube.com/watch?v=-bEzHG2u8XA&list=TLPQMzAwODIwMjSPVmCQ3bsprg

https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/index

https://wiki.gentoo.org/wiki/Comparison_of_init_systems


"Rethinking PID 1", 2010.
systemd uses many Linux-specific features, and does not limit itself to POSIX. That unlocks a lot of functionality a system that is designed for portability to other operating systems cannot provide.



## Systemd

https://en.wikipedia.org/wiki/Systemd

systemd is a software suite that provides an array of system components for Linux. The main aim is to unify service configuration and behavior across Linux distributions. Its primary component is a "system and service manager" - an init system used to bootstrap user space and manage user processes. It also provides replacements for various daemons and utilities, including device management, login management, network connection management, and event logging.

The name systemd adheres to the Unix convention of naming daemons by appending the letter d. It also plays on the term "System D", which refers to a person's ability to adapt quickly and improvise to solve problems.

Since 2015, the majority of Linux distributions have adopted systemd, having replaced other init systems such as SysV init. It has been praised by developers and users of distributions that adopted it for providing a stable, fast out-of-the-box solution for issues that had existed in the Linux space for years.

At the time of adoption of systemd on most Linux distributions, it was the only software suite that offered reliable parallelism during boot as well as centralized management of processes, daemons, services and mount points.

Critics of systemd contend that it suffers from mission creep and bloat, the latter affecting other software (such as the GNOME desktop), adding dependencies on systemd, reducing its compatibility with other Unix-like operating systems and making it difficult for sysadmins to integrate alternative solutions. In addition, they contend that the complexity of systemd results in a larger attack surface, reducing the overall security of the platform.[14] Concerns have also been raised about Red Hat and its parent company IBM controlling the scene of init systems on Linux.[15][1]
