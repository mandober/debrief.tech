# File Systems in WSL

https://github.com/MicrosoftDocs/WSL/issues/280

LxFs DrvFs WslFs tmpfs devpts sysfs


Historically, WSL (v.1) had 2 file systems:
- **LxFs** for manipulation of Linux files from within WSL
- **DrvFs** for (ro) access to Windows files from within WSL

However, furthered development of the `DrvFs` brought it closer to the `LxFs` (in at least these 2 features: metadata, special chars).

Feature
- **Metadata** feature referrs to the support of all the POSIX basic and extended file attributes
- case sensitivity
- file permissions
- extra attributes
- special characters in filenames
(those that were allowed in linux were also permitted in WSL, i.e. illegal NTFS characters were properly escaped)
- caching

However, for various reasons, Microsoft has used a different implementation for these features in `DrvFs` and in `LxFs`.

**WslFs** is a replacement that converges these features. 
It uses the `DrvFs` implementation for the internal Linux files.
It's essentially `DrvFs` with a few options locked:
- metadata is always on
- all directories are case sensitive
- etc
- It also has caching enabled, unlike `DrvFs` (so using your internal Linux files from Windows is still not supported, and they must be accessed through \\wsl$).


There isn't a lot of reason to upgrade to WslFs.
There may be some improved performance for some operations, but it probably won't be noticeable.

In general, we only recommend WslFs for new installs, which will be turned on in a future insider build.

Even more so because we're currently investigating a few strange bugs in the upgrade process, so I wouldn't recommend using this unless you're comfortable with possibly needing to reinstall the distribution if something goes wrong.

To check which filesystem is currentlly in use:
- `mount`

Should you wish to convert the Linux file system from `LxFs` to `WslFs`:
- `wsl /upgrade`
- `wslconfig /upgrade`


$ mount

rootfs      on /                          type  lxfs        (rw,noatime)

none        on /dev                       type  tmpfs       (rw,noatime,mode=755)
devpts      on /dev/pts                   type  devpts      (rw,nosuid,noexec,noatime,gid=5,mode=620)

sysfs       on /sys                       type  sysfs       (rw,nosuid,nodev,noexec,noatime)
cgroup      on /sys/fs/cgroup             type  tmpfs       (rw,relatime,mode=755)
cgroup      on /sys/fs/cgroup/devices     type  cgroup      (rw,relatime,devices)

proc        on /proc                      type  proc        (rw,nosuid,nodev,noexec,noatime)
binfmt_misc on /proc/sys/fs/binfmt_misc   type  binfmt_misc (rw,relatime)

none        on /run                       type  tmpfs       (rw,nosuid,noexec,noatime,mode=755)
none        on /run/lock                  type  tmpfs       (rw,nosuid,nodev,noexec,noatime)
none        on /run/shm                   type  tmpfs       (rw,nosuid,nodev,noatime)
none        on /run/user                  type  tmpfs       (rw,nosuid,nodev,noexec,noatime,mode=755)

C:\         on /mnt/c                     type  drvfs       (rw,noatime,uid=1000,gid=1000,umask=22,fmask=11,metadata,case=off)
T:\         on /mnt/t                     type  drvfs       (rw,noatime,uid=1000,gid=1000,umask=22,fmask=11,metadata,case=off)
V:\         on /mnt/v                     type  drvfs       (rw,noatime,uid=1000,gid=1000,umask=22,fmask=11,metadata,case=off)
