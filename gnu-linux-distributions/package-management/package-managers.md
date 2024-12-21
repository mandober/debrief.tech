# Package Managers

Linux Software Package Formats and Package Managers


## Index

- brew
- linuxbrew
- AUR (arch)
- pacman (arch)
- xbps (Void Linux)
- nix-shell (Nix shell)
- pkg (FreeBSD)
- eopkg (Solus)
- pkg (Android, with termux)
- emerge (Gentoo)
- Debian/Ubuntu
  - .deb
  - dpkg
  - apt
  - deb-get
- Universal Application Stores
  - Flatpak
  - Snap
  - AppImages


## PKGBUILD
PKGBUILD is a packaging format designed to be concise, simple, and easy to pick up, all the while remaining powerful enough to match the flexibility of standard Debian packaging tools.

https://docs.makedeb.org/makedeb/pkgbuild-syntax/
https://wiki.archlinux.org/title/PKGBUILD

PKGBUILDs are just Bash scripts that define variables and functions that tell makedeb how to build a package.

## Flatpak

FlatHub is a build and distribution service for Flatpak applications.
https://flathub.org/
https://flathub.org/setup

FlatHub Forum
https://discourse.flathub.org/

https://www.linux.com/training-tutorials/how-install-and-use-flatpak-linux/

## Snaps

Snapcraft Forum
https://forum.snapcraft.io/

Snap Store is a build and distribution service for Snap applications.
https://snapcraft.io/store
https://snapcraft.io/docs/quickstart-tour
https://snapcraft.io/docs/data-locations
https://snapcraft.io/docs/managing-updates
https://snapcraft.io/docs/home-interface
https://snapcraft.io/docs/snap-confinement
https://snapcraft.io/docs/environment-variables
https://snapcraft.io/docs/parts-environment-variables
https://snapcraft.io/docs/glossary#heading--snapd


* Quickly migrate from using snap packages to flatpaks
https://github.com/popey/unsnap


## App Outlet

App Outlet is a Universal application store (Flatpaks, Snaps, and AppImages) inspired by the Linux App Store online service.
https://app-outlet.github.io/

## AppImages

AppImageHub is a build and distribution service for AppImage applications.
https://www.appimagehub.com/

AppImage Manager is a package manager for AppImages.
https://github.com/AppImageCrafters/appimage-manager

AppImage Forum
https://discourse.appimage.org/



## Debian Packaging

### makedeb
* makedeb - a simplicity-focused packaging tool for Debian archives
https://www.makedeb.org/
https://github.com/makedeb
The community-maintained repository for the makedeb packaging tool.
https://mpr.makedeb.org/

*makedeb* is based on (and is originated in the codebase of) `makepkg`, the packaging tool used on Arch Linux. Likewise, most of the behavior in *makedeb* is the same as `makepkg`, but there are a few changes that have been made to work better in the packaging system for .deb packages.


Tools like `debuild` and `dpkg-deb` are commonly used to build packages for Debian and Ubuntu based distributions.

The normal Debian packaging tools are known for not being the most user-friendly towards new users - they're the reason makedeb exists in the first place. Notably, the standard way of creating a Debian package involves creating a source package consisting of a debian/ directory, which contains multiple files that describe how to build a package. This is quite verbose. The rules file used in Debian packaging also uses Makefile syntax, which isn't the nicest to work with, especially as project complexity starts to increase.

### Pacstall
https://pacstall.dev/
Pacstall is a package manager that function as an `AUR`-like platform for Ubuntu systems, "The AUR for Ubuntu".

sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install)"

* Why is this any different than any other package manager?
Pacstall uses the stable base of Ubuntu but allows you to use bleeding edge software with little to no compromises, so you don't have to worry about security patches or new features.

* How does it work then?
Pacstall takes in files known as `pacscripts` (similar to `PKGBUILD`s) that contain the necessary contents to build packages, and builds them into executables on your system.
https://github.com/pacstall/pacstall/wiki/Pacscript-101



* deb-get
https://github.com/wimpysworld/deb-get
apt-get functionality for .debs published in 3rd party repositories or via direct download. It works on Debian, Ubuntu and their derivative distributions.
List of installable software
https://github.com/wimpysworld/deb-get/blob/main/01-main/README.md



### dpkg
Package management system in Debian and its OS derivatives.

.deb Debian Package

https://www.digitalocean.com/community/tutorials/dpkg-command-in-linux
https://en.wikipedia.org/wiki/APT_(software)
https://www.debian.org/distrib/packages

DEB is a Debian Software Package file used on Debian-based Linux systems such Debian, Ubuntu, Linux Mint, and Pop!_OS.

APT (Advanced Package Tool) is a higher-level package management systemtool, that is more commonly used than dpkg as it can fetch packages from remote locations.

## dnf

TDNF(Tiny Dandified) package manager is a C based successor of the DNF package manager, which itself is the successor to Fedora's YUM package manager. TDNF is included in the base CBL-Mariner image by default.

DNF(Dandified Packaging Tool) is a software package manager that installs, updates, and removes packages on Fedora and is the successor to YUM (Yellow-Dog Updater Modified). DNF makes it easy to maintain packages by automatically checking for dependencies and determines the actions required to install packages.

Micro DNF is a lightweight C implementation of DNF, designed to be used for doing simple packaging actions when you don't need full-blown DNF and you want the tiniest useful environments possible. Checkout the Micro DNF GitHub.

## rpm

RPM Package Manager (RPM) is a powerful package management system capable of building computer software from source into easily distributable packages installing, updating and uninstalling packaged software querying detailed information about the packaged software, whether installed or not.

## EPEL

(Extra Packages for Enterprise Linux) is an free and open source community-based repository project from the Fedora team which provides 100% high-quality add-on software packages for Linux distribution including RHEL (Red Hat Enterprise Linux) and CentOS Stream.

## YUM
(Yellowdog Updater, Modified) is a software package-management utility for Linux operating system using the RPM Package Manager.

## ROM OSTree
is a hybrid image/package system. It combines libostree as a base image format, and accepts RPM on both the client and server side, sharing code with the dnf project; specifically libdnf. Thus bringing many of the benefits of both projects together.

*YaST* is a installation and configuration tool for openSUSE and the SUSE Linux Enterprise distributions. It features an easy-to-use interface and powerful configuration capabilities.

## Zypper
is a command line package manager which makes use of libzypp. It provides functions like repository access, dependency solving, package installation, etc. Zypper repositories are similar to the ones used in YaST, which also makes use of libzypp.

## Pacman
is a utility which manages software packages in Arch Linux. It uses simple compressed files as a package format, and maintains a text-based package database (more of a hierarchy), just in case some hand tweaking is necessary.
