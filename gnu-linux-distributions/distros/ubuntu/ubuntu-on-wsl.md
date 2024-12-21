# Ubuntu on WSL


- ubuntu-keyring              /jammy 2021.03.26
- ubuntu-mono                 /jammy 20.10-0ubuntu2
- ubuntu-advantage-tools      /jammy-updates 34~22.04
- ubuntu-pro-client           /jammy-updates 34~22.04
- ubuntu-pro-client-l10n      /jammy-updates 34~22.04
- ubuntu-release-upgrader-core/jammy-updates 1:22.04.20

- ubuntu-minimal  1.481.4
- ubuntu-standard 1.481.4
- ubuntu-wsl      1.481.4
- wsl-setup       0.5.4


wsl-setup/jammy-updates 0.5.4~22.04 - WSL integration setup
ubuntu-wsl Ubuntu on Windows tools - WSL integration
wslu/jammy 3.2.3-0ubuntu3 - Collection of utilities for the Windows 10 WSL



## ubuntu-minimal
- Package: ubuntu-minimal
- Version: 1.481
- Priority: important
- Section: metapackages
- Source: ubuntu-meta
- Origin: Ubuntu
- Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
- Bugs: https://bugs.launchpad.net/ubuntu/+filebug
- Installed-Size: 54.3 kB
- Task: minimal
- Download-Size: 2866 B
- APT-Sources: http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages

- *Depends*:
   - adduser
   - apt
   - apt-utils
   - console-setup
   - debconf
   - debconf-i18n
   - e2fsprogs
   - eject
   - init
   - iproute2
   - iputils-ping
   - isc-dhcp-client
   - kbd
   - kmod
   - less
   - locales
   - lsb-release
   - mawk
   - mount
   - netbase
   - netcat-openbsd
   - netplan.io
   - passwd
   - procps
   - python3
   - sensible-utils
   - sudo
   - tzdata
   - ubuntu-advantage-tools
   - ubuntu-keyring
   - udev
   - vim-tiny
   - whiptail
- *Recommends*:
  - rsyslog
  - usrmerge
- *Description*: Minimal core of Ubuntu
This package depends on all of the packages in the Ubuntu minimal system, that is a functional command-line system with the following capabilities:
- Boot
- Detect hardware
- Connect to a network
- Install packages
- Perform basic diagnostics

It is also used to help ensure proper upgrades, so it is recommended that it not be removed.

## ubuntu-standard
- Package: ubuntu-standard
- Version: 1.481
- Priority: standard
- Section: metapackages
- Source: ubuntu-meta
- Origin: Ubuntu
- Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
- Bugs: https://bugs.launchpad.net/ubuntu/+filebug
- Installed-Size: 54.3 kB
- Task: standard
- Download-Size: 2886 B
- APT-Sources: http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages

- *Depends*:
  - bind9-dnsutils
  - busybox-static
  - cpio
  - cron
  - dmidecode
  - dosfstools
  - ed
  - file
  - ftp
  - hdparm
  - info
  - libpam-systemd
  - logrotate
  - lshw
  - lsof
  - man-db
  - media-types
  - nftables
  - parted
  - pciutils
  - psmisc
  - rsync
  - strace
  - time
  - usbutils
  - wget
  - xz-utils
- *Recommends*:
  - apparmor
  - bash-completion
  - command-not-found
  - friendly-recovery
  - iptables
  - iputils-tracepath
  - irqbalance
  - manpages
  - mtr-tiny
  - nano
  - ntfs-3g
  - openssh-client
  - plymouth
  - plymouth-theme-ubuntu-text
  - tcpdump
  - telnet
  - ufw
  - update-manager-core
  - uuid-runtime
- *Description*: The Ubuntu standard system
This package depends on all of the packages in the *Ubuntu standard system*. This set of packages provides a comfortable command-line Unix-like environment. It is also used to help ensure proper upgrades, so it is recommended that it not be removed.

