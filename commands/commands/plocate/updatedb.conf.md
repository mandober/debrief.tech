# plocate

https://plocate.sesse.net/
https://plocate.sesse.net/updatedb.conf.5.html

`/etc/updatedb.conf` - configuration file for `updatedb` command of `plocate`

## PRUNE_BIND_MOUNTS

PRUNE_BIND_MOUNTS="yes"

## PRUNENAMES

PRUNENAMES=".git .bzr .hg .svn .luac .cache"

## PRUNEFS

PRUNEFS="9p afs autofs binfmt_misc ceph cgroup cgroup2 cifs coda configfs curlftpfs debugfs devfs devpts devtmpfs ecryptfs ftpfs fuse.ceph fuse.cryfs fuse.encfs fuse.glusterfs fuse.gvfsd-fuse fuse.mfs fuse.rclone fuse.rozofs fuse.snapfuse fuse.sshfs fusectl fusesmb hugetlbfs iso9660 lustre lustre_lite mfs mqueue ncpfs nfs nfs4 ntfs ocfs ocfs2 overlay proc pstore ramfs rootfs rpc_pipefs securityfs shfs smbfs sysfs tmpfs tracefs udev udf usbfs"

## PRUNEPATHS

PRUNEPATHS="/mnt /tmp /media /lost+found /run /srv /var /home/.ecryptfs /home/.cabal/packages /home/.cache/pip /home/.ghcup /home/.local /home/.npm /home/.vscode-server /home/snap"

```bash
PRUNEPATHS="
  /lost+found
  /media
  /mnt
  /run
  /srv
  /tmp
  /var
  /home/.cabal/packages
  /home/.cache/pip
  /home/.ecryptfs
  /home/.ghcup
  /home/.local
  /home/.npm
  /home/.vscode-server
  /home/snap"

#/var/lib/ceph
#/var/lib/os-prober
#/var/lib/schroot
#/var/spool
```
