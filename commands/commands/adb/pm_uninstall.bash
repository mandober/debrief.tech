#!/bin/bash

declare -a fx
#read -a fx <<< read "./uninstall_list.txt"
readarray fx < "./uninstall_list.txt"
for x in "${fx[@]}"; do
  echo -n "Uninstalling: $x"
  adb uninstall $x
  echo " ...done!"
done

echo "All done!"
