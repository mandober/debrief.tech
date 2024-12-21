adb - Android Debug Bridge version 1.0.32

adb @win:
  Android Debug Bridge version 1.0.32
adb @wsl ubuntu 18: 
  Android Debug Bridge version 1.0.36
  Revision 1:7.0.0+r33-2


## SERVER/CLIENT

-a                             Directs adb to listen on `all interfaces` for a connection
-H                             Name of adb server `host` (default: `localhost`)
-P                             `Port` of adb server (default: `5037`)

devices [-l]                   `list all` connected devices ('-l' will also list device qualifiers)
connect <host>[:<port>]        Connect to a device via TCP/IP. default: 5555
 
disconnect                     disconnect from all connected TCP/IP devices.
disconnect [<host>[:<port>]]   disconnect from a TCP/IP device. default: 5555
 
-d                             Directs command to the only connected `USB device`
                                (returns an error if more than one USB device is present)
                                 
-e                             Directs command to the only running `emulator`.
                                (error if more than one emulator is running
 
`-s <specific device>`         Directs command to the device or emulator with the given
                                `serial` number or qualifier. Overrides ANDROID_SERIAL envvar.
 
`-p <product name or path>`    Simple `product name` (e.g. 'sooner'), or a relative/absolute 
                                path to a product out directory like `out/target/product/sooner`. 
                                If -p is not specified, `ANDROID_PRODUCT_OUT` envvar is used, 
                                which must be an absolute path.


## DEVICE COMMANDS


`adb push [-p] <local> <remote>`
  Copy file/dir to device
  `-p` to display the transfer progress

`adb pull [-p] [-a] <remote> [<local>]`
  Copy file/dir from device
  `-p` to display the transfer progress
  `-a` means copy timestamp and mode
  
`adb sync [ <directory> ]`
  Copy from host to device only if there are changes.
  `-l` means list but don't copy (see `adb help all`)
  _<localdir>_ can be interpreted in several ways:
  - If _<dir>_ is not specified, "/system", "/vendor" (if present), 
    and `/data` partitions will be updated.
  - If it is "system", "vendor", "data", only the corresponding partition is updated.

`adb shell`
  run remote shell interactively
  
`adb shell <command>`
  run remote shell command and return
  
  
adb shell [-e escape] [-n] [-Tt] [-x] [command]
  Run remote shell command (interactive shell if no command given)
  (-e: choose escape character, or "none"; default '~')
  (-n: don't read from stdin)
  (-T: disable PTY allocation)
  (-t: force PTY allocation)
  (-x: disable remote exit codes and stdout/stderr separation)


`adb emu <command>`
  run emulator console command
  
`adb logcat [<filter-spec>]`
  View device log



`adb forward --list`
  List all forward socket connections.
  The format is a list of lines with the following format:
  *<serial> " " <local> " " <remote> "\n"*

`adb forward <local> <remote>`
  forward socket connections forward specs are one of:
  tcp:<port>
  localabstract:<unix domain socket name>
  localreserved:<unix domain socket name>
  localfilesystem:<unix domain socket name>
  dev:<character device name>
  jdwp:<process pid> (remote only)

`adb forward --no-rebind <local> <remote>`
  Same as `adb forward <local> <remote>` but fails if *<local>* is already forwarded

adb forward --remove <local>
  remove a specific forward socket connection

adb forward --remove-all
  remove all forward socket connections

adb reverse --list
  list all reverse socket connections from device
  
adb forward --remove-all
  remove all forward socket connections

adb reverse --list
  list all reverse socket connections from device

adb reverse <remote> <local>
  reverse socket connections reverse specs are one of:
  tcp:<port>
  localabstract:<unix domain socket name>
  localreserved:<unix domain socket name>
  localfilesystem:<unix domain socket name>

`adb reverse --norebind <remote> <local>`
  same as `adb reverse <remote> <local>` but fails if *<remote>* is already reversed.
  
adb reverse --remove <remote>
  remove a specific reversed socket connection
  
adb reverse --remove-all
  remove all reversed socket connections from device

adb jdwp
  list PIDs of processes hosting a JDWP transport

`adb install [-lrtsd] <file>`
  push this package file to the device and install it

`adb install-multiple [-lrtsdp] <file...>`
  push package files to the device and install it

 `[-lrtsd]`
  -r: replace existing application
  -s: install application on sdcard
  -l: forward lock application
  -t: allow test packages
  -d: allow version code downgrade
  -p: partial application install. Updating an app with delta or patch package.


`adb uninstall [-k] <package>`
  Remove this app package from the device.
  -k = keep the data and cache directories

adb bugreport
  Return all information from the device that should be included in a bug report.

`adb backup [-f <file>] [-apk|-noapk] [-obb|-noobb]`
     `[-shared|-noshared] [-all] [-system|-nosystem] [<packages...>]`
      write an archive of the device's data to *<file>*.
      If no `-f` then data is written to *backup.ab* in the current directory.
  -apk|-noapk
    enable/disable backup of the .apks themselves in the archive; 
    the default is noapk.
  -obb|-noobb
    enable/disable backup of any installed apk expansion (aka .obb) files 
    associated with each application; the default is noobb.
  -shared|-noshared
    enable/disable backup of the device's
    shared storage / SD card contents; the default is noshared.
  -all
    means to back up all installed applications
  -system|-nosystem
    toggles whether -all automatically includes system applications; 
    the default is to include system apps
  <packages...>
    is the list of applications to be backed up.
    If `-all` or `-shared` flags are passed, then the package list is optional.
    Applications explicitly given on the command line will be included even 
    if -nosystem would ordinarily cause them to be omitted.

`adb restore <file>`
  restore device contents from the <file> backup archive

`adb disable-verity`
  disable dm-verity checking on USERDEBUG builds
  
`adb keygen <file>`
  generate adb public/private key.
  The private key is stored in <file>, and the public key is stored 
  in <file>.pub. Any existing files are overwritten.
                                 
`adb help`
  show this help message

`adb version`
  show version num


## SCRIPTING

adb wait-for-device          - block until device is online
adb start-server             - ensure that there is a server running
adb kill-server              - kill the server if it is running
adb get-state                - prints: offline | bootloader | device
adb get-serialno             - prints: <serial-number>
adb get-devpath              - prints: <device-path> 
adb status-window            - continuously print device status for a specified device

`adb remount`
  remounts the /system and /vendor (if present) partitions on the device read-write

`adb reboot [bootloader|recovery]`
  reboots the device, optionally into the bootloader or recovery program

`adb reboot-bootloader`
  reboots the device into the bootloader
  
`adb root`
  restarts the adbd daemon with root permissions

`adb usb`
  restarts the adbd daemon listening on USB

`adb tcpip <port>`
  restarts the adbd daemon listening on TCP on the specified port



## NETWORKING

`adb ppp <tty> [parameters]`
  Run PPP over USB. Do not automatically start a PPP connection.
  *<tty>* refers to the tty for PPP stream, e.g. `dev:/dev/omap_csmi_tty1`
  *[parameters]* e.g. `defaultroute debug dump local notty usepeerdns`



## ENVIRONMENTAL VARIABLES

`ANDROID_SERIAL`
The serial number to connect to. `-s` takes priority over this if given.

`ANDROID_LOG_TAGS`
When used with the logcat option, only these debug tags are printed.

`ADB_TRACE`
Print debug information. A comma separated list of the following values:
`1` or `all, adb, sockets, packets, rwx, usb, sync, sysdeps, transport, jdwp`







