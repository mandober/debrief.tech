# Values

Types of values
- scalars
  - integers, (bool)
  - strings, (char)
- lists
  - arrays, indexed and assoc
  - list: call list, list of params/args
  - list (pseudo) CSL list, colon-separated list
- functions
- references
  - nameref vars
  - indirection operator
  - aliases?

Strings
- boolean
- char
- filename
- list of filenames/dirs

Integers
- arith


In Unix FS everything is a file and in bash everything is a string. The terms word, shell-word, token, name may have different meaning, depending on the context, but they are all strings. A strings is a sequence of characters, whether letters or not.

Contrary to majority of programming languages, in bash strings may appear unqouted. Since bash is the command interpreter first and a programming language second, most of interaction with bash happens by typing text in the command line, so it would be very tedious if users were made to quote each and every strings.

And since everything in bash is a string, we need a sigil (the dollar sign) to indicate that we want a variable's value, that is, we expect bash to perform variable expansion, producing a r-value (variable's value) given a l-value (variable's name).
