# Terminal

**Terminal**
console, terminal emulator, terminal multiplexer, teletype, console, dumb terminal, thin client, mainframe, terminal (justifying the term "terminal" by being at the end of the line), DEC VT100, DEC52, terminal emulator,

The attempt to emulate the hardware of a past era resulted in vastly incompatible terminal devices and based on them termional emulators. The incompatibility of the hardware of a past era continued to manifest as the incompatibility of software in the modern period.

The `termcap` utility was an attempt to index all the different features of terminals and to compile a database associating terminal emulators with the terminal hardware device they were modelled after, relating it to a particular implementation of a feture set, particularly the ANSi codes. The successor of this effort was the `terminfo` utility which is still in use today, even though the large varity of terminal features seem to have collapsed into a single set, e.g. the ANSI escape sequences, as described on Wikipedia, seem to be supported by all major terminals, so the codes could be used in their raw form, i.e. without delagation to the `tput` utility.

A (any) Linux distribution, when used in the text-only mode - the so-called Linux console - is probably the form most faithful to the way terminals (as hardware device) were used in the days of yore. That environment is quite different then runnning a terminal under a GUI. First, the terminal occupies the entire screen and not a resizable window. Linux console doesn't allow for too much customization: there's no resizing, no easy way to change the font face or the font size; it lacks many customization options that a desktop terminal offers.

*Linux console* seems to be as closest "to the metal" as possible for an interaction with a computer in text mode. That is, terminals which run in a graphical environment have additional layers between them and the OS, which is particularly problematic on Windows.

Windows has a single *console*, which is the process `conhost.exe`.

Most of the time however, terminals run in a GUI (even inside an emulation layer, e.g. WSL on Windows), 

inside a parent terminal application (e.g. `conemu` on Windows) that hosts the proper terminal (e.g. `mintty`).

All these layers complicate the interaction with the applciations that runs in the terminal (like running `vim` under WSL Ubuntu in `mintty` terminal, hosted as a child process and window inside the `conemu` console, and slightly modified by the `cmder`, while runnning in Windows).