## ubuntu-wsl
- Package: ubuntu-wsl
- Version: 1.481
- Priority: optional
- Section: metapackages
- Source: ubuntu-meta
- Origin: Ubuntu
- Bugs: https://bugs.launchpad.net/ubuntu/+filebug
- APT-Sources: http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages
- Installed-Size: 54.3 kB
- Task: ubuntu-wsl
- Download-Size: 2718 B

- *Depends*:
  - apport
  - binutils
  - byobu
  - curl
  - dirmngr
  - fonts-ubuntu
  - git
  - gnupg
  - htop
  - patch
  - screen
  - software-properties-common
  - tmux
  - vim
  - wsl-setup
- *Recommends*:
  - dbus-x11
  - motd-news-config
  - show-motd
  - snapd
  - unattended-upgrades
- *Description*: Ubuntu on Windows tools - WSL integration.

Utilities for integrating Ubuntu well into the WSL environment. It is also used to help ensure proper upgrades, so it is recommended that it not be removed.

## wsl-setup

Package: ubuntu-minimal
Version: 1.481.4
Priority: important
Section: metapackages
Source: ubuntu-meta
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 54.3 kB
Task: minimal
Phased-Update-Percentage: 10
Download-Size: 2928 B
APT-Sources: http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages

Depends: adduser, apt, apt-utils, console-setup, debconf, debconf-i18n, e2fsprogs, eject, init, iproute2, iputils-ping, isc-dhcp-client, kbd, kmod, less, locales, lsb-release, mawk, mount, netbase, netcat-openbsd, netplan.io, passwd, procps, python3, sensible-utils, sudo, tzdata, ubuntu-advantage-tools, ubuntu-keyring, udev, vim-tiny, whiptail

Recommends: rsyslog, usrmerge

Description: *Minimal core of Ubuntu*

This package depends on all of the packages in the Ubuntu minimal system,
that is a functional command-line system with the following capabilities:
- Boot
- Detect hardware
- Connect to a network
- Install packages
- Perform basic diagnostics

It is also used to help ensure proper upgrades, so it is recommended that
it not be removed.

### ubuntu-minimal
Package: ubuntu-minimal
Version: 1.481.3
Status: install ok installed
Priority: important
Section: metapackages
Source: ubuntu-meta
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Installed-Size: 54.3 kB
Download-Size: unknown
APT-Manual-Installed: yes
APT-Sources: /var/lib/dpkg/status

Depends: adduser, apt, apt-utils, console-setup, debconf, debconf-i18n, e2fsprogs, eject, init, iproute2, iputils-ping, isc-dhcp-client, kbd, kmod, less, locales, lsb-release, mawk, mount, netbase, netcat-openbsd, netplan.io, passwd, procps, python3, sensible-utils, sudo, tzdata, ubuntu-advantage-tools, ubuntu-keyring, udev, vim-tiny, whiptail

Recommends: rsyslog, usrmerge

Description: Minimal core of Ubuntu

This package depends on all of the packages in the Ubuntu minimal system,
that is a functional command-line system with the following capabilities:

- Boot
- Detect hardware
- Connect to a network
- Install packages
- Perform basic diagnostics

It is also used to help ensure proper upgrades, so it is recommended that
it not be removed.

### Package: ubuntu-minimal
Package: ubuntu-minimal
Version: 1.481
Priority: important
Section: metapackages
Source: ubuntu-meta
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 54.3 kB

Depends: adduser, apt, apt-utils, console-setup, debconf, debconf-i18n, e2fsprogs, eject, init, iproute2, iputils-ping, isc-dhcp-client, kbd, kmod, less, locales, lsb-release, mawk, mount, netbase, netcat-openbsd, netplan.io, passwd, procps, python3, sensible-utils, sudo, tzdata, ubuntu-advantage-tools, ubuntu-keyring, udev, vim-tiny, whiptail

Recommends: rsyslog, usrmerge

Task: minimal
Download-Size: 2866 B
APT-Sources: http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages
Description: Minimal core of Ubuntu

