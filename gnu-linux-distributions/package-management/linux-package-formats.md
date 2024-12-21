# Linux package formats

*Package formats* are the different file formats used for software packaging in various distributions.

The two principal kinds of package: binary and source packages.

Basically, software is distributed as
- already compiled binaries
- source code package (which you have to compile yourself)

Most distross and their package managers work with binaries - only a few distros insist you compile the package yourself.



DEB
Debian package, originally from Debian. Used by Debian and derivatives such as Ubuntu.

RPM
RPM Package Manager, originally from Red Hat, is now used by many other distributions as well, like openSUSE, Mageia and Alt Linux.


ebuild
The file containing information on how to retrieve, compile, and install a package in Gentoo's Portage system using the command emerge. Typically these are source-primary installs, though binary packages can be installed in this fashion as well. Gentoo-based distributions also use the ebuild system from the same Portage tree.


pkg.tar.xz
Used by Arch Linux's Pacman package manager.

PiSi
Used by Pisi Linux and formerly Pardus.

tgz or tar.gz
Standard tar + gzip, possibly with some extra control files. Used by Slackware and others, or sometimes when distributing very simple handmade packages.

SuperDeb
An installer containing a program plus all the dependencies needed, was used in now-discontinued Super OS.

LZM
Used by Slax. Opens with Slax Module Manager, and then gets installed to the KDE menu as a Desktop Config file. May be placed into the Slax CD's Modules folder to get installed at boot.

PUP and PET
Used by Puppy Linux and derivatives. Click and install package type. OS can be installed to a flash drive for portability and will bring apps with it.
