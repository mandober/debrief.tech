# Bash syntax

https://aosabook.org/en/v1/bash.html

## Syntactic Units and Primitives

### Primitives

To bash, there are basically 3 kinds of *tokens*:
- reserved words
- operators
- other words

**Reserved words** have meaning to the shell and its programming language. These reserved words include the *keywords* of the shell's programming language; for example, they introduce flow control constructs, like 'if' and 'while' keywords.

**Operators** are composed of one or more *metacharacters*, which are characters that have special meaning to the shell on their own (such as `|` and `>`).

The rest of the shell's input consists of **ordinary words**, some of which have *special meaning*; for instance, assignment statements, and numbers, depending on where they appear on the command line.

## Variables and parameters

As in any programming language, shell provides *variables*: *names* to refer to stored data and operate on it. The shell provides basic user-settable variables and some built-in variables referred to as *parameters*.

*Shell parameters* generally reflect some aspect of the shell's internal state, and are set automatically or as a side effect of another operation.

*Variable* values are strings. Some values are treated specially depending on context. Variables are assigned using statements of the form `name=value`. The value is optional; omitting it assigns the empty string to name. If the value is supplied, the shell expands the value and assigns it to name. 

The shell can perform different operations based on whether or not a variable is set, but assigning a value is the only way to set a variable. 

Variables that have not been assigned a value, even if they have been declared and given attributes, are referred to as *unset*.

A *word* beginning with a dollar sign introduces a variable or parameter reference. The word, including the dollar sign, is replaced with the value of the named variable.

The shell provides a rich set of *expansion operators*, from simple value replacement to changing or removing portions of the value that matches a pattern.

There are provisions for local and global variables.

By default, all variables are *global*. Any simple command (the most familiar type of command - a command name and optional set of arguments and redirections) may be prefixed by a set of assignment statements to cause those variables to exist only for that command.

The shell implements stored procedures, aka *shell functions*, which can have *local variables* (local to function).

Variables can be *minimally typed*: in addition to simple string-valued variables, there are integers and arrays.

*Integer-typed variables* are treated as numbers: any string assigned to them is expanded as an arithmetic expression and the result is assigned as the variable's value.

*Arrays* may be indexed or associative. 

*Indexed arrays* use numbers as subscripts.

*Associative arrays* use arbitrary strings.

Array elements are strings, which can be treated as integers if desired. 
Array elements may not be other arrays.

Bash uses *hash tables* to store and retrieve shell variables, and *linked lists* of these hash tables to implement *variable scoping*.

There are different variable scopes for shell function calls and temporary scopes for variables set by assignment statements preceding a command. 

When those assignment statements precede a builtin, for instance, the shell has to keep track of the correct order in which to resolve variable references, and the linked scopes allow bash to do that.

There can be a surprising number of scopes to traverse depending on the execution nesting level.

## The Shell Programming Language

A *simple command*, one with which most readers are most familiar, consists of a command name (such as `echo` or `cd`) and a list of zero or more arguments, and redirections.

*Redirections* allow the user to control the input to and output from invoked commands. As noted above, users can define variables local to simple commands.

*Reserved words* introduce more complex shell commands. There are constructs common to high-level programming languages, such as `if-then-else`, `while`, `for` loop that iterates over a list of values, and a C-like arithmetic `for` loop. These more complex commands allow the shell to execute a command or otherwise test a condition and perform different operations based on the result, or execute commands multiple times (in a loop).

One of the gifts Unix brought the computing world is the *pipeline*: a linear list of commands, in which the output of one command in the list becomes the input of the next. Any shell construct can be used in a pipeline, and it's not uncommon to see pipelines in which a command feeds data to a loop.

Bash implements a facility that allows the standard input, standard output, and standard error streams for a command to be redirected to a file or process when the command is invoked. Shell programmers can also use redirection to open and close files in the current shell environment (`exec`).

Bash allows shell programs to be stored and used more than once. *Shell functions* and *shell scripts* are both ways to name a group of commands and execute the group, just like executing any other command.

*Shell functions* are declared using a special syntax and stored and executed in the same shell context. Shell functions share most of the execution context with the shell that invoked them.

*Shell scripts* are created by putting commands into a file and executing a new instance of the shell to interpret them. Shell scripts, since they are interpreted by a new shell instance, share only what is passed between processes in the environment.

