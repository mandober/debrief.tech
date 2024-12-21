# Calibre: environment-variables


`CALIBRE_CONFIG_DIRECTORY`
dir where configuration files are stored/read

`CALIBRE_CACHE_DIRECTORY`
dir to cache persistent data between sessions


CALIBRE_TEMP_DIR
sets the temporary directory used by calibre

CALIBRE_OVERRIDE_DATABASE_PATH
allows you to specify the full path to `metadata.db`. Using this variable you can have metadata.db be in a location other than the library folder. Useful if your library folder is on a networked drive that does not support file locking.

CALIBRE_DEVELOP_FROM
Used to run from a calibre development environment.

CALIBRE_OVERRIDE_LANG
Used to force the language used by the interface 
(ISO 639 language code)

CALIBRE_TEST_TRANSLATION
Used to test a translation .po file 
(should be the path to the .po file)

CALIBRE_NO_NATIVE_FILEDIALOGS
Causes calibre to not use native file dialogs for selecting files.

CALIBRE_NO_NATIVE_MENUBAR
Causes calibre to not create a native (global) menu on Ubuntu Unity and similar linux desktop environments. The menu is instead placed inside the window, as is traditional.

CALIBRE_USE_SYSTEM_THEME
By default, on Linux, calibre uses its own builtin Qt style. This is to avoid crashes and hangs caused by incompatibilities between the version of Qt calibre is built against and the system Qt. The downside is that calibre may not follow the system look and feel. If you set this environment variable on Linux, it will cause calibre to use the system theme – beware of crashes and hangs.

CALIBRE_SHOW_DEPRECATION_WARNINGS
Causes calibre to print deprecation warnings to stdout. Useful for calibre developers.

CALIBRE_NO_DEFAULT_PROGRAMS
Prevent calibre from automatically registering the filetypes it is capable of handling with Windows.

SYSFS_PATH - Use if sysfs is mounted somewhere other than /sys
http_proxy, https_proxy - Used on linux to specify an HTTP(S) proxy

