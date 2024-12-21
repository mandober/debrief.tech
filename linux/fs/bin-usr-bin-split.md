# The usr merge

* The Case for the /usr Merge
https://systemd.io/THE_CASE_FOR_THE_USR_MERGE/

* The Case for the /usr Merge
https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/

- *merged-/usr* vs *non-merged-/usr* filesystem layout

* usrmerge package
https://salsa.debian.org/md/usrmerge/raw/master/debian/README.Debian

The `usrmerge` package will convert the system it is installed on to the "everything in `/usr` directories" scheme, i.e. the `/{bin,sbin,lib}/` directories become symbolic links to `/usr/{bin,sbin,lib}/`. However, `usrmerge` does not also merge `/usr/bin/` and `/usr/sbin/`.





`Understanding /bin vs /usr/bin and /sbin vs /usr/sbin split` by Rob Landley
http://lists.busybox.net/pipermail/busybox/2010-December/074114.html

Rob Landley rob at landley.net
Thu Dec 9 15:45:39 UTC 2010
Previous message: Applet for detecting the filesystem type.
Next message: Understanding the bin, sbin, usr/bin , usr/sbin split
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]

On Tuesday 30 November 2010 15:58:00 David Collier wrote:
> I see that busybox spreads it's links over these 4 directories.
> Is there a simple rule which decides which directory each link lives in?
> For instance I see kill is in /bin and killall in /usr/bin.
> I don't have a grip on what might be the logic for that.


Why are there two identical directories `/bin` and `/usr/bin`? 
And also `/sbin` and `/usr/sbin`?

## Understanding the bin and usr/bin split
by Rob Landley

You know how Ken Thompson and Dennis Ritchie created Unix on a PDP-7 in 1969? Well, around 1971 they upgraded to a PDP-11 with a pair of RK05 disk packs (1.5 megabytes each) for storage. When the operating system grew too big to fit on the first RK05 disk pack (their root filesystem) they let it leak into the second one, which is where all the user home directories lived (which is why the mount was called `/usr`). They replicated all the OS directories under there (`/bin`, `/sbin`, `/lib`, `/tmp`, etc.) and wrote files to those new directories because their original disk was out of space.

When they got a third disk, they mounted it on `/home` and relocated all the user directories to there, so the OS could consume all the space on both disks and grow to THREE WHOLE MEGABYTES (ooooh!).

Of course, they made rules about "when the system first boots, it has to come up enough to be able to mount the second disk on `/usr`, so don't put things like the `mount` command in `/usr/bin` or we'll have a chicken and egg problem bringing the system up".

Fairly straightforward. Also fairly specific to UNIX Version 6 of 35 years ago.

The `/bin` vs `/usr/bin` split (and all the others) is an artifact of this, a 1970's implementation detail that got carried forward for decades by bureaucrats who never question why they are doing things. It stopped making any sense before Linux was ever invented, for multiple reasons:

1. Early system bringup is the provice of `initrd` and `initramfs`, which deal with the "this file is needed before that file" issues. We already have a temporary system that boots the main system.

2. Shared libraries (introduced by the Berkeley guys) prevent you from independently upgrading the `/lib` and `/usr/bin` parts. They two partitions have to _match_ or they won't work. This wasn't the case in 1974, back then they had a certain level of independence because everything was statically linked.

3. Cheap retail hard drives passed the 100 megabyte mark around 1990, and partition resizing software showed up somewhere around there (*Partition Magic* v.3.0 shipped in 1997).

Of course, once the split existed, some people made other rules to justify it.

The root (`/`) was for the OS stuff you got from upstream and `/usr` was for your site-local files.

Then `/` was for the stuff you got from AT&T and `/usr` was for the stuff that your distro (like IBM AIX or Dec Ultrix or SGI Irix) added to it, and `/usr/local` was for your specific installation's files.

Then somebody decided `/usr/local` wasn't a good place to install new packages, so let's add `/opt`! (I'm still waiting for `/opt/local` to show up).

Of course, given 30 years to fester, this split made some interesting distro-specific rules show up and go away again, such as "`/tmp` is cleared between reboots but `/usr/tm`p is not".

Of course, on Ubuntu `/usr/tmp` doesn't exist, and on Gentoo `/usr/tmp` is a symlink to `/var/tmp` which now has the "not cleared between reboots" rule.

Yes, all of this predated `tmpfs`. It has to do with readonly root filesystems, `/usr` is always going to be readonly in that case, and `/var` is where your writable space is; `/` is mostly readonly except for bits of `/etc` which they tried to move to `/var`, but really symlinking `/etc` to `/var/etc` happens more often than not.

Standards bureaucracies like the Linux Foundation (which consumed the Free Standards Group in its' ever-growing accretion disk years ago) happily document and add to this sort of complexity without ever trying to understand why it was there in the first place. "Ken and Dennis leaked their OS into the equivalent of home because an RK05 disk pack on the PDP-11 was too small" goes "whoosh" over their heads.

I'm pretty sure the `busybox` install just puts binaries wherever other versions of those binaries have historically gone. There's no actual reason for any of it anymore. (Personally, I symlink `/bin`, `/sbin` and `/lib` to their `/usr` equivalents on systems I put together).

-- rob

---

Another simplification: I symlink `[/usr]/sbin` to `/bin`. If a program shouldn't be runnable by a non-root, it can easily be arranged by suitable mode in the binary. No need to have separate directory for that. -- vda

---

Actually, there are other good historical reasons, and they have nothing to do with Bureaucrats. Disks were very expensive; the core system binaries were located in `/bin` and `/sbin`, and `/usr` and `/home` were often NFS-mounted from a central location housing non-core binaries, manuals, source trees, user data and other shared stuff.

This had the benefit of a single upgrade point for non-core binaries, and source and user homes were accessible from everywhere - convenience and less disk usage all around.

Even today, good admins partition their local disks to put `/usr` (and definitely `/tmp`) on a separate slice, or even on another disk. 

To touch on your earlier comment, the `initramfs` rarely (if ever) mounts anything but `/`.

Also the `PATH` can be tailored for users vs admin, setting permissons is simpler, etc.

That, and stuffing tons of non-core things in `/bin` or `/sbin` is sloppy in my opinion. For an embedded appliance, does it still make sense? I guess it's debatable, but if it has a need for non-core binaries, I'd say yeah, why not? It avoids the mess, and non-core files that historically have been in `/usr` should probably remain there. And if you're accessing them via a symlink, what's the big deal anyway? If it's NIX, why not just keep it consistent? Are you saving any space by doing this?

(Carrying your point to its logical conclusion, Rob, maybe you should really simplify and just eliminate directories altogether. Who needs 'em!? They only clutter stuff up anyway, and for no good reason. Just dump everything right in / and make all those annoying historical directories just symlinks to / or each other. Then you've got everything handy in a single place. And, as an added bonus, you can even save some space by deleting the cd command).
