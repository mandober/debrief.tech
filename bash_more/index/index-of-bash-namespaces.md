# Index :: Bash namespaces

processes, PID
signals
traps
ulimit
PATH dir
installed packages
network interface names

# bash lib

namespaces:
- a  al  ali  aliases namespace
- b  bb  bui  builtins namespace
- c  co  cmd  commands namespace (a, k, f, b, p)
- d  di  dir  directories namespace
- e  ev  env  environment variables namespace
- f  fn  fun  functions namespace
-    fi  fil  files namespace
- g  gr  grp  groups namespace
- h  ho  hst  hostnames namespace
- j      job  jobs namespace (running, stopped)
- k  kw  key  keywords namespace
- o  op  opt  options namespace (setopt, shopt)
- p  pr  prg  programs namespace
- r  rl  rea  readline namespace (rl vars, rl fns, bindings)
- s  sr  ser  services namespace
-    si  sig  signals namespace
- u  us  usr  users namespace
-    ul  lim  ulimit namespace
- v  va  var  variables namespace


- v  va  var  variables namespace
- x      exp  exported variables (envars) and functions namespace
- e  ev  env  environment variables namespace
- i      int  integers namespace
-    ar  arr  arrays namespace
-    ia  iar  indexed arrays namespace
-    aa  aar  associated arrays namespace


- fn
  - fn_get_src
  - fn_get_def
  - fn_get_all
  - fn_get_exported

# Listing namespace elements

`compgen -A action`

where `action` is
- alias
- keyword
- variable
  - export
  - arrayvar
- function
- builtin
  - enabled
  - disabled
- command
- setopt
- shopt
- file
- directory
- hostname
- binding
- job
  - running
  - stopped
- signal
- service
- user
- group
- helptopic

`compgen [-abcdefgjksuv]`

abcdefgjksuv
- a  alias
- b  builtin
- c  command
- d  directory
- e  environment variable
- f  function
- g  group
- j  job
- k  keyword
- s  service
- u  user
- v  variable
