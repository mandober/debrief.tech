# xcompose :: GLOSSARY


## Compose system
Is an ad hoc name for the techology (whether a single ustility or a subsystem) that provides the support for entering various characters, out of the keyboard range, by sequencing multiple key strokes. On Linux, the compose subsystem is a part of a suit of related utilities, all parts of the X system, fronted by the `xcompose` utility that handles the user-configured *definition files*.

while the Windows support is usually realized as a single app, like `wincompose`, 

the suit of utilities that provide composing on Linux, or for a, usually a single, standalone app for Windows. In any case, it is just a name for the tech 


## Production
A production is the resulting output, which may be a single character, or multiple characters, sometimes called a user-defned macro.

## Composed character
A composed character is typically an accented letter, or similarly, a letter with a decoration that resambles another standalone character. For example, `ô` may be decomposed into the caret symbol, `^`, and the small latin letter `o`.

- ô = ^ + o
- Ö = : + O
- Ũ = ~ + U
- Ů = o + U
- <Multi_key> <acute> <a> : "à"

## Definition file
A definition file holds the user definitions, i.e. the key sequences and the resulting productions. It may be located in the user's home directory and named `.xcompose`. Since the compose system has the inclusion mechanism to aid organizing (what is bound to become a large pile of scaterred definition files), `~/.xcompose` may better serve as the central place to include other files with the actual definitions (asorted by a topic or prefix key). The definition files used on Linux and Windows (with wincompose) are compatible.

## Compose key
The compose key is syntactically denoted by `<Multi_key>` in definitions, while the corresponding physical keyboard key is set to the left Alt by default. You can designate one compose key as the main one, then set another key as the alternative compose key (e.g. right Alt, for symmetry). When the two compose keys (the main one and the alt) are set, you have the option to regard them both as the same compose key, or to differentiate between them (e.g. to get further granularity in definitions or some shit).

A compose key, sometimes also called "multi key", is a physical key on a keyboard, typically used for entering a precomposed character or a symbol. Pressing the compose key, followed by one or more key strokes, inserts a predefined character. For example, <Multi_key> + <acute/tilde> + <a> produces the letter `à`. Or, <Multi_key> + <period> + <equals> produces `⩦` (EQUALS SIGN WITH DOT BELOW, 0x2a66).


## Prefix key
