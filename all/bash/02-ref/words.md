# Words

https://wiki.bash-hackers.org/syntax/words


Bash scans the command line and splits it into words, usually to put positional parameters into the `argv` vector in C's memory, toso that it can later feed these parameters to the command.

These words are recognized by splitting the command line at the special character position, Space or Tab (the manual defines them as blanks). For example, take the echo program. It displays all its parameters separated by a space. When you enter an echo command at the Bash prompt, Bash will look for those special characters, and use them to separate the parameters.
