# which - Manual page

https://carlowood.github.io/which/

NAME
       which - shows the full path of (shell) commands.

SYNOPSIS
       which [options] [--] programname [...]

DESCRIPTION
       Which takes one or more arguments. For each of its arguments it prints
       to stdout the full path of the executables that would have been exe-
       cuted when this argument had been entered at the shell prompt. It does
       this by searching for an executable or script in the directories listed
       in the environment variable PATH using the same algorithm as bash(1).

       This man page is generated from the file which.texinfo.

OPTIONS
       --all, -a
           Print all matching executables in PATH, not just the first.

       --read-alias, -i
           Read aliases from stdin, reporting matching ones on stdout. This is
           useful in combination with using an alias for which itself. For
           example
           alias which='alias | which -i'.

       --skip-alias
           Ignore option `--read-alias', if any. This is useful to explicity
           search for normal binaries, while using the `--read-alias' option
           in an alias or function for which.

       --read-functions
           Read shell function definitions from stdin, reporting matching ones
           on stdout. This is useful in combination with using a shell func-
           tion for which itself.  For example:
           which() { declare -f | which --read-functions $@ }
           export -f which

       --skip-functions
           Ignore option `--read-functions', if any. This is useful to explic-
           ity search for normal binaries, while using the `--read-functions'
           option in an alias or function for which.

       --skip-dot
           Skip directories in PATH that start with a dot.

       --skip-tilde
           Skip directories in PATH that start with a tilde and executables
           which reside in the HOME directory.

       --show-dot
           If a directory in PATH starts with a dot and a matching executable
           was found for that path, then print "./programname" rather than the
           full path.

       --show-tilde
           Output a tilde when a directory matches the HOME directory. This
           option is ignored when which is invoked as root.
       --version,-v,-V
           Print version information on standard output then exit success-
           fully.

       --help
           Print usage information on standard output then exit successfully.

