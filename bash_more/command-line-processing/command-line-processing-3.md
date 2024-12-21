# Command line processing

https://en.wikipedia.org/wiki/Bash_(Unix_shell)

As a *command processor*, Bash operates within a terminal where users input commands (at the command line) to execute various tasks. It also supports the execution of commands from files, known as *shell scripts*, facilitating automation. 

## Bash features

Bash incorporates a rich set of features including
- bash invocation
  - as non-interactive shell
    - with file args
    - `-c` followed by a string (command) arg
  - as interactive shell
    - login shell vs non-login shell
- supports exit status codes
- supports control structures
  - loops (iteration): `for`, `while`, `until`
  - conditionals
    - `if`, `case`, `select`
    - `&&` (AND), `||` (OR)
    - tests/testing for
      - syntax for file types, string value, integer value testing
      - the C-style loop, `for ((…))`
      - traditional single-bracket test, `[ … ]`
        - `[` is both an external program (`/bin/[`), and bash builtin
        - `]` has a weird status
      - modern double-bracket test, `[[ … ]]`, including
      - extended regular expression and extglob matching
      - lexicographic sorting with `<` and `>`
  - UNIX-style pipelines, `|`
  - subshells, `( … )`
  - signaling as a means of IPC using the `trap` builtin
  - asynchronous execution, `job_spec &`
  - modes
    - POSIX conformance mode
    - restricted mode
    - remote mode

## Bash command parsing

- comments are ignored
  - Bourne-style hashtag comments (`#`)
  - Thompson-style colon comments (`:`)
    - `:` builtin can only seem like a comment intro sign

- commands are parsed one line at a time
  - control structures are honored
  - backslash escapes (`\`), aka *line continuations*, are honored at EOL
  - cmdline is split into words (word splitting) according to quoting rules
  - including ANSI-C quoting `$'…'`

- expansions are performed on the resulting string in the following order:
  - brace expansion
  - tilde expansion
  - then from left-to-right:
    - parameter and variable expansion, including
      - dynamically scoped variables
      - indexed arrays of unlimited size
      - associative arrays
      - expansion pattern syntax
        - pattern substitution, `${foo//x/y}` as sed's `'s/x/y/g'`
        - remove matching prefix or suffix pattern,
          `${bar##[a-zA-Z0-9]*}` for `cut -c8-`
        - print array keys, `${!array[@]}`
        - display error if null or unset, `${var:?error message}`
  - command substitution, `$( … )`
  - process substitution, `<()` for input, and `>()` for output
  - arithmetic expansion, `(( … ))` or `$(( … ))`, including
      - integer arithmetic from 2 to 64 as base
  - word splitting (again)
  - pathname expansion: globbing with `*`, `?`, `[…]`
  - quote removal

- redirections, including
  - file writing `>`, and appending, `>>`
  - here-document, `<<`
  - here-strings, `<<<`, allow parameters to be used as input
  - redirection operator `>|` to force overwriting in spite of `noclobber`

- *command name lookup* is performed;
  namespaces are searched in the following order:
  - internal commands
    - shell aliases
    - shell reserved words
    - shell functions
    - shell builtins¹
  - external commands
    - executables: programs and shell scripts
    - sourceables
  - finally, the resulting string is executed as a command

(¹special builtins are found before shell functions during command lookup)

>LOOKUP PRECEDENCE: alias > reserved-word > function > builtin > programs

## Command name lookup

The shell has no idea about the user's intentions and their state of mind. It cannot know in advance whether the text the user has just typed is even a sensible command or utter gibberish; if it did, it'd know with 82 % certainty that every other command-line they submit between 3:12 and 4:43 in the AM contains a spelling mistake. 

However, the shell has to go through the motions, processing the input as it always does, and one of the outcomes of that process is a (unknown) name. At this point the shell performs **name resolution** in order to determine what the name represents.

By the way, some other end results of that processing include obtaining a *name-value pair* to be inserted as a new shell variable in the current environment (`name=value`); creating a new file (in case of `> file` redirection, which doesn't count as a command per se).


>After processing, a command-line input amounts to being either:
- a name=value pair (insert the new var into env; includes fn definition)
- (unknown) command name (do name resolution)
- degenerate redirection operation
- (…are there more?)




## Bash also offers

- Configurable execution environment(s):
  - Shell and session startup files such as ~/.bashrc and ~/.profile (i.e., dotfiles)
- Settings (set built-in) and shell options (shopt built-in) which alter shell behavior
- With interactive invocation only
  - Unlimited size command history
  - Jobs and job control
  -  A directory stack (see pushd and popd built-ins),
  -  Tab completion
  -  Configurable prompts
  - Command line editing with GNU readline

- Lightweight logging for debugging purposes (xtrace), and other lightweight debugging options (errexit, noexec, nounset, pipefail, etc.);
  - Shell compatibility modes: bash 5.1 can operate as if it were bash 4.2, etc.;
  - Documentation:
    - A built-in help command,
    - A man page, and
    - An info page which is the same as the GNU manual;
  - Informal avenues of support via:
    - IRC at libera.chat #bash
    - Mailing lists at https://www.gnu.org/software/bash/



The **Bash command syntax** is a superset of the Bourne shell command syntax.

Among other features, Bash supports
- brace expansion
- command line completion (Programmable Completion)
- basic debugging
- signal handling (using trap) since bash 2.05a

Bash can execute the vast majority of Bourne shell scripts without modification, with the exception of Bourne shell scripts stumbling into fringe syntax behavior interpreted differently in Bash or attempting to run a system command matching a newer Bash builtin, etc. 

Bash command syntax includes ideas drawn from the Korn Shell (ksh) and the C shell (csh), such as
- command line editing
- command history (history command)
- directory stack
- $RANDOM and $PPID variables
- POSIX command substitution syntax $(...)
