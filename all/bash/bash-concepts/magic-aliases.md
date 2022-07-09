# Magic Aliases

A Layering Loophole in the Bourne Shell - by Simon Tatham
https://www.chiark.greenend.org.uk/~sgtatham/aliases.html

Bash expands aliases long before it deals with other command line words. At the time an alias is expanded, the rest of the command line has not yet underwent parameter expansions nor glob expansions - this means an _alias can affect later expansions_.

A cmdline is first checked whether it is an alias, then a function, then a builtin, then a keyword, then


As an example, here's an eponymous function-alias pair:

```bash
# function
lsetc(){ cd /etc; ls -l "$@"; }

# alias
alias lsetc='cd /etc; ls -l'
```

NOTE: Start with a clean env each time: first try with a function, then clean env and try the alias.

NOTE: It's also possible to define them both at the same time (should the bash complain make sure you define the function first) because bash keeps the names of aliases, functions and variables in different namespaces. However, if you do, you'll get different results from these described below.

(define just one at the time, e.g. start with just an alias): If you type `lsetc`, or provide some inert arguments, e.g. `lsetc passwd hosts`, both the alias and function version behave the same.

If a wildcard is involved, e.g. `lsetc *.conf`, something interesting occurs:

Function:
* the args passed to the function, and then to the ls, result from expanding the wildcard `*.conf` in the current directory.
* the output is a list of `.conf` files in `/etc` that *also exist in the dir where the function was called* (matched by filename)

Alias:
* the alias will be expanded into `cd /etc; ls -l *.conf`
* bash is already done with `cd` when it expands the wildcard in the arg of `ls`
* the output is a list of `.conf` files in `/etc`



## Harnessing their Power

This is all good but not very interesting. The lsetc cmd is useless because it changes your cwd, leaving you in /etc as a side effect.

*An alias containing a sequence of semicolon-separated commands has a great potential, especially if combined with a function*.

We have to fiind a more practical way:

```bash
lhelper() { ls -l "$@"; cd "$originaldir"; unset originaldir; }

alias lsetc='originaldir="$PWD"; cd /etc; lhelper'
```

This new version of lsetc has a special property: if you give it a wildcard, it is expanded within /etc, rather then in cwd.

> The alias saves a relevant part of the env before modifying it, and then calls the helper function, potentially passing it the args. The helper function restores the part of env that the alias saved.

So the args passed to the alias undergo variable and wildcard expansion in the altered shell context, yet the whole process of execution of that alias leaves the shell context seemingly unchanged.

*MAGIC ALIAS is an alias in colaboration with a function, in which the alias' args are evaluated in a different env than expected.*



## Philosophy

But after you've used it for a little while, you start to notice an underlying consistency which enables you to be confident that you don't need to worry about unexpected behaviour in many circumstances.

One important form of this consistency is that the shell expands arguments before passing them to subcommands.

Under other operating systems (notably DOS), wildcards are expanded by each individual system command and program, and each one expands them in their own way.

A hurriedly written program, for example, might not understand wildcards at all; at the other end of the spectrum, you could write a rename program that ‘intelligently’ parsed your command line and understood the intent behind rename *.txt *.text.

So the shell's strength is its absolute consistency in this regard.

Because the shell expands wildcards before passing them to a command, they are guaranteed to be expanded in exactly the same way in all cases.

Any wildcard which matches at least one file will arrive in the subprogram in the form of a list of valid filename arguments; so in any situation where a command expects a list of one or more filenames, it is valid to use a wildcard instead.

Life is simpler for the application programmer, and there are fewer tricky special cases to remember for the user, and if a little flexibility such as the above rename example is lost in the process, that often seems a small price to pay.

In fact, I usually find my own bulk renaming needs are more complex than that syntax could easily express anyway, so I have a bulk rename utility that uses regular expressions! Much more powerful.


Even with shell functions, this consistency is not broken. Arguments to a shell function are expanded in exactly the same way as arguments to an external command, before the function begins to run.
A function can do more than an external command - it can alter your shell's internal state, such as variables and current directory - but there are still limits on how much it can mess with the command line you give it.


