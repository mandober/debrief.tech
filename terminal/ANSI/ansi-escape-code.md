# ANSI escape code

https://en.wikipedia.org/wiki/ANSI_escape_code

**ANSI escape sequences** are a standard for *in-band signaling* to control cursor location, color, font styling, and other options on terminals.

Certain sequences of bytes, most starting with an *ASCII escape character* and a *bracket character*, are embedded into text. The terminal interprets these sequences as commands, rather than text to display verbatim.

ANSI sequences were introduced in the 1970s to replace *vendor-specific sequences* and became widespread in the computer equipment market by the early 1980s.

Although hardware text terminals have become increasingly rare in the 21st century, the relevance of the ANSI standard persists because a great majority of terminal emulators and command consoles interpret at least a portion of the ANSI standard.

## Contents

- 1. History
- 2. Platform support
  - 2.1. DOS and Windows
- 3. Description
  - 3.1. C0 control codes
  - 3.2. Fe Escape sequences
  - 3.3. CSI (Control Sequence Introducer) sequences
  - 3.4. SGR (Select Graphic Rendition) parameters
    - 3.4.1. Colors
      - 3.4.1.1. 3-bit and 4-bit
      - 3.4.1.2. 8-bit
      - 3.4.1.3. 24-bit
      - 3.4.1.4. Unix environment vars related to color support
  - 3.5. OSC (Operating System Command) sequences
  - 3.6. Fs Escape sequences
  - 3.7. Fp Escape sequences
  - 3.8. nF Escape sequences
  - 3.9. Examples
    - 3.9.1. In shell scripting
    - 3.9.2. In C
  - 3.10. Terminal input sequences

## History

Almost all manufacturers of video terminals added *vendor-specific escape sequences* to perform various operations, such as placing the cursor at arbitrary positions on the screen.

- VT52 by DEC, July 1974
  - 12 rows and 80 columns of upper-case text
  - expanded set of control characters
  - forward-only scrolling
- Hazeltine 1500 by Hazeltine Corporation, April 1977

One example is the *VT52* terminal, which allowed the cursor to be placed at an `(x, y)` location on the screen by sending the ESC character, a Y character, and then two characters representing numerical values of `(x, y)` coordinates, added to 32 (thus starting at the ASCII SPACE character and skipping the first 32 ASCII characters which are control characters). The *Hazeltine 1500* had a similar feature, invoked using `~`, `DC1` and then the X and Y positions separated with a comma. While these two terminals had identical functionality in this regard, different control sequences had to be used to invoke them.

As these sequences were different for different terminals, elaborate libraries such as `termcap` (terminal capabilities) and utilities such as `tput` were created in order to unify the API.

In addition, many of these terminals required sending numbers (such as row and column) as the binary values of the characters; for some programming languages, and for systems that did not use ASCII internally, it was often difficult to turn a number into the correct character.

The ANSI standard attempted to address these problems by making a command set that all terminals would use and requiring all numeric information to be transmitted as ASCII numbers.

The first standard in the series was *ECMA-48*, adopted in *1976*. It was a continuation of a series of character coding standards, the first one being *ECMA-6* from *1965*, a 7-bit standard from which *ISO 646* originates. 

The name *"ANSI escape sequence"* dates from 1979 when ANSI adopted *ANSI X3.64*. The *ANSI X3L2* committee collaborated with the ECMA committee *TC 1* to produce nearly identical standards. These two standards were merged into an international standard, *ISO 6429*. In 1994, ANSI withdrew its standard in favor of the international standard.

The first popular video terminal to support these sequences was DEC's *VT100*, introduced in *1978*. This model was very successful in the market, which sparked a variety of VT100 clones, among the earliest and most popular of which was the much more affordable *Zenith Z-19 in 1979*. Others included the *Qume QVT-108*, *Televideo TVI-970*, *Wyse WY-99GT* as well as optional *"VT100" or "VT103" or "ANSI" modes* with varying degrees of compatibility on many other brands.

In 1981, *ANSI X3.64* was adopted for use in the US government by FIPS publication 86. Later, the US government stopped duplicating industry standards, so FIPS pub.86 was withdrawn.

*ECMA-48* has been updated several times and is currently at its *5th edition, from 1991*. It is also adopted by ISO and IEC as standard *ISO/IEC 6429*. A version is adopted as a Japanese Industrial Standard, as *JIS X 0211*.

Related standards include *ITU T.61*, the Teletex standard, and the *ISO/IEC 8613*, the Open Document Architecture standard (mainly ISO/IEC 8613-6 or ITU T.416). The two systems share many escape codes with the ANSI system, with extensions that are not necessarily meaningful to computer terminals. Both systems quickly fell into disuse, but ECMA-48 does mark the extensions used in them as reserved.

Standards
- ECMA-48
- ISO/IEC 6429
- FIPS 86
- ANSI X3.64
- JIS X 0211
