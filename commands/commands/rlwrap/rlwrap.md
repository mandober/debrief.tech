# rlwrap - readline wrapper

Contents
- [SYNOPSIS](#synopsis)
- [DESCRIPTION](#description)
- [OPTIONS](#options)
- [EXAMPLES](#examples)
- [DIRECT MODE AND READLINE MODE](#direct-mode-and-readline-mode)
- [PATIENT AND IMPATIENT MODE](#patient-and-impatient-mode)
- [COOKING PROMPTS](#cooking-prompts)
- [SPECIAL KEYS](#special-keys)
- [ENVIRONMENT](#environment)
- [SIGNALS](#signals)
- [REDIRECTION](#redirection)
- [EXIT STATUS](#exit-status)
- [FILES](#files)
- [BUGS and LIMITATIONS](#bugs-and-limitations)
- [VERSION](#version)
- [AUTHORS](#authors)
- [SEE ALSO](#see-also)


## SYNOPSIS

```bash
rlwrap [OPTIONS] CMD [CMD-OPTIONS]
```

* Repo: https://github.com/hanslub42/rlwrap
* man: https://www.systutorials.com/docs/linux/man/1-rlwrap/

## DESCRIPTION

`rlwrap` runs the specified _CMD_, intercepting user input in order to enhance the line editing experience of various commands, primarily of uncared-for REPLs on top of misc PLs (ocaml, sml, swiprolog, python; php has its own alts, haskell has ghci, node is now ok). Most significantly, it fixes the gabled output of many functional keys (like arrow keys, AppPad keys, etc.) OOBE, bringing almost all the readline's features to the table, including the essentail tasks of history maintainance and completion mechanics.

rlwrap tries to be completely transparent - there shouldn't be any noticable difference between running the _CMD_ itself and wrapping it as _rlwrap CMD_. This should even hold true when you are redirecting, piping and sending signals from and to _CMD_, or when _CMD_ manipulates its terminal settings.

## OPTIONS

`-a, --always-readline [PASSWORD_PROMPT]`
* Always remain in *readline mode*, regardless of command's terminal settings. Use this to employ rlwrap with commands that already use readline. With this option, rlwrap will echo (and save) passwords, unless you give command's password prompt as an arg. The arg is optional: if given, it has to directly follow the option without an intervening space.
* On a linux machine you can use the `-N` / `--no-children` option to prevent the wrapping of pagers and editors called from command; this should make them much more usable.
* Many commands that need `--always-readline` may also need `-t dumb` to prevent terminal control sequences from confusing rlwrap (although they will interact badly with pagers and editors).

`-A, --ansi-colour-aware`
* Prompts that use colour confuse rlwrap, especially at the end of long input lines. This option will make rlwrap better behaved in such cases.
* If the prompt contains anything fancier than ANSI colour codes, this option may actually make things worse. great

`-b, --break-chars LIST_OF_CHARACTERS`
* Word-break chars.
* whitespace is always a word-breaker.
* Determines what a "word" is, for e.g. completions.
* Default list: `(){}[],'+-=&^%$#@"";|`
* Unless `-c` (filename completion) is ON, `/` and `.` are in the default list.

`-c, --complete-filenames`
* Complete filenames.
* always case-sensitive, even with `-i` option.
* When doing this, rlwrap keeps track of command's cwd.

`-C, --command-name CMDNAME|N`
* Use *CMDNAME* instead of *CMD* for the names of history and completion files, and to initialise readline (as specified in `~/.inputrc` if-blocks).
* A numeric arg N > 0 means: use the Nth arg counting backwards from the end of the arg list.

`-D, --history-no-dupes n`
* Clean duplicated history entries
* n = 0 all inputs are kept in the history list
* n = 1 (default) consecutive duplicates are dropped
* n = 2 drop all previous occurrences of the current input

`-e, --extra-char-after-completion CHAR`
* By default, rlwrap appends a space after any inserted completion text.
* Use '' for the empty string.

`-f, --file FILE`
* Split FILE into words and add them to the completion word list.
* This option can be given more than once, and adds to the
* default completion list in `${RLWRAP_HOME:-/usr/share/rlwrap/completions}`.
* Specifying `-f` will make rlwrap use the current history file as a completion word list.

`-g, --forget-matching regexp`    
Drop from history all input lines that match the POSIX 1003.2 REGEXP. The match is always case-insensitive. regexp may be an ordinary string. For more about regular expressions, see `regex (7)`

**-h, --help **
:  Print a short help message. 

**-H, --history-filename _file_**
:  Read command history from _file_ (and write it back there if \--histsize >= 0) 

**-i, --case-insensitive **
:  Ignore case when completing (filename completion remains case-sensitive). This option has to come before any -f options. 

**-I, --pass-sigint-as-sigterm**
: Send a TERM signal to _command_ when an INT is received (e.g. when you press CTRL-C). 

**-l, --logfile _FILE_**
: When in readline mode, append _command_'s output (including echo'ed user input) to _FILE_ (creating _FILE_ when it doesn't exist). 

**-n, --no-warnings**
: Don't print warnings. 

**-N, --no-children**
: Don't rlwrap _command_'s children: whenever rlwrap notices that _command_ is waiting for one of its children, it switches to direct mode, handing down all keypresses immediately. With this option commands that need --always-readline can call editors and pagers and still be usable. 

This option needs /proc/_command__pid/wchan, so it only works with linux kernels configured with CONFIG_KALLSYMS. 

**-m, --multi-line [_newline_substitute_]**
:  Enable multi-line input using a "newline substitute" character sequence (" ", [space-backslash-space] by default). Newline substitutes are translated to newlines before sending the input to _command_. With this option, you can call an external editor $RLWRAP_EDITOR on the (expanded) current input with the _rlwrap_call_editor_ key (CTRL-^ by default) The arg is optional; if given, it has to directly follow the option without an intervening space. 

**-M, --multi-line-ext _.ext_**
:  Call multi-line-editor on temporary files with filename extension _.ext_ (useful for e.g. automatic syntax colouring) 

**-o, --one-shot **
:  Send an EOF to _command_ after accepting the first line of input 

**-O, --only-cook _regexp_**
:  Only ever "cook" prompts that match _regexp_

**-p, --prompt-colour [_colour_name|Colour_name|colour_spec_]**
:  Use one of the colour names _black, red, green, yellow, blue, cyan, purple (=magenta)_ or _white_, or an ANSI-conformant  to colour any prompt displayed by _command_. An uppercase colour name (_Yellow_ or _YELLOW_ ) gives a bold prompt. Prompts that already contain (colour) escape sequences or one of the readline "ignore markers" (ASCII 0x01 and 0x02) are not coloured. This option implies --ansi-colour-aware. _colour spec_ has the form ;[;] Example: -p'1;31' will give a bold red prompt on the current background (this is the default when no arg is given). Google for 'ANSI color' to learn more about colour codes. The arg is optional; if given, it has to directly follow the option without an intervening space. 

**-P, --pre-given _text_**
:  Start rlwrap with _text_ in its edit buffer (this will automatically set the --always-readline option). 

**-q, --quote-characters _list_of_characters_**
:  Assume that the given characters act as quotes, e.g. when matching parentheses. Take care to escape the list properly for your shell (example: -q ""'", which happens to be the default, or -q """ which will be better for Lisp users) 

**-r, --remember **
:  Put all words seen on in- and output on the completion list. 

**-R, --renice **
:  Make rlwrap nicer than _command_ (cf **nice (1)**). This may prevent rlwrap from interrupting _command_ to display a prompt when _command_ is still "thinking" about what to output next. 

**-s, --histsize _N_**
:  Limit the history list to N entries, truncating the history file (default: 300). A negative size -N means the same as N, but treats the history file as read-only. 

**-S, --substitute-prompt _prompt_**
:  Substitute the specified prompt for _command_'s own prompt. Mainly useful when _command_ doesn't have a prompt. 

**-t, --set-term-name _name_**
:  Set _command_'s TERM to _name_. Programs that confuse rlwrap with fancy screen control codes can sometimes be tamed by specifying **-t dumb**

**-U, --mirror-args **
:  (linux only) Keep track of _command_'s args as seen by the **ps (1)** command, and mirror them in rlwrap's own args This is mainly useful for commands that overwrite command-line password args that would be exposed by rlwrap without this option. 

**-v, --version **
:  Print rlwrap version. 

**-w, --wait-before-prompt _timeout_**
:  In order to determine if _command_'s last output is a prompt, rlwrap waits _timeout_ millisecs after receiving it. Only when no more output has arrived, it is cooked (coloured, filtered and/or replaced by a substitute prompt) and displayed as a prompt. Before this the prompt is displayed "uncooked". Most users won't notice, but heavy cookers can prepend the timeout with a minus sign, making rlwrap hold back the prompt until it has been cooked ("patient mode"). This will prevent flashing of the prompt, but it will also interfere with long output lines and make switches from direct to readline mode less reliable. Default timeout: 40 ms 

**-W, --polling **
:  EXPERIMENTAL: Wake up every _timeout_ millisecs, where _timeout_ is the same as for the -w (--wait-before-prompt) option, 40 ms by default. This is used to sense the slave's interrupt character and ISIG flag and to adjust stdin's terminal settings accordingly, even before you press a key. Try this option e.g. when CTRL-C acts differently on _command_ with, and without, rlwrap. 

**-z, --filter _filter_**
:  Use a filter to change rlwrap's behaviour. A filter can be used to keep certain input out of the history, to change the prompt, to implement simple macros or programmable completion.. rlwrap comes with a special **perl** module (cf. [**RlwrapFilter][1](3pm)**) for easy filter writing. A number of example filters are installed in the directory /usr/share/rlwrap/filters. "rlwrap -z _filter_" displays information about a filter, "rlwrap -z listing" lists all currently installed filters. If _filter_ needs args, you should quote the whole filter command line: 
    
    
    
        rlwrap -z 'filter args' command
    
    

If this command line contains shell metacharacters, rlwrap passes it to the system shell for parsing. 

## EXAMPLES

Run **nc** (netcat) with command-line editing and history
:  **rlwrap nc**

Wrap **smbclient** (which uses readline itself), keep passwords out of the history and don't wrap commands launched from smbclient (like **more**)
:  **rlwrap -aPassword: -N smbclient //PEANUT/C**

Wrap **gauche** (a Scheme interpreter) with a bold blue prompt, enable multi-line editing (using .scm as filename extension) and don't consider single quotes as quotes (so that the parentheses in e.g. (print 'q) match) 
:  **rlwrap -pBlue -m -M .scm -q'' gosh**

Get a list of all currently installed filters
:  **rlwrap -z listing**

Get help for the filter **pipeto**
:  **rlwrap -z pipeto**

Wrap **sqlite3**, use the **pipeto** filter to be able to pipe the output of SQL commands through **grep** and/or **less**, complete (case-insensitively) on the SQL keywords in 'sql_words'
:  **rlwrap -a -z pipeto -i -f sql_words sqlite3 contacts.db**

In a shell script, use rlwrap in 'one-shot' mode as a replacement for **read**
:  **order=$(rlwrap -pYellow -S 'Your pizza? ' -H past_orders -P Margherita -o cat)**

## DIRECT MODE AND READLINE MODE

Most simple console commands put your terminal either in "cooked" or in "raw" mode. In cooked mode the terminal will wait until you press the ENTER key before handing the entire line to the program, in raw mode every key you press is handed down immediately. In cooked mode you generally can use the backspace key, but not the arrow keys, to edit your input. Most simple console commands use cooked mode whenever they want whole input lines, and raw mode when they want single keypresses. More sophisticated commands tend to use raw mode all the time; they may sometimes be rlwrappable with the **-a** (and **-N**) options. 

When you rlwrap _command_, rlwrap will run it a in a separate session, with its own "pseudo-terminal" (pty), and monitor this pty to see whether the pty is in raw mode or in cooked mode. In the first case, rlwrap will copy all input and output directly between _command_ and your terminal ("direct mode"). In the second case, rlwrap will use readline to edit your input ("readline mode"), and monitor **command**'s output - every last line that doesn't end with a newline is a potential prompt. How it handles such a candidate prompt depends on its being in "patient" or "impatient" mode: 

## PATIENT AND IMPATIENT MODE

If _command_ writes a lot of output, it tends to be written (and read) in "chunks". Not all chunks will end with a newline, and we need to distinguish their last lines from real prompts, especially if we want to re-write ("cook") prompts. rlwrap solves this (almost) by waiting a little, to see if there is more to come. "A little" is 40 msec by default, but this can be changed with the **-w** option. Normally rlwrap writes the suspected prompt as soon as it is received, replacing it with a "cooked" version afer the wait time. This is called "impatient" mode. If you don't like the flashing effect (which can become annoying when you "cook" the prompt heavily) you can put rlwrap in "patient mode" by specifying a negative value with **-w** (e.g. -w -40). Rlwrap will then hold back the prompt and only print if after cooking. 

## COOKING PROMPTS

If and when rlwrap decides that it has a prompt, it will perform a number of actions on it, depending on the given options: filtering (**-z**), substituting (**-S**) and colouring (**-p**), in this order. The resulting "cooked" prompt is then printed (after erasing the "raw" prompt, if necessary) 

## SPECIAL KEYS

**Control + O**
:  Accept the current line, but don't put it in the history list. This action has a readline command name _rlwrap-accept-line-and-forget_

**Control + ^**
:  Use an external editor to edit the current input (this will only work if the -m option is set). This action has a readline command name _rlwrap-call-editor_

These special keys were chosen for no other reason than that they are not currently bound to any readline action. If you don't like them, (or your window manager swallows them) they can be re-bound more sensibly by including lines like the following in your **~/.inputrc**: 
    
    
       "M-C-m": rlwrap-accept-line-and-forget # ESC-ENTER 
       "C-xe":   rlwrap-call-editor            # CTRL-x e 
    

cf. the [**readline][2](3)** manpage 

## ENVIRONMENT 

**RLWRAP_HOME**: 
:  directory in which the history and completion files are kept. 

**RLWRAP_EDITOR** (or else **EDITOR**, or else **VISUAL**): 
:  editor to use for multi-line input. Example: 
    
    
        export RLWRAP_EDITOR="vi +%L"
        export RLWRAP_EDITOR="vim '+call cursor(%L,%C)'"
    

The first example above is the default; %L and %C are replaced by line and column numbers corresponding to the cursor position in rlwrap's edit buffer 

**RLWRAP_FILTERDIR**: 
:  Any executable along your PATH can in theory be used as a filter, but because filters have to follow a rather outlandish protocol (cf. **RlwrapFilter (3)**) it is a good idea to keep them separate. This is why rlwrap adds a special filter directory to $PATH just before launching a filter. By default, this is /usr/share/rlwrap/filters, but $RLWRAP_FILTERDIR is used if set. 

## SIGNALS

A number of signals are forwarded to _command_: HUP INT QUIT USR1 USR2 TERM and (by way of resizing _command_'s terminal) WINCH. Some care is taken to handle TSTP (usually a result of a CTRL-Z from the terminal) sensibly - for example, after suspending rlwrap in the middle of a line edit, continuing (by typing 'fg') will land you at the exact spot where you suspended it. 

Filters that take more than 1 second to respond can be interrupted by a CTRL-C from the terminal (although rlwrap will not survive this) 

If _command_ changes the keystrokes that send a particular signal from the keyboard (like emacs, which uses CTRL-G instead of CTRL-C) rlwrap will do the same (but only after the next keystroke - use the **\--polling** option to make rlwrap more transparent in this respect) 

When _command_ is killed by a signal, rlwrap will clean up, reset its signal handlers an then commit suicide by sending the same signal to itself. This means that your shell sees the same exit status as it would have seen without rlwrap. 

## REDIRECTION

When the standard input is not a terminal, editing input doesn't make sense, so rlwrap will ignore all options and simply execute _command_. When stdout (or stderr) is not a terminal, rlwrap will re-open it to /dev/tty (the users terminal) after it has started _command_, so that _command_'s output is redirected as expected, but keyboard input and rlwrap error messages are still visible. 

The upshot of this is that rlwrap _command_ behaves more or less like _command_ when redirecting. 

## EXIT STATUS

non-zero after a rlwrap error, or else _command_'s exit status. rlwrap will always leave the terminal in a tidy state, even after a crash. 

## FILES

rlwrap expects its history and completion files in $RLWRAP_HOME, but uses .dotfiles in the user's home directory if this variable is not set. This will quickly become messy if you use rlwrap for many different commands. 

$RLWRAP_HOME/_command__history, ~/._command__history
:  History for _command_

$RLWRAP_HOME/_command__completions, ~/._command__completions
:  Per-user completion word list for _command_. rlwrap never writes into this list, but one can combine **-l** and **-f** options to to simulate the effect of a **-r** option that works across invocations. 

/usr/share/rlwrap/completions/_command_
:  System-wide completion word list for _command_. This file is only consulted if the per-user completion word list is not found. 

$INPUTRC, ~/.inputrc
:  Individual readline initialisation file (See readline (3) for its format). rlwrap sets its _application name_ to _command_ (this can be overridden by the **-C** option), enabling different behaviours for different commands. One could e.g. put the following lines in **~/.inputrc**: 

: 
    
    
    
       $if coqtop
           set show-all-if-ambiguous On
       $endif
    
    

making rlwrap show all completions whenever it runs **coqtop**

## BUGS and LIMITATIONS 

Though it is flexible, delivers the goods (readline functionality), and adheres to the Unix "many small tools" paradigm, rlwrap is a kludge. It cannot know anything about _command_'s internal state, which makes context-sensitive completion impossible. Using the readline library from within _command_ is still the best option. 

Also, because "it takes two to tango" there is no way for rlwrap to synchronise its internal state with _command_, resulting in a number of subtle race conditions, where e.g. _command_ may have changed the state of its terminal before rlwrap has read _command_ output that was written before the state change. You will notice these races especially on a busy machine and with heavy "cooking" and filtering, when suddenly (and unpredictably) promtps or command output are garbled or incorrectly coloured.   
   rlwrap can try, but often fails to, handle prompts that contain control characters. A flter may be used to clean up the prompt. 

## VERSION

This manpage documents rlwrap version 0.42

## AUTHORS

The readline library (written by Brian Fox and Chet Ramey) does all the hard work behind the scenes, the pty-handling code has been taken practically unchanged from rxvt-2.7.10 (currently maintained by Geoff C. Wing), and completion word lists are managed by Damian Ivereigh's libredblack library. The few remaining lines of code were written by Hans Lub (hanslub42 [at] gmail.com).

## SEE ALSO

[readline][2](3), [RlwrapFilter][1](3pm)

[1]: https://www.systutorials.com/docs/linux/man/3pm-RlwrapFilter/
[2]: https://www.systutorials.com/docs/linux/man/3-readline/
