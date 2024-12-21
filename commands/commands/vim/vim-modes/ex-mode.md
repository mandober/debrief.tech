# Vim :: Vim modes :: Ex mode

Vim does not have a built-in REPL, but it has Ex mode that can be used like one. Ex mode accepts a sequence of commands - you can type cmd after a cmd. The Ex mode is like an extended command-line mode.

- `Q` or `gQ`         enter ex mode
- :visual             exit ex mode
- :echo               prints the evaluated expression
- :echom              same as :echo but also logs the message
- :messages           view message history
- :messages clear     clear message history
