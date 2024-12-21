# Bash :: Reference :: About bash



The difference between a user interface and a shell is simetimes blurry; in case of the text-based UI and the text shell, we could probably get away saying that they are the same. To emphasize the difference we should perhaps consider the case of a graphical UI in which icons represent commands, and where a click on an icon is transformed into a textual input on the command line, so a GUI is just a thin veneer over a TUI.


the UI is seemingly also graphical, but it may be 


## About Bash

https://www.gnu.org/software/bash/manual/html_node/What-is-Bash_003f.html

The shell.    
Bash is a shell. A **shell** is a program at a lower level of abstraction than most other programs for it needs to support user's interaction with a computer. Users interact with a computer using a user interface, which, from the hardware's aspect, consist mainly of keyboard for input and monitor for output, while from the software's aspect is made of numerous programs, with the shell as the most prominent one; shell encompasses different rudimentary system functionalities under one roof.

A shell provides a user interface (UI) for people to interact with the computer. The most basic type of such interface is the one based solely on text used both for input and output (I/O), and this is what the bash provides.

Chronologically, this was the first type of UI, followed by the graphical user interface (GUI) that came later and also introduced a new device, called mouse, which was promoted as the better tool for interacting with the GUI. And since GUI was built as an enhancement of the text-based interface, the later wad also accessable. In fact, many modern OSs select a GUI as the default choice of a user interface, at the same time offering a convenient access to a text-based interface in a regular window displayed in the GUI, prompting the name *command prompt*. 

**Command prompt** is a version of a text-based user interface that is made accessible through a GUI window (TUI in a GUI).




The most prominent types of shells are text-based and graphical (graphical user interface, GUI). A variant of text-based interface that mimics a GUI is known as the TUI - text-based user interface, or rather, terminal user interface to better reflect the dependence on the numerous capabilities of the terminal (that go well beyond mere text).

The purpose.    

Bash is a text-based shell. 
The kind of interaction with the computer that bash provides is based on the textual input and output. Users type in commands at the *command line*, or *command prompt*, that bash reads and then executes. But to do that, a shell must be able to parse and process the user's input in order to discern their intentions, and thus a shell is also called a *command language interpreter*. In this aspect, every shell (that is, the text-based ones) comes with a programming language - in this context called a *command language*.


The name.    
Bash, aka Bourne-Again SHell. The name, "bash", is an acronym for the _Bourne-Again SHell_, a pun on Stephen Bourne, the author of the immediate predecessor of the bash shell - the shell referred to as `sh`.

The name "sh" for a shell program followed the naming convention of many Unix utilities, like "tr" for translate, "cat" for concatenation, 

(rant ahead)

time of its creation, not many shells existed, so "sh" was a convenient abbreviation for a program of this kind (that is, for a shell), 

The term "sh" is somewhat ambiguous: 

following the same naming convention as the other Unix utilities 
 This naming scheme also endorsed the bijective relation between a requirted functionality and the one utility to provide it, hailed as the Unix phylosophy.


one-for-one approach (I, me, mine)

promoted the phylosophy 

indicating that a single utility program per some functionality is quite sufficient, so it may as well be named after the functionality it provides (monopoly on sorrow), trading the competitiveness for mediocrity


still refers to the actual Unix shell, and it first appeared in the 7th edition "Bell Labs Research" version of Unix.







- Bash is intended to be a conformant implementation of the IEEE POSIX Shell and Tools portion of the IEEE POSIX specification (IEEE Standard 1003.1). It offers functional improvements over sh for both interactive and programming use.
- While the GNU operating system provides other shells, Bash is the default shell.
- Like other GNU software, Bash is portable: it runs on nearly every version of Unix, and on some very different OSs as well.


Bash is largely compatible with _sh_ and incorporates useful features from the Korn shell, _ksh_, and the C shell, _csh_. In fact, all shells have an emulation mode that makes them sh-compliant. When invoked as `sh`, bash runs in a sh-compatible mode. Otherwise, bash is significantly different from sh, so when writing sh-compatible scripts, the author must refrain from using the language constructs that are collectively known as the *bashisms*.

(rant ahead) The term "bashisms" is of course invented by the conservatives (with "Upgrading is for pussies" badges) that would like it best if no software is ever changed, and all the discoveries and improvements made in the programming language research over the past several decades were ignored. We have witnessed this situations many times in the past: it is when a deprecated (support-wise), degenerate (compared to the standard), wastly inferior (compared to the currunt solutions) piece of software keeps being used owing to a significant user-base. This situation arises for numerous factors, but a promonent one is perhaps the inertness of the companies that employ it or the one that produced it. Perhaps, the vendor thinks the upgrade of that product is unjustified since, after all, it still works (sure, but so does the abacus). A bigger case of this kind was the procession of burying the IE6 browser that peaked at the time when web technologies really took off forward, if only it weren't for the IE6 that removed all joy from web development. Its significant user base forced developers to support it, directly or indirectly (boss as a relay), which could only be half-assed by doing a number of special cases, reaching beyond mere IE conditionals, sprinkled with a bunch of ad hoc hacks on top. It was the time when no developer was content with their work.
