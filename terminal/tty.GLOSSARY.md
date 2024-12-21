# Terminal :: GLOSSARY

## Alternative terminal mode
Alternative screen mode (alternative screen buffer, alt screen) is like a full-screen overlay over the main terminal screen, as opposed to the default, primary screen mode. Alternative screen mode provides a whole extra screen of realestate that programs can use for their entire presentation, or just as a place to put their output without disrupting the main screeen flow. However, the alt screen has no back buffer support and thus no scrolling support (at least not out of the box). Almost all screen-oriented programs (vim, emacs, mc, ranger, htop, etc.) present themselves on the alt screen, managing things like backbuffer and scrolling (and many others) by themselves. When these apps quit, the main screen is restored just as it was before the app was started. The ANSI escape sequence to enter the alt mode is `^[[?1049h` and `^[[?1049l` to exit it.



## Primary screen mode
The initial mode the terminal screen is in, as opposed to the alternative terminal mode. Primary screen mode has backbuffer support and capability to scroll into it.

## Terminal
## Terminal emulator
## Terminal multiplexer
## Console
## tty

## stty
A tool used to set the basic terminal settings

## Cooked mode


## Raw mode
