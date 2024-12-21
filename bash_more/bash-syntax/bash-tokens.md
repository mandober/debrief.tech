# Bash tokens

## Primitives

To bash, there are basically 3 kinds of *tokens*:
- reserved words
- operators
- other words

**Reserved words** have meaning to the shell and its programming language. These reserved words include the *keywords* of the shell's programming language; for example, they introduce flow control constructs, like 'if' and 'while' keywords.

**Operators** are composed of one or more *metacharacters*, which are characters that have special meaning to the shell on their own (such as `|` and `>`).

The rest of the shell's input consists of **ordinary words**, some of which have *special meaning*; for instance, assignment statements, and numbers, depending on where they appear on the command line.
