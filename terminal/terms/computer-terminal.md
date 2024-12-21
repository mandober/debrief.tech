# Computer terminal

https://en.wikipedia.org/wiki/Computer_terminal

A **computer terminal** is an electronic or electromechanical hardware device that can be used for entering data into, and transcribing data from, a computer or a computing system.

**Teleprinters** were used as early-day hard-copy terminals and predated the use of a computer screen by decades.

Most *early computers* only had a front panel to input or display bits and had to be connected to a terminal to print or input text through a keyboard. The computer would typically transmit a line of data which would be printed on paper, and accept a line of data from a keyboard over a serial or other interface.

Starting in the mid-1970s with microcomputers such as the Sphere 1, Sol-20, and Apple I, display circuitry and keyboards began to be integrated into personal and workstation computer systems, with the computer handling *character generation* and *output to CRT display* such as a computer monitor (or even TV), but most larger computers continued to require terminals.

Early terminals were inexpensive devices but very slow compared to *punched cards* or *paper tape* for input; with the advent of *time-sharing systems*, terminals slowly pushed these older forms of interaction from the industry.

Related development were the improvement of terminal technology and the introduction of inexpensive *video displays*.


Early *Teletypes* printed at only 75 baud (or 10 5-bit characters per second), but by 1970s, the speed of video terminals had improved to 2400 or 9600 bit/s.

Similarly, the speed of *remote batch terminals* had improved to 4800 bit/s at the beginning of the decade, and 19.6 kbps by the end of the decade, with higher speeds possible on more expensive terminals.

The function of a terminal is typically confined to *transcription and input of data*; a device with significant local, programmable data-processing capability may be called a *smart terminal* or **fat client**. A terminal that depends on the host computer for its processing power is called a *dumb terminal* or a **thin client**.

In the era of *serial (RS-232) terminals* there was a conflicting use of the term "smart terminal" as a dumb terminal with no user-accessible local computing power but a particularly rich set of *control codes for manipulating the display*; this conflict was not resolved before *hardware serial terminals* became obsolete.

A *personal computer* can run *terminal emulator* software that replicates the functions of real terminals, sometimes allowing concurrent use of local programs and access to a distant terminal host system, either over a direct serial connection or over a network (via e.g. SSH).

Today, few, if any, *dedicated computer terminals* are being manufactured, as *time sharing* of power computers is usually achieved through workstations, often though a WebGUI, or through mobile devices.

## Contents

- 1. History
- 2. Categories
  - 2.1. Hard-copy terminals
  - 2.2. Video display unit
  - 2.3. Character-oriented terminals
    - 2.3.1. Text terminals
  - 2.4. Block-oriented terminals
    - 2.4.1. Common block-oriented terminals
  - 2.5. Graphical terminals
  - 2.6. Intelligent terminals
  - 2.7. Contemporary
- 3. System console
  - 3.1. History
- 4. Emulation
- 5. Modes
- 6. See also
- 7. Notes
- 8. References

## History

The console of Konrad Zuse's `Z3` had a keyboard in 1941, as did the `Z4` in 1942-1945. However, these consoles could only be used to enter numeric inputs and were thus analogous to those of calculating machines; programs, commands, and other data were entered via paper tape. Both machines used a *row of display lamps for output*.

In 1956, the `Whirlwind Mark I` computer became the first computer equipped with a *keyboard-printer combination* with which to support direct input of data and commands, and output of results. That device was a *Friden Flexowriter*, which would continue to serve this purpose on many other early computers well into the 1960s.

## Categories

**Hard-copy terminals**
- electromechanical teleprinters/teletypewriters
- configured as Keyboard Send-Receive (KSR), Automatic Send-Receive (ASR); and Read Only (RO) configuration
- some terminals included a paper tape reader and punch which could record output such as a program listing
- custom-designed keyboard/printer terminals came later and included the IBM 2741 in 1965, and DECwriter in 1970; LA30 was an early DECwriter.
- top speeds of teletypes were 10, 15 and 30 characters per second
- DECwriter was the last major printing-terminal product.
- they faded away after 1980 under pressure from Video Display Units

**Video Display Unit (VDU)**
- displays information on a screen, typically, cathode-ray tube (CRT)
- in 1950s, besides text, VDUs were displaying graphical data
- in 1964, two early landmarks: Univac Uniscope and IBM 2260
- these were **block-mode terminals** designed to display a page at a time, using proprietary protocols; in contrast to **character-mode devices** (that came later), they enter data from keyboard into *display buffer* rather than transmitting it immediately.
- used asynchronous serial communication
- next generation of VDUs introduced *addressable cursor*: VT05 and Hazeltine 2000 operating in character mode, both from 1970
- Early devices of this type were often called *glass TTYs*. Later, this term was restrospectively used for devices without (full) cursor addressibility.



- https://www.linusakesson.net/programming/tty/index.php
- https://terminals-wiki.org/wiki/index.php/Main_Page
- https://tldp.org/HOWTO/Text-Terminal-HOWTO.html
- https://web.archive.org/web/20100523190056/http://www.cs.utk.edu/~shuford/terminal

- http://www.epocalc.net/index_e.php
- http://www.epocalc.net/php/liste_models.php?texte=&look=All+fields&yearmax=2018&nocomp=pc&cat=Terminal

- http://www.catb.org/jargon/html/G/glass-tty.html

- https://en.wikipedia.org/wiki/Teletype_Corporation
- https://en.wikipedia.org/wiki/Hazeltine_1500
- https://en.wikipedia.org/wiki/VT05
- https://en.wikipedia.org/wiki/VT52


Types of terminals
- hard-copy terminal
  - teleprinter, tty
- Video display unit (VDU) (introduced cursor addressibility)
  - block-mode terminals (introduced display buffer)
  - character-mode devices
- glass TTY (no full cursor addressibility)

- remote batch terminal

- dumb terminal, thin client
- smart terminal, fat client

- serial (RS-232) terminals, hardware serial terminals
  - smart terminal: a dumb terminal (no user-accessible local computing power) but a particularly rich set of *control codes for display manipulation*

- text terminal
- graphic GUI capabilities of text terminals
- computer terminal
- terminal emulator

punched cards (for input)
paper tape (for input)
character generation capability
output to CRT display
time-sharing systems

character-cell video-display terminal
serial-line remote-graphics terminal


## Character-cell terminal
A harware device with keyboard, connected to a mainframe (host) computer via serial cable, used for displaying ASCII text. The thinnest of thin clients.

## Graphics-capable terminal
A harware device with keyboard, connected to a mainframe (host) computer via serial cable, used for displaying ASCII text, but also graphics! sent to it by the remote host. It has support for remote graphics protocols, such as Tektronix vector graphics, DEC's ReGIS protocols, DEC's Sixel protocols, and NAPLPS (North American presentation-level-protocol syntax).

## X terminal
X terminals (such as those by NCD and Wyse Technology, or formerly made by Human Designed Systems/Neoware or Tektronix or Hewlett-Packard) support the *X protocol* and bit-mapped display of graphics. They are connected via high-speed Ethernet connections.
