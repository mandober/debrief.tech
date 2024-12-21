# man :: invocation examples

```bash
# Display manual for item (program) 'ls'
man ls

# Display manual for macro package 'man' from section 7
man 7 man
# alternative spelling
man man.7
# another alternative spelling
man 'man(7)'
# convenient when copy-pasting (well, not really since parens must be quoted)

# successively show all intro manual pages contained within the manual.
# It is possible to quit between successive displays or skip any of them.
man -a intro

# Format the manual page for bash into the default troff or groff format and pipe it to the printer named ps. The default output for groff is usually PostScript. man --help should advise as to which processor is bound to the -t option.
man -t bash | lpr -Pps

# decompress and format the nroff source ./foo.1x.gz into a dvi file. The redirection is necessary as -T flag causes output to be directed to stdout with no pager. The output could be viewed with xdvi or further processed into PostScript with dvips.
man -l -Tdvi ./foo.1x.gz > ./foo.1x.dvi

# Search short desc and page names for keyword 'printf' as regex, print matches
man -k printf
# Equivalent to
apropos printf

# Lookup man pages referenced by 'smail' and print out short descriptions
man -f smail
# Equivalent to
whatis smail
```
