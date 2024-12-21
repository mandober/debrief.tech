# Linux :: Filesystems

https://www.kernel.org/doc/Documentation/filesystems/

https://en.wikipedia.org/wiki/File_systems
https://en.wikipedia.org/wiki/Comparison_of_file_systems

Types of file systems
- Journaling file systems
- FUSE-based file systems
- Stackable file systems
- Read-only file systems
- Clustered file systems
- Shared-disk file system
- Distributed file system
- parallel file system
- read-only file system
log-structured file system
copy-on-write (COW) file system for Linux-based OSs

9p afs autofs binfmt_misc ceph cgroup cgroup2 cifs coda configfs curlftpfs debugfs devfs devpts devtmpfs ecryptfs ftpfs fuse.ceph fuse.cryfs fuse.encfs fuse.glusterfs fuse.gvfsd-fuse fuse.mfs fuse.rclone fuse.rozofs fuse.snapfuse fuse.sshfs fusectl fusesmb hugetlbfs iso9660 lustre lustre_lite mfs mqueue ncpfs nfs nfs4 ntfs ocfs ocfs2 overlay proc pstore ramfs rootfs rpc_pipefs securityfs shfs smbfs sysfs tmpfs tracefs udev udf usbfs

## Linux filesystem types

ext               standard data storage
ext2              standard data storage
ext3              standard data storage
ext4              standard data storage

9p                remote
afs
autofs            special
binfmt_misc       special
bcachefs
ceph
cephfs            distributed
cgroup            special
cgroup2           special
cifs
coda
configfs          special
curlftpfs         remote
debugfs           special
devfs             special
devpts            special
devtmpfs          special
ecryptfs          special
ftpfs             remote
fuse.ceph         FUSE
fuse.cryfs        FUSE
fuse.encfs        FUSE
fuse.glusterfs    FUSE, distributed
fuse.gvfsd-fuse   FUSE
fuse.mfs          FUSE
fuse.rclone       FUSE
fuse.rozofs       FUSE
fuse.snapfuse     FUSE
fuse.sshfs        FUSE, remote
fusectl           FUSE
fusesmb           FUSE, remote
hugetlbfs
iso9660           CD
lustre
lustre_lite
mfs
mqueue        special
ncpfs         remote (Novell networks)
nfs           remote
nfs4          remote
ntfs          Windows
ocfs
ocfs2
overlay       special
proc          special
pstore
ramfs         special
rootfs        special
rpc_pipefs    special, remote
securityfs    special
shfs          special
smbfs         remote
sysfs         special
tmpfs         special
tracefs       special
udev          special
udf           CD
usbfs         USB


-------


