
Traditionally, screen manipulation is done through the termcap or terminfo database that supplies the information necessary to manipulate any of dozens or even hundreds of types of terminals. The shell interface to the database is an external command, tput.

On some systems, tput uses the termcap database; on others (mostly newer systems), it uses the terminfo database. The commands for the two databases are not the same, so a tput command written for one system may not work on another.

However, the plethora of terminal types has, for all intents and purposes, been reduced to a single, standard type. This standard, ISO 6429 (also known as ECMA-48 and formerly known as ANSI X3.64 or VT100), is ubiquitous, and terminals that do not support it are few and far between. As a result, it is now feasible to code for a single terminal type. One advantage of this homogeneity is that the necessary coding can be done entirely within the shell. There's no need for an external command.
