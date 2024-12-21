# util-linux

https://en.wikipedia.org/wiki/Util-linux

- v2.40.2 (2024-07-04)

* util-linux is a random collection of Linux utilities
https://github.com/util-linux/util-linux
Note: for the years 2006-2010 this project was named "util-linux-ng"

https://karelzak.blogspot.com/
https://www.kernel.org/pub/linux/utils/util-linux/
https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/
https://lore.kernel.org/util-linux/
https://lore.kernel.org/util-linux/topics_new.html
http://vger.kernel.org/vger-lists.html#util-linux

util-linux is a standard package distributed by the Linux Kernel Organization for use as part of the Linux operating system. A fork, util-linux-ng (with ng meaning "next generation"), was created when development stalled, but as of January 2011 has been renamed back to util-linux, and is the official version of the package.

## index (118 utilities)

addpart
blkdiscard
blkid
blkzone
blockdev
cal
cfdisk
chcpu
chfn
chmem
choom
chrt
chsh
col
colcrt
colrm
column
coresched
ctrlaltdel
delpart
dmesg
eject
enosys
exch
fadvise
fallocate
fdformat
fdisk
fincore
findfs
findmnt
flock
fsck
fsck.cramfs
fsck.minix
fsfreeze
fstrim
getopt
hardlink
hexdump
hwclock
ionice
ipcmk
ipcrm
ipcs
irqtop
isosize
last
lastlog2
ldattach
logger
look
losetup
lsblk
lsclocks
lscpu
lsipc
lsirq
lslocks
lslogins
lsmem
lsns
mcookie
mesg
mkfs
mkfs.bfs
mkfs.cramfs
mkfs.minix
mkswap
more
mount
mountpoint
namei
newgrp
nsenter
partx
pg
pipesz
pivot_root
prlimit
raw
readprofile
rename
renice
resizepart
rev
rfkill
rtcwake
script
scriptlive
scriptreplay
setarch
setpgid
setpriv
setsid
setterm
sfdisk
su
swaplabel
swapoff
swapon
taskset
tunelp
uclampset
ul
umount
unshare
utmpdump
uuidd
uuidgen
uuidparse
waitpid
wall
wdctl
whereis
wipefs
write
zramctl



## util-linux v2.40.2 Release Notes

### Changes between v2.40.1 and v2.40.2

autotools:
   - Properly order install dependencies of pam_lastlog2  [Thomas Weißschuh]
   - make pam install path configurable  [Thomas Weißschuh]
bash-completion:
   - add logger --sd-* completions  [Ville Skyttä]
build-sys:
   - _PATH_VENDORDIR workaround  [Karel Zak]
cfdisk:
   - fix possible integer overflow [coverity scan]  [Karel Zak]
docs:
   - update AUTHORS file  [Karel Zak]
include/pidfd-utils:
   - provide ENOSYS stubs if pidfd functions are missing  [Thomas Weißschuh]
   - remove hardcoded syscall fallback  [Karel Zak]
lib/buffer:
   - introduce ul_buffer_get_string()  [Thomas Weißschuh]
lib/fileutils:
   - add ul_basename()  [Karel Zak]
lib/path:
   - Fix ul_path_read_buffer() [Daan De Meyer]
lib/sysfs:
   - abort device hierarchy walk at root of sysfs  [Thomas Weißschuh]
   - zero-terminate result of sysfs_blkdev_get_devchain()  [Thomas Weißschuh]
libmount:
   - fix syscall save function  [Karel Zak]
   - fix tree FD usage in subdir hook  [Karel Zak]
   - improving robustness in reading kernel messages  [Karel Zak]
   - add pidfs to pseudo fs list  [Mike Yuan]
libsmartcols:
   - fix reduction stages use  [Karel Zak]
   - ensure filter-scanner/paser.c file is newer than the .h file  [Chen Qi]
libuuid:
   - clear uuidd cache on fork()  [Thomas Weißschuh]
   - drop check for HAVE_TLS  [Thomas Weißschuh]
   - drop duplicate assignment liuuid_la_LDFLAGS  [Karel Zak]
   - split uuidd cache into dedicated struct  [Thomas Weißschuh]
   - Conditionally add uuid_time64 to sym. version map [Nicholas Vinson]
lscpu:
   - New Arm Cortex part numbers  [Jeremy Linton]
lsfd:
   - Refactor the pidfd logic into lsfd-pidfd.c  [Xi Ruoyao]
   - Support pidfs  [Xi Ruoyao]
   - test  Adapt test cases for pidfs  [Xi Ruoyao]
meson:
   - Correctly require the Python.h header for the python dependency  [Jordan Williams]
   - Fix build-python option  [Jordan Williams]
   - Only require Python module when building pylibmount  [Jordan Williams]
misc-utils:
   - uuidd  Use ul_sig_err instead of errx  [Cristian Rodríguez]
mkswap.8.adoc:
   - update note regarding swapfile creation  [Mike Yuan]
po:
   - merge changes  [Karel Zak]
   - update es.po (from translationproject.org)  [Antonio Ceballos Roa]
   - update ja.po (from translationproject.org)  [Hideki Yoshida]
po-man:
   - merge changes  [Karel Zak]
rename:
   - use ul_basename()  [Karel Zak]
sys-utils/setpgid:
   - make -f work  [Emanuele Torre]
wdctl:
   - always query device node when sysfs is unavailable  [Thomas Weißschuh]
