# xcompose :: The Compose lib on X

https://manpages.debian.org/bullseye/libx11-data/Compose.5.en.html

`Compose` - X client mappings for multi-key input sequences.

The X library, `libX11`, provides a simple input method for characters, beyond those represented on typical keyboards, using sequences of key strokes that are combined to enter a single character.

The compose file is searched for in the following order:
- If the environment variable `$XCOMPOSEFILE` is set, its value is used as the name of the Compose file.
- If the user's home directory has a file named `.XCompose`, it is used as the Compose file.
- The system provided compose file is used by mapping the locale to a compose file from the list in `/usr/share/X11/locale/compose.dir`.

Compose files can have an "include" instruction that allows local modifications to existing compose files by including only the overriden content via an included compose file (since new definitions override the previous ones, based on the comparison of their key sequences).

---


On Linux, the compose system is provided by the libX11's `Compose` feature of the `X` system (portable, network-transparent windowing system). Compose(5) provides client mappings for multi-key input sequences in X.

and have to do with typing compound and complex characters, beyond those available on your (physical) keyboard. 

`xcompose` is for configuring the association between key sequences and the resulting output character.

xcompose is a utility in a set of related utilities that rely on

`wincompose` is a corresponding utility for Windows. The key compositions under Windows are enabled by this utility alone, it is not a part of a bigger suit like on Linux, however the *definition files* are compatible.



such as é ž à ō û ø ☺ ¤ ∅ « ♯ ⸘ Ⓚ ㊷ ♪ ♬ using short and often very intuitive key combinations. For instance, ö is obtained using o + ", and ♥ is obtained using < + 3.


* X
https://manpages.debian.org/bullseye/xorg-docs-core/X.7.en.html

* Compose - X client mappings for multi-key input sequences
https://manpages.debian.org/bullseye/libx11-data/Compose.5.en.html


`xmodmap` is utility for modifying keymaps and pointer button mappings in X.
https://manpages.debian.org/bullseye/x11-xserver-utils/xmodmap.1.en.html

`xkbcomp` compile XKB keyboard description.
https://manpages.debian.org/bullseye/x11-xkb-utils/xkbcomp.1.en.html


`setxkbmap` set the keyboard using the X Keyboard Extension.
https://manpages.debian.org/bullseye/x11-xkb-utils/setxkbmap.1.en.html
