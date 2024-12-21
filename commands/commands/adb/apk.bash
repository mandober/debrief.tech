#!/bin/bash

#
# apk pakage installer for Android via `adb` (Android Debug Bridge)
#
# 1. Turn on "adb over network" on the phone. Find out its IP.
# 2. $ adb connect <phone_IP>
# 3. Download apk pakages, slugify their names (no spaces and shit, keep it ASCII)
# 4. adb install -s PKG.apk
#                -s: install app on sdcard


#
# INSTALL
#
# apkInstall() {

declare -a fx
read -a fx <<< $(echo *.apk)
for x in "${fx[@]}"; do
  echo "Installing: $x"
  adb install -s $x
  echo "   done!"
done

# }

#
# UNINSTALL
#
# apkRemove() {
#   declare -a fx
#   #read -a fx <<< read "./uninstall_list.txt"
#   readarray fx < "./uninstall_list.txt"
#   for x in "${fx[@]}"; do
#     echo -n "Uninstalling: $x"
#     adb uninstall $x
#     echo " ...done!"
#   done
#   echo "All done!"
# }


#
# Have I been executed or sourced?
#
# if [[ "$0" == "$BASH_SOURCE" ]]; then
#   # executed
#   echo "[apk] executed!"
#   apk $@
# else
#   # sourced
#   echo "[apk] sourced!"
#   apk $@
# fi


# exit 0
