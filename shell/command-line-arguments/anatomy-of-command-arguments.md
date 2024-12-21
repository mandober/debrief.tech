# Options and operands

argument
option
non-option
operand (non-option argument)
option-argument
required argument
optional argument
end-of-options, double dash
unambiguous abbreviations of long options
short options
long options
commonly encountered options
lone dash (-)
lone ddash (--)


Common options
- --help    Print usage, then exit (exit code 0).
- --version Print version, then exit (exit code 0).

**Double dash**, `--`, marks the end of options; arguments that follow are treated as operands even if they begin with a dash; e.g. `sort -- -r` reads from the file named `-r`. Normally, double-dash should appear only once.

A **single dash**, `-`, represents stdin or stdout (usually it is clear from the context which); e.g. `sort -` reads from stdin and it is equivalent to plain `sort`. Unless otherwise specified, a `-` can appear whever a file name is required. For example, `cat file1 - file1 -` merges 4 files: contents of `file1`, then whatever is entered by the user as stdin, then the contents of `file2`, then stdin again. So a dash may appear any number of times. Programs that have other interpretations of a single lone dash must specify them explictly; e.g. `env -` is the same as `env -i`.



- options come in two flavors wrt the introduction symbol: short and long
- options kinds:
  - short
  - long
  - special
  - flags (Boolean options)
  - options with required arg
  - options with optional arg



- special options
  - single dash, `-`, denotes the stdin
  - double dash, `--`, denotes the end of options
    - e.g. `echo` has option `-n` (don't print the trailing NL), so it cannot output '-n' easily; had it supported `--`, this would've been possible with `echo -- -n`. This *end-of-options* marker is also convenient when using commands that mention other commands, `env -e -- 'bash -c "echo -n"'`
- short options
  - short options are introduced (prefixed) with a dash, `-o`
  - short options may be grouped in clusters, `--output-file`
- long options
  - long options are introduced (prefixed) with a double dash
  - long options may be shortened while unambiguous
- options may have required or optional argument
  - in a cluster, only the last short option may have an argument, -aFo=FILE
- required argument to a short option is given
  - separated by equals,  `-o=FILE`
  - separated by a space, `-o FILE`
  - cannot be glued onto, -oFILE is ambiguous
- required argument to a long option is given
  - separated by `=`,       `--output=FILE`
  - separated by a space,   `--output FILE`
  - juxtaposed (glued onto) `--outputFILE`
- operands are non-option, i.e. the payload (e.g. in `ls DIR`, dirs are the payload so appear as operands; in `tail FILE`, files are the payload)
- assignments of the form `VAR=VALUE` before the name of command set the environment variable VAR to value VALUE in the subprocess.
- Setting a variable to an empty value is different from unsetting it
- Options need not precede operands unless stated otherwise. 

## getopt

flags
options

short-opt=()
long-opt=()
opt=( v verbose )


-a, --all (a pair of corresponding options)
--color[=WHEN] (optional arg)
--format=WORD (required arg)
--group-directories-first (but no corresponding shortopt)
-C (but no corresponding longopt)
-I, --ignore=PATTERN 

WHEN is constrained - it only takes one of: 'always' (default if WHEN is omitted), 'auto', 'never'.

---------------------------------
-aFsoFILE is ambiguous
-aFso=FILE
------------ canonize -----------
-aFso FILE ==> -a -F -s -o FILE
---------------------------------
--ven[dor]
--vers[ion]
--verba[tim]
--verbo[sity]
------------ canonize -----------
--vers    ==> --version
--verbo 3 ==> --verbosity=3
--verbo=3 ==> --verbosity=3
--verbo3  ==> --verbosity=3
---------------------------------
-aF OPERAND1 --vers -o=FILE OPERAND2
==>
-a -F -o=FILE --version -- OPERAND1 OPERAND2


[a]=1
[b]=0 (explicitly turn off option set by e.g. envar)
[F]=1
[o]=FILE
[version]=1
[color]=1        (without optional arg)
[color]=always   (with optional arg)
