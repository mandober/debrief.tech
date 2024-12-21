# Early days of Unix and design of sh

* `Early days of Unix and design of sh`, by Stephen R. Bourne
https://www.youtube.com/watch?v=FI_bZhV7wpI

also
https://www.youtube.com/watch?v=2kEJoWfobpA&list=PL-F6yzP-Y8RWR84892hKU6rvUEI-IxOYF

Abstract of the talk
- my history and background
- how and why we had to re write the shell
- why I wrote my own memory management
- key language design decisions
- where those ideas came from
- what was hard to get right
- system changes we made to accommodate sh
- what the rules were in UNIX group
- what would I do differently today

## Background

Stephen R. Bourne is computer scientist, born in 1944, who is internationally known for creation of the Bourne Shell and his work on the UNIX operating system.

While at Bell Laboratories, Steve designed the standard UNIX command language, aka the shell, known as the *Bourne Shell*. It is the default shell on many OSs even today.

Stephen has a Bachelor's degree in mathematics from King's College London, England. He has a Diploma (or Master's degree) in Computer Science and a Ph.D. in mathematics from Trinity College, Cambridge. While at the University of Cambridge Computer Laboratory he worked on an ALGOL 68 compiler and CAMAL an early algebra system.

After Cambridge, Steve spent nine years at Bell Labs with the Seventh Edition Unix team. As well as the Bourne shell, he wrote the adb debugger and published /The UNIX System/, the second 
book on the UNIX system, intended for a general readership. This book is recognized as a text for the effective use of UNIX.

After Bell Labs, he spent 20 years in senior engineering management positions. At Cisco Systems, he was director of engineering for enterprise network management; at Sun Microsystems, he managed the Solaris 2.0 program; at Digital Equipment Corporation, he developed DEC's first RISC-based workstation; and at Silicon Graphics, he was Director of Software Engineering responsible for the introduction of the IRIS, the company's first graphics workstation.

From 2000 to 2002 he was President of the Association for Computing Machinery. For his work on computing he was made a Fellow of the ACM in 2005. He is also a Fellow of the Royal Astronomical Society.

At present Steve is chief technology officer at Rally Venture Partners, a Menlo Park-based venture capital group in California. He is also the chair of the Editorial Advisory Board for /ACM Queue/, a magazine he started when he was President of the ACM.


---

Rewrite of the very limited shell that didn't support many things, but worse, it wasn't amenable to improvement, so we decide to rewrite the shell. This was in 1975, and the first version came out in 1976.

## sh as a language

- typeless
- strings are first class citizens
- delimited by blanks and reserved chars
- serves as interactive and scripting language
- provides programmable interface for Unix
  - vars and substitution
  - control flow
  - signal management
  - process management
  - eval


First of all, shell is a typeless language. The issue with a shell as a language is that strings must be first class citizens. So you are screwed, I mean. Leaving aside the mechanics of adding types; there was no way to add types easily; you can infer types, but at the time we decided that the last thing anyone would want is to quote the input strings everywhere, because that is what you do in a regular programming language. You don't want to do that in a language that is supposed to be used interactively, but also as a scripting language. So, interactively, there's no way you want to quote all those strings.

this was pressured by the fact that the shell must execute scripts and be used interactively as well. (there was no way we were to make users put quotes everywhere).

This issue with strings was the biggest constraint on the language. 

We managed to put a few things in there that allowed you to do some string processing. These days I've looked at some of the things that have been done since, with people adding all kinds of stuff; string processing that you can do with the dollar sign is crazy.

So but it does provide a program interface. the whole point of the shell is to be the interface to the system, so we were really trying to map the system, so it can manage the system resources through scripting.

it turned out the hard part was the *signal management* and the *process management* (I'll come back to that in a minute).

## Shell design and implementation

we were running on a PDP 1, so performance was really important and some of the things that were done were done simply just to keep the performance tolerable. To make sure that the thing performed well and of course 

With the shell the biggest performance hit is the forking - the amount of memory you're using when you do a fork. So that was, and you'll see why that matters in a minute. Then the other thing I did which I'll defend somewhat, is I did my own memory allocation, and I'll explain why too. So what's the shell got in it it's got all this stuff in it and I think I'll just keep going because you've seen all that and actually 

## Shell features

Here is a complete list of features.

Complete list from 1977 dynamic storage management for variables
- dynamic storage management (for variables &c)
- control structures (at tty as well)
- parameter substitution (+, -, ?, =)
- case pattern matching
- path search
- builtin file name matching (/etc/glob)
- no re-evaluation after $ substitution
- more general patterns (sys/s?/…)
- general trap and fault handling
- control over child signals
- piping into or out of loops
- mail notification
- argument substitution (e.g. nohup(a; b))
- efficient for loop and reading from files
- error recovery from subcommand failure assured
- shell error handling can be controlled
- checks for `cat > x > x` and `cat > x | wc`
- cannot execute and cannot find distinguished
- general redirection, e.g. `2>…`
- input and execution traces; also no execution mode
- `wait` interruptible
- `cat > x` hangs on open can be interrupted

The *signal management* was really a hard work; it took me a good two or three months to understand the Unix signal mechanism and how it affected the shell. When you hit interrupt, you want the shell to do something, or not, depending on what you are trying achive. It took a while to iron it out because there are lots of corner cases. In fact, some of the bugs were only fixed a year or two after the initial release.

Another thing we did was to integrate *patent matching mechanism* into the shell, instead of it being handled by the `/etc/glob` subcommand.

## Unix at the time

- in 1975 we were running Unix VI edition
- did not use the C library
  - mostly cos we didn:t need to
  - also cos of malloc conficts
- tacc and lex were too heave a tools
- no standard I/O, no standard string copying outines
- dir layout had fixed size
- no setjmp and longjump


The state of Unix at the time explains why some of the things were done and the way we did them.

The *standard I/O* didn't exist. There were no *string copying routines* - we had to write them ourselves.

We did have `yacc` and `lex`, but they were too heavy and *parsing the shell syntax* is actually not that difficult; it's only a couple of pages of C.

By the time Unix System VII edition came along that had these things, I was done. That was 1978-79 and I was going to do a rewrite in order to use the *standard I/O*, but in the end I didn't do it. Because by that time, I have written my own *memory allocator*, so it didn't make sense to rewrite it - that would be too much work - so that's why I didn't use `malloc`.

Then, there was no 'setjump' and 'longjump', so Dennis (Ritchie) added those for me. Because unless you could jump somewhere safe, there was no way to do *error recovery* in the shell. 

## Memory management
