# MirBSD Korn Shell

- name: MirBSD Korn Shell
- short: mksh
- latest version: 59c-16
- home: http://mirbsd.de/mksh

https://github.com/MirBSD/mksh
https://github.com/mirabilos/mksh

mksh is the successor of the *Public Domain Korn shell* (`pdksh`), a Bourne/POSIX compatible shell which is largely similar to the original AT&T *Korn Shell* (`ksh88`/`ksh93`).

It includes bug fixes and feature improvements, in order to produce a modern, robust shell good for interactive and especially script use.

mksh has UTF-8 support (in string operations and the Emacs editing mode). The code has been cleaned up and simplified, bugs fixed, *standards compliance* added, and several enhancements (for extended compatibility to other modern shells, as well as a couple of its own) are available.

This shell is *Debian Policy 10.4 compliant* and works as `/bin/sh` on Debian systems (use the `/bin/lksh` executable) and is a good rescue and *initrd shell* (consider the `/bin/mksh-static` executable).

The **mksh binary** is a complete, full-featured shell. It provides a "consistent across all platforms" guarantee, using 32-bit integers for arithmetics, possibly deviating from POSIX.

The **mksh-static binary** is a version of mksh, linked against klibc, musl, or dietlibc (if they exist for that Debian architecture and are usable) and optimised for small code size, for example for use on initrd or initramfs images, installation or rescue systems. Except for omitting some features to be smaller, it is similar to the mksh binary otherwise. Note that the exact featureset may differ depending on which C library was used to compile it.

The **lksh binary** is a *script runner shell* based on mksh intended to run old `ksh88` and `pdksh` scripts, but not for interactive use. When used as `/bin/sh` it follows POSIX most closely, including use of the host's "long" C data type for arithmetics. It also contains kludges so it can run as `/bin/sh` on Debian beyond what Policy dictates, to work around bugs in maintainer scripts and *LSB init scripts* shipped by many packages, such as including a rudimentary printf(1) builtin, permitting a shell function to be named stop overriding the default alias, more loose interpretation of shell extglobs, etc.

A sample `~/.mkshrc` is included in `/usr/share/doc/mksh/examples` and provided as `/etc/mkshrc` conffile, which is sourced by another file `/etc/skel/.mkshrc` users are recommended to copy into their home.