This package depends on all of the packages in the Ubuntu minimal system,
that is a functional command-line system with the following capabilities:

- Boot
- Detect hardware
- Connect to a network
- Install packages
- Perform basic diagnostics

It is also used to help ensure proper upgrades, so it is recommended that
it not be removed.

### Package: ubuntu-standard
Package: ubuntu-standard
Version: 1.481.4
Priority: standard
Section: metapackages
Source: ubuntu-meta
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 54.3 kB

Depends: bind9-dnsutils, busybox-static, cpio, cron, dmidecode, dosfstools, ed, file, ftp, hdparm, info, libpam-systemd, logrotate, lshw, lsof, man-db, media-types, nftables, parted, pciutils, psmisc, rsync, strace, time, usbutils, wget, xz-utils

Recommends: apparmor, bash-completion, command-not-found, friendly-recovery, iptables, iputils-tracepath, irqbalance, manpages, mtr-tiny, nano, ntfs-3g, openssh-client, plymouth, plymouth-theme-ubuntu-text, tcpdump, telnet, ufw, update-manager-core, uuid-runtime

Task: standard
Phased-Update-Percentage: 10
Download-Size: 2948 B
APT-Sources: http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages

Description: The Ubuntu standard system

This package depends on all of the packages in the Ubuntu standard system.
This set of packages provides a comfortable command-line Unix-like
environment.

It is also used to help ensure proper upgrades, so it is recommended that
it not be removed.

### Package: ubuntu-standard
Package: ubuntu-standard
Version: 1.481.3
Status: install ok installed
Priority: optional
Section: metapackages
Source: ubuntu-meta
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Installed-Size: 54.3 kB

Depends: bind9-dnsutils, busybox-static, cpio, cron, dmidecode, dosfstools, ed, file, ftp, hdparm, info, libpam-systemd, logrotate, lshw, lsof, man-db, media-types, nftables, parted, pciutils, psmisc, rsync, strace, time, usbutils, wget, xz-utils

Recommends: apparmor, bash-completion, command-not-found, friendly-recovery, iptables, iputils-tracepath, irqbalance, manpages, mtr-tiny, nano, ntfs-3g, openssh-client, plymouth, plymouth-theme-ubuntu-text, tcpdump, telnet, ufw, update-manager-core, uuid-runtime

Download-Size: unknown
APT-Manual-Installed: yes
APT-Sources: /var/lib/dpkg/status
Description: The Ubuntu standard system
This package depends on all of the packages in the Ubuntu standard system.
This set of packages provides a comfortable command-line Unix-like
environment.

It is also used to help ensure proper upgrades, so it is recommended that
it not be removed.

### Package: ubuntu-standard
Package: ubuntu-standard
Version: 1.481
Priority: standard
Section: metapackages
Source: ubuntu-meta
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 54.3 kB
Task: standard
Download-Size: 2886 B
APT-Sources: http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages

Depends: bind9-dnsutils, busybox-static, cpio, cron, dmidecode, dosfstools, ed, file, ftp, hdparm, info, libpam-systemd, logrotate, lshw, lsof, man-db, media-types, nftables, parted, pciutils, psmisc, rsync, strace, time, usbutils, wget, xz-utils

Recommends: apparmor, bash-completion, command-not-found, friendly-recovery, iptables, iputils-tracepath, irqbalance, manpages, mtr-tiny, nano, ntfs-3g, openssh-client, plymouth, plymouth-theme-ubuntu-text, tcpdump, telnet, ufw, update-manager-core, uuid-runtime

Description: The Ubuntu standard system

This package depends on all of the packages in the Ubuntu standard system.
This set of packages provides a comfortable command-line Unix-like
environment.

It is also used to help ensure proper upgrades, so it is recommended that
it not be removed.

