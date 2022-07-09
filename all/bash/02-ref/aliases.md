# Aliases

- Alias is shell word that stands for another word or sequence of words.
- Aliases live in memory; they may be loaded from a file or defined on cmdline


Invocation of an alias may be bypassed by quoting any part of its name. Either single quotes or backslash escaping will do. This technic works because aliases get expanded early in the command line processing, so the lookup for a matching name starts before the quote removal phase, meaning that the shell fails finding an alias with a slash in its name, `\ls`.



An **alias** is basically a macro - a word that doesn't represent itself, but stands in for another word or a sequence of words. Aliases relieve the user from typing frequent but inconveniately long commands.

A new alias is defined using the builtin command `alias`, followed by a "key=value" pair. Unlike variable names, the characters allowed in an <ALIAS-KEY> are practically unresticted.

On the other hand, the <ALIAS-VALUE> should be made up of the valid shell words, paying attention to the proper quoting.

Whenever the <ALIAS-KEY> appears in the initial position of a simple command it gets replaced with the <ALIAS-VALUE>, as soon as the shell accepts a command line.

The "simple command" qualifier implies there may be more then one alias in a compound command. Every beginning of a simple command is an opportunity for alias placement.

If the <ALIAS-VALUE> has a trailing space (which implies that it should be wrapped in the single-quotes) **then the shell also probes the following word for aliasability**. This can be useful with "proxy" commands (e.g. `builtin`, `command`, `sudo`, `su`, etc.) that appear as prefixes to normal commands, thereby robbing them of potential aliasability. For example, is a user has an alias, also called `ls` for a very complicated configuration of the `ls` command, then the alias expands only when it is the first word (of a simple command). If the user need to check a restricted directory, doing `sudo ls ...` comes with a surprise. Now, instead of making another, almost identical alias (apart from the `sudo` prefix) for `ls` command, she will, well...akhm...still have to make another damn alias; but at least a shorter and a DRY one.

```bash
# proxy aliases: trailing space makes the shell examine
# the next word for aliasibilitisnessless
sudo='sudo '
# so the old `ll` alias does get expanded!
sudo ll

# the simplest kind of alias
alias ipconfig=ifconfig

# quoting is required for multi-word alias-values
alias l='ls -la'

# must put end-of-options mark if an operand's name starts with a dash
alias -- -='cd -'
```

The shell maintains a list of aliases that may be set with the `alias` and `unalias` builtins.

*The first word* of each simple command, if unquoted, 
is checked to see if it has/is an alias. 
If so, it is replaced by the alias' value (alias is expanded).

May not be a part of an *alias name*:
- chars: `<slash> <dollar> <backtick> <equals>`
- shell metacharacters
- quoting characters

*alias value* (the replacement text) may contain any valid shell input, including shell metacharacters.

*The first word of an alias value* is checked if it's also an alias, but only in case it is not the same word as the original alias name. This prevents unbounded recursion.

For example, if `alias ls="ls -F"`, bash will not try to recursively expand the first word in the replacement text.

> If the last character of the alias value is a blank, then the next command word following the alias is also checked for alias expansion. *unclear*

Aliases are not expanded when the shell is not interactive, unless this is enabled with `shopt -s expand_aliases`.

## Aliasing

Bash always reads *at least one complete line of input*, 
before executing any of the commands *on that line*.

Bash always reads *all lines that make up a compound command*, 
before executing any of the commands *of the compound command*.

Bash always reads at least one complete line of input, and all lines that make up a compound command, before executing any of the commands on that line or the compound command.

> Aliases are expanded when a command is read, not when it is executed.

Therefore, an alias definition, appearing on the same line as another command, doesn't take effect until the next line of input is read. The commands following the alias definition on that line are not affected by the new alias.

This behavior is also an issue when functions are executed. *Aliases are expanded when a function definition is read, not when the function is executed*, because a function definition is itself a command.

As a consequence, aliases defined in a function are not available until after that function is executed.

To be safe, always put alias definitions on a separate line, and do not use alias in compound commands.




---

The shell maintains a list of aliases that may be set and unset with the alias and unalias builtin commands.

