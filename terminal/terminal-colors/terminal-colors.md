# Terminal colors

https://www.hackitu.de/termcolor256/
https://github.com/linrock/256-colors
https://robotmoon.com/256-colors/
https://robotmoon.com/bash-prompt-generator/

- 3-bit colors,  2³  = 8 = 2¹ᐩ¹ᐩ¹ = 2¹×2¹×2¹
- 4-bit colors,  2⁴  = 16
- 8-bit colors,  2⁸  = 256
- 16-bit colors, 2¹⁶ = 65,536
- 24-bit colors, 2²⁴ = 16,777,216 = 256³ = 2⁸×2⁸×2⁸ = 2⁸ᐩ⁸ᐩ⁸ = 2^(8+8+8) 
  aka 888 colors, True color, RGB colors


## 3-bit colors

After the long period of colorless displays, the first specification introduced 8 colors and gave them names: black, red, green, yellow, blue, magenta, cyan, and white.



The SGR parameters 30-37 selected the foreground color, while 40-47 selected the background.

## 4-bit colors

Some terminals implemented "bold" (SGR code 1) as a brighter color rather than a heavier font, thus introducing 8 additional foreground colors.

Today, many terminals allow you to select whether you'd like to render bold as a font or color (or even both).

Usually you could not get these as background colors, though sometimes inverse video (SGR code 7) would allow that.

Examples:
- black fg on white bg: `$ESC[30;47m`
- red fg `$ESC[31m`, to get bright red use ESC[1;31m. 

To reset colors to their defaults, use ESC[39;49m (not supported on some terminals), or reset all attributes with ESC[0m. 

Later terminals added the ability to directly specify the "bright" colors with 90-97 and 100-107.

The chart below shows a few examples of how VGA standard and modern terminal emulators translate the 4-bit color codes into 24-bit color codes.
