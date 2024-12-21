# Sections



Sections:
- 1, 1p, 1x, 1ssl, 
- 2, 
- 3, 3t, 3am, 3pm, 3perl, 3readline, 
- 4, 
- 5, 5ssl, 5edit, 
- 6, 
- 7, 7ssl, 7gcc, 7edit, 
- 8, 8postfix


SYNOPSIS

    man [man options] [[SECTION] PAGE ...] ...
    man -k [apropos options] regexp ...
    man -K [man options] [SECTION] term ...
    man -f [whatis options] PAGE ...
    man -l [man options] file ...
    man -w|-W [man options] PAGE ...

man is the system's manual pager. 

Each `PAGE` arg is normally the name of a program, utility or function. 
The manual PAGE associated with each of these args is then found and displayed.

A `SECTION`, if provided, directs man to look only in that SECTION of manual. 
The default action is to search in all of the available sections following a pre-defined order, and to show only the first PAGE found, even if PAGE exists in several sections.

SECTION numbers and the types of pages they contain:
- 1 Executable programs or shell commands
- 2 System calls (functions provided by the kernel)
- 3 Library calls (functions within program libraries)
- 4 Special files (usually found in /dev)
- 5 File formats and conventions (e.g. /etc/passwd)
- 6 Games
- 7 Misc (including macro packages and conventions), e.g. man(7), man-pages(7)
- 8 System administration commands (usually only for root)
- 9 Kernel routines (non standard)

A manual page consists of several *sections*. 
Conventional section names include:

    NAME, SYNOPSIS, CONFIGURATION,
    DESCRIPTION, OPTIONS, 
    EXIT STATUS, RETURN VALUE, ERRORS,
    ENVIRONMENT, FILES, 
    VERSIONS, STANDARDS, 
    NOTES, BUGS, EXAMPLE, 
    AUTHORS, SEE ALSO.
