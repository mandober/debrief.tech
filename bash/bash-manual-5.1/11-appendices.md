Appendix A Reporting Bugs
*************************

Please report all bugs you find in Bash. But first, you should make
sure that it really is a bug, and that it appears in the latest version
of Bash. The latest version of Bash is always available for FTP from
<ftp://ftp.gnu.org/pub/gnu/bash/>.

Once you have determined that a bug actually exists, use the
'bashbug' command to submit a bug report. If you have a fix, you are
encouraged to mail that as well!  Suggestions and 'philosophical' bug
reports may be mailed to <bug-bash@gnu.org> or posted to the Usenet
newsgroup 'gnu.bash.bug'.

All bug reports should include:
* The version number of Bash.
* The hardware and operating system.
* The compiler used to compile Bash.
* A description of the bug behaviour.
* A short script or 'recipe' which exercises the bug and may be used
to reproduce it.

'bashbug' inserts the first three items automatically into the template
it provides for filing a bug report.

Please send all reports concerning this manual to <bug-bash@gnu.org>.

Appendix B Major Differences From The Bourne Shell
**************************************************

Bash implements essentially the same grammar, parameter and variable
expansion, redirection, and quoting as the Bourne Shell. Bash uses the
POSIX standard as the specification of how these features are to be
implemented. There are some differences between the traditional Bourne
shell and Bash; this section quickly details the differences of
significance. A number of these differences are explained in greater
depth in previous sections. This section uses the version of 'sh'
included in SVR4.2 (the last version of the historical Bourne shell) as
the baseline reference.

* Bash is POSIX-conformant, even where the POSIX specification
differs from traditional 'sh' behavior (Bash POSIX Mode).

* Bash has multi-character invocation options (Invoking
Bash).

* Bash has command-line editing (Command Line Editing) and
the 'bind' builtin.

* Bash provides a programmable word completion mechanism (*note
Programmable Completion), and builtin commands 'complete',
'compgen', and 'compopt', to manipulate it.

* Bash has command history (Bash History Facilities) and the
'history' and 'fc' builtins to manipulate it. The Bash history
list maintains timestamp information and uses the value of the
'HISTTIMEFORMAT' variable to display it.

* Bash implements 'csh'-like history expansion (History
Interaction).

* Bash has one-dimensional array variables (Arrays), and the
appropriate variable expansions and assignment syntax to use them.
Several of the Bash builtins take options to act on arrays. Bash
provides a number of built-in array variables.

* The '$'...'' quoting syntax, which expands ANSI-C backslash-escaped
characters in the text between the single quotes, is supported
(ANSI-C Quoting).

* Bash supports the '$"..."' quoting syntax to do locale-specific
translation of the characters between the double quotes. The '-D',
'--dump-strings', and '--dump-po-strings' invocation options list
the translatable strings found in a script (Locale
Translation).

* Bash implements the '!' keyword to negate the return value of a
pipeline (Pipelines). Very useful when an 'if' statement
needs to act only if a test fails. The Bash '-o pipefail' option
to 'set' will cause a pipeline to return a failure status if any
command fails.

* Bash has the 'time' reserved word and command timing (*note
Pipelines). The display of the timing statistics may be
controlled with the 'TIMEFORMAT' variable.

* Bash implements the 'for (( EXPR1 ; EXPR2 ; EXPR3 ))' arithmetic
for command, similar to the C language (Looping
Constructs).

* Bash includes the 'select' compound command, which allows the
generation of simple menus (Conditional Constructs).

* Bash includes the '[[' compound command, which makes conditional
testing part of the shell grammar (Conditional Constructs),
including optional regular expression matching.

* Bash provides optional case-insensitive matching for the 'case' and
'[[' constructs.

* Bash includes brace expansion (Brace Expansion) and tilde
expansion (Tilde Expansion).

* Bash implements command aliases and the 'alias' and 'unalias'
builtins (Aliases).

* Bash provides shell arithmetic, the '((' compound command (*note
Conditional Constructs), and arithmetic expansion (Shell
Arithmetic).

* Variables present in the shell's initial environment are
automatically exported to child processes. The Bourne shell does
not normally do this unless the variables are explicitly marked
using the 'export' command.

* Bash supports the '+=' assignment operator, which appends to the
value of the variable named on the left hand side.

* Bash includes the POSIX pattern removal '%', '#', '%%' and '##'
expansions to remove leading or trailing substrings from variable
values (Shell Parameter Expansion).

* The expansion '${#xx}', which returns the length of '${xx}', is
supported (Shell Parameter Expansion).

* The expansion '${var:'OFFSET'[:'LENGTH']}', which expands to the
substring of 'var''s value of length LENGTH, beginning at OFFSET,
is present (Shell Parameter Expansion).

* The expansion '${var/[/]'PATTERN'[/'REPLACEMENT']}', which matches
PATTERN and replaces it with REPLACEMENT in the value of 'var', is
available (Shell Parameter Expansion).

* The expansion '${!PREFIX*}' expansion, which expands to the names
of all shell variables whose names begin with PREFIX, is available
(Shell Parameter Expansion).

* Bash has INDIRECT variable expansion using '${!word}' (Shell
Parameter Expansion).

* Bash can expand positional parameters beyond '$9' using '${NUM}'.

* The POSIX '$()' form of command substitution is implemented (*note
Command Substitution), and preferred to the Bourne shell's '``'
(which is also implemented for backwards compatibility).

* Bash has process substitution (Process Substitution).

* Bash automatically assigns variables that provide information about
the current user ('UID', 'EUID', and 'GROUPS'), the current host
('HOSTTYPE', 'OSTYPE', 'MACHTYPE', and 'HOSTNAME'), and the
instance of Bash that is running ('BASH', 'BASH_VERSION', and
'BASH_VERSINFO'). Bash Variables::, for details.

* The 'IFS' variable is used to split only the results of expansion,
not all words (Word Splitting). This closes a longstanding
shell security hole.

* The filename expansion bracket expression code uses '!' and '^' to
negate the set of characters between the brackets. The Bourne
shell uses only '!'.

* Bash implements the full set of POSIX filename expansion operators,
including CHARACTER CLASSES, EQUIVALENCE CLASSES, and COLLATING
SYMBOLS (Filename Expansion).

* Bash implements extended pattern matching features when the
'extglob' shell option is enabled (Pattern Matching).

* It is possible to have a variable and a function with the same
name; 'sh' does not separate the two name spaces.

* Bash functions are permitted to have local variables using the
'local' builtin, and thus useful recursive functions may be written
(Bash Builtins).

* Variable assignments preceding commands affect only that command,
even builtins and functions (Environment). In 'sh', all
variable assignments preceding commands are global unless the
command is executed from the file system.

* Bash performs filename expansion on filenames specified as operands
to input and output redirection operators (Redirections).

* Bash contains the '<>' redirection operator, allowing a file to be
opened for both reading and writing, and the '&>' redirection
operator, for directing standard output and standard error to the
same file (Redirections).

* Bash includes the '<<<' redirection operator, allowing a string to
be used as the standard input to a command.

* Bash implements the '[n]<&WORD' and '[n]>&WORD' redirection
operators, which move one file descriptor to another.

* Bash treats a number of filenames specially when they are used in
redirection operators (Redirections).

* Bash can open network connections to arbitrary machines and
services with the redirection operators (Redirections).

* The 'noclobber' option is available to avoid overwriting existing
files with output redirection (The Set Builtin). The '>|'
redirection operator may be used to override 'noclobber'.

* The Bash 'cd' and 'pwd' builtins (Bourne Shell Builtins)
each take '-L' and '-P' options to switch between logical and
physical modes.

* Bash allows a function to override a builtin with the same name,
and provides access to that builtin's functionality within the
function via the 'builtin' and 'command' builtins (Bash
Builtins).

* The 'command' builtin allows selective disabling of functions when
command lookup is performed (Bash Builtins).

* Individual builtins may be enabled or disabled using the 'enable'
builtin (Bash Builtins).