* The first word of each simple command, if unquoted, is checked to see if it has an alias and if so, that word is replaced by the text of the alias. 
* characters / $ = ` and any of the shell metacharacters or quoting characters listed above may not appear
  in an alias name. The replacement text may contain any valid shell input, including shell metacharacters. 
* The first word of the replacement text is tested for aliases, but a word that is identical to an alias being expanded is not expanded a 
  second time. This means that one may alias ls to ls -F, for instance, and bash does not try to recursively expand the replacement text. 
* If the last character of the alias value is a blank (space/tab), then the next command word following the alias is also checked for alias expansion.
* There is no mechanism for using arguments in the replacement text. If arguments are needed, a shell function should be used.
* Aliases are not expanded when the shell is not interactive, unless the expand_aliases shell option is set using shopt.

The rules concerning the definition and use of aliases are somewhat confusing:
Bash always reads at least one complete line of input before executing any of the commands on that line. 
Aliases are expanded when a command is read, not when it is executed. Therefore, an alias definition appearing on the same line as another 
command does not take effect until the next line of input is read. The commands following the alias definition on that line are not affected by the new alias. 
  alias l='ls -la'; l /bin  # will not work
This behavior is also an issue when functions are executed: 
aliases are expanded when a function definition is read, not when the function is executed, 
because a function definition is itself a compound command. As a consequence, aliases defined
in a function are not available until after that function is executed.
To be safe, always put alias definitions on a separate line, and do not use alias in compound commands.


Common aliases

# ls
alias ls="ls --almost-all --classify --human-readable --group-directories-first --color=auto"
alias ll="ls -l" # long
alias l="ls"     # short

# apt
alias sau="sudo apt update"
alias sag="sudo apt upgrade"
alias sai="sudo apt install"


Magic Aliases
https://www.chiark.greenend.org.uk/~sgtatham/aliases.html
https://www.reddit.com/r/bash/comments/6a8uh5/magic_aliases_a_layering_loophole_in_the_bourne/

Magic Aliases: A Layering Loophole in the Bourne Shell by Simon Tatham
The Bourne shell contains two entirely different ways to define your own commands: shell functions and aliases. 
This article explores the differences between the two, and shows some unexpected consequences of the alias mechanism.


All POSIX-compliant Bourne-style shells allow the user to define shell functions. The shell evaluates a functions in much the same way it would evaluate any other command: first it does all the usual variable expansion, wildcard expansion and so on, until the command line is a list of individual words. Then it examines the first of those words, notices that it matches the name of a shell function, and runs the function body with the remaining command words available as $1, $2 and so on. This is a simple and flexible way to define new commands. The inside of a shell function can do anything that a shell script in a file could have done, and has the additional ability to modify the shell's internal state. Bourne shells also support aliases, which are defined using a command like this: alias dir='ls -l' Now if you invoke this alias using a command such as dir /etc, the shell will notice that the first word on the line is the name of an alias, and it will replace that word with the definition. So the command line will become ls -l /etc Shell functions, of course, can do things aliases can't do: a shell function can loop through its arguments one by one, or reverse their order completely, or can use its arguments and then do something else afterwards. But the example alias shown above could just as easily have been written as a shell function: dir() { ls -l "$@"; }

The power of aliases lies in the fact that they are handled by the shell before all the usual command-line processing. At the time when the alias is expanded, the rest of the command line has not had variable or wildcard expansions done. This suggests that the alias might be able to do something to affect those expansions. Here's a very simple example, together with the shell-function which you might expect to be equivalent:
	alias lsetc='cd /etc; ls -l'         # as an alias
	lsetc() { cd /etc; ls -l "$@"; }     # as a shell function

If you just type lsetc, or provide some inert arguments such as lsetc hosts, these two implementations will behave identically. 
But if you pass a wildcard as an argument lsetc *.conf, something more interesting will happen.

The arguments passed to the shell function, and hence to ls, will be the results of expanding the wildcard *.conf in the current directory; so you'll get a list of all the .conf files in /etc which also exist in the directory you started in. However, the alias version will be converted into cd /etc; ls -l *.conf; and the shell will finish processing the cd command before expanding the wildcard in the ls. So if you do this with the alias version of the command, you will see a list of all the .conf files in /etc.

This is all very well, but it's not really very interesting. The lsetc command defined in the above example is a thoroughly useless command, because you almost certainly would not want it to leave your current directory as /etc as a side effect. An alias containing a semicolon has the power to change the shell environment so that its arguments are expanded in a different way; but that power is not very useful if it always leaves that changed environment for you to clear up afterwards.

If we combine an alias with a shell function, however, we can harness the power of aliases in a more useful fashion. Watch this example:

lsetc_helper() {
    ls -l "$@"
    cd "$cwd"
    unset cwd
}

alias lsetc='cwd="$PWD"; cd /etc; lsetc_helper'

This version of the lsetc command is much closer to being useful, since it leaves you in the same directory you started in. It now behaves very much like an ordinary shell command, with the unusual property that if you give a wildcard on its command line then that wildcard is expanded in the context of /etc instead of the current directory.

This is the simplest example of what I call a magic alias: an combination of an alias and a shell function which between them cause the alias's command line to be evaluated in a different environment from the expected one. A summary of the trick is:

You have an alias which saves parts of the shell context, changes that context, and then passes the alias's arguments to a helper shell function. The helper shell function restores the original shell context which was saved by the alias (either before or after doing something with the arguments it was given). Thus, the arguments passed to the alias undergo variable and wildcard expansion in the altered shell context, and yet the running of the alias as a whole leaves the shell context as it was.

One important consistency is that the shell expands arguments before passing them to subcommands.
So the Bourne shell's strength is its absolute consistency in this regard. 
Because the shell expands wildcards before passing them to a command, they are guaranteed to be expanded in exactly the same way in all cases.
Any wildcard which matches at least one file will arrive in the subprogram in the form of a list of valid filename arguments; 
so in any situation where a command expects a list of one or more filenames, it is valid to use a wildcard instead. 
Even with shell functions, this consistency is not broken. 
Arguments to a shell function are expanded in exactly the same way as arguments to an external command, before the function begins to run. 
A shell function can do more than an external command - it can alter shell's state, but there are still limits on how much it can mess with the command line you give it.
However, the magic alias trick is a loophole in the Bourne shell's otherwise unbroken consistency. 
It allows you to create commands which interpret their command lines at a level which by rights ought to be impossible: 
a command, for example, which can tell the difference between mycmd *.c and mycmd foo.c bar.c, even when the former ought to expand to the latter. 
(Also, there's a much more immediate danger in putting a semicolon inside an alias: it causes parsing of composite commands to do unexpected things. For example, you should never put & at the end of a magic alias invocation, or the shell function that restores your environment to the way it started off will be run in a context where it can't affect your original shell!)


We've already seen the idea of having command-line wildcards evaluated in a different directory from the obvious one. 
One much more simple thing which affects wildcard expansion is just not to expand them at all. 
Here's a helper function and an alias which arrange this:

nog() {
    "$@"
    case "$shopts" in
        *noglob*) ;;
        *) set +f ;;
    esac
    unset shopts
}
alias nog='shopts="$SHELLOPTS"; set -f; nog'

This turns wildcard expansion off completely (set -f) before evaluating the alias's arguments, and then restores it to its original state afterwards. So after doing this, you can use the new noglob prefix to avoid globbing the arguments to a particular command:

$ echo *.c
foo.c bar.c baz.c
$ noglob echo *.c
*.c

This is a fairly benign use of the technique, and also fairly unhelpful since it would have been quicker to type echo '*.c' than to bother typing the noglob prefix! If you're feeling brave, you could try defining specific aliases which apply the noglob property automatically to certain commands. One command in which wildcards almost always have to be quoted is find:
find . -name '*.[ch]' | xargs grep 'struct treenode'

So if you cover the find command with an alias much like noglob:
alias find='shopts="$SHELLOPTS"; set -f; noglob_helper find'

then you will be able to type find . -name *.[ch] without fear of premature wildcard expansion.

Other possibilities include fiddling with the finer details of the globbing options in extended shells (nocaseglob, extglob, and dotglob in bash); I've already mentioned the possibility of evaluating wildcards in a different directory (but note that this also affects I/O redirections). You could disable bash's brace expansion; you could turn on set -C to avoid clobbering existing files with output redirections. The list goes on.

Irritatingly, one thing you can't do is turn off parsing of shell comments (another bash feature) for one command only. This would be incredibly useful if you had an IRC client or utility which expected a channel name on the command line: you could redefine the utility name as an alias and arrange that ‘irc -c #foobar’ was parsed in the useful way rather than by treating everything after the hash as a comment! But unfortunately, this doesn't seem to work: comments must have already been parsed by the time the alias substitution takes place.

Finally, a helpful technique for restoring sanity. As soon as you start defining aliases that modify the behaviour of existing commands, you also start wondering if you can easily turn them off when necessary. It's worth bearing in mind that you can bypass any alias definition by prefixing it with a backslash: instead of starting your command with ‘find’, use ‘\find’. This works because alias lookup happens before backslash escapes are processed, so the shell actually looks for an alias called ‘\find’, which doesn't exist.
Related Hacks

With bash in particular, there is an even worse hack you can do which allows you to suppress all of the normal bash command-line processing. This time it works by putting a comment character at the end of the alias definition. This completely suppresses parsing of the remainder of the command line.

After you do this, you then need to recover the command line from somewhere so you can process it in your own way. 
The best solution I'm aware of is to recover it from the command history using bash's history builtin:


echo-literally-helper() {
    str="`history 1 | perl -pe 's/^ *[0-9]+ +[^ ]+ //'`"
    echo "$str"
}
alias echo-literally='echo-literally-helper #'


The resulting alias is a command which prints exactly what was passed on the remainder of its command line, whether that contains single quotes, double quotes, theoretically insignificant variations in whitespace, redirections, wildcards, trailing backslashes or even other comment characters:

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

Of course, this hack is even more unstable than the magic alias hack: it won't work if run from a script, or as part of a complex command. It only works properly if typed on the interactive shell command line. That said, it might conceivably have uses (such as, for example, passing a verbatim command line through a remote-execution utility such as ssh), if you're brave enough to keep it lying around your shell configuration...
