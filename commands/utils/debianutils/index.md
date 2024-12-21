Package: debianutils
Version: 5.5-1ubuntu2
Priority: required
Essential: yes
Section: utils
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Clint Adams <clint@debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 249 kB
Pre-Depends: libc6 (>= 2.34)
Breaks: ifupdown (<< 0.8.36+nmu1), printer-driver-pnm2ppa (<< 1.13-12), x11-common (<< 1:7.7+23~)
Task: minimal, server-minimal
Download-Size: 107 kB
APT-Manual-Installed: no
APT-Sources: http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages
Description: Miscellaneous utilities specific to Debian
 This package provides a number of small utilities which are used
 primarily by the installation scripts of Debian packages, although
 you may use them directly.
 .
 The specific utilities included are:
 add-shell installkernel ischroot remove-shell run-parts savelog
 tempfile update-shells which