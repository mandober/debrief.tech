# Backspace and delete

https://www.in-ulm.de/~mascheck/

* Fixing backspace and delete
https://lists.debian.org/debian-i18n/1998/04/msg00015.html


Typically, a terminal has in the upper right corner of the main key block a key that people expect to be bound to the function delete-previous-character. Depending on the terminal, this key may be labeled "Backspace", "<--", `<X|`, "Delete", etc. A neutral term for it is RUBOUT.

A terminal keyboard may also have a special key people expect to be bound to the function delete-next-character. This key may be labeled "Delete", "Remove", "Erase Char", etc.; or, it may simply be missing.

**The Linux console strives to emulate a DEC VT220 terminal** because the DEC terminal line is something of a standard in the Unix world, especially in the BSD camp which has vastly influenced GNU, and thus Linux.

The RUBOUT key of the VT220, labeled `<X|`, produces an ASCII DEL (0x7F, ^?) character. The VT220 also has a key labeled "Remove", which produces the sequence `ESC [ 3 ~`.

The VT220 itself is the successor to the VT100. The RUBOUT key of the VT100, labeled "<-", also produces DEL. The VT100 didn't have a key associated with delete-previous-character. The VT100 did have a key labeled "Backspace" (or "BS") that generated ASCII BS (0x08, ^H), but that key was in an awkward position and did not serve as RUBOUT.

There are terminals whose RUBOUT key produces an ASCII BS (0x08) character. There also terminals whose left arrow key produces the same character. Lots of breakage. Anyway, the RUBOUT key on a VT100 series terminal produces a DEL, and if a terminal emulator does not, it is broken.

On the shell level, the `stty erase` setting (e.g. `erase = ^?`) determines what character is bound to delete-previous-character (there is no stty setting for delete-next-character). The *tty discipline* sticks to what it finds there.

The *terminfo database* also contains two capabilities for the keys that people typically bind to delete-previous-character (`kbs`) and delete-next-character (`kdch1`). The correct settings of these capabilities for the VT220 terminal (or the Linux console) are `kbs=\177`, `kdch1=\E[3~`.

## Situation with X11

On X11, the RUBOUT key (associated with delete-previous-character) should produce the _keysym_ <BACKSPACE>. The key associated with delete-next-character should produce the _keysym_ <DELETE>. Motif, for instance, expects this. It is the usual mapping and everything in X itself is fine until people start messing with it.

The culprit is `xterm`. Namely, xterm pretends to emulate a VT100 series terminal, and actually does a pretty good job at it. However, it translates the <BACKSPACE> keysym to the `BS` character and the <DELETE> keysym to the `DEL` character.

This is at odds with what the respective keys return on a VT220 or on the console. People then start mapping <DELETE> to the RUBOUT key, which makes xterm return the expected character but confuses Motif and other X apps.

Instead, xterm can be easily configured for the correct behavior with these resource lines:

```
XTerm*ttyModes:         erase ^?
XTerm*VT100.Translations: \
        #override <Key>BackSpace: string(0x7f) \n\
        <Key>Delete: string(0x1b) string("[3~")
```

This may be at odds with the xterm terminfo entry, which needs to be corrected then.

Alternatively, you might decide to leave xterm's <BACKSPACE> -> BS and <DELETE> -> DEL mapping alone. The advantage of this would be that if you telnet to a remote machine, the default xterm terminfo entry will most likely use `kbs=^H`, `kdch1=\177`. The disadvantages, however, are that you will have to deal with stubborn applications like emacs that insist that only `^?` is appropriate for deleting. There are different control characters for delete-{previous,next}-character depending whether you are *on the console* or *in an xterm*. Users seem to be mentally unable to cope with this.