* The Bash 'exec' builtin takes additional options that allow users
to control the contents of the environment passed to the executed
command, and what the zeroth argument to the command is to be
(Bourne Shell Builtins).

* Shell functions may be exported to children via the environment
using 'export -f' (Shell Functions).

* The Bash 'export', 'readonly', and 'declare' builtins can take a
'-f' option to act on shell functions, a '-p' option to display
variables with various attributes set in a format that can be used
as shell input, a '-n' option to remove various variable
attributes, and 'name=value' arguments to set variable attributes
and values simultaneously.

* The Bash 'hash' builtin allows a name to be associated with an
arbitrary filename, even when that filename cannot be found by
searching the '$PATH', using 'hash -p' (Bourne Shell
Builtins).

* Bash includes a 'help' builtin for quick reference to shell
facilities (Bash Builtins).

* The 'printf' builtin is available to display formatted output
(Bash Builtins).

* The Bash 'read' builtin (Bash Builtins) will read a line
ending in '\' with the '-r' option, and will use the 'REPLY'
variable as a default if no non-option arguments are supplied. The
Bash 'read' builtin also accepts a prompt string with the '-p'
option and will use Readline to obtain the line when given the '-e'
option. The 'read' builtin also has additional options to control
input: the '-s' option will turn off echoing of input characters as
they are read, the '-t' option will allow 'read' to time out if
input does not arrive within a specified number of seconds, the
'-n' option will allow reading only a specified number of
characters rather than a full line, and the '-d' option will read
until a particular character rather than newline.

* The 'return' builtin may be used to abort execution of scripts
executed with the '.' or 'source' builtins (Bourne Shell
Builtins).

* Bash includes the 'shopt' builtin, for finer control of shell
optional capabilities (The Shopt Builtin), and allows these
options to be set and unset at shell invocation (Invoking
Bash).

* Bash has much more optional behavior controllable with the 'set'
builtin (The Set Builtin).

* The '-x' ('xtrace') option displays commands other than simple
commands when performing an execution trace (The Set
Builtin).

* The 'test' builtin (Bourne Shell Builtins) is slightly
different, as it implements the POSIX algorithm, which specifies
the behavior based on the number of arguments.

* Bash includes the 'caller' builtin, which displays the context of
any active subroutine call (a shell function or a script executed
with the '.' or 'source' builtins). This supports the bash
debugger.

* The 'trap' builtin (Bourne Shell Builtins) allows a 'DEBUG'
pseudo-signal specification, similar to 'EXIT'. Commands specified
with a 'DEBUG' trap are executed before every simple command, 'for'
command, 'case' command, 'select' command, every arithmetic 'for'
command, and before the first command executes in a shell function.
The 'DEBUG' trap is not inherited by shell functions unless the
function has been given the 'trace' attribute or the 'functrace'
option has been enabled using the 'shopt' builtin. The 'extdebug'
shell option has additional effects on the 'DEBUG' trap.

The 'trap' builtin (Bourne Shell Builtins) allows an 'ERR'
pseudo-signal specification, similar to 'EXIT' and 'DEBUG'.
Commands specified with an 'ERR' trap are executed after a simple
command fails, with a few exceptions. The 'ERR' trap is not
inherited by shell functions unless the '-o errtrace' option to the
'set' builtin is enabled.

The 'trap' builtin (Bourne Shell Builtins) allows a
'RETURN' pseudo-signal specification, similar to 'EXIT' and
'DEBUG'. Commands specified with an 'RETURN' trap are executed
before execution resumes after a shell function or a shell script
executed with '.' or 'source' returns. The 'RETURN' trap is not
inherited by shell functions unless the function has been given the
'trace' attribute or the 'functrace' option has been enabled using
the 'shopt' builtin.

* The Bash 'type' builtin is more extensive and gives more
information about the names it finds (Bash Builtins).

* The Bash 'umask' builtin permits a '-p' option to cause the output
to be displayed in the form of a 'umask' command that may be reused
as input (Bourne Shell Builtins).

* Bash implements a 'csh'-like directory stack, and provides the
'pushd', 'popd', and 'dirs' builtins to manipulate it (The
Directory Stack). Bash also makes the directory stack visible as
the value of the 'DIRSTACK' shell variable.

* Bash interprets special backslash-escaped characters in the prompt
strings when interactive (Controlling the Prompt).

* The Bash restricted mode is more useful (The Restricted
Shell); the SVR4.2 shell restricted mode is too limited.

* The 'disown' builtin can remove a job from the internal shell job
table (Job Control Builtins) or suppress the sending of
'SIGHUP' to a job when the shell exits as the result of a 'SIGHUP'.

* Bash includes a number of features to support a separate debugger
for shell scripts.

* The SVR4.2 shell has two privilege-related builtins ('mldmode' and
'priv') not present in Bash.

* Bash does not have the 'stop' or 'newgrp' builtins.

* Bash does not use the 'SHACCT' variable or perform shell
accounting.

* The SVR4.2 'sh' uses a 'TIMEOUT' variable like Bash uses 'TMOUT'.

More features unique to Bash may be found in Bash Features::.

B.1 Implementation Differences From The SVR4.2 Shell
====================================================

Since Bash is a completely new implementation, it does not suffer from
many of the limitations of the SVR4.2 shell. For instance:

* Bash does not fork a subshell when redirecting into or out of a
shell control structure such as an 'if' or 'while' statement.

* Bash does not allow unbalanced quotes. The SVR4.2 shell will
silently insert a needed closing quote at 'EOF' under certain
circumstances. This can be the cause of some hard-to-find errors.

* The SVR4.2 shell uses a baroque memory management scheme based on
trapping 'SIGSEGV'. If the shell is started from a process with
'SIGSEGV' blocked (e.g., by using the 'system()' C library function
call), it misbehaves badly.

* In a questionable attempt at security, the SVR4.2 shell, when
invoked without the '-p' option, will alter its real and effective
UID and GID if they are less than some magic threshold value,
commonly 100. This can lead to unexpected results.

* The SVR4.2 shell does not allow users to trap 'SIGSEGV', 'SIGALRM',
or 'SIGCHLD'.

* The SVR4.2 shell does not allow the 'IFS', 'MAILCHECK', 'PATH',
'PS1', or 'PS2' variables to be unset.

* The SVR4.2 shell treats '^' as the undocumented equivalent of '|'.

* Bash allows multiple option arguments when it is invoked ('-x -v');
the SVR4.2 shell allows only one option argument ('-xv'). In fact,
some versions of the shell dump core if the second argument begins
with a '-'.

* The SVR4.2 shell exits a script if any builtin fails; Bash exits a
script only if one of the POSIX special builtins fails, and only
for certain failures, as enumerated in the POSIX standard.

* The SVR4.2 shell behaves differently when invoked as 'jsh' (it
turns on job control).

Appendix C GNU Free Documentation License
*****************************************

Version 1.3, 3 November 2008

Copyright (C) 2000, 2001, 2002, 2007, 2008 Free Software Foundation, Inc.
<http://fsf.org/>

Everyone is permitted to copy and distribute verbatim copies
of this license document, but changing it is not allowed.

0. PREAMBLE

The purpose of this License is to make a manual, textbook, or other
functional and useful document "free" in the sense of freedom: to
assure everyone the effective freedom to copy and redistribute it,
with or without modifying it, either commercially or
noncommercially. Secondarily, this License preserves for the
author and publisher a way to get credit for their work, while not
being considered responsible for modifications made by others.

This License is a kind of "copyleft", which means that derivative
works of the document must themselves be free in the same sense.
It complements the GNU General Public License, which is a copyleft
license designed for free software.

We have designed this License in order to use it for manuals for
free software, because free software needs free documentation: a
free program should come with manuals providing the same freedoms
that the software does. But this License is not limited to
software manuals; it can be used for any textual work, regardless
of subject matter or whether it is published as a printed book. We
recommend this License principally for works whose purpose is
instruction or reference.

1. APPLICABILITY AND DEFINITIONS