File system       | Creator                   | Year | Original OS
------------------|---------------------------|------|-------------------------
EROFS             | Huawei                    | 2018 | Android
BlueStore/Cephfs  | Red Hat                   | 2017 | Linux
HAMMER2           | Matthew Dillon            | 2017 | DragonFly BSD 5.0
NOVA              | UC, San Diego             | 2017 | Linux
APFS              | Apple                     | 2016 | Mac HighSierra, iOS 10.3
bcachefs          | Kent Overstreet           | 2015 | Linux
F2FS              | Samsung Electronics       | 2012 | Linux
ReFS              | Microsoft                 | 2012 | Windows Server 2012
CHFS              | University of Szeged      | 2011 | NetBSD 6.0+
OrangeFS          | Omnibond and others       | 2011 | Linux
VMFS5             | VMware                    | 2011 | vSphere 5.0+
CASL              | Nimble Storage            | 2010 | Linux
LSFS              | StarWind Software         | 2009 | Linux, FreeBSD, Windows
UniFS             | Nasuni                    | 2009 | Cloud
HAMMER            | Matthew Dillon            | 2008 | DragonFly BSD 2.0
JXFS              | Hyperion Entertainment    | 2008 | AmigaOS 4.1
Btrfs             | Chris Mason               | 2007 | Linux
exFAT             | Microsoft                 | 2006 | Windows CE 6.0
ext4              | various                   | 2006 | Linux
GFS2              | Red Hat                   | 2006 | Linux
BeeGFS            | Fraunhofer/ ThinkParQ     | 2005 | Linux
GlusterFS         | Gluster Inc.              | 2005 | Linux
Minix V3 FS       | Andrew S. Tanenbaum       | 2005 | MINIX 3
NILFS             | NTT                       | 2005 | Linux
OCFS2             | Oracle Corporation        | 2005 | Linux
VMFS3             | VMware                    | 2005 | VMware ESX Server 3.0
Non-Volatile FS   | Palm, Inc.                | 2004 | Palm OS Garnet
Reiser4           | Namesys                   | 2004 | Linux
ZFS               | Sun Microsystems          | 2004 | Solaris
Fossil            | Bell Labs                 | 2003 | Plan 9 v4
Google FS         | Google                    | 2003 | Linux
FATX              | Microsoft                 | 2002 | Xbox
Lustre            | Cluster File Systems      | 2002 | Linux
OCFS              | Oracle Corporation        | 2002 | Linux
SquashFS          | P. Lougher, R.Lougher     | 2002 | Linux
UFS2              | Kirk McKusick             | 2002 | FreeBSD 5.0
VMFS2             | VMware                    | 2002 | VMware ESX Server 2.0
ReiserFS          | Namesys                   | 2001 | Linux
zFS               | IBM                       | 2001 | z/OS backport to OS/390
GFS               | Sistina (Red Hat)         | 2000 | Linux
ext3              | Stephen Tweedie           | 1999 | Linux
ISO 9660:1999     | Ecma International, ISO   | 1999 | Win,Linux,Mac,BSD,Amiga
JFS               | IBM                       | 1999 | OS/2 Warp Server
HFS Plus          | Apple                     | 1998 | Mac OS 8.1
NSS               | Novell                    | 1998 | NetWare 5
ODS-5             | DEC                       | 1998 | OpenVMS V7.2
PS FS             | PolyServe                 | 1998 | Windows, Linux
WAFL              | NetApp                    | 1998 | Data ONTAP
Minix V2 FS       | Andrew S. Tanenbaum       | 1997 | MINIX 2.0
Be File System    | Be Inc.                   | 1996 | BeOS
FAT32, FAT32X     | Microsoft                 | 1996 | MS-DOS7.10,Windows95OSR2
GPFS              | IBM                       | 1996 | AIX, Linux
QFS               | Sun Microsystems          | 1996 | Solaris
FAT16X            | Microsoft                 | 1995 | MS-DOS 7.0, Windows 95
Joliet ("CDFS")   | Microsoft                 | 1995 | Win,Linux,Mac,BSD
UDF               | ISO/ECMA/OSTA             | 1995 | -
HFS               | IBM                       | 1994 | MVS/ESA (now z/OS)
UFS1              | Kirk McKusick             | 1994 | 4.4BSD
XFS               | SGI                       | 1994 | IRIX
AdvFS             | DEC                       | 1993 | Digital Unix
ext2              | Rémy Card                 | 1993 | Linux, Hurd
LFS               | Margo Seltzer             | 1993 | Berkeley Sprite
NTFS              | Microsoft                 | 1993 | Windows NT 3.1
Xiafs             | Q. Frank Xia              | 1993 | Linux
ext               | Rémy Card                 | 1992 | Linux
VxFS              | VERITAS                   | 1991 | SVR4.0
JFS1              | IBM                       | 1990 | AIX
Rock Ridge        | IEEE                      | 1990 | Unix
HPFS              | IBM & Microsoft           | 1989 | OS/2 1.2
Amiga FFS         | Commodore                 | 1988 | Amiga OS 1.3
ISO 9660:1988     | Ecma International, ISO   | 1988 | MS-DOS, Mac OS, AmigaOS
FAT16B            | Compaq                    | 1987 | Compaq MS-DOS 3.31
Minix V1 FS       | Andrew S. Tanenbaum       | 1987 | MINIX 1.0
High Sierra       | Ecma International        | 1986 | MSCDEX for MS-DOS3.1/3.2
Amiga OFS[1]      | Metacomco for Commodore   | 1985 | Amiga OS
Elektronika BK    | NPO "Scientific centre"   | 1985 | Vilnius Basic
GEMDOS            | Digital Research          | 1985 | Atari TOS
HFS               | Apple                     | 1985 | System 2.1
NWFS              | Novell                    | 1985 | NetWare 286
FAT16             | IBM, Microsoft            | 1984 | PC DOS 3.0, MS-DOS 3.0
MFS               | Apple                     | 1984 | System 1
ADFS              | Acorn Computers Ltd       | 1983 | Acorn Electron
FFS               | Kirk McKusick             | 1983 | 4.2BSD
DFS               | Acorn Computers Ltd       | 1982 | Acorn BBC Micro MOS
FAT12             | Seattle Computer Products | 1980 | QDOS/86-DOS
ProDOS            | Apple                     | 1980 | Apple SOS
Atari DOS         | Atari                     | 1979 | Atari 8-bit
ODS-2             | DEC                       | 1979 | OpenVMS
V7FS              | Bell Labs                 | 1979 | Version 7 Unix
CBM DOS           | Commodore                 | 1978 | Commodore BASIC
DOS 3.x           | Apple                     | 1978 | Apple DOS
UCSD p-System     | UCSD                      | 1978 | UCSD p-System
FAT (8-bit)       | Microsoft for NCR         | 1977 | MS Disk BASIC-80
GEC DOS           | GEC                       | 1977 | OS4000
ODS-1             | DEC                       | 1975 | RSX-11
CP/M fs           | Gary Kildall              | 1974 | CP/M
Disk OS (GEC DOS) | GEC                       | 1973 | Core OS
RT-11 file system | DEC                       | 1973 | RT-11
V6FS              | Bell Labs                 | 1972 | Version 6 Unix
George 3          | ICT (later ICL)           | 1968 | George 3
Level-D           | DEC                       | 1968 | TOPS-10
DECtape           | DEC                       | 1964 | PDP-6 Monitor
OS/3x0 FS         | IBM                       | 1964 | OS/360
