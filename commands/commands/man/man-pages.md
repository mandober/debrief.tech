# man-pages

https://man7.org/linux/man-pages/man7/man-pages.7.html

## NAME

`man-pages` - conventions for writing Linux man pages

## SYNOPSIS

    man [section] title

## DESCRIPTION

This page describes the conventions for writing man pages for the *Linux man-pages project*, which documents the user-space API provided by kernel and the GNU C library.

The project provides most of the pages in Section 2, many of the pages that appear in Sections 3, 4, and 7, and a few of the pages that appear in Sections 1, 5, and 8 of the man pages on a Linux system.

## Sections of the manual pages

The manual SECTIONS are traditionally defined as follows:

* 1 User commands   
Commands (programs) that can be executed by the user from within a shell.

* 2 System calls   
Functions which wrap operations performed by the kernel.

* 3 Library calls   
All library functions excluding the system call wrappers (most of libc).

* 4 Special files   
Devices files in /dev which allow to access to devices through the kernel.

* 5 File formats and configuration files   
Describes various human-readable file formats and configuration files.

* 6 Games   
Games and funny little programs available on the system.

* 7 Overview, conventions, and miscellaneous   
Overviews or descriptions of various topics, conventions, and protocols, character set standards, the standard filesystem layout, and miscellaneous other things.

* 8 System management commands   
Commands like mount(8), many of which only root can execute.


*Macro package*   
New manual pages should be marked up using the groff `an.tmac` package described in man(7). This choice is mainly for consistency: the vast majority of existing Linux manual pages are marked up using these macros.

*Conventions for source file layout*   
Please limit source code line length to no more than about 75 characters wherever possible. This helps avoid line-wrapping in some mail clients when patches are submitted inline.


Title line
The first command in a man page should be a TH command:

    .TH title section date source manual-section

The arguments of the command are as follows:
- title: the title of the man page, written in all caps (e.g. MAN-PAGES)
- section: the section number in which the man page should be placed (e.g. 7)
- date: YYYY-MM-DD of the last nontrivial change that was made to the man page
- source: the name and version of the project that provides the manual page
- manual-section: normally empty since the default value will be good

## Sections within a manual page

(don't confuse sections with sections)

The list below shows conventional or suggested sections:
- NAME
- LIBRARY          (Normally only in Sections 2, 3)
- SYNOPSIS
- CONFIGURATION    (Normally only in Section 4)
- DESCRIPTION
- OPTIONS          (Normally only in Sections 1, 8)
- EXIT STATUS      (Normally only in Sections 1, 8)
- RETURN VALUE     (Normally only in Sections 2, 3)
- ERRORS           (Typically only in Sections 2, 3)
- ENVIRONMENT
- FILES
- ATTRIBUTES       (Normally only in Sections 2, 3)
- VERSIONS         (Normally only in Sections 2, 3)
- STANDARDS
- HISTORY
- NOTES
- CAVEATS
- BUGS
- EXAMPLES
- AUTHORS          (Discouraged)
- REPORTING BUGS   (Not used in man-pages)
- COPYRIGHT        (Not used in man-pages)
- SEE ALSO
