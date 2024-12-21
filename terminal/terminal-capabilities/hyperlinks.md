# ANSI features :: Hyperlinks

https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda


https://github.com/Alhadis/OSC8-Adoption/

OSC 8-compatible terminals
https://github.com/Alhadis/OSC8-Adoption/#support
https://github.com/mintty/mintty/releases/tag/2.9.7


Most of the terminal emulators auto-detect when a URL appears onscreen and allow to conveniently open them (e.g. via Ctrl+click or Cmd+click, or the right click menu).

It was, however, not possible until now for arbitrary text to point to URLs, just as on webpages.

In spring 2017, GNOME Terminal and iTerm2 have changed this.

GNOME Terminal is based on the VTE widget, and almost all of this work went to VTE. As such, we expect other VTE-based terminal emulators to catch up and add support really soon. Other terminal emulators are also welcome and encouraged to join!

Quick example

Here's a simple command to try out the feature. The result is equivalent to this HTML link: This is a link

```bash
printf '\e]8;;http://example.com\e\\This is a link\e]8;;\e\\\n'
```

printf " \e]8 ;; $url \e \\ $text \e]8 ;; \e \\ \n "


The list of supporting terminal emulators and terminal-based apps is no longer maintained here. It is kindly maintained by Alhadis in his [OSC 8 adoption in terminal emulators page](https://github.com/Alhadis/OSC8-Adoption/).



## Ideas for use

File viewers and editors could auto-detect URIs in the document, and convert them to hyperlinks even if they are only partially visible on the screen. 

Example screenshot from an imaginary text editor with two files opened:

```
╔═ file1 ════╗
║          ╔═ file2 ═══╗
║http://exa║Lorem i ju ║
║le.com    ║ st like t ║
║          ║ he diagra ║
╚══════════║ m overlap ║
           ╚═══════════╝
```
