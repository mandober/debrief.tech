# Outline of entities

* Hardliners
  - hardware
  - platform
  - OS
  - CPU
  - CPU flags
  - CPU arch

* Distro

* Top-level entities
  hw
  sw
  os
  pm
  virt
  containerization
  shell
  program


* Executables
  programs, binaries
    standard (came with installation)
    user-installed

* Scripts
  executable script
  sourcable script
  executable/sourcable script
  partial, sourcable file (file intended to be sourced/included)
  rc file (just containing defs)


* Shell
  * Shell settings
    - inherited settings from some parent env/process
    - set by env vars
    - set by shell vars
    - set by user vars
    - rc, init files
    - by special service
    - by host
  * Shell users
    - system
      - service (cron)
      - script
    - users
      - admin
      - reguser
      - guest
  * Shell modes
    normal vs restricted
    regular vs POSIX-compliant or emulation
    local vs remote (ssh, telnet)
    script mode vs interactive mode
    login ± interactive ± gui
    mixed modes

* FS entities
  item
  file
  regular file
  dir, folder
  fifo
  door
  pipe
  socket
  links
    symlink
    hardlink
  block
  text





* Words
  alias
  function
  alifunc = alias + function
