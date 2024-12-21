---
downloaded:       2021-12-03
page-url:         https://mywiki.wooledge.org/BashGuide
page-title:       BashGuide - Greg's Wiki
article-title:    BashGuide - Greg's Wiki
---
# BashGuide - Greg's Wiki

Commands and Arguments ->
[Commands and Arguments ->][1]

---

__You are invited to make additions or modifications so long as you can keep them accurate. Please test any code samples you write.__

All the information here is presented without any warranty or guarantee of accuracy. Use it at your own risk. When in doubt, please consult the man pages or the GNU info pages as the authoritative references.

---

A [new version of this guide][2] is currently being drafted. For now, this guide is still the most complete and best reviewed. Any contributions to the new guide are welcome [via GitHub forks][3].

This guide aims to aid people interested in learning to work with [BASH][4]. It aspires to teach good practice techniques for using BASH, and writing simple scripts.

This guide is targeted at beginning users. It assumes no advanced knowledge -- just the ability to login to a Unix-like system and open a command-line (terminal) interface. It will help if you know how to use a text editor; we will not be covering editors, nor do we endorse any particular editor choice. Familiarity with the fundamental Unix tool set, or with other programming languages or programming concepts, is not required, but those who have such knowledge may understand some of the examples more quickly.

If something is unclear to you, you are invited to report this (use [BashGuideFeedback][5], or the #bash channel on [irc.libera.chat][6]) so that it may be clarified in this document for future readers.

You are invited to contribute to the development of this document by extending it or correcting invalid or incomplete information.

The primary maintainer(s) of this document:

-   \-- [Lhunath][7] (primary author)
    
-   \-- [GreyCat][8]
    

The guide is also available in [PDF format][9]. Alternatively, you can just hit print after going to [FullBashGuide][10]. That guarantees you'll be printing the latest version of this document.

---

BASH is an acronym for *__B__ourne __A__gain __Sh__ell*. It is based on the *Bourne* shell and is mostly compatible with its features.

Shells are command interpreters. They are applications that provide users with the ability to give commands to their operating system interactively, or to execute batches of commands quickly. In no way are they required for the execution of programs; they are merely a layer between system function calls and the user.

Think of a shell as a way for you to speak to your system. Your system doesn't need it for most of its work, but it is an excellent interface between you and what your system can offer. It allows you to perform basic math, run basic tests and execute applications. More importantly, it allows you to combine these operations and connect applications to each other to perform complex and automated tasks.

BASH is __not__ your operating system. It is not your window manager. It is not your terminal (but it oftens runs *inside* your terminal). It does not control your mouse or keyboard. It does not configure your system, activate your screensaver, or open your files when you double-click them. It is generally not involved in launching applications from your window manager or desktop environment. It's important to understand that BASH is only an interface for you to execute statements (using BASH syntax), either at the interactive BASH prompt or via BASH scripts.

---

-   __In The Manual: [Introduction][11]__
    

---

-   *Shell*: A (possibly interactive) command interpreter, acting as a layer between the user and the system.  
    *Bash*: The Bourne Again Shell, a *Bourne* compatible shell.
    

---

Most users that think of BASH think of it as a prompt and a command line. That is BASH in *interactive mode*. BASH can also run in *non-interactive mode*, as when executing scripts. We can use scripts to automate certain logic. Scripts are basically lists of commands (just like the ones you can type on the command line), but stored in a file. When a script is executed, all these commands are (generally) executed sequentially, one after another.

We'll start with the basics in an *interactive shell*. Once you're familiar with those, you can put them together in scripts.

__Important!  
You should make yourself familiar with the man and apropos commands on the shell. They will be vital to your self-tutoring.__

$ man man
$ man apropos

In this guide, the $ at the beginning of a line represents your BASH prompt. Traditionally, a shell prompt either ends with $, % or #. If it ends with $, this indicates a shell that's compatible with the Bourne shell (such as a POSIX shell, or a Korn shell, or Bash). If it ends with %, this indicates a *C shell* (csh or tcsh); this guide does not cover C shell. If it ends with #, this indicates that the shell is running as the system's superuser account (root), and that you should be extra careful.

Your actual BASH prompt will probably be much longer than $. Prompts are often highly individualized.

The man command stands for "manual"; it opens documentation (so-called "man pages") on various topics. You use it by running the command man \[topic\] at the BASH prompt, where \[topic\] is the name of the "page" you wish to read. Note that many of these "pages" are considerably longer than one printed page; nevertheless, the name persists. Each command (application) on your system is likely to have a man page. There are pages for other things too, such as system calls or specific configuration files. In this guide, we will only be covering commands.

Note that if you're looking for information on BASH built-ins (commands provided by BASH, not by external applications) you should look in man bash instead. BASH's manual is extensive and detailed. It is an excellent reference, albeit more technical than this guide.

Bash also offers a help command which contains brief summaries of its built-in commands (which we'll discuss in depth later on).

$ help
$ help read

---

-   __In the FAQ:  
    [Is there a list of which features were added to specific releases (versions) of Bash?][12]__
    

---

-   *Interactive mode*: A mode of operation where a prompt asks you for one command at a time.
    
-   *Script*: A file that contains a sequence of commands to execute one after the other.
    

---

The guide has been divided into sections, which are intended to be read roughly in the order presented. If you skip ahead to a specific section, you might find yourself missing some background information from previous sections. (Links to relevant sections are not always provided when a topic is mentioned.)

-   [Commands and Arguments][13]
    
    -   Types of commands; argument splitting; writing scripts.
-   [Special Characters][14]
    
-   [Parameters][15]
    
    -   Variables; special parameters; parameter types; parameter expansion.
-   [Patterns][16]
    
    -   Globs; filename matching; extended globs; brace expansion; regular expressions.
-   [Tests and Conditionals][17]
    
    -   Exit status; && and ||; if, test and \[\[; while, until and for; case and select.
        
-   [Arrays][18]
    
    -   Arrays; associative arrays.
-   [Input and Output][19]
    
    -   Redirection; here documents; here strings; pipes; process substitution.
-   [Compound Commands][20]
    
    -   Subshells; command grouping; arithmetic evaluation; functions; aliases.
-   [Sourcing][21]
    
    -   Reading commands from other files.
-   [Job Control][22]
    
-   [Practices][23]
    
    -   Choosing your shell; quoting; readability; debugging.

---

[Commands and Arguments ->][24]

---

[CategoryShell][25]

[1]: https://mywiki.wooledge.org/BashGuide/CommandsAndArguments
[2]: http://guide.bash.academy/
[3]: https://github.com/lhunath/bash.academy
[4]: https://mywiki.wooledge.org/BASH
[5]: https://mywiki.wooledge.org/BashGuideFeedback
[6]: https://libera.chat/
[7]: https://mywiki.wooledge.org/Lhunath
[8]: https://mywiki.wooledge.org/GreyCat
[9]: http://s.ntnu.no/bashguide.pdf
[10]: https://mywiki.wooledge.org/FullBashGuide
[11]: http://www.gnu.org/software/bash/manual/bashref.html#Introduction
[12]: https://mywiki.wooledge.org/BashFAQ/061
[13]: https://mywiki.wooledge.org/BashGuide/CommandsAndArguments
[14]: https://mywiki.wooledge.org/BashGuide/SpecialCharacters
[15]: https://mywiki.wooledge.org/BashGuide/Parameters
[16]: https://mywiki.wooledge.org/BashGuide/Patterns
[17]: https://mywiki.wooledge.org/BashGuide/TestsAndConditionals
[18]: https://mywiki.wooledge.org/BashGuide/Arrays
[19]: https://mywiki.wooledge.org/BashGuide/InputAndOutput
[20]: https://mywiki.wooledge.org/BashGuide/CompoundCommands
[21]: https://mywiki.wooledge.org/BashGuide/Sourcing
[22]: https://mywiki.wooledge.org/BashGuide/JobControl
[23]: https://mywiki.wooledge.org/BashGuide/Practices
[24]: https://mywiki.wooledge.org/BashGuide/CommandsAndArguments
[25]: https://mywiki.wooledge.org/CategoryShell
