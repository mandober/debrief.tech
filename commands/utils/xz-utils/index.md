# XZ Utils
https://tukaani.org/xz/
https://github.com/tukaani-project/xz

XZ Utils consist of several components:
- `liblzma` is a compression library with an API similar to that of zlib.
- `xz` is a command line tool with syntax similar to that of gzip.
- `xzdec` is a decompression-only tool smaller than the full-featured xz tool.
- A set of shell scripts (`xzgrep`, `xzdiff`, etc.) have been adapted from gzip to ease viewing, grepping, and comparing compressed files.

Man pages with keyword indexes:
- xz(1)
- xzgrep(1)
- xzdiff(1)
- xzcmp(1)
- xzless(1)
- xzmore(1)
- xzdec(1)
- lzmainfo(1)


## xz-utils

Package: xz-utils
Version: 5.2.5-2ubuntu1
Priority: standard
Build-Essential: yes
Section: utils
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Jonathan Nieder <jrnieder@gmail.com>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 381 kB
Provides: lzma
Depends: libc6 (>= 2.34), liblzma5 (>= 5.2.2)
Conflicts: lzma (<< 9.22-1), xz-lzma
Breaks: lzip (<< 1.8~rc2)
Replaces: lzip (<< 1.8~rc2), xz-lzma
Homepage: https://tukaani.org/xz/
Task: standard, server-minimal
Download-Size: 84.8 kB
APT-Manual-Installed: no
APT-Sources: http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages

Description: XZ-format compression utilities

XZ is the successor to the Lempel-Ziv/Markov-chain Algorithm
compression format, which provides memory-hungry but powerful
compression (often better than bzip2) and fast, easy decompression.

This package provides the command line tools for working with XZ
compression, including xz, unxz, xzcat, xzgrep, and so on. They can
also handle the older LZMA format, and if invoked via appropriate
symlinks will emulate the behavior of the commands in the lzma
package.

The XZ format is similar to the older LZMA format but includes some improvements for general use:
* 'file' magic for detecting XZ files;
* crc64 data integrity check;
* limited random-access reading support;
* improved support for multithreading (not used in xz-utils);
* support for flushing the encoder.
