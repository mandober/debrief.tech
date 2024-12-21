adb install <file>



`adb install-multiple [-lrtsdp] <file...>`
push this package file to the device and install it
  (-l: forward lock application)
  (-r: replace existing application)
  (-t: allow test packages)
  (-s: install application on sdcard)
  (-d: allow version code downgrade)
  (-p: partial application install)