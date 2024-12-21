# Vim :: Indenting and tab character

## Aspects

spaces or tabs
inserting spaces on Tab
The <Tab> key (`^I`) vs tab escape (`\t`) vs indentation
tab stops
indentation: auto vs manual
shifting (moving) the entire line right/left
shifting (moving) a part of line right/left
shifting a line with `>>`
inserting the <TAB> key
indenting with the <TAB> key
indenting: manually, auto, using Tab, using shifting
shifting text
backspacing over indentation
pre-existing tabs in a file
re-tabbing the Tabs
tab and other whitespace

## Tab stops

Terminal have the concept of *TAB STOPS*, which are the number of terminal columns the cursor stops at when encountering a TAB.

The convential (de iure) TAB STOP value is 8 (meaning 8 characters). Many applications and authors of text files (that intend the text to use a *tabular layout*) assume that TAB STOPS have this value.

When the TAB STOP = 8, a tab stop occurs at the terminal columns: 
1, 9, 17, 25, 33, 41, 49, 57, 65, 73, etc.

As long as the width of a *text column* is less than 8 (TEXT COLUMN < 8), each text column will correspond to a terminal column.



Text files use tab stops (marking the TABS with `\t`) when the intended layout is *columnar*. 



If each column contains text whose width is never bigger than 8 chars, every text column will correspond to a terminal column.

```bash

echo "1234567\t1234567\t1234567\t1234567"
echo "12345678\t12345678\t12345678\t12345678"

col1    col2    col3    col4    col5
abcdefe abcdefe abcdefe abcdefe abcdefe

#-------2-------3-------4-------5-------6-------7-------8-------9
# The numbers mark the TAB STOPS
# and thereby the start of a possible text column
```

AS long as each text column is not wider than 8 chars



the first text column (as opposed to terminal colum)



text is to be laintended presentation is columnar.
- moreover, they assume the value of tab stop is 8 - 

If a column is N chars wide and `N < 8`
- 1st column starts at col1
- 2st column starts at col9

```bash
echo "1234567\t1234567\t1234567\t1234567"
echo "12345678\t12345678\t12345678\t12345678"
echo "123456789\t123456789\t123456789\t123456789"
echo "123456789\t1234\t12345678\t1234567"
```

A column whose width is N, and N < 8, is render from col1 to colN

can then use 


echo "col1\tcol2\tcol3\tcol4\tcol5\t"

col1    col2    col3    col4    col5    col6    col7    col8    col9    col10
T-------T-------T-------T-------T-------T-------T-------T-------T-------T-----


The tab stops are strongly suggested to always be set at 8 (characters), in the terminal but in file editors as well.

The tab stop of 8 means, a tab char (usually `\t`) is 8 chars wide, i.e. a tab stop appears every 8 chars. When the cursor is in the col 1, encountering a tab will place it on col 8


```
$ tabs -d
  The debugging option (-d) shows a ruler line, followed by two data lines.
  The ruler line numbers indicate each 10 characters.
  The first data line shows the expected tab-stops marked with `T`.
  The second data line shows the actual tab-stops, marked with `*`.

----+----1----+----2----+----3----+----4----+----5----+----6----+----7----+---
T-------T-------T-------T-------T-------T-------T-------T-------T-------T-----
*       *       *       *       *       *       *       *       *       *     
----+----1----+----2----+----3----+----4----+----5----+----6----+----7----+---

.2345678.0123456.8901234.6789012.4567890.2345678.0123456.8901234.6789012.45678
.       .       .       .       .       .       .       .       .       .     
123456789012345678901234567890123456789012345678901234567890123456789012345678
         ↓         ↓         ↓         ↓         ↓         ↓         ↓
         10        20        30        40        50        60        70

TAB STOPS in cols: 1, 9, 17, 25, 33, 41, 49, 57, 65, 73, …
◾◽◽◽◽◽◽◽◾◽◽◽◽◽◽◽◾◽◽◽◽◽◽◽◾◽◽◽◽◽◽◽◾◽◽◽◽◽◽◽◾◽◽◽◽◽◽◽◾◽◽◽◽◽◽◽◾◽◽◽◽◽◽◽◾◽◽◽◽◽◽◽◾◽◽◽◽◽◽◽
A TAB STOP each 8th cols starting with col 1.
A period: (TS, 7 free), (TS, 7 free), ...
A group of cells: 1 ts cell + 7 free cells = 8 cells
7 free cols between each TAB STOP.
```

## Using tabs

There are 4 main ways to use tabs in Vim:

1. Always keep `tabstop` at 8, set `softtabstop` and `shiftwidth` to 2 (or whatever you prefer) and use `noexpandtab`. Then Vim will use a mix of tabs and spaces, but typing <Tab> and <BS> will behave like a tab appears every 2 chars. This is the recommended way, the file will look the same with other tools and when listing it in a terminal.

2. Set `softtabstop` and `shiftwidth` to 2 (or whatever you prefer) and use `expandtab` to always insert spaces. The formatting will never be messed up when `tabstop` is changed (leave it at 8 just in case). The file will be a bit larger. You do need to check if no Tabs exist in the file. You can get rid of Tabs by first setting `expandtab` and using *%retab!*, making sure the value of `tabstop` is set correctly.

3. Set `tabstop` and `shiftwidth` to whatever you prefer and use `expandtab`.  This way you will always insert spaces. The formatting will never be messed up when `tabstop` is changed. You do need to check if no Tabs exist in the file, just like in the item just above.

4. Set `tabstop` and `shiftwidth` to whatever you prefer and use a modeline to set these values when editing the file again. Only works when using Vim to edit the file, other tools assume a tabstop is worth 8 spaces.

5. Always set `tabstop` and `shiftwidth` to the same value, and `noexpandtab`. This should then work (for initial indents only) for any tabstop setting that people use. It might be nice to have tabs after the first non-blank inserted as spaces if you do this though. Otherwise aligned comments will be wrong when `tabstop` is changed.


## Tab options

option        default
tabstop       8
softtabstop
shiftwidth
expandtab



Note: Setting `tabstop` to any other value than 8 can make your file appear wrong in many places, e.g., when printing it. The value must be more than 0 and less than 10000.


## Re-tabbing a file


## Refs

https://vimhelp.org/options.txt.html#%27tabstop%27
https://vimhelp.org/change.txt.html#%3Aretab
