# IFS

https://www.in-ulm.de/~mascheck/various/ifs/


## Re: IFS valid characters
https://www.mail-archive.com/bug-bash@gnu.org/msg05283.html


Stephane CHAZELAS Sun, 15 Mar 2009 06:40:21 -0700

2009-03-10, 15:43(-04), Chet Ramey:
>> What are the valid charactes for the IFS variable? In particular, is '\0' a 
>> valid one? 
>
> Technically, yes, but in practice it's not useful.  There are too many things
> represented as C strings to make NUL work right.
[...]

And to answer the rest of the question. In bash, any character
except NUL is allowed in $IFS.

Some points that should be noted:
  - the SPC, TAB and NL characters are treated specially.
  - contrary to in the Bourne shell, pdksh or zsh, IFS is an
    internal field terminator, not separator ("a:b:" is split
    into "a" and "b", not "a" and "b" and "" which makes it
    inappropriate to split $PATH for instance) (in the Bourne
    shell, it splits into "a" and "b" as well but that's because
    empty elements are removed there)
  - another difference from the Bourne shell, when IFS is empty,
    no splitting occurs except for $* and $@ (and $...@]}...)
  - an unset IFS is equivalent to IFS=$' \t\n'

Other differences from other shells
  - contrary to ksh93 or zsh, doubling the IFS white space
    characters doesn't disable their special treatment.
  - zsh supports NUL in its shell variables and therefore also
    in $IFS, and NUL is in the default value of IFS there.
  - word splitting is not performed by default upon variable
    expansion in zsh (unless in sh or ksh emulation)
  - contrary to pdksh derived shells and zsh, bash performs word
    splitting upon arithmetic expansion
  - contrary to the Bourne shell, $* is made up of the
    concatenation of the positional parameters with the first
    character of $IFS (with space in the Bourne shell regardless
    of $IFS) (and not that "a", "b" becomes "a:b", not "a:b:".
  - contrary to ash, pdksh and zsh, the above is not true of $@
  - and contrary to ash and zsh, in bash, IFS=; set a b; echo $*
    doesn't output ab.
  - other oddities:
    $ bash -c 'IFS=; a=abcd; echo "${a#$*}"' x a b
    abcd
    (that one could be considered as a bug)
    $ ARGV0=sh bash -c 'IFS=; case ab in $*) echo yes;; esac' x a b
    $ ARGV0=sh bash -c 'IFS=; case $* in ab) echo yes;; esac' x a b
    yes

```
$ IFS=':'
$ v=":a:b"
$ arr=($v)
$ declare -p arr
declare -a arr='([0]="" [1]="a" [2]="b")'
$ v="a:b:"
$ arr=($v)
$ declare -p arr
declare -a arr='([0]="a" [1]="b")'
```

Yes, hence "internal field terminator" and not "internal field
introducer"