This License applies to any manual or other work, in any medium,
that contains a notice placed by the copyright holder saying it can
be distributed under the terms of this License. Such a notice
grants a world-wide, royalty-free license, unlimited in duration,
to use that work under the conditions stated herein. The
"Document", below, refers to any such manual or work. Any member
of the public is a licensee, and is addressed as "you". You accept
the license if you copy, modify or distribute the work in a way
requiring permission under copyright law.

A "Modified Version" of the Document means any work containing the
Document or a portion of it, either copied verbatim, or with
modifications and/or translated into another language.

A "Secondary Section" is a named appendix or a front-matter section
of the Document that deals exclusively with the relationship of the
publishers or authors of the Document to the Document's overall
subject (or to related matters) and contains nothing that could
fall directly within that overall subject. (Thus, if the Document
is in part a textbook of mathematics, a Secondary Section may not
explain any mathematics.)  The relationship could be a matter of
historical connection with the subject or with related matters, or
of legal, commercial, philosophical, ethical or political position
regarding them.

The "Invariant Sections" are certain Secondary Sections whose
titles are designated, as being those of Invariant Sections, in the
notice that says that the Document is released under this License.
If a section does not fit the above definition of Secondary then it
is not allowed to be designated as Invariant. The Document may
contain zero Invariant Sections. If the Document does not identify
any Invariant Sections then there are none.

The "Cover Texts" are certain short passages of text that are
listed, as Front-Cover Texts or Back-Cover Texts, in the notice
that says that the Document is released under this License. A
Front-Cover Text may be at most 5 words, and a Back-Cover Text may
be at most 25 words.

A "Transparent" copy of the Document means a machine-readable copy,
represented in a format whose specification is available to the
general public, that is suitable for revising the document
straightforwardly with generic text editors or (for images composed
of pixels) generic paint programs or (for drawings) some widely
available drawing editor, and that is suitable for input to text
formatters or for automatic translation to a variety of formats
suitable for input to text formatters. A copy made in an otherwise
Transparent file format whose markup, or absence of markup, has
been arranged to thwart or discourage subsequent modification by
readers is not Transparent. An image format is not Transparent if
used for any substantial amount of text. A copy that is not
"Transparent" is called "Opaque".

Examples of suitable formats for Transparent copies include plain
ASCII without markup, Texinfo input format, LaTeX input format,
SGML or XML using a publicly available DTD, and standard-conforming
simple HTML, PostScript or PDF designed for human modification.
Examples of transparent image formats include PNG, XCF and JPG.
Opaque formats include proprietary formats that can be read and
edited only by proprietary word processors, SGML or XML for which
the DTD and/or processing tools are not generally available, and
the machine-generated HTML, PostScript or PDF produced by some word
processors for output purposes only.

The "Title Page" means, for a printed book, the title page itself,
plus such following pages as are needed to hold, legibly, the
material this License requires to appear in the title page. For
works in formats which do not have any title page as such, "Title
Page" means the text near the most prominent appearance of the
work's title, preceding the beginning of the body of the text.

The "publisher" means any person or entity that distributes copies
of the Document to the public.

A section "Entitled XYZ" means a named subunit of the Document
whose title either is precisely XYZ or contains XYZ in parentheses
following text that translates XYZ in another language. (Here XYZ
stands for a specific section name mentioned below, such as
"Acknowledgements", "Dedications", "Endorsements", or "History".)
To "Preserve the Title" of such a section when you modify the
Document means that it remains a section "Entitled XYZ" according
to this definition.

The Document may include Warranty Disclaimers next to the notice
which states that this License applies to the Document. These
Warranty Disclaimers are considered to be included by reference in
this License, but only as regards disclaiming warranties: any other
implication that these Warranty Disclaimers may have is void and
has no effect on the meaning of this License.

2. VERBATIM COPYING

You may copy and distribute the Document in any medium, either
commercially or noncommercially, provided that this License, the
copyright notices, and the license notice saying this License
applies to the Document are reproduced in all copies, and that you
add no other conditions whatsoever to those of this License. You
may not use technical measures to obstruct or control the reading
or further copying of the copies you make or distribute. However,
you may accept compensation in exchange for copies. If you
distribute a large enough number of copies you must also follow the
conditions in section 3.

You may also lend copies, under the same conditions stated above,
and you may publicly display copies.

3. COPYING IN QUANTITY

If you publish printed copies (or copies in media that commonly
have printed covers) of the Document, numbering more than 100, and
the Document's license notice requires Cover Texts, you must
enclose the copies in covers that carry, clearly and legibly, all
these Cover Texts: Front-Cover Texts on the front cover, and
Back-Cover Texts on the back cover. Both covers must also clearly
and legibly identify you as the publisher of these copies. The
front cover must present the full title with all words of the title
equally prominent and visible. You may add other material on the
covers in addition. Copying with changes limited to the covers, as
long as they preserve the title of the Document and satisfy these
conditions, can be treated as verbatim copying in other respects.

If the required texts for either cover are too voluminous to fit
legibly, you should put the first ones listed (as many as fit
reasonably) on the actual cover, and continue the rest onto
adjacent pages.

If you publish or distribute Opaque copies of the Document
numbering more than 100, you must either include a machine-readable
Transparent copy along with each Opaque copy, or state in or with
each Opaque copy a computer-network location from which the general
network-using public has access to download using public-standard
network protocols a complete Transparent copy of the Document, free
of added material. If you use the latter option, you must take
reasonably prudent steps, when you begin distribution of Opaque
copies in quantity, to ensure that this Transparent copy will
remain thus accessible at the stated location until at least one
year after the last time you distribute an Opaque copy (directly or
through your agents or retailers) of that edition to the public.

It is requested, but not required, that you contact the authors of
the Document well before redistributing any large number of copies,
to give them a chance to provide you with an updated version of the
Document.

4. MODIFICATIONS

You may copy and distribute a Modified Version of the Document
under the conditions of sections 2 and 3 above, provided that you
release the Modified Version under precisely this License, with the
Modified Version filling the role of the Document, thus licensing
distribution and modification of the Modified Version to whoever
possesses a copy of it. In addition, you must do these things in
the Modified Version:

A. Use in the Title Page (and on the covers, if any) a title
distinct from that of the Document, and from those of previous
versions (which should, if there were any, be listed in the
History section of the Document). You may use the same title
as a previous version if the original publisher of that
version gives permission.

B. List on the Title Page, as authors, one or more persons or
entities responsible for authorship of the modifications in
the Modified Version, together with at least five of the
principal authors of the Document (all of its principal
authors, if it has fewer than five), unless they release you
from this requirement.

C. State on the Title page the name of the publisher of the
Modified Version, as the publisher.

D. Preserve all the copyright notices of the Document.

E. Add an appropriate copyright notice for your modifications
adjacent to the other copyright notices.

F. Include, immediately after the copyright notices, a license
notice giving the public permission to use the Modified
Version under the terms of this License, in the form shown in
the Addendum below.

G. Preserve in that license notice the full lists of Invariant
Sections and required Cover Texts given in the Document's
license notice.

H. Include an unaltered copy of this License.

I. Preserve the section Entitled "History", Preserve its Title,
and add to it an item stating at least the title, year, new
authors, and publisher of the Modified Version as given on the
Title Page. If there is no section Entitled "History" in the
Document, create one stating the title, year, authors, and
publisher of the Document as given on its Title Page, then add
an item describing the Modified Version as stated in the
previous sentence.

J. Preserve the network location, if any, given in the Document
for public access to a Transparent copy of the Document, and
likewise the network locations given in the Document for
previous versions it was based on. These may be placed in the
"History" section. You may omit a network location for a work
that was published at least four years before the Document
itself, or if the original publisher of the version it refers
to gives permission.

K. For any section Entitled "Acknowledgements" or "Dedications",
Preserve the Title of the section, and preserve in the section
all the substance and tone of each of the contributor
acknowledgements and/or dedications given therein.

L. Preserve all the Invariant Sections of the Document, unaltered
in their text and in their titles. Section numbers or the
equivalent are not considered part of the section titles.

