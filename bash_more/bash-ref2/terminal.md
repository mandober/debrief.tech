# Bash :: Terminal



## TERM envar

`TERM=xterm-256colors`




## Terminal colors

Terminal color modes
- Plain ASCII
- ANSI escape codes: 16 color codes with bold/italic and background
- 256 color palette: 216 colors + 16 ANSI + 24 gray (colors are 24-bit)
- 24-bit truecolor: "888" colors (aka 16 million)

The 256-color palette is configured at start and is a 666-cube of colors, each of them defined as a 24-bit (888 RGB) color. This means that current support can only display 256 different colors in the terminal, while "truecolor" means that you can display 16 million different colors at the same time. Truecolor escape codes do not use a color palette, but they specify the color directly as RGB values using the format `\ESC[38;2;${R};${G};${B}m`.

```bash
# 16 colors
printf "\x1b[31m16-bit colors\x1b[0m\n"


# true colors, \ESC[38;2;${R};${G};${B}m
printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
```








## Refs

* Terminal colors
https://github.com/termstandard/colors