### A Further Note

As you read further, keep in mind that the shell implements its features using only a few *data structures*:
- arrays
- trees
- singly-linked list
- doubly-linked lists
- hash tables

Nearly all of the shell constructs are implemented using these primitives.

The basic data structure the shell uses to pass information from one stage to the next, and to operate on data units within each processing stage, is the `WORD_DESC`:

```c
typedef struct word_desc {
  char *word;           /* nul-terminated string */
  int flags;            /* flags associated with this word */
} WORD_DESC;
```

Words are combined into, for example, argument lists, using simple linked lists:

```c
typedef struct word_list {
  struct word_list *next;
  WORD_DESC *word;
} WORD_LIST;
```

`WORD_LIST` is a pervasive structure throughout the shell. A simple command is a word list, the result of expansion is a word list, and builtins take arguments as word list.

## Input Processing

The first stage of the *bash processing pipeline* is *input processing*: taking characters from the terminal or file, and breaking them into lines, then passing these lines to the shell parser that transforms them into commands.

The lines are sequences of characters terminated by a NL (newline).

### Readline and Command Line Editing

Bash reads input from the terminal when interactive; otherwise, from a script file specified as an argument.

When *interactive*, bash allows the user to edit command lines while they are typed in, using key sequences and editing commands similar to those of the emacs and vi editors.

Bash uses the `readline` library to implement command line editing.

It provides a set of functions allowing users to edit command lines, functions to save command lines as they are entered, to recall previous commands, and to perform csh-like history expansion.

Bash is readline's primary client, and they are developed together, but there is no bash-specific code in readline. Many other projects have adopted readline to provide a terminal-based line editing interface.

Readline also allows users to *bind key sequences* of unlimited length to any of a large number of readline commands.

Readline has commands to move the cursor around the line, insert and remove text, retrieve previous lines, and complete partially-typed words. 

On top of this, users may define *macros*, which are strings of characters that are inserted into the line in response to a key sequence, using the same syntax as key bindings. Macros afford readline users a simple string substitution and shorthand facility.

### Readline Structure

(...)

### Non-interactive Input Processing

In non-interactive mode, instead of readline, bash uses either `stdio` or its own buffered input routines to obtain the input.

The bash's own *buffered input* method is preferable to stdio because of the somewhat peculiar restrictions POSIX standard imposes on the input consumption: the shell is supposed to consume only as much of the input as necessary to parse a command, leaving the rest for executed programs.

This is particularly important when the shell is reading a script from the standard input. The shell is allowed to buffer input as much as it wants, as long as it is able to roll the file offset back to just after the last character the parser consumes. 

In practice, this means that the shell must read scripts one character at a time when reading from *non-seekable devices* such as pipes, but may buffer as many characters as it likes when reading from files.

These idiosyncrasies aside, the output of the non-interactive input portion of the shell processing ends up the same as with readline: a buffer of characters terminated by a newline.

### Multibyte Characters

*Multibyte character processing* was added to bash long after its initial introduction, and it was done so as to minimize the impact on the existing code.

In a locale that supports multibyte characters, the shell stores its input in a buffer of bytes (C chars), but treats these bytes as potentially multibyte characters. 

Readline understands how to display multibyte characters (the key is knowing how many *screen positions* a multibyte character occupies, and how many bytes to consume from a buffer when displaying a character on the screen), how to move forward and backward on the line one character at a time (as opposed to a byte at a time), and so on.

Other than that, multibyte characters do not have much effect on the shell's input processing, although other parts of the shell need to be aware of multibyte characters and take them into account when processing input.

## Parsing

The initial job of the parsing engine is *lexical analysis*: to break the input stream of characters into tokens (shell words).

A **shell word** is the basic unit on which the parser operates.

associating them with meaning.


*Words* are *sequences of characters* separated by *metacharacters* (which include delimiters like spaces and tabs), and characters special to the shell language like semicolon and ampersand.

One historical problem with the shell, as Tom Duff said in his paper about rc, the Plan 9 shell, is that nobody really knows what the Bourne shell grammar is. The Posix shell committee deserves significant credit for finally publishing a definitive grammar for a Unix shell, albeit one that has plenty of context dependencies. That grammar isn't without its problems-it disallows some constructs that historical Bourne shell parsers have accepted without error-but it's the best we have.