M. Delete any section Entitled "Endorsements". Such a section
may not be included in the Modified Version.

N. Do not retitle any existing section to be Entitled
"Endorsements" or to conflict in title with any Invariant
Section.

O. Preserve any Warranty Disclaimers.

If the Modified Version includes new front-matter sections or
appendices that qualify as Secondary Sections and contain no
material copied from the Document, you may at your option designate
some or all of these sections as invariant. To do this, add their
titles to the list of Invariant Sections in the Modified Version's
license notice. These titles must be distinct from any other
section titles.

You may add a section Entitled "Endorsements", provided it contains
nothing but endorsements of your Modified Version by various
parties--for example, statements of peer review or that the text
has been approved by an organization as the authoritative
definition of a standard.

You may add a passage of up to five words as a Front-Cover Text,
and a passage of up to 25 words as a Back-Cover Text, to the end of
the list of Cover Texts in the Modified Version. Only one passage
of Front-Cover Text and one of Back-Cover Text may be added by (or
through arrangements made by) any one entity. If the Document
already includes a cover text for the same cover, previously added
by you or by arrangement made by the same entity you are acting on
behalf of, you may not add another; but you may replace the old
one, on explicit permission from the previous publisher that added
the old one.

The author(s) and publisher(s) of the Document do not by this
License give permission to use their names for publicity for or to
assert or imply endorsement of any Modified Version.

5. COMBINING DOCUMENTS

You may combine the Document with other documents released under
this License, under the terms defined in section 4 above for
modified versions, provided that you include in the combination all
of the Invariant Sections of all of the original documents,
unmodified, and list them all as Invariant Sections of your
combined work in its license notice, and that you preserve all
their Warranty Disclaimers.

The combined work need only contain one copy of this License, and
multiple identical Invariant Sections may be replaced with a single
copy. If there are multiple Invariant Sections with the same name
but different contents, make the title of each such section unique
by adding at the end of it, in parentheses, the name of the
original author or publisher of that section if known, or else a
unique number. Make the same adjustment to the section titles in
the list of Invariant Sections in the license notice of the
combined work.

In the combination, you must combine any sections Entitled
"History" in the various original documents, forming one section
Entitled "History"; likewise combine any sections Entitled
"Acknowledgements", and any sections Entitled "Dedications". You
must delete all sections Entitled "Endorsements."

6. COLLECTIONS OF DOCUMENTS

You may make a collection consisting of the Document and other
documents released under this License, and replace the individual
copies of this License in the various documents with a single copy
that is included in the collection, provided that you follow the
rules of this License for verbatim copying of each of the documents
in all other respects.

You may extract a single document from such a collection, and
distribute it individually under this License, provided you insert
a copy of this License into the extracted document, and follow this
License in all other respects regarding verbatim copying of that
document.

7. AGGREGATION WITH INDEPENDENT WORKS

A compilation of the Document or its derivatives with other
separate and independent documents or works, in or on a volume of a
storage or distribution medium, is called an "aggregate" if the
copyright resulting from the compilation is not used to limit the
legal rights of the compilation's users beyond what the individual
works permit. When the Document is included in an aggregate, this
License does not apply to the other works in the aggregate which
are not themselves derivative works of the Document.

If the Cover Text requirement of section 3 is applicable to these
copies of the Document, then if the Document is less than one half
of the entire aggregate, the Document's Cover Texts may be placed
on covers that bracket the Document within the aggregate, or the
electronic equivalent of covers if the Document is in electronic
form. Otherwise they must appear on printed covers that bracket
the whole aggregate.

8. TRANSLATION

Translation is considered a kind of modification, so you may
distribute translations of the Document under the terms of section
4. Replacing Invariant Sections with translations requires special
permission from their copyright holders, but you may include
translations of some or all Invariant Sections in addition to the
original versions of these Invariant Sections. You may include a
translation of this License, and all the license notices in the
Document, and any Warranty Disclaimers, provided that you also
include the original English version of this License and the
original versions of those notices and disclaimers. In case of a
disagreement between the translation and the original version of
this License or a notice or disclaimer, the original version will
prevail.

If a section in the Document is Entitled "Acknowledgements",
"Dedications", or "History", the requirement (section 4) to
Preserve its Title (section 1) will typically require changing the
actual title.

9. TERMINATION

You may not copy, modify, sublicense, or distribute the Document
except as expressly provided under this License. Any attempt
otherwise to copy, modify, sublicense, or distribute it is void,
and will automatically terminate your rights under this License.

However, if you cease all violation of this License, then your
license from a particular copyright holder is reinstated (a)
provisionally, unless and until the copyright holder explicitly and
finally terminates your license, and (b) permanently, if the
copyright holder fails to notify you of the violation by some
reasonable means prior to 60 days after the cessation.

Moreover, your license from a particular copyright holder is
reinstated permanently if the copyright holder notifies you of the
violation by some reasonable means, this is the first time you have
received notice of violation of this License (for any work) from
that copyright holder, and you cure the violation prior to 30 days
after your receipt of the notice.

Termination of your rights under this section does not terminate
the licenses of parties who have received copies or rights from you
under this License. If your rights have been terminated and not
permanently reinstated, receipt of a copy of some or all of the
same material does not give you any rights to use it.

10. FUTURE REVISIONS OF THIS LICENSE

The Free Software Foundation may publish new, revised versions of
the GNU Free Documentation License from time to time. Such new
versions will be similar in spirit to the present version, but may
differ in detail to address new problems or concerns. See
<http://www.gnu.org/copyleft/>.

Each version of the License is given a distinguishing version
number. If the Document specifies that a particular numbered
version of this License "or any later version" applies to it, you
have the option of following the terms and conditions either of
that specified version or of any later version that has been
published (not as a draft) by the Free Software Foundation. If the
Document does not specify a version number of this License, you may
choose any version ever published (not as a draft) by the Free
Software Foundation. If the Document specifies that a proxy can
decide which future versions of this License can be used, that
proxy's public statement of acceptance of a version permanently
authorizes you to choose that version for the Document.

11. RELICENSING

"Massive Multiauthor Collaboration Site" (or "MMC Site") means any
World Wide Web server that publishes copyrightable works and also
provides prominent facilities for anybody to edit those works. A
public wiki that anybody can edit is an example of such a server.
A "Massive Multiauthor Collaboration" (or "MMC") contained in the
site means any set of copyrightable works thus published on the MMC
site.

"CC-BY-SA" means the Creative Commons Attribution-Share Alike 3.0
license published by Creative Commons Corporation, a not-for-profit
corporation with a principal place of business in San Francisco,
California, as well as future copyleft versions of that license
published by that same organization.

"Incorporate" means to publish or republish a Document, in whole or
in part, as part of another Document.

An MMC is "eligible for relicensing" if it is licensed under this
License, and if all works that were first published under this
License somewhere other than this MMC, and subsequently
incorporated in whole or in part into the MMC, (1) had no cover
texts or invariant sections, and (2) were thus incorporated prior
to November 1, 2008.

The operator of an MMC Site may republish an MMC contained in the
site under CC-BY-SA on the same site at any time before August 1,
2009, provided the MMC is eligible for relicensing.

ADDENDUM: How to use this License for your documents
====================================================

To use this License in a document you have written, include a copy of
the License in the document and put the following copyright and license
notices just after the title page:

Copyright (C)  YEAR  YOUR NAME.
Permission is granted to copy, distribute and/or modify this document
under the terms of the GNU Free Documentation License, Version 1.3
or any later version published by the Free Software Foundation;
with no Invariant Sections, no Front-Cover Texts, and no Back-Cover
Texts. A copy of the license is included in the section entitled ``GNU
Free Documentation License''.

If you have Invariant Sections, Front-Cover Texts and Back-Cover
Texts, replace the "with...Texts."  line with this:

with the Invariant Sections being LIST THEIR TITLES, with
the Front-Cover Texts being LIST, and with the Back-Cover Texts
being LIST.

