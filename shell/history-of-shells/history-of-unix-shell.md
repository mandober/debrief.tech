# Shell :: History of UNIX shell

Louis Pouzin has descibed the basic concept of the shell in his papers:

See project MAC at MIT and the two papers by Louis Pouzin
- `The SHELL: A Global Tool for Calling and Chaining Procedures in the System`
  by Louis Pouzin, April 2, 1965
  https://people.csail.mit.edu/saltzer/Multics/Multics-Documents/MDN/MDN-4.pdf
- `RUNCOM: A Macro-Procedure Processor for the 636 System`
  by Louis Pouzin, April 7, 1965
  https://people.csail.mit.edu/saltzer/Multics/Multics-Documents/MDN/MDN-5.pdf

These papers were about the idea of having a command processing shell be an unprivileged user program that parsed a command line, located a program to run, and executed it with arguments.

* MULTICS System-Programmers' Manual Section BX.1.00, Published: 10/29/68
Multics Command Language. 
W. H. Southworth, G. Schroeder, R. Sobecki, D. Eastwood
https://multicians.org/mspm-bx-1-00.html

## Multics' command processor

### Command processor
The Multics command processor used to be called the *shell*. This program is passed a command line for execution by the *listener*; it parses the line into a command name and arguments, locates the command and *initiates* it (map into an address space and optionally assign a reference name), and calls the command program with arguments that are PL/I character strings. It is simple to replace the default system supplied shell with a user-provided program, by calling `cu_$set_cp`. A *Unix shell* includes the concepts of both shell and listener in the Multics sense.

Louis Pouzin's story of "The Origin of the Shell" describes the genesis of the concept. An early implementation of the Multics command language is described in MSPM section BX.1.00 (see above).

Glossary of Multics acronyms and terms
https://multicians.org/mgl.html#listener

### Listener
Listener is the top-level program in the process that reads command lines and dispatches them to the command processor.

Listener is user-ring program that loops reading a line of input from the user and submitting it to the command processor. 

The listener, or "command level", is accessed via the switchable API 'cu_$cl' (you can install your own listener), and is called whenever command level is "pushed" by an error (compare Unix behavior) as well as at process start-up. 

Hence, one can investigate blowups with debuggers, or even change variables and type 'start' ('%'). 

Note that the job discipline is a stack, not a ring of equals as in Unix.

Attempts to create a new listener level in an absentee process cause the process to terminate.

### Command

Program designed to be invoked by typing its name at a terminal.

Multics commands are ordinary user programs, and what is more, ordinary PL/I procedures. Commands and "subroutines" are indistinguishable at the PL/I and dynamic linking levels. Although this reduces the number of search mechanisms, it rarely turned out to be useful, as calling a command as a subroutine or vice-versa, although fully possible and often done in kludges, presents all kinds of UI problems.

The proper handling and diagnosis of missing, malformed, or non-string arguments makes the passing of command arguments as actual parameters a poor idea, and the current C "argc/argv" scheme, an outcome of Multics's experience, is one correct solution. 

Correct handling of the *star convention* and *equal convention* are not so easy, though, and the seemingly-obvious solution of relegating that task to the *shell* (i.e. command processor) is fraught with well-known dangers whose horror stories adorn the landscape of Unix critiques.

- "Multics Commands and Active Functions" for a list of commands
https://multicians.org/multics-commands.html
- see also additional names
https://multicians.org/mga.html#additionalnames


### Command language
The Multics command language derives from the CTSS language, with ideas added from BESYS and TRAC. The listener reads lines from the input stream and passes them to the shell for execution.

The Multics command language permits quoting, iteration and command functions ("active functions") with string return values. The string return values can themselves contain quoting, iteration, or more command functions. 

By default the command processor evaluates the return value, but you can suppress that and use the unevaluated return value.

There is no particular limit to the length of a command line, command argument or return value; the `files` active function returns the names of all files matching a *star name*, for example, which can easily return hundreds of file names. 

Everything in Multics is case sensitive; Multics permits use of the full upper and lower case ASCII character set.

Multics command names and programming languages use lowercase by convention, but users are free to use uppercase letters in path names, identifiers, user names, etc.

```c
// Simple command line example:

rename a.pl1 b.pl1 /* renames branch a.pl1 to b.pl1 */
/* works on files, dirs, or links */

// Quoted command line example:

rename "x y z" "x_y_z" /* change spaces to underscores */
/* yes, filenames could have spaces */

// Iteration example:

rename (a b c).pl1 (d e f).pl1
// expands to:
rename a.pl1 d.pl1
rename b.pl1 e.pl1
rename c.pl1 f.pl1

// Active Function example:
copy [home_dir]>Green.abbrev Green.abbrev.save

// All of these features can be combined, nested, etc.
// to produce very complex (and very useful) command lines.

// To run two commands on the same file, you can say:
(edm pl1) t.pl1
// which runs the edm line editor then the pl1 compiler on the file t.pl1
```

Since Multics was meant to be extensible, you can write your own commands, your own active functions, your own command processor, or even your own "listener" (the top-level program in the process that reads command lines and dispatches them to the command processor). We had environments that simulated Dartmouth BASIC (by Bob Frankston) and GCOS time-sharing, to name two.

An early implementation of the Multics command language is described in MSPM section BX.1.00. Several features described in that section were changed later, such as the support for two different quoting mechanisms.


### Active functions

Active functions is a command, enclosed in brackets, inserted in a command line.

The shell invokes the inserted command and *captures its return value* and puts the value back on the command line for further evaluation. 

For example, the shell executes the command line

    delete [files *.pl1]

by invoking the `files` active function and constructing a `delete` command line that deletes all PL/I files in the working directory.

The term "active function" comes from Calvin Mooers' TRAC language, and was adopted to name a feature called *evaluated commands* in earlier versions of the shell spec.

https://web.mit.edu/multics-history/source/Multics/doc/info_segments/exec_com.info

#### Star Convention

Convention of representing the names of multiple entries in a directory with asterisks.

Each asterisk matches either one component of the trailing characters of a component: `foo.*.pl1` matches `foo.a.pl1`, but not `foo.pl1`.

`**` matches any number of components:
`foo.**` matches `foo`, `foo.pl1`, and `foo.pl1.old`. 

Although there are subroutines to do star matching and searching, it is the responsibility of commands to call them. Star expansion is not done by the shell. 

See also: Equal Convention.

#### Equal Convention

Command argument convention that specifies the interpretation of equal signs in file name arguments. Library function `equal_name_` provides this feature. A command that operates on related filename arguments should implement the equal convention. 

For example, the `rename` command operates on pairs of arguments. The equal convention specifies how equal signs in the second element of a pair are replaced by components of the first element.

A user can say

    rename fred.*.pl1 ==.old

to rename 
`fred.incl.pl1` to `fred.incl.pl1.old`, 
`fred.debug.pl1` to `fred.debug.pl1.old`, etc.

Also see: Star Convention.

### Command processor

See shell. Users may call their command processor via `cu_$cp`.
