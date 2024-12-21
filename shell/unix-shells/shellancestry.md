# Shell ancestry

https://github.com/marcpaq/shellancestry


```dot
/* shellancestry.gv */
digraph shells {
  {
    edge [ style = invis; ]
    node [ shape = plaintext; ]
    1971 -> "1975-1977" -> 1978 -> 1979 -> 1983 -> "1987-1989" -> 1990 -> 1993 -> 1995 -> 1996 ->1999 -> 2002 -> 2005 -> 2006;
  }
  edge [ style = solid; ]
  node [ shape = box; ]

  /*
  Proprietary licenses
  */
  node [ style=filled, color=chartreuse ];
  { rank = same; 1971; "Thompson shell"; }
  { rank = same; "1975-1977"; "PWB shell"; }
  { rank = same; 1978; "Bourne shell"; }
  { rank = same; "1990" ; rc; }
  { rank = same; 1983; "KornShell"; }
  { rank = same; "1987-1989"; "ksh88"; }
  { rank = same; 1993; "ksh93"; }

  /*
  Open, free, public licenses
  */
  node [ style=filled, color=plum ];
  { rank = same; 1978; "C shell"; }
  { rank = same; "1987-1989"; "BRL shell"; }
  { rank = same; 1978; "Forsyth shell"; }
  { rank = same; 1983; tcsh; }
  { rank = same; "1987-1989"; "Almquist shell"; }
  { rank = same; 2005; "ksh93q"; }
  { rank = same; 2002; dash; }
  { rank = same; "1987-1989"; pdksh; }
  { rank = same; "1987-1989"; Bash; }
  { rank = same; 1993; es; }
  { rank = same; 1990; zsh; }
  { rank = same; 1995; dtksh; }
  { rank = same; 1996; tksh; }
  { rank = same; 1999; BusyBox; }
  { rank = same; 2002; mksh; }
  { rank = same; 2006; toybox; }
  { rank = same; 1996; "OpenBSD ksh"; }

  /*
  Uses source code from
  */
  edge [ style = solid; color = black; ];
  "Bourne shell" -> "Thompson shell";
  "BusyBox" -> "Almquist shell";
  "KornShell" -> "Bourne shell";
  "OpenBSD ksh" -> "pdksh";
  "PWB shell" -> "Thompson shell";
  "dash" -> "Almquist shell";
  "dtksh" -> "ksh93";
  "ksh88" -> "KornShell";
  "ksh93" -> "KornShell";
  "ksh93q" -> "ksh93";
  "mksh" -> "pdksh";
  "pdksh" -> "BRL shell";
  "pdksh" -> "Forsyth shell";
  "rc" -> "Bourne shell";
  "tcsh" -> "C shell";
  "tksh" -> "ksh93";

  /*
  Influenced by/clean reimplementation of
  */
  edge [ style = dashed; color = grey; ];
  "pdksh" -> ksh88;
  "zsh" -> KornShell;
  "zsh" -> tcsh;
  "Forsyth shell" -> "Bourne shell" ;
  "Bash" -> "Bourne shell";
  "Almquist shell" -> "Bourne shell";
  "C shell" -> "Thompson shell";
  "es" -> "rc";
  "toybox" -> BusyBox;
}
```

A history (ahem) of command shells in Unix and Unix-like systems.

Each shell appears at the year that it was first announced to the
world. For example, S. R. Bourne describes his shell in the *Bell
System Technical Journal* in 1978 but Bell released it to the world in
1979 or so.

A shell uses a solid, black arrow to point to a shell that it
borrows source code from. A shell uses a dashed, grey arrow to point
to a shell that the former attempts to be compatible with while not 
using the latter's source code.

A plum-coloured shell has an open, free, or public license. 

A green shell had a proprietary or closed license at the time that it was
announced. Source for many formerly-closed shells are now available for us
to look at. For example, Bell Labs released to source code to UNIX,
available in a few links below.

The authors of a shell are the people credited at the time of the shell's 
announcement. 

![Shell ancestry](shellancestry.svg)

## Almquist shell

Author: Kenneth Almquist

Also known as ash.

https://en.wikipedia.org/wiki/Almquist_shell


## Bash