If you have Invariant Sections without Cover Texts, or some other
combination of the three, merge those two alternatives to suit the
situation.

If your document contains nontrivial examples of program code, we
recommend releasing these examples in parallel under your choice of free
software license, such as the GNU General Public License, to permit
their use in free software.

Appendix D Indexes
******************

D.1 Index of Shell Builtin Commands
===================================

* Menu:

* .:                                     Bourne Shell Builtins.
(line 2803)
* ::                                     Bourne Shell Builtins.
(line 2797)
* [:                                     Bourne Shell Builtins.
(line 3056)
* alias:                                 Bash Builtins.     (line 3232)
* bg:                                    Job Control Builtins.
(line 6868)
* bind:                                  Bash Builtins.     (line 3242)
* break:                                 Bourne Shell Builtins.
(line 2822)
* builtin:                               Bash Builtins.     (line 3325)
* caller:                                Bash Builtins.     (line 3334)
* cd:                                    Bourne Shell Builtins.
(line 2830)
* command:                               Bash Builtins.     (line 3351)
* compgen:                               Programmable Completion Builtins.
(line 8662)
* complete:                              Programmable Completion Builtins.
(line 8680)
* compopt:                               Programmable Completion Builtins.
(line 8887)
* continue:                              Bourne Shell Builtins.
(line 2871)
* declare:                               Bash Builtins.     (line 3371)
* dirs:                                  Directory Stack Builtins.
(line 6188)
* disown:                                Job Control Builtins.
(line 6962)
* echo:                                  Bash Builtins.     (line 3474)
* enable:                                Bash Builtins.     (line 3523)
* eval:                                  Bourne Shell Builtins.
(line 2880)
* exec:                                  Bourne Shell Builtins.
(line 2888)
* exit:                                  Bourne Shell Builtins.
(line 2906)
* export:                                Bourne Shell Builtins.
(line 2913)
* fc:                                    Bash History Builtins.
(line 9085)
* fg:                                    Job Control Builtins.
(line 6878)
* getopts:                               Bourne Shell Builtins.
(line 2929)
* hash:                                  Bourne Shell Builtins.
(line 2973)
* help:                                  Bash Builtins.     (line 3552)
* history:                               Bash History Builtins.
(line 9121)
* jobs:                                  Job Control Builtins.
(line 6888)
* kill:                                  Job Control Builtins.
(line 6919)
* let:                                   Bash Builtins.     (line 3571)
* local:                                 Bash Builtins.     (line 3579)
* logout:                                Bash Builtins.     (line 3595)
* mapfile:                               Bash Builtins.     (line 3600)
* popd:                                  Directory Stack Builtins.
(line 6216)
* printf:                                Bash Builtins.     (line 3646)
* pushd:                                 Directory Stack Builtins.
(line 6234)
* pwd:                                   Bourne Shell Builtins.
(line 2993)
* read:                                  Bash Builtins.     (line 3695)
* readarray:                             Bash Builtins.     (line 3791)
* readonly:                              Bourne Shell Builtins.
(line 3003)
* return:                                Bourne Shell Builtins.
(line 3022)
* set:                                   The Set Builtin.   (line 3965)
* shift:                                 Bourne Shell Builtins.
(line 3043)
* shopt:                                 The Shopt Builtin. (line 4241)
* source:                                Bash Builtins.     (line 3800)
* suspend:                               Job Control Builtins.
(line 6974)
* test:                                  Bourne Shell Builtins.
(line 3056)
* times:                                 Bourne Shell Builtins.
(line 3135)
* trap:                                  Bourne Shell Builtins.
(line 3141)
* type:                                  Bash Builtins.     (line 3805)
* typeset:                               Bash Builtins.     (line 3837)
* ulimit:                                Bash Builtins.     (line 3843)
* umask:                                 Bourne Shell Builtins.
(line 3190)
* unalias:                               Bash Builtins.     (line 3949)
* unset:                                 Bourne Shell Builtins.
(line 3208)
* wait:                                  Job Control Builtins.
(line 6937)

D.2 Index of Shell Reserved Words
=================================

* Menu:

* !:                                     Pipelines.         (line  574)
* [[:                                    Conditional Constructs.
(line  870)
* ]]:                                    Conditional Constructs.
(line  870)
* {:                                     Command Grouping.  (line 1008)
* }:                                     Command Grouping.  (line 1008)
* case:                                  Conditional Constructs.
(line  773)
* do:                                    Looping Constructs. (line  696)
* done:                                  Looping Constructs. (line  696)
* elif:                                  Conditional Constructs.
(line  752)
* else:                                  Conditional Constructs.
(line  752)
* esac:                                  Conditional Constructs.
(line  773)
* fi:                                    Conditional Constructs.
(line  752)
* for:                                   Looping Constructs. (line  716)
* function:                              Shell Functions.   (line 1169)
* if:                                    Conditional Constructs.
(line  752)
* in:                                    Conditional Constructs.
(line  773)
* select:                                Conditional Constructs.
(line  828)
* then:                                  Conditional Constructs.
(line  752)
* time:                                  Pipelines.         (line  574)
* until:                                 Looping Constructs. (line  696)
* while:                                 Looping Constructs. (line  706)

D.3 Parameter and Variable Index
================================

* Menu:

* !:                                     Special Parameters. (line 1446)
* #:                                     Special Parameters. (line 1429)
* $:                                     Special Parameters. (line 1441)
* $!:                                    Special Parameters. (line 1447)
* $#:                                    Special Parameters. (line 1430)
* $$:                                    Special Parameters. (line 1442)
* $*:                                    Special Parameters. (line 1400)
* $-:                                    Special Parameters. (line 1437)
* $0:                                    Special Parameters. (line 1452)
* $?:                                    Special Parameters. (line 1433)
* $@:                                    Special Parameters. (line 1413)
* $_:                                    Bash Variables.    (line 4677)
* *:                                     Special Parameters. (line 1399)
* -:                                     Special Parameters. (line 1436)
* 0:                                     Special Parameters. (line 1451)
* ?:                                     Special Parameters. (line 1432)
* @:                                     Special Parameters. (line 1412)
* _:                                     Bash Variables.    (line 4676)
* auto_resume:                           Job Control Variables.
(line 6986)
* BASH:                                  Bash Variables.    (line 4686)
* BASHOPTS:                              Bash Variables.    (line 4689)
* BASHPID:                               Bash Variables.    (line 4698)
* BASH_ALIASES:                          Bash Variables.    (line 4705)
* BASH_ARGC:                             Bash Variables.    (line 4714)
* BASH_ARGV:                             Bash Variables.    (line 4727)
* BASH_ARGV0:                            Bash Variables.    (line 4739)
* BASH_CMDS:                             Bash Variables.    (line 4747)
* BASH_COMMAND:                          Bash Variables.    (line 4756)
* BASH_COMPAT:                           Bash Variables.    (line 4763)
* BASH_ENV:                              Bash Variables.    (line 4779)
* BASH_EXECUTION_STRING:                 Bash Variables.    (line 4785)
* BASH_LINENO:                           Bash Variables.    (line 4788)
* BASH_LOADABLES_PATH:                   Bash Variables.    (line 4796)
* BASH_REMATCH:                          Bash Variables.    (line 4800)
* BASH_SOURCE:                           Bash Variables.    (line 4808)
* BASH_SUBSHELL:                         Bash Variables.    (line 4815)
* BASH_VERSINFO:                         Bash Variables.    (line 4821)
* BASH_VERSION:                          Bash Variables.    (line 4844)
* BASH_XTRACEFD:                         Bash Variables.    (line 4847)
* bell-style:                            Readline Init File Syntax.
(line 7289)
* bind-tty-special-chars:                Readline Init File Syntax.
(line 7296)
* blink-matching-paren:                  Readline Init File Syntax.
(line 7301)
* CDPATH:                                Bourne Shell Variables.
(line 4618)
* CHILD_MAX:                             Bash Variables.    (line 4858)
* colored-completion-prefix:             Readline Init File Syntax.
(line 7306)
* colored-stats:                         Readline Init File Syntax.
(line 7313)
* COLUMNS:                               Bash Variables.    (line 4865)
* comment-begin:                         Readline Init File Syntax.
(line 7319)
* completion-display-width:              Readline Init File Syntax.
(line 7324)
* completion-ignore-case:                Readline Init File Syntax.
(line 7331)
* completion-map-case:                   Readline Init File Syntax.
(line 7336)
* completion-prefix-display-length:      Readline Init File Syntax.
(line 7342)
* completion-query-items:                Readline Init File Syntax.
(line 7349)
* COMPREPLY:                             Bash Variables.    (line 4917)
* COMP_CWORD:                            Bash Variables.    (line 4871)
* COMP_KEY:                              Bash Variables.    (line 4900)
* COMP_LINE:                             Bash Variables.    (line 4877)
* COMP_POINT:                            Bash Variables.    (line 4882)
* COMP_TYPE:                             Bash Variables.    (line 4890)
* COMP_WORDBREAKS:                       Bash Variables.    (line 4904)
* COMP_WORDS:                            Bash Variables.    (line 4910)
* convert-meta:                          Readline Init File Syntax.
(line 7359)
* COPROC:                                Bash Variables.    (line 4923)
* DIRSTACK:                              Bash Variables.    (line 4927)
* disable-completion:                    Readline Init File Syntax.
(line 7367)
* echo-control-characters:               Readline Init File Syntax.
(line 7372)
* editing-mode:                          Readline Init File Syntax.
(line 7377)
* EMACS:                                 Bash Variables.    (line 4937)
* emacs-mode-string:                     Readline Init File Syntax.
(line 7383)
* enable-bracketed-paste:                Readline Init File Syntax.
(line 7393)
* enable-keypad:                         Readline Init File Syntax.
(line 7401)
* ENV:                                   Bash Variables.    (line 4942)
* EPOCHREALTIME:                         Bash Variables.    (line 4947)
* EPOCHSECONDS:                          Bash Variables.    (line 4955)
* EUID:                                  Bash Variables.    (line 4962)
* EXECIGNORE:                            Bash Variables.    (line 4966)
* expand-tilde:                          Readline Init File Syntax.
(line 7412)
* FCEDIT:                                Bash Variables.    (line 4979)
* FIGNORE:                               Bash Variables.    (line 4983)
* FUNCNAME:                              Bash Variables.    (line 4989)
* FUNCNEST:                              Bash Variables.    (line 5006)
* GLOBIGNORE:                            Bash Variables.    (line 5011)
* GROUPS:                                Bash Variables.    (line 5018)
* histchars:                             Bash Variables.    (line 5024)
* HISTCMD:                               Bash Variables.    (line 5039)
* HISTCONTROL:                           Bash Variables.    (line 5045)
* HISTFILE:                              Bash Variables.    (line 5061)
* HISTFILESIZE:                          Bash Variables.    (line 5065)
* HISTIGNORE:                            Bash Variables.    (line 5076)
* history-preserve-point:                Readline Init File Syntax.
(line 7416)
* history-size:                          Readline Init File Syntax.
(line 7422)
* HISTSIZE:                              Bash Variables.    (line 5096)
* HISTTIMEFORMAT:                        Bash Variables.    (line 5103)
* HOME:                                  Bourne Shell Variables.
(line 4622)
* horizontal-scroll-mode:                Readline Init File Syntax.
(line 7431)
* HOSTFILE:                              Bash Variables.    (line 5111)
* HOSTNAME:                              Bash Variables.    (line 5122)
* HOSTTYPE:                              Bash Variables.    (line 5125)
* IFS:                                   Bourne Shell Variables.
(line 4627)
* IGNOREEOF:                             Bash Variables.    (line 5128)
* input-meta:                            Readline Init File Syntax.
(line 7440)
* INPUTRC:                               Bash Variables.    (line 5138)
* INSIDE_EMACS:                          Bash Variables.    (line 5142)
* isearch-terminators:                   Readline Init File Syntax.
(line 7448)
* keymap:                                Readline Init File Syntax.
(line 7455)
* LANG:                                  Bash Variables.    (line 5148)
* LC_ALL:                                Bash Variables.    (line 5152)
* LC_COLLATE:                            Bash Variables.    (line 5156)
* LC_CTYPE:                              Bash Variables.    (line 5163)
* LC_MESSAGES:                           Locale Translation. (line  506)
* LC_MESSAGES <1>:                       Bash Variables.    (line 5168)
* LC_NUMERIC:                            Bash Variables.    (line 5172)
* LC_TIME:                               Bash Variables.    (line 5176)
* LINENO:                                Bash Variables.    (line 5180)
* LINES:                                 Bash Variables.    (line 5185)
* MACHTYPE:                              Bash Variables.    (line 5191)
* MAIL:                                  Bourne Shell Variables.
(line 4631)
* MAILCHECK:                             Bash Variables.    (line 5195)
* MAILPATH:                              Bourne Shell Variables.
(line 4636)
* MAPFILE:                               Bash Variables.    (line 5203)
* mark-modified-lines:                   Readline Init File Syntax.
(line 7485)
* mark-symlinked-directories:            Readline Init File Syntax.
(line 7490)
* match-hidden-files:                    Readline Init File Syntax.
(line 7495)
* menu-complete-display-prefix:          Readline Init File Syntax.
(line 7502)
* meta-flag:                             Readline Init File Syntax.
(line 7440)
* OLDPWD:                                Bash Variables.    (line 5207)
* OPTARG:                                Bourne Shell Variables.
(line 4643)
* OPTERR:                                Bash Variables.    (line 5210)
* OPTIND:                                Bourne Shell Variables.
(line 4647)
* OSTYPE:                                Bash Variables.    (line 5214)
* output-meta:                           Readline Init File Syntax.
(line 7507)
* page-completions:                      Readline Init File Syntax.
(line 7513)
* PATH:                                  Bourne Shell Variables.
(line 4651)
* PIPESTATUS:                            Bash Variables.    (line 5217)
* POSIXLY_CORRECT:                       Bash Variables.    (line 5222)
* PPID:                                  Bash Variables.    (line 5232)
* PROMPT_COMMAND:                        Bash Variables.    (line 5236)
* PROMPT_DIRTRIM:                        Bash Variables.    (line 5242)
* PS0:                                   Bash Variables.    (line 5248)
* PS1:                                   Bourne Shell Variables.
(line 4657)
* PS2:                                   Bourne Shell Variables.
(line 4662)
* PS3:                                   Bash Variables.    (line 5253)
* PS4:                                   Bash Variables.    (line 5258)
* PWD:                                   Bash Variables.    (line 5266)
* RANDOM:                                Bash Variables.    (line 5269)
* READLINE_LINE:                         Bash Variables.    (line 5275)
* READLINE_MARK:                         Bash Variables.    (line 5279)
* READLINE_POINT:                        Bash Variables.    (line 5285)
* REPLY:                                 Bash Variables.    (line 5289)
* revert-all-at-newline:                 Readline Init File Syntax.
(line 7523)
* SECONDS:                               Bash Variables.    (line 5292)
* SHELL:                                 Bash Variables.    (line 5301)
* SHELLOPTS:                             Bash Variables.    (line 5306)
* SHLVL:                                 Bash Variables.    (line 5315)
* show-all-if-ambiguous:                 Readline Init File Syntax.
(line 7529)
* show-all-if-unmodified:                Readline Init File Syntax.
(line 7535)
* show-mode-in-prompt:                   Readline Init File Syntax.
(line 7544)
* skip-completed-text:                   Readline Init File Syntax.
(line 7550)
* SRANDOM:                               Bash Variables.    (line 5320)
* TEXTDOMAIN:                            Locale Translation. (line  506)
* TEXTDOMAINDIR:                         Locale Translation. (line  506)
* TIMEFORMAT:                            Bash Variables.    (line 5329)
* TMOUT:                                 Bash Variables.    (line 5367)
* TMPDIR:                                Bash Variables.    (line 5379)
* UID:                                   Bash Variables.    (line 5383)
* vi-cmd-mode-string:                    Readline Init File Syntax.
(line 7563)
* vi-ins-mode-string:                    Readline Init File Syntax.
(line 7574)
* visible-stats:                         Readline Init File Syntax.
(line 7585)

D.4 Function Index
==================

* Menu:

* abort (C-g):                           Miscellaneous Commands.
(line 8370)
* accept-line (Newline or Return):       Commands For History.
(line 7962)
* alias-expand-line ():                  Miscellaneous Commands.
(line 8485)
* backward-char (C-b):                   Commands For Moving.
(line 7914)
* backward-delete-char (Rubout):         Commands For Text. (line 8073)
* backward-kill-line (C-x Rubout):       Commands For Killing.
(line 8148)
* backward-kill-word (M-<DEL>):          Commands For Killing.
(line 8165)
* backward-word (M-b):                   Commands For Moving.
(line 7921)
* beginning-of-history (M-<):            Commands For History.
(line 7976)
* beginning-of-line (C-a):               Commands For Moving.
(line 7905)
* bracketed-paste-begin ():              Commands For Text. (line 8089)
* call-last-kbd-macro (C-x e):           Keyboard Macros.   (line 8355)
* capitalize-word (M-c):                 Commands For Text. (line 8122)
* character-search (C-]):                Miscellaneous Commands.
(line 8402)
* character-search-backward (M-C-]):     Miscellaneous Commands.
(line 8407)
* clear-display (M-C-l):                 Commands For Moving.
(line 7947)
* clear-screen (C-l):                    Commands For Moving.
(line 7952)
* complete (<TAB>):                      Commands For Completion.
(line 8246)
* complete-command (M-!):                Commands For Completion.
(line 8320)
* complete-filename (M-/):               Commands For Completion.
(line 8289)
* complete-hostname (M-@):               Commands For Completion.
(line 8312)
* complete-into-braces (M-{):            Commands For Completion.
(line 8340)
* complete-username (M-~):               Commands For Completion.
(line 8296)
* complete-variable (M-$):               Commands For Completion.
(line 8304)
* copy-backward-word ():                 Commands For Killing.
(line 8206)
* copy-forward-word ():                  Commands For Killing.
(line 8211)
* copy-region-as-kill ():                Commands For Killing.
(line 8202)
* dabbrev-expand ():                     Commands For Completion.
(line 8335)
* delete-char (C-d):                     Commands For Text. (line 8068)
* delete-char-or-list ():                Commands For Completion.
(line 8283)
* delete-horizontal-space ():            Commands For Killing.
(line 8194)
* digit-argument (M-0, M-1, ... M--):    Numeric Arguments. (line 8226)
* display-shell-version (C-x C-v):       Miscellaneous Commands.
(line 8470)
* do-lowercase-version (M-A, M-B, M-X, ...): Miscellaneous Commands.
(line 8374)
* downcase-word (M-l):                   Commands For Text. (line 8118)
* dump-functions ():                     Miscellaneous Commands.
(line 8434)
* dump-macros ():                        Miscellaneous Commands.
(line 8446)
* dump-variables ():                     Miscellaneous Commands.
(line 8440)
* dynamic-complete-history (M-<TAB>):    Commands For Completion.
(line 8330)
* edit-and-execute-command (C-x C-e):    Miscellaneous Commands.
(line 8494)
* end-kbd-macro (C-x )):                 Keyboard Macros.   (line 8351)
* end-of-file (usually C-d):             Commands For Text. (line 8062)
* end-of-history (M->):                  Commands For History.
(line 7979)
* end-of-line (C-e):                     Commands For Moving.
(line 7908)
* exchange-point-and-mark (C-x C-x):     Miscellaneous Commands.
(line 8397)
* forward-backward-delete-char ():       Commands For Text. (line 8077)
* forward-char (C-f):                    Commands For Moving.
(line 7911)
* forward-search-history (C-s):          Commands For History.
(line 7989)
* forward-word (M-f):                    Commands For Moving.
(line 7917)
* glob-complete-word (M-g):              Miscellaneous Commands.
(line 8452)
* glob-expand-word (C-x *):              Miscellaneous Commands.
(line 8458)
* glob-list-expansions (C-x g):          Miscellaneous Commands.
(line 8464)
* history-and-alias-expand-line ():      Miscellaneous Commands.
(line 8488)
* history-expand-line (M-^):             Miscellaneous Commands.
(line 8478)
* history-search-backward ():            Commands For History.
(line 8013)
* history-search-forward ():             Commands For History.
(line 8007)
* history-substring-search-backward ():  Commands For History.
(line 8025)
* history-substring-search-forward ():   Commands For History.
(line 8019)
* insert-comment (M-#):                  Miscellaneous Commands.
(line 8421)
* insert-completions (M-*):              Commands For Completion.
(line 8262)
* insert-last-argument (M-. or M-_):     Miscellaneous Commands.
(line 8491)
* kill-line (C-k):                       Commands For Killing.
(line 8143)
* kill-region ():                        Commands For Killing.
(line 8198)
* kill-whole-line ():                    Commands For Killing.
(line 8156)
* kill-word (M-d):                       Commands For Killing.
(line 8160)
* magic-space ():                        Miscellaneous Commands.
(line 8481)
* menu-complete ():                      Commands For Completion.
(line 8266)
* menu-complete-backward ():             Commands For Completion.
(line 8278)
* next-history (C-n):                    Commands For History.
(line 7973)
* next-screen-line ():                   Commands For Moving.
(line 7940)
* non-incremental-forward-search-history (M-n): Commands For History.
(line 8001)
* non-incremental-reverse-search-history (M-p): Commands For History.
(line 7995)
* operate-and-get-next (C-o):            Commands For History.
(line 8052)
* overwrite-mode ():                     Commands For Text. (line 8126)
* possible-command-completions (C-x !):  Commands For Completion.
(line 8326)
* possible-completions (M-?):            Commands For Completion.
(line 8255)
* possible-filename-completions (C-x /): Commands For Completion.
(line 8292)
* possible-hostname-completions (C-x @): Commands For Completion.
(line 8316)
* possible-username-completions (C-x ~): Commands For Completion.
(line 8300)
* possible-variable-completions (C-x $): Commands For Completion.
(line 8308)
* prefix-meta (<ESC>):                   Miscellaneous Commands.
(line 8379)
* previous-history (C-p):                Commands For History.
(line 7969)
* previous-screen-line ():               Commands For Moving.
(line 7933)
* print-last-kbd-macro ():               Keyboard Macros.   (line 8359)
* quoted-insert (C-q or C-v):            Commands For Text. (line 8082)
* re-read-init-file (C-x C-r):           Miscellaneous Commands.
(line 8366)
* redraw-current-line ():                Commands For Moving.
(line 7956)
* reverse-search-history (C-r):          Commands For History.
(line 7983)
* revert-line (M-r):                     Miscellaneous Commands.
(line 8386)
* self-insert (a, b, A, 1, !, ...):      Commands For Text. (line 8086)
* set-mark (C-@):                        Miscellaneous Commands.
(line 8393)
* shell-backward-kill-word ():           Commands For Killing.
(line 8174)
* shell-backward-word (M-C-b):           Commands For Moving.
(line 7929)
* shell-expand-line (M-C-e):             Miscellaneous Commands.
(line 8473)
* shell-forward-word (M-C-f):            Commands For Moving.
(line 7925)
* shell-kill-word (M-C-d):               Commands For Killing.
(line 8169)
* shell-transpose-words (M-C-t):         Commands For Killing.
(line 8178)
* skip-csi-sequence ():                  Miscellaneous Commands.
(line 8412)
* start-kbd-macro (C-x ():               Keyboard Macros.   (line 8348)
* tilde-expand (M-&):                    Miscellaneous Commands.
(line 8390)
* transpose-chars (C-t):                 Commands For Text. (line 8103)
* transpose-words (M-t):                 Commands For Text. (line 8109)
* undo (C-_ or C-x C-u):                 Miscellaneous Commands.
(line 8383)
* universal-argument ():                 Numeric Arguments. (line 8230)
* unix-filename-rubout ():               Commands For Killing.
(line 8189)
* unix-line-discard (C-u):               Commands For Killing.
(line 8153)
* unix-word-rubout (C-w):                Commands For Killing.
(line 8185)
* upcase-word (M-u):                     Commands For Text. (line 8114)
* yank (C-y):                            Commands For Killing.
(line 8216)
* yank-last-arg (M-. or M-_):            Commands For History.
(line 8040)
* yank-nth-arg (M-C-y):                  Commands For History.
(line 8031)
* yank-pop (M-y):                        Commands For Killing.
(line 8219)

D.5 Concept Index


* Menu:

* alias expansion:                       Aliases.           (line 6009)
* arithmetic evaluation:                 Shell Arithmetic.  (line 5914)
* arithmetic expansion:                  Arithmetic Expansion.
(line 1990)
* arithmetic, shell:                     Shell Arithmetic.  (line 5914)
* arrays:                                Arrays.            (line 6058)
* background:                            Job Control Basics. (line 6778)
* Bash configuration:                    Basic Installation. (line 9412)
* Bash installation:                     Basic Installation. (line 9412)
* Bourne shell:                          Basic Shell Features.
(line  328)
* brace expansion:                       Brace Expansion.   (line 1500)
* builtin:                               Definitions.       (line  249)
* command editing:                       Readline Bare Essentials.
(line 7069)
* command execution:                     Command Search and Execution.
(line 2483)
* command expansion:                     Simple Command Expansion.
(line 2442)
* command history:                       Bash History Facilities.
(line 9031)
* command search:                        Command Search and Execution.
(line 2483)
* command substitution:                  Command Substitution.
(line 1961)
* command timing:                        Pipelines.         (line  574)
* commands, compound:                    Compound Commands. (line  673)
* commands, conditional:                 Conditional Constructs.
(line  751)
* commands, grouping:                    Command Grouping.  (line  993)
* commands, lists:                       Lists.             (line  628)
* commands, looping:                     Looping Constructs. (line  690)
* commands, pipelines:                   Pipelines.         (line  571)
* commands, shell:                       Shell Commands.    (line  529)
* commands, simple:                      Simple Commands.   (line  558)
* comments, shell:                       Comments.          (line  517)
* Compatibility Level:                   Shell Compatibility Mode.
(line 6644)
* Compatibility Mode:                    Shell Compatibility Mode.
(line 6644)
* completion builtins:                   Programmable Completion Builtins.
(line 8656)
* configuration:                         Basic Installation. (line 9412)
* control operator:                      Definitions.       (line  253)
* coprocess:                             Coprocesses.       (line 1027)
* directory stack:                       The Directory Stack.
(line 6174)
* editing command lines:                 Readline Bare Essentials.
(line 7069)
* environment:                           Environment.       (line 2598)
* evaluation, arithmetic:                Shell Arithmetic.  (line 5914)
* event designators:                     Event Designators. (line 9250)
* execution environment:                 Command Execution Environment.
(line 2527)
* exit status:                           Definitions.       (line  258)
* exit status <1>:                       Exit Status.       (line 2631)
* expansion:                             Shell Expansions.  (line 1463)
* expansion, arithmetic:                 Arithmetic Expansion.
(line 1990)
* expansion, brace:                      Brace Expansion.   (line 1500)
* expansion, filename:                   Filename Expansion. (line 2068)
* expansion, parameter:                  Shell Parameter Expansion.
(line 1616)
* expansion, pathname:                   Filename Expansion. (line 2068)
* expansion, tilde:                      Tilde Expansion.   (line 1551)
* expressions, arithmetic:               Shell Arithmetic.  (line 5914)
* expressions, conditional:              Bash Conditional Expressions.
(line 5768)
* field:                                 Definitions.       (line  262)
* filename:                              Definitions.       (line  267)
* filename expansion:                    Filename Expansion. (line 2068)
* foreground:                            Job Control Basics. (line 6778)
* functions, shell:                      Shell Functions.   (line 1162)
* history builtins:                      Bash History Builtins.
(line 9081)
* history events:                        Event Designators. (line 9252)
* history expansion:                     History Interaction.
(line 9190)
* history list:                          Bash History Facilities.
(line 9031)
* History, how to use:                   A Programmable Completion Example.
(line 9020)
* identifier:                            Definitions.       (line  283)
* initialization file, readline:         Readline Init File. (line 7237)
* installation:                          Basic Installation. (line 9412)
* interaction, readline:                 Readline Interaction.
(line 7055)
* interactive shell:                     Invoking Bash.     (line 5520)
* interactive shell <1>:                 Interactive Shells. (line 5649)
* internationalization:                  Locale Translation. (line  497)
* job:                                   Definitions.       (line  270)
* job control:                           Definitions.       (line  274)
* job control <1>:                       Job Control Basics. (line 6778)
* kill ring:                             Readline Killing Commands.
(line 7144)
* killing text:                          Readline Killing Commands.
(line 7132)
* localization:                          Locale Translation. (line  497)
* login shell:                           Invoking Bash.     (line 5517)
* matching, pattern:                     Pattern Matching.  (line 2112)
* metacharacter:                         Definitions.       (line  278)
* name:                                  Definitions.       (line  283)
* native languages:                      Locale Translation. (line  497)
* notation, readline:                    Readline Bare Essentials.
(line 7069)
* operator, shell:                       Definitions.       (line  289)
* parameter expansion:                   Shell Parameter Expansion.
(line 1616)
* parameters:                            Shell Parameters.  (line 1308)
* parameters, positional:                Positional Parameters.
(line 1380)
* parameters, special:                   Special Parameters. (line 1396)
* pathname expansion:                    Filename Expansion. (line 2068)
* pattern matching:                      Pattern Matching.  (line 2112)
* pipeline:                              Pipelines.         (line  571)
* POSIX:                                 Definitions.       (line  241)
* POSIX Mode:                            Bash POSIX Mode.   (line 6396)
* process group:                         Definitions.       (line  294)
* process group ID:                      Definitions.       (line  298)
* process substitution:                  Process Substitution.
(line 2011)
* programmable completion:               Programmable Completion.
(line 8519)
* prompting:                             Controlling the Prompt.
(line 6261)
* quoting:                               Quoting.           (line  390)
* quoting, ANSI:                         ANSI-C Quoting.    (line  446)
* Readline, how to use:                  Job Control Variables.
(line 7003)
* redirection:                           Redirections.      (line 2204)
* reserved word:                         Definitions.       (line  302)
* reserved words:                        Reserved Words.    (line  540)
* restricted shell:                      The Restricted Shell.
(line 6345)
* return status:                         Definitions.       (line  307)
* shell arithmetic:                      Shell Arithmetic.  (line 5914)
* shell function:                        Shell Functions.   (line 1162)
* shell script:                          Shell Scripts.     (line 2702)
* shell variable:                        Shell Parameters.  (line 1308)
* shell, interactive:                    Interactive Shells. (line 5649)
* signal:                                Definitions.       (line  310)
* signal handling:                       Signals.           (line 2665)
* special builtin:                       Definitions.       (line  314)
* special builtin <1>:                   Special Builtins.  (line 4583)
* startup files:                         Bash Startup Files. (line 5538)
* suspending jobs:                       Job Control Basics. (line 6778)
* tilde expansion:                       Tilde Expansion.   (line 1551)
* token:                                 Definitions.       (line  318)
* translation, native languages:         Locale Translation. (line  497)
* variable, shell:                       Shell Parameters.  (line 1308)
* variables, readline:                   Readline Init File Syntax.
(line 7288)
* word:                                  Definitions.       (line  322)
* word splitting:                        Word Splitting.    (line 2034)
* yanking text:                          Readline Killing Commands.
(line 7132)
