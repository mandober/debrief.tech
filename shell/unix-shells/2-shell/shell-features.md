# Shell features

Shell features
- shell environment
  - variables
    - environment variables
    - shell variables
    - concrete-shell variables (e.g. bash variables)
    - user variables
    - exported variables
    - inherited variables
    - one-time env var (upon calling a command), `IFS=, cmd …`
  - command execution
    - shell, subshell, shell level `SHLVL`, shell child process
  - FDs
  - ulimits
  - umask
  - locale
  - settings: setops, shopt
- command-line
  - command-line history
  - command-line history
  - command-line processing, the machanics of
  - shell quoting and escaping machanics and mechanisms
  - globbing, glob expansion, regexp, tilde expansion

- mechanics / features / concepts
  - text in text out (everyting's string)
  - passing values around
  - capturing output
  - FDs, stdin, stdout, stderr, extra FDs
  - redirection
    - piping
    - heredoc
    - herestring
  - command substitution
  - process substitution
- scripting features
  - scripting language enhancements
  - types of variables: int, ro, array, ref
  - indexed arrays
  - associative arrays
- interactive features
  - TAB completion
  - completion menu
  - expansion of logical and arithmetical exp
  - autocompletion
  - programmable completions
- navigation, dir stack
- job control
  - async jobs
  - foreground jobs
  - background jobs
  - handling signals
  - traps
- shell aliases
- shell functions
- shell syntax
- shell keywords
- shell builtins
- emulation modes
- restricted modes
- command line history
- history-management capabilities
- auto-suggestions: real-time feedback based on command history
- colorful interface
- as-you-type syntax highlighting
- configuration, rc files
- startup, the startup sequence






Unix/Linux shells (unlike e.g. the cmd.exe on Windows) process the command line before forwarding the arguments (other words but the first) to the command (usually the first word on the command line). This process can be very complex and it includes the interpretation of *metacharacters* and many types of expansions.

- word-splitting
- quoting and escaping: removing quotes, escapes (backslash)
- globbing: expanding the glob patterns
- expanding tilde
- expanding vars
- expanding (calculating) arithemtical expressions