Author: Brian Fox

https://en.wikipedia.org/wiki/Bash_(Unix_shell)


## Bourne shell

Author: S. R. Bourne

https://en.wikipedia.org/wiki/Bourne_shell

https://archive.org/details/bstj57-6-1971


## BRL shell

Authors: Doug A Gwyn, Doug Kingston, Ron Natalie, Arnold Robbins, Lou Salkind, and others?

https://web.archive.org/web/20040227010520/http://web.cs.mun.ca:80/~michael/pdksh/CONTRIBUTORS


## BusyBox

Author: Bruce Perens

https://en.wikipedia.org/wiki/BusyBox

https://www.busybox.net/


## C shell

Author: Bill Joy

https://en.wikipedia.org/wiki/C_shell


## Desktop KornShell

Author: Stephen J. Pendergrast

Also known as dtksh

https://books.google.ca/books?id=O6xQAAAAMAAJ&q=Desktop+Korn+Shell+Graphical+Programming+For+the+Common+Desktop+Environment+Version+1.0&dq=Desktop+Korn+Shell+Graphical+Programming+For+the+Common+Desktop+Environment+Version+1.0&hl=en&sa=X&ved=0ahUKEwjjg9Tp0MXeAhXK34MKHeoZB74Q6AEIKTAA


## Forsyth shell

Author: Charles Forsyth

I've corresponded with Charles Forsyth. He tells me that he adapted his shell for MINIX 1 too.

http://www.terzarima.net/

https://web.archive.org/web/20040227010520/http://web.cs.mun.ca:80/~michael/pdksh/CONTRIBUTORS


## es shell

Authors: Paul Haahr, Byron Rakitzis

ftp://ftp.sys.toronto.edu/pub/es/old/

http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.45.8024

https://stuff.mit.edu/afs/sipb/user/yandros/doc/es-usenix-winter93.html


## Korn shell, ksh88, ksh93, ksh93q

Author: David G. Korn

https://en.wikipedia.org/wiki/KornShell

http://www.kornshell.com/info/

http://man.openbsd.org/ksh


## mksh

Author: ?

https://en.wikipedia.org/wiki/MirOS_BSD


## Public Domain Korn shell, OpenBSD ksh

Author: Eric Gisin

https://web.archive.org/web/20040227010520/http://web.cs.mun.ca:80/~michael/pdksh/CONTRIBUTORS


## PWB shell

Author: John Mashey

Programmer's Work Bench shell, aka Mashey shell

https://en.wikipedia.org/wiki/PWB_shell

https://grosskurth.ca/bib/1976/mashey-command.pdf

https://groups.google.com/forum/#!original/net.unix-wizards/k1FW4s0X7jw/4GNAGTPHLXQJ


## rc shell

Author: Tom Duff

https://en.wikipedia.org/wiki/Plan_9_from_Bell_Labs

https://en.wikipedia.org/wiki/Rc

http://doc.cat-v.org/plan_9/4th_edition/papers/rc

http://citeseerx.ist.psu.edu/viewdoc/versions?doi=10.1.1.47.1625


## Thompson shell

Author: Ken Thompson

https://en.wikipedia.org/wiki/Thompson_shell

https://www.bell-labs.com/usr/dmr/www/hist.html


## tcsh

Authors: Ken Greer, Paul Placeway, Christos Zoulas, et al.

https://en.wikipedia.org/wiki/Tcsh

https://github.com/tcsh-org/tcsh

https://groups.google.com/forum/?hl=en#!msg/net.sources/BC0V7oosT8k/MKNdzEG_c3AJ


## tksh

https://www.usenix.org/legacy/publications/library/proceedings/tcl96/full_papers/korn/index.html


## toybox

Author: Robert Landley

https://en.wikipedia.org/wiki/toybox

http://www.landley.net/toybox


## zsh
Author: Paul Falstad
https://groups.google.com/forum/#!msg/alt.sources/tVgN49u8Ax4/7VgQlHZ4bJMJ
http://zsh.sourceforge.net/FAQ/zshfaq01.html#l1


## Thanks

https://www.in-ulm.de/~mascheck/various/
http://www.graphviz.org/Documentation/TSE93.pdf
