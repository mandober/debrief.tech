# Services

```bash
service --status-all

[ - ]  apparmor
[ + ]  apport
[ - ]  console-setup.sh
[ + ]  cron
[ + ]  dbus
[ - ]  hwclock.sh
[ - ]  irqbalance
[ - ]  keyboard-setup.sh
[ - ]  kmod
[ + ]  plymouth
[ + ]  plymouth-log
[ - ]  postfix
[ + ]  procps
[ - ]  rsync
[ - ]  screen-cleanup
[ + ]  udev
[ + ]  ufw
[ + ]  unattended-upgrades
[ - ]  uuidd
[ - ]  x11-common
```


**Plymouth** is a project from Fedora and now listed among the freedesktop.org's official resources providing a flicker-free graphical boot process. It relies on kernel mode setting (KMS) to set the native resolution of the display as early as possible, then provides an eye-candy splash screen leading all the way up to the login manager.

https://wiki.archlinux.org/title/Plymouth
