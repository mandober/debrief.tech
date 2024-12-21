## CMDS

~~dis/connect~~
adb connect 192.168.1.107
adb disconnect

~~push a file to phone's sdcard root dir~~
adb push <path_local_file> /sdcard/

~~install app directly~~
adb install app.apk

~~multi-app install:~~
adb install-multiple <file...>

~~list all installed packages in android adb shell~~
adb shell 'pm list packages -f'


adb reboot

~~View device log~~
adb logcat [ <filter-spec> ]

adb uninstall [-k] <package> 
~~remove this app package from the device~~
~~'-k' means keep the data and cache directories~~


scripting:
  adb wait-for-device          - block until device is online
  adb start-server             - ensure that there is a server running
  adb kill-server              - kill the server if it is running
  adb get-state                - prints: offline | bootloader | device
  adb status-window            - continuously print device status for a specified device
  adb sideload <file>          - sideloads the given package (flash mem)