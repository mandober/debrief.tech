# Processing input from the command line

The characters and key-combos entered by the user on the command line are affected by different things organized in several layers, and each influences the destiny of a piece of text as it travels towards the nether regions of the shell.

before a piece of text even reaches the shell


```
terminal driver
↓
line discipline
↓
readline
↓
bash
↓
all affect the command line text
```

Extended, because some basic editing capabilities are provided by the terminal driver by configuring a line discipline.

A **line discipline** is the actual set of rules that affect the most fundamental aspects of terminal's functionality.

These rules are configurable using the `stty` utility:
- choosing which keyseqs send which signals
  - interrupt: ^C
  - end-of-line: ^D
  - abort: ^/
  - suspend: ^Z
- setting the character conversions rules
- selecting the default character encoding set


Readline provides extended command line editing facilities. It manages the command line text until the moment the line is submitted to bash (e.g. by pressing ENTER).
