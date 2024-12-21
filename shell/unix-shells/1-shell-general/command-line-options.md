# Command line interface

The POSIX has managed to standardize a lot of aspects regarding the command line interface. It has particularly brough order, by establishing a set of reasonable conventions, in the way command options and arguments are specified.

- command line interface
- command line components
- prompt
- command line words, split by whitespace (or as specified in IFS)
- main command - usually the 1st word on the command line
- prefix command - 1st word that alters the main command (2nd word)
- options
  - short
  - long
- argument (the main arg, the payload), arguments
- operand
- operators

 
## Consoles, terminals, ttys, hardware devices, software emulators

After the computer boots up (GUI-less to keep it simple) to text mode, we are left off in the (there are a few in fact) *Linux console*, in the dark (mode). Any time the user-to-computer interface is based on text, we are dealing with some kind of *console* or *terminal* or *shell*. Althoght these terms are often used interchangibly, each has its own distinct meaning ("terminal" and "console" do have some overlap), but the details are fleeting. A **terminal** (terminator, "the end of the line") was once a hardware device (or is that a console?) but today it is a program that *emulates a particular terminal* in software.

These programs are called **terminal emulators** (the "emulator" part is often dropped), and they either concentrate in mimicking one particular device - such as the venerable VT100 by DEC, which was a popular product back then, and is a popular choice of a terminal to emulate now - or offer support (modes) for emulating several devices (VT100 mode, VT52 mode).

Once upon a time, these devices have competed for user's affection by improving their set of features - some models (like VT100) have rounded up a certain set of features favored by users, so the terminal emulators declare the support for that (assummingly known) set of features by saying they have the, e.g. VT100 mode (what features does VT100 mode exactly provide is unclear).

However, a particular emulation mode usually covers only a set of failry basic features, while the additional, more exciting, features come up as the add-ons to the basic feature set. For example, a terminal emulator that has VT100 support may also offer some extras, like the capability to set margins, redefine the scrolling area, additional set of text attributes and cursor manipulation commands, even capability to render images.

This would be the Linux console (TERM=linux) that takes up the whole screen and cannot be manipulated becasue it is not a window (i.e. no minimize, maximize) - the number of rows and columns in predefined and fixed just like in old times. And just like then, there are terminal sequences (DCI commands) that cycle between the allowed screen modes (i.e. row x col).

## Prompt

primary prompt:
- signifies the computer is ready to heed user's command
- marks the place where such command is to be entered

## Syntax

The command line is the place for users to type in commands. After submitting (by hitting ENTER, ^J or ^M) the command-line (meaning the text the user has typed at the prompt)



cmd [OPTIONS] ARG
cmd [OPTIONS] ARG, [ARG…]
cmd [OPTIONS] SUBCMD [OPTIONS]

Most commands deal with a particular action. In Linux, the names of commands are short, mnemonic-like. A command like `cd` takes a *payload*, i.e. the main argument, which should be the name of an (existing) directory, so it conforms to the basic format: `cd [OPTION] ARG`. It is not sensible to specify more than one directry name.
