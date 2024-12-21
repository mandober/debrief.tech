# Vim :: Registers

There are 10 types of registers:
1. unnamed register, `""`
2. 10 numbered registers, `"0 - "9`
3. small delete register, `"-`
4. 26 named lowercase registers, `"a - "z`
5. 26 named uppercase registers, `"A - "Z`
6. 3 read-only registers, `":`, `".`, `"%`
7. alternate buffer register, `"#`
8. expression register, `"=`
9. selection and drop registers, `"*`, `"+`, `"~`
10. last search pattern register, `"/`
11. black hole register, `"_`

## Unnamed register

Unnamed register `""`(:h quote_quote, :h quotequote)

Vim fills this register with text deleted with the `d`, `c`, `s`, `x` commands or copied with the yank `y` command, regardless of whether or not a specific register was used (e.g. `"xdd`). It is like the unnamed register is pointing to the last used register. Thus when appending using an uppercase register name, the unnamed register contains the same text as the named register. An exception is the `_` (blackhole) register: `"_dd` does not store the deleted text in any register.

Vim uses the contents of the unnamed register for any put command (`p` or `P`) which does not specify a register.

Additionally you can access it with the name `"`. This means you have to type two double quotes. Writing to the `""` register writes to register `"0`.

## Numbered registers

Numbered registers "0 to "9
(:h quote_number, :h quote0, :h quote1, :h quote2, …, :h quote9)

Vim fills these registers with text from yank and delete commands.

0 register contains the text from the most recent yank command, unless the command specified another register with `"x`.

1 register 1 contains the text deleted by the most recent delete or change command, unless the command specified another register or the text is less than one line (the small delete register is used then).

An exception is made for the delete operator with these *movement commands*:
   `%`, <tick>
   `/`, `?`, `n`, `N`, 
   `(`, `)`
   `{`, `}`
Register `"1` is always used then.

The `"-` register is used as well if the delete is within a line.

These characters may be mapped, e.g. `%` is mapped by the *matchit* plugin.

With each successive deletion or change, Vim shifts the previous contents of register 1 into register 2, 2 into 3, and so forth, thus losing the previous contents of the final register 9.

## Small delete register

Small delete register `"-` (:h quote_-, :h quote-)

This register contains text from commands that delete less than one line, except when the command specifies a register with `"x`.

## Named registers

Named registers "a to "z or "A to "Z (:h quote_alpha, :h quotea)

Vim fills these registers only when you say so
- lowercase registers replace their previous contents
- uppercase registers append content to the corresponding lowercase registers

When the '>' flag is present in `cpoptions` then a line break is inserted before the appended text.
