# Shell words

A **shell word** is a character or a string of characters that has a meaning to the shell.

A shell word is a character, or a string of characters, that carry some meaning in the shell. Shell words are somewhat analogous to the words of a natural language. A shell word is a string of alphabetic and/or symbolic characters.

In fact, every *token* may be considered a shell word. That is, any character, or a string of characters, that has a meaning may be considered as a shell word.

Some utilities, particularly GNU Readline, define functions that operate on the command line, which is seen as a mere set of characters. Then, some commands' notion of a word is the shell word, and other commands' notion of a word is more in line with words from natural languages.

## What constitutes a shell word

The central issue here is what exactly makes up a word, and, similarly, what characters should qualify as word splitters?

Instead of defining a uniqe take on this, readline provides different functions for each interpretation. So, some functions consider a word to be only a string of character surrounded by space charcter, while others have a sligthly different notion of a word, perhaps more in line with what constitutes a word in a natural language.

One readline function for deleting words may delete only the alphanumerical sequence of characters, leaving the symbolic characters, while another function may delete them all (if contiguous).

## The hierarchy of shell words

Taking any meaningful (to shell) string of characters as a shell word, then any identifier, name, metacharacter, punctuation even, is a shell word and belongs to a particular set.

By placing the set of shell words as the top-level category, we can define the shell hierarchy as

Shell words (tokens)
- the set of reserved words
  - the set of metacharacters
  - the set of punctuation symbols
  - the set of keywords
- the set of names
  - the set of builtin names
  - the set of alias names
  - the set of function names
  - the set of command names