The bash parser is derived from an early version of the Posix grammar, and is, as far as I know, the only Bourne-style shell parser implemented using Yacc or Bison. This has presented its own set of difficulties-the shell grammar isn't really well-suited to yacc-style parsing and requires some complicated lexical analysis and a lot of cooperation between the parser and the lexical analyzer.

In any event, the lexical analyzer takes lines of input from readline or another source, breaks them into tokens at metacharacters, identifies the tokens based on context, and passes them on to the parser to be assembled into statements and commands. There is a lot of context involved-for instance, the word for can be a reserved word, an identifier, part of an assignment statement, or other word, and the following is a perfectly valid command:

for for in for; do for=for; done; echo $for
that displays for.

At this point, a short digression about aliasing is in order. Bash allows the first word of a simple command to be replaced with arbitrary text using aliases. Since they're completely lexical, aliases can even be used (or abused) to change the shell grammar: it's possible to write an alias that implements a compound command that bash doesn't provide. The bash parser implements aliasing completely in the lexical phase, though the parser has to inform the analyzer when alias expansion is permitted.

Like many programming languages, the shell allows characters to be escaped to remove their special meaning, so that metacharacters such as & can appear in commands. There are three types of quoting, each of which is slightly different and permits slightly different interpretations of the quoted text: the backslash, which escapes the next character; single quotes, which prevent interpretation of all enclosed characters; and double quotes, which prevent some interpretation but allow certain word expansions (and treats backslashes differently). The lexical analyzer interprets quoted characters and strings and prevents them from being recognized by the parser as reserved words or metacharacters. There are also two special cases, $'…' and $"…", that expand backslash-escaped characters in the same fashion as ANSI C strings and allow characters to be translated using standard internationalization functions, respectively. The former is widely used; the latter, perhaps because there are few good examples or use cases, less so.

The rest of the interface between the parser and lexical analyzer is straightforward. The parser encodes a certain amount of state and shares it with the analyzer to allow the sort of context-dependent analysis the grammar requires. For example, the lexical analyzer categorizes words according to the token type: reserved word (in the appropriate context), word, assignment statement, and so on. In order to do this, the parser has to tell it something about how far it has progressed parsing a command, whether it is processing a multiline string (sometimes called a "here-document"), whether it's in a case statement or a conditional command, or whether it is processing an extended shell pattern or compound assignment statement.

Much of the work to recognize the end of the command substitution during the parsing stage is encapsulated into a single function (parse_comsub), which knows an uncomfortable amount of shell syntax and duplicates rather more of the token-reading code than is optimal. This function has to know about here documents, shell comments, metacharacters and word boundaries, quoting, and when reserved words are acceptable (so it knows when it's in a case statement); it took a while to get that right.

When expanding a command substitution during word expansion, bash uses the parser to find the correct end of the construct. This is similar to turning a string into a command for eval, but in this case the command isn't terminated by the end of the string. In order to make this work, the parser must recognize a right parenthesis as a valid command terminator, which leads to special cases in a number of grammar productions and requires the lexical analyzer to flag a right parenthesis (in the appropriate context) as denoting EOF. The parser also has to save and restore parser state before recursively invoking yyparse, since a command substitution can be parsed and executed as part of expanding a prompt string in the middle of reading a command. Since the input functions implement read-ahead, this function must finally take care of rewinding the bash input pointer to the right spot, whether bash is reading input from a string, a file, or the terminal using readline. This is important not only so that input is not lost, but so the command substitution expansion functions construct the correct string for execution.

Similar problems are posed by programmable word completion, which allows arbitrary commands to be executed while parsing another command, and solved by saving and restoring parser state around invocations.

Quoting is also a source of incompatibility and debate. Twenty years after the publication of the first Posix shell standard, members of the standards working group are still debating the proper behavior of obscure quoting. As before, the Bourne shell is no help other than as a reference implementation to observe behavior.

The parser returns a single C structure representing a command (which, in the case of compound commands like loops, may include other commands in turn) and passes it to the next stage of the shell's operation: word expansion. The command structure is composed of command objects and lists of words. Most of the word lists are subject to various transformations, depending on their context, as explained in the following sections.

3.5. Word Expansions