RETURN VALUE
       Which returns the number of failed arguments, or -1 when no `program-
       name' was given.

EXAMPLE
       The recommended way to use this utility is by adding an alias (C shell)
       or shell function (Bourne shell) for which like the following:

       [ba]sh:

            which ()
            {
              (alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot $@
            }
            export -f which

       [t]csh:

            alias which 'alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

       This will print the readable ~/ and ./ when starting  which  from  your
       prompt, while still printing the full path when used from a script:

            > which q2
            ~/bin/q2
            > echo `which q2`
            /home/carlo/bin/q2


BUGS
       The  HOME  directory  is determined by looking for the HOME environment
       variable, which aborts when this variable doesn't  exist.   Which  will
       consider  two  equivalent  directories to be different when one of them
       contains a path with a symbolic link.

AUTHOR
       Carlo Wood 

SEE ALSO
       bash(1)



                                                                      WHICH(1)
Examples
>#! /bin/bash
>umask 022
>export PATH=".:~/bin:/bin:/usr/bin"
>export HOME=`(cd ~; pwd)`
>alias which="$HOME/c/which/which"

>touch cat; chmod 755 cat; pwd
/home/carlo/c/which
>alias

>which
Usage: which [options] [--] COMMAND [...]
Write the full path of COMMAND(s) to standard output.

  --version, -[vV] Print version and exit successfully.
  --help,          Print this help and exit successfully.
  --skip-dot       Skip directories in PATH that start with a dot.
  --skip-tilde     Skip directories in PATH that start with a tilde.
  --show-dot       Don't expand a dot to current directory in output.
  --show-tilde     Output a tilde for HOME directory for non-root.
  --tty-only       Stop processing options on the right if not on tty.
  --all, -a        Print all matches in PATH, not just the first
  --read-alias, -i Read list of aliases from stdin.
  --skip-alias     Ignore option --read-alias; don't read stdin.
  --read-functions Read shell functions from stdin.
  --skip-functions Ignore option --read-functions; don't read stdin.

Recommended use is to write the output of (alias; declare -f) to standard
input, so that which can show aliases and shell functions. See which(1) for
examples.

If the options --read-alias and/or --read-functions are specified then the
output can be a full alias or function definition, optionally followed by
the full path of each command used inside of those.

Report bugs to .

>which --version
GNU which v2.21, Copyright (C) 1999 - 2015 Carlo Wood.
GNU which comes with ABSOLUTELY NO WARRANTY;
This program is free software; your freedom to use, change
and distribute this program is protected by the GPL.

>which -- --version
which: no --version in (.:~/bin:/bin:/usr/bin)

>which cat
/home/carlo/c/which/cat

>which --show-tilde cat
~/c/which/cat

>which --show-dot cat
./cat

>which --show-tilde --show-dot cat
./cat

>which --skip-dot cat
/bin/cat

>(cd /bin; which cat)
/bin/cat

>(cd /bin; which --show-dot cat)
./cat

>(cd /bin; PATH=".:/bin:/usr/bin" which --show-dot cat)
./cat

>(cd /bin; PATH="/bin:.:/usr/bin" which --show-dot cat)
/bin/cat

>(cd /bin; PATH=".:/bin:/usr/bin" which --skip-dot --show-dot cat)
/bin/cat

>which ls
/bin/ls

>which xxx
which: no xxx in (.:~/bin:/bin:/usr/bin)

>which ./ls
which: no ls in (.)

>(cd /; which bin/ls)
/bin/ls

>(cd /; which --show-dot bin/ls)
./bin/ls

>(cd /; which --show-dot /bin/ls)
/bin/ls

>(cd /; which --show-dot bin/xxx)
which: no xxx in (./bin)

>(cd /; which --show-dot /bin/xxx)
which: no xxx in (/bin)

>which --all cat
/home/carlo/c/which/cat
/bin/cat

>touch xxx
>which ./xxx
which: no xxx in (.)

>chmod 711 xxx
>which ./xxx
/home/carlo/c/which/xxx

>chmod 655 cat
>which cat
/bin/cat

>su
>chown root cat
>exit
>which cat
/home/carlo/c/which/cat

>su
>chmod 545 cat
>exit
>which cat
/bin/cat

>su
>chgrp bin cat
>exit
>which cat
/home/carlo/c/which/cat

>su
>chmod 541 cat
>exit
>which cat
/home/carlo/c/which/cat
>su
>rm -f cat

>chown root xxx
>exit
>which ./xxx
/home/carlo/c/which/xxx

>su
>chmod 700 xxx
>exit
>which ./xxx
which: no xxx in (.)

>id
uid=1000(carlo) gid=1000(carlo) groups=1000(carlo),24(cdrom),25(floppy),29(audio),30(dip),44(video),46(plugdev),50(staff),104(scanner),107(bluetooth),109(netdev),122(lpadmin)
>ls -l xxx
-rwx------ 1 root carlo 0 Mar 20 17:30 xxx
>su
>chmod 750 xxx
>chgrp carlo xxx
>exit
>which ./xxx
/home/carlo/c/which/xxx

>su
>chgrp bin xxx
>exit
>which ./xxx
which: no xxx in (.)

>alias which='alias | which --tty-only --read-alias --show-tilde --show-dot'
>alias test1='test1'
>alias test2='echo "test2" | cat | sort'
>alias test3='  echo "test2"|cat&sort'
>alias test4='	ls &&sort ||/usr/bin/which || exit'

>which which
alias which='alias | which --tty-only --read-alias --show-tilde --show-dot'
	~/c/which/which
>which test1
alias test1='test1'
>which test2
alias test2='echo test2 | cat | sort'
	/bin/echo
	/bin/cat
	/usr/bin/sort
>which test3
alias test3='  echo test2|cat&sort'
	/bin/echo
	/bin/cat
	/usr/bin/sort
>which test4
alias test4='	ls &&sort ||/usr/bin/which || exit'
	/bin/ls
	/usr/bin/sort
	/usr/bin/which