### Package: ubuntu-wsl
Package: ubuntu-wsl
Version: 1.481.4
Priority: optional
Section: metapackages
Source: ubuntu-meta
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 54.3 kB
Task: ubuntu-wsl
Phased-Update-Percentage: 10
Download-Size: 2876 B
APT-Sources: http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages

Depends: apport, binutils, byobu, curl, dbus-x11, dirmngr, ed, file, git, gnupg, info, libegl1, libgl1, libgtk-3-0, libpam-systemd, lsof, man-db, media-types, patch, psmisc, rsync, software-properties-common, time, vim, wget, wsl-setup

Recommends: apparmor, bash-completion, cloud-init, command-not-found, fonts-ubuntu, landscape-client, manpages, motd-news-config, nano, openssh-client, show-motd, snapd, unattended-upgrades, update-manager-core

Description: Ubuntu on Windows tools - Windows Subsystem for Linux integration

Utilities for integrating Ubuntu well into the WSL environment.

It is also used to help ensure proper upgrades, so it is recommended that
it not be removed.

### Package: ubuntu-wsl
Package: ubuntu-wsl
Version: 1.481.3
Status: install ok installed
Priority: optional
Section: metapackages
Source: ubuntu-meta
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Installed-Size: 54.3 kB
Download-Size: unknown
APT-Manual-Installed: yes
APT-Sources: /var/lib/dpkg/status

Depends: apport, binutils, byobu, curl, dirmngr, fonts-ubuntu, git, gnupg, htop, patch, screen, software-properties-common, tmux, vim, wsl-setup

Recommends: dbus-x11, motd-news-config, show-motd, snapd, unattended-upgrades

Description: Ubuntu on Windows tools - Windows Subsystem for Linux integration

Utilities for integrating Ubuntu well into the WSL environment. It is also used to help ensure proper upgrades, so it is recommended that it not be removed.

### Package: ubuntu-wsl
- Package: ubuntu-wsl
- Version: 1.481
- Priority: optional
- Section: metapackages
- Source: ubuntu-meta
- Origin: Ubuntu
- Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
- Bugs: https://bugs.launchpad.net/ubuntu/+filebug
- APT-Sources: http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages
- Installed-Size: 54.3 kB
- Task: ubuntu-wsl
- Download-Size: 2718 B

- Depends: apport, binutils, byobu, curl, dirmngr, fonts-ubuntu, git, gnupg, htop, patch, screen, software-properties-common, tmux, vim, wsl-setup

- Recommends: dbus-x11, motd-news-config, show-motd, snapd, unattended-upgrades

- Description: Ubuntu on Windows tools - Windows Subsystem for Linux integration

Utilities for integrating Ubuntu well into the WSL environment.
It is also used to help ensure proper upgrades, so it is recommended that
it not be removed.

### wsl-setup
- Package: wsl-setup
- Version: 0.5.4~22.04
- Priority: optional
- Section: admin
- Origin: Ubuntu
- Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
- Bugs: https://bugs.launchpad.net/ubuntu/+filebug
- APT-Sources: http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages
- Installed-Size: 25.6 kB
- Task: ubuntu-wsl
- Phased-Update-Percentage: 10
- Download-Size: 4034 B
- APT-Manual-Installed: no
- Homepage: https://github.com/ubuntu/wsl-setup

Description: WSL integration setup

This package helps setting up a working WSL environment with systemd enabled by default.

### wsl-setup
- Package: wsl-setup
- Version: 0.2
- Priority: optional
- Section: admin
- Origin: Ubuntu
- Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
- Bugs: https://bugs.launchpad.net/ubuntu/+filebug
- APT-Sources: http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages
- Installed-Size: 28.7 kB
- Task: ubuntu-wsl
- Download-Size: 7700 B
- Homepage: https://github.com/ubuntu/wsl-setup

Depends: libc6 (>= 2.34), libsystemd0 (>= 221)

Description: WSL setup snap launcher

This package helps setting up a mock snap environment on WSL to start the *ubuntu-desktop-installer* in *system_setup mode*. It will be deprecated once snap is supported on WSL.
