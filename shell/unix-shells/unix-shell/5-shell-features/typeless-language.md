# String as the only shell type

The UNIX philosophy of preferring plain text to binary formats, even frowning upon the use of rigidly formatted text files, has cemented the use of text files as configuration files. Shell scripts are also text files. Handling plain text is comfortable. Using text as the primary exchange format requires pratically no effort to implement. Unix CLI utilities had the 3 standard streams attached, each being text. It was easy to redirect e.g. the input stream so the input is read from a file instead of being typed on the keyboard. By default the output of commands was send to the screen, but it was easy to redirect it into a file, or do both (using `tee`).

The shell language is typeless. The shell syntax is loose and underspecified which is justified by the intended use - as interactive language. It was preferred that the command line interface is comfortable, even if that meant loose, to being stringent. Interacting with the computer by typing commands for long periods of time also meant that the users couldn't be bothered with quoting, if strings were to be used the same as in PLs.

The shell almost exclusively deals with things which are logically strings, except for the lack of quoting and some other more or less weird properties.

The shell syntax was very peculiar. Compared to the syntax of programming languages at the time (middle of 1970's) it was very strange, there was nothing like it.

For one, even if *string* is logically the type of things that appear on the command line, these were no ordinary, well-behaved strings, familiar from PLs. Instead, these strings appeared strange, and not just because they lacked the traditional fence in the form of double or single quotes to keep them contained.

*Quoting* is more used as an *escape mechanism*, to strip the "special" off characters, then to delineate strings from the surrounding text (entities).
