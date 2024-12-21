# Cursor motions

[motion.txt](https://vimhelp.org/motion.txt.html)

These commands move the cursor position. If the new position is off of the screen, the screen is scrolled to show the cursor (see 'scrolljump' and 'scrolloff' options).

## Contents

- 1. [Motions and operators](#1-motions-and-operators)
     https://vimhelp.org/motion.txt.html#operator
- 2. [Left-right motions](#2-left-right-motions)
     https://vimhelp.org/motion.txt.html#left-right-motions
- 3. [Up-down motions](#3-up-down-motions)
     https://vimhelp.org/motion.txt.html#up-down-motions
- 4. [Word motions](#4-word-motions)
     https://vimhelp.org/motion.txt.html#word-motions
- 5. [Text object motions](#5-text-object-motions)
     https://vimhelp.org/motion.txt.html#object-motions
- 6. [Text object selection](#6-text-object-selection)
     https://vimhelp.org/motion.txt.html#object-select
- 7. [Marks](#7-marks)
     https://vimhelp.org/motion.txt.html#mark-motions
- 8. [Jumps](#8-jumps)
     https://vimhelp.org/motion.txt.html#jump-motions
- 9. [Various motions](#9-various-motions)
     https://vimhelp.org/motion.txt.html#various-motions


## General remarks

To see where you are in the file use [c-g] or [gCTRL-G]. Set 'ruler' option so that cursor position is continuously shown in the status line. Enabling 'virtualedit' option makes it possible to move the cursor to positions where there is no character or within a multi-column character (like a tab).

## 1. Motions and operators

The motion commands can be used after an operator command, to have the command operate on the text that was moved over. That is the text between the cursor position before and after the motion. Operators are generally used to delete or change text.

The following operators are available:
- `c`     change
- `d`     delete
- `y`     yank into register (text unchanged)
- `~`     swap case (only if 'tildeop' is set)
- `g~`    swap case
- `gu`    make lowercase
- `gU`    make uppercase
- `!`     filter through an external program
- `=`     filter through 'equalprg' or C-indenting if empty
- `gq`    text formatting
- `gw`    text formatting (with no cursor movement)
- `g?`    ROT13 encoding
- `>`     shift (indent) right
- `<`     shift (indent) left
- `zf`    define a fold
- `g@`    invoke the function set with the 'operatorfunc' option



## 2. Left-right motions

## 3. Up-down motions

## 4. Word motions

## 5. Text object motions


## 6. Text object selection

This is a series of commands that can only be used
- while in Visual mode or
- after an operator

Note
- commands that start with `a` select `a`n object including WS
- commands starting with `i` select an `inner` object without WS (or just WS)
- `inner` commands always select less text than `a` cmds
- see also `gn` and `gN`, operating on the last search pattern


*aw*
- **a word**
- select [count] words.
- Leading or trailing WS is included, but not counted.
- When used in Visual Line-wise mode `aw` switches to Visual Char-wise mode

*iw*
- **inner word**
- select [count] words (see word).
- WS between words is counted too.
- When used in Visual Line-wise mode `iw` switches to Visual Char-wise mode.

*aW*
- **a WORD**
- select [count] WORDs.
- Leading or trailing WS is included, but not counted.
- When used in Visual Line-wise mode `aW` switches to Visual Char-wise mode.

*iW*
- **inner WORD**
- select [count] WORDs.
- WS between words is counted too.
- When used in Visual Line-wise mode `iW` switches to Visual Char-wise mode.

*as*
- **a sentence**
- select [count] sentences.
- When used in Visual mode it is made Char-wise.

*is*
- **inner sentence**
- select [count] sentences.
- When used in Visual mode it is made Char-wise.

*ap*
- **a paragraph**
- select [count] paragraphs.
- Exception: a blank line (only whitespace) is also a paragraph boundary.
- When used in Visual mode it is made linewise.

*ip*
- **inner paragraph**
- select [count] paragraphs.
- Exception: a blank line (only WS) is also a paragraph boundary.
- When used in Visual mode it is made linewise.

*a]* *a[*
- **a [] block**
- select [count] '[' ']' blocks. 
- This goes backwards to the [count] unclosed '[', and finds the matching ']'.
- The enclosed text is selected, including the '[' and ']'.
- The cpo-M option flag is used to handle escaped brackets.
- When used in Visual mode it is made characterwise.

*i]* *i[*
**inner [] block**
- select [count] '[' ']' blocks.
- This goes backwards to the [count] unclosed '[', and finds the matching ']'.
- The enclosed text is selected, excluding the '[' and ']'.
- It's an error to select an empty inner block like "[]".
- The cpo-M option flag is used to handle escaped brackets.
- When used in Visual mode it is made characterwise.

*ab* *a)* *a(*
**a block**
- select [count] blocks, from "[count] [(" to the matching ')', including the '(' and ')'
- Does not include WS outside of the parenthesis.
- The cpo-M option flag is used to handle escaped parenthesis.
- When used in Visual mode it is made characterwise.

*ib* *i)* *i(*
- **inner block**
- select [count] blocks, from "[count] [(" to the matching ')', excluding the '(' and ')'
- If the cursor is not inside a () block, then find the next "(".
- It's an error to select an empty inner block like "()".
- The cpo-M option flag is used to handle escaped parenthesis.
- When used in Visual mode it is made characterwise.

*a>* *a<*
- **a <> block**
- select [count] <> blocks, from the [count]'th unmatched '<' backwards to the matching '>', including the '<' and '>'.
- The cpo-M option flag is used to handle escaped '<' and '>'.
- When used in Visual mode it is made characterwise.

*i>* *i<*
- **inner <> block**
- select [count] <> blocks, from the [count]'th unmatched '<' backwards to the matching '>', excluding the '<' and '>'.
- It's an error to select an empty inner block like "<>".
- The cpo-M option flag is used to handle escaped '<' and '>'.
- When used in Visual mode it is made characterwise.

*at*
- **a tag block**
- select [count] tag blocks, from the [count]'th unmatched "<aaa>" backwards to the matching "</aaa>", including the "<aaa>" and "</aaa>".
- See tag-blocks about the details.
- When used in Visual mode it is made characterwise.
- Only available when compiled with the +eval feature.

*it*
- **inner tag block**
- select [N] tag blocks, from [N]'th unmatched "<aaa>" backwards to the matching "</aaa>", excluding the "<aaa>" and "</aaa>".
- See tag-blocks about the details.
- When used in Visual mode it is made characterwise.

*aB* *a}* *a{*
- **a Block**
- select [N] Blocks, from `[N] [{` to the matching `}`, including `{` and `}`
- The cpo-M option flag is used to handle escaped braces.
- When used in Visual mode it is made characterwise.

*iB* *i}* *i{*
- **inner Block**
- select [N] Blocks, from `{` to matching `}`, excluding braces themselves.
- It's an error to select an empty inner block like `{}`.
- The cpo-M option flag is used to handle escaped braces.
- When used in Visual mode it is made characterwise.

*a"* *a'* *a`*
- **a quoted string**
- Selects the text from the previous quote until the next quote.
- The 'quoteescape' option is used to skip escaped quotes.
- Only works within one line.
- When cursor starts on a quote, Vim figures out which quote pairs form a string by searching from BOL.
- any trailing WS is included, unless there's none,
- unless there's none, in which case leading WS is included.
- When used in Visual mode it is made characterwise
- Repeating this object in Visual mode another string is included
- count is currently not used

*i"* *i'* *i`*
- Like a", a' and a\` but excluding the quotes
- also, repeating won't extend the Visual selection.
- Special case: if N=2 quotes are included but no extra WS as with 'a'-versions


## 7. Marks

## 8. Jumps

## 9. Various motions
