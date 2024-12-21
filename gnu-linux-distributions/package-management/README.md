

- Types of packages
  - compiled (binary packages)
  - uncompiled (source packages)
- Distro-specific
  - .deb (Debian)
  - .rpm (RedHat)
- Distro-agnostic
  - pkgsrc (22,000 packages)
  - Homebrew
  - Universal formats, Sandboxing App Systems
    - Snap
    - Flatpak
    - AppImage
  - Purely functional declarative package managers
    - Nix (CppNix)
    - Nix clones
      - GNU Guix
      - Tvix (modularity, compatibile with Nixpkgs, performance, in Rust)
      - Lix (focused on correctness, in Rust)
- Package management systems
  - apt, dpkg (underline .deb)
  - pacman
  - rpm
  - yum, dnf
  - zypper (underline is .rpm)



**pkgsrc** (package source) is a package management system for Unix-like operating systems. It was forked from the FreeBSD ports collection in 1997 as the primary package management system for NetBSD. Since then it has evolved independently; in 1999, support for Solaris was added, followed by support for other operating systems.

**Snap** is a software packaging and deployment system developed by Canonical for Ubuntu-like distros. The packages, called *snaps*, and the tool for using them, *snapd*, work across a range of Linux distributions and allow upstream software developers to distribute their apps directly to users. Snaps are self-contained applications running in a sandbox with mediated access to the host system.

**Nix** is a purely functional, cross-platform package manager and a tool to instantiate and manage an OS (preferably *NixOS*), invented in 2003 by Eelco Dolstra. The Nix package manager employs a model in which software packages are each installed into unique directories with immutable contents. These directory names correspond to cryptographic hashes that take into account all dependencies of a package, including other packages managed by Nix. As a result, Nix package names are content-identifying since packages with the same name will have had the same inputs and the same build platform, and therefore the same build result. *Nixpkgs* is the package repository built upon the Nix package manager. `Maak` is a build automation utility similar to `make`, and early precursor to Nix.

**GNU Guix** is a declarative package manager, an early clone of Nix, using GNU `Guile` language for configuration and customization.


**dpkg** is the software at the base of the *package management system* in Debian and its numerous derivatives. dpkg is used to install, remove, and provide information about .deb packages.
