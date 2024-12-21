# dpkg

* Package management
https://documentation.ubuntu.com/server/how-to/software/package-management/
https://ubuntu.com/server/docs/package-management

* Debian packages
https://www.debian.org/distrib/packages
https://wiki.debian.org/Teams/Dpkg

* Ubuntu jammy man pages
https://manpages.ubuntu.com/manpages/jammy/man1/dpkg.1.html
https://manpages.ubuntu.com/manpages/jammy/man1/debconf-show.1.html
https://manpages.ubuntu.com/manpages/jammy/man1/debconf.1.html
https://manpages.ubuntu.com/manpages/jammy/man7/debconf.7.html
https://manpages.ubuntu.com/manpages/jammy/man5/debconf.conf.5.html
https://manpages.ubuntu.com/manpages/jammy/man8/dpkg-preconfigure.8.html
https://manpages.ubuntu.com/manpages/jammy/man8/dpkg-reconfigure.8.html
https://manpages.ubuntu.com/manpages/jammy/man1/dialog.1.html
https://manpages.ubuntu.com/manpages/jammy/man1/whiptail.1.html

* dpkg and related links
https://en.wikipedia.org/wiki/Dpkg
https://en.wikipedia.org/wiki/Deb_(file_format)

- Documentation
  - Package Management
    https://wiki.debian.org/PackageManagement
  - Package search
    https://packages.debian.org/search?keywords=dpkg
  - Packaging
    https://wiki.debian.org/Packaging/Intro 
  - Frequently Asked Questions (FAQ)
    https://wiki.debian.org/Teams/Dpkg/FAQ
  - Source package (.dsc) support in software.
    https://wiki.debian.org/Teams/Dpkg/DscSupport
  - Binary package (.deb) support in software.
    https://wiki.debian.org/Teams/Dpkg/DebSupport
  - deb822-style syntax support in software.
    https://wiki.debian.org/Teams/Dpkg/Deb822Support
  - Downstream: list of downstream distributions shipping dpkg.
    https://wiki.debian.org/Teams/Dpkg/Downstream
  - Triggers HOWTO by Sean Finney (from archive.org).
    https://web.archive.org/web/20140127083557/http://www.seanius.net/blog/2009/09/dpkg-triggers-howto/
  - UsingSymbolsFiles
    https://wiki.debian.org/UsingSymbolsFiles
  - libdpkg API documentation.
    https://www.dpkg.org/doc/libdpkg/
  - dpkg-www
    https://git.dpkg.org/cgit/dpkg/dpkg-www.git/tree/README
  - Mailing List
    https://lists.debian.org/debian-dpkg/
  - dpkg 2.0 (pdf)
    https://www.dpkg.org/doc/specs/dpkg2.pdf
  - DpkgV2 specs
    https://lists.debian.org/debian-devel-announce/1999/07/msg00012.html


- dpkg and related commands
  - do-release-upgrade(1)
  - apt-get(1)
  - apt(1)            - CLI frontend for dpkg
  - dpkg(1)           - Package manager for Debian
  - dselect(1)
  - debconf(1)        - Debian package configuration system
  - dpkg-deb(1)
  - dpkg-query(1)
  - debconf-show(1)   - query the debconf database
  - deb(5)
  - dpkg.cfg(5)
  - deb-control(5)
  - debconf.conf(5)
  - debsums
  - dpkg-reconfigure(8)
  - dpkg-preconfigure(8)
  - apt(8)
  - aptitude(8)     - TUI frontend over apt for dpkg
  - synaptics       - GUI package manager for Debian


- dpkg environment variables
  - `DEBIAN_PRIORITY`
  - `DEBIAN_FRONTEND`
  - DPKG_FRONTEND_LOCKED

- dpkg files
  - /etc/debconf.conf
  - /usr/share/doc/dpkg/
  - /var/lib/dpkg/info/
  - /var/lib/dpkg/status
  - /var/cache/debconf/
  - Conffile
  - .deb format

## Examples

```bash
# show all installed
sudo apt list --installed | less

# show all installed and desc
sudo dpkg --list | less

# use -get-selections to get packages based on status:
sudo dpkg --get-selections > completePackage.txt

# list installed snaps
snap list

# list installed flatpaks
flatpak list

# list all the files provided by a package (only for installed packages)
dpkg --list-files textutils

# find out which package a file belongs to:
dpkg -S /path/to/some/file
```

List log files in `/var/log/apt` to check what packages have been removed, updated, or deleted.



## dpkg

>dpkg [option...] action


`dpkg` is a *medium-level tool* to install, build, remove and manage Debian packages.

With `dpkg --set-selections`, you can set which packages are to be installed/removed etc, which gets done the next time you run `apt-get dselect-upgrade`.

>Why "medium-level"?
Below it, there is `dpkg-deb`, which performs lower-level actions on .deb (binary) packages, such as reading the control information and directly extracting the contained files.

dpkg checks dependencies and will refuse to install a package whose dependencies are not met, but it won't help you find and install those dependencies; for that, you need a *higher-level tool* like aptitude, apt-get or dselect.

dpkg frontends
- `apt` is primary CLI frontend
- `aptitude` is a TUI frontend

dpkg itself is controlled entirely via command line parameters, which consist of exactly one action and zero or more options. The action-parameter tells dpkg what to do and options control the behavior of the action in some way.

dpkg can also be used as a frontend to `dpkg-deb(1)` and `dpkg-query(1)`. The list of supported actions can be found later on in the ACTIONS section. If any such action is encountered dpkg just runs `dpkg-deb` or `dpkg-query` with the parameters given to it, but no specific options are currently passed to them, to use any such option the backends need to be called directly.

dpkg maintains some usable information about available packages. The information is divided in 3 classes:
- states
- selection states
- flags
These values are intended to be changed mainly with `dselect`.

Package states
- `not-installed`    The package is not installed on your system
- `unpacked`         The package is unpacked, but not configured
- `half-installed`   Installation started, but not completed for some reason
- `triggers-awaited` The package awaits trigger processing by another package
- `triggers-pending` The package has been triggered
- `installed`        The package is correctly unpacked and configured
- `half-configured`  Unpacked, configuration started, but not completed
- `config-files`     Only configs, `postrm` script and data exist on the system

Package selection states
- `install` The package is selected for installation.
- `hold` A package marked to be on hold is kept on the same version, that is, no automatic new installs, upgrades or removals will be performed on them, unless these actions are requested explicitly, or are permitted to be done automatically with the --force-hold option.
- `deinstall` The package is selected for deinstallation (i.e. we want to remove all files, except configuration files).
- `purge` The package is selected to be purged (i.e. we want to remove everything from system directories, even configuration files).
- `unknown` The package selection is unknown.  A package that is also in a not-installed state, and with an ok flag will be forgotten in the next DB store.

Package flags
- `ok` Package marked ok is in a known state, but might need further processing
- `reinstreq` A package marked reinstreq is broken and requires reinstallation. These packages cannot be removed unless forced with --force-remove-reinstreq