However, the magic alias trick is a loophole in the Bourne shell's otherwise unbroken consistency. It allows you to create commands which interpret their command lines at a level which by rights ought to be impossible: a command, for example, which can tell the difference between `mycmd *.c` and `mycmd foo.c bar.c`, even when the former expands to the latter. 


*Also, there's a much more immediate danger in putting a semicolon inside an alias: it causes parsing of composite commands to do unexpected things*. For example, you should never put `&` at the end of a magic alias invocation, or the shell function that restores your environment to the way it started off will be run in a context where it can't affect your original shell!


## Applications
Here's a concrete example of how magic aliases could actually be useful. We've already seen the idea of having command-line wildcards evaluated in a different directory from the obvious one. One much more simple thing which affects wildcard expansion is just not to expand them at all. Here's a helper function and an alias which arrange this:

```bash
noglob_helper() {
  "$@"
  case "$shopts" in
    *noglob*) ;;
    *) set +f ;;
  esac
  unset shopts
}

alias noglob='shopts="$SHELLOPTS"; set -f; noglob_helper'
```

This turns wildcard expansion off completely (set -f) before evaluating the alias's arguments, and then restores it to its original state afterwards. So after doing this, you can use the new noglob prefix to avoid globbing the arguments to a particular command:

```bash
echo *.c
# foo.c bar.c baz.c
noglob echo *.c
# *.c
```

This is a fairly benign use of the technique, and also fairly unhelpful since it would have been quicker to type `echo '*.c'` than to bother typing the noglob prefix!

If you're feeling brave, you could try defining specific aliases which apply the noglob property automatically to certain commands. One command in which wildcards almost always have to be quoted is find:

```bash
find . -name '*.[ch]' | xargs grep 'struct treenode'

# So if you cover the find command with an alias much like noglob:
alias find='shopts="$SHELLOPTS"; set -f; noglob_helper find'

# then you will be able to type
find . -name *.[ch]
# without fear of premature wildcard expansion
```


Other possibilities include fiddling with the finer details of the globbing options in extended shells (nocaseglob, extglob, and dotglob in bash);

I've already mentioned the possibility of evaluating wildcards in a different directory (but note that this also affects I/O redirections).

You could disable bash's brace expansion; you could turn on `set -C` to avoid clobbering existing files with output redirections. The list goes on.


Irritatingly, one thing you can't do is turn off parsing of shell comments (another bash feature) for one command only. This would be incredibly useful if you had an IRC client or utility which expected a channel name on the command line: you could redefine the utility name as an alias and arrange that ‘irc -c #foobar’ was parsed in the useful way rather than by treating everything after the hash as a comment! But unfortunately, this doesn't seem to work: comments must have already been parsed by the time the alias substitution takes place.


Finally, a helpful technique for restoring sanity. As soon as you start defining aliases that modify the behaviour of existing commands, you also start wondering if you can easily turn them off when necessary.

The invokation of an alias may be bypassed by quoting any part of its name. This works because aliases are expanded early and the lookup for a mathing name happens before the removal of (backslash) escapes, so the shell fails finding an alias with a slash in its name, `\ls`.



## Related Hacks

With bash in particular, there is an even worse hack you can do which allows you to suppress all of the normal bash command-line processing by putting a comment character at the end of the alias definition. This suppresses parsing the remainder of the line.

After you do this, you then need to recover the command line from somewhere so you can process it in your own way. One way is to recover it from history:

```bash
echo-literally-helper() {
    str="`history 1 | perl -pe 's/^ *[0-9]+ +[^ ]+ //'`"
    echo "$str"
}

alias echo-literally='echo-literally-helper #'
```

The resulting alias is a command which prints exactly what was passed on the remainder of its command line, whether that contains single quotes, double quotes, theoretically insignificant variations in whitespace, redirections, wildcards, trailing backslashes or even other comment characters:

```bash
$ echo-literally a; b; c
a; b; c
$ echo-literally    a
   a
$ echo-literally hello, world > thingy
hello, world > thingy
$ echo-literally ooh # this is a comment
ooh # this is a comment
$ echo-literally `rm -rf $HOME`
`rm -rf $HOME`
```


Of course, this hack is even more unstable than the magic alias hack: it won't work if run from a script, or as part of a complex command - *it only works properly if typed on the interactive shell command line*. It might be possible to use it elsewhere, for example, by passing a verbatim command through ssh.
