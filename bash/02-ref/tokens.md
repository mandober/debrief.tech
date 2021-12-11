# Tokens

In general, words and characters that appear on the command line or in scripts may be divided into internal and those external to the bash shell. The internal words are the tokens that have a special meaning in bash and they may be divided into three groups; the external words are all the other tokens that stand for misc other elements, mostly for entities of the file system.

Bash tokens are categorized into 3 groups:
1. Builtins
2. Keywords
3. Metacharacters

Syntactically, the biggest difference between a keyword and a builtin is in whitespace treatment. Builtins, like most of the shell tokens, are extremelly sensible to whitespace and require a padding between them and the surrounding words. On the other hand, the keywords don't care at all, and they get correctly parsed in either case.

```bash
# there must be a space between the builtin `[` and its args
if [$var ...
#  ^^ ERROR due to space

# the same with:
if [[$var
#  ^^^ must be ws-separated
```



*Bash Metacharacters*
*Bash Keywords*
*Bash Builtins*
