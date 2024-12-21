# Bash :: Concepts

- command line processing
- command splitting and tokenization
- alias expansion
- expansions and substitutions
- word splitting
- performing redirections
- assignments NAME=VALUE
- name resolution, name lookup



## How does bash exactly processes a command line?
## How does bash exactly perform names resolution?
## Namespace resolution process
## Name resolution process - searching programs in PATH

## What does command line processing amount to?

What are the different types of outcome of command line processing?

Each type of outcome includes processing of the command-line input, no need to repeat it. The outcome is about what general types of tasks are eventually executed? 

The most common type of outcome is to obtain a *name*, then name resolution process conducted by *searching the namespaces* (keywords, functions, builtins, externals programs)

A *name* that is obtained after processing the command-line is a sufficiently well-formed string, meaning it satisfies some basic properties of being a shell-word (as opposed to utter gibberish) [like-the-fuck-what-exactly?] [it need not conform to the identifer rules from PLs - it need not start with an alphabetical character]

>Numbers are legit identifiers, e.g. the name of a bash function can start with a number, it can even be single digit.

```bash
5 () { echo "hola, cinque"; }

```

This *name* is the main (which usually - but not always - means the first) word on a command line.



assumed to be the name of an internal or external command (although this assumption may turn out wrong in the end) - this name is usually as the first word on a command line

eventually comes down to, what are the different types of tasks in the end?

Types of "outcomes"
1. command-like type of outcome:
   resolving the name, locating the command, executing it, showing the output, reporting the exit code
2. *name=value assignment(s)*: obtaining one (or more!) name=value pairs to place in the current environment
3. *creating a new file* (or truncating an existing file)

The most common outcome of a command-line processing is to obtain a (simple) command - with the main/first word as command's name - possibly followed by a number of arguments. This is what the majority of command-line interactions with the users amount to; the user types in the command, possibly with some arguments, and the shell finds and executes that command.


```bash
# 1. command-like type of outcome
git status

# 2. assignment 
```

## The difference between literal and syntactic quotes

**Syntactic quotes**: quotes that are part of syntax, i.e. instructions to the shell about how to parse things.

**Literal quotes**: quotes that are data, i.e. the actual content stored in a variable or passed to commands, etc.

These are two very different things. Once something has become data, it cannot go back to being syntax, at least not without using `eval`, `bash -c CMD`, or a similar construct.

## Types of shell values

There are only strings, so shell language is untyped. But these are not the same strings as in PLs, even when they are surrounded by single or double quotes. Strings can momentarily turn into shell words and names, assuming the active role in the command.

```bash
x='o abc'
ech$x
#: abc
ech"$x"
#: echo abc: command not found

# example2
var=\'"\"hello   world\""
echo "$var"
#: '"hello   world"
echo $var
#: '"hello world"

va2=''\''"hello world"'
```

All the interesting stuff happen on the assignment - let's break it down:
- `\'` This is an escaped single-quote. Without the escape, it would start a single-quoted string, but escaped, it is just a *literal single-quote*. Thus, the final string will start with `'`.
- `"`  This starts a double-quoted string
- `\"` An escaped double-quote; like the escaped single-quote, this gets treated as a *literal double-quote*, so `"` will be the second character of the final string.
- `hello   world` Since we are still in a double-quoted string, this just gets included literally in the final string. Note that if we were not inside double-quotes at this point, the space would mark the end of a string.
- `\"` Another escaped double-quote; again, included literally so the last character of the final string will be `"`.
- `"`  This closes the double-quoted string.

VS Code does a good a job of hightlighting it as to make sense: the escaped quotes (i.e. liternal quotes) are colored differently then syntactic quotes (that act as delimiters).
