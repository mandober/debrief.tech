# intro.txt

https://vimhelp.org/intro.txt.html

intro.txt / For Vim version 9.1. / Last change: 2023 Nov 18

Introduction to Vim
https://vimhelp.org/intro.txt.html
1. Introduction
   https://vimhelp.org/intro.txt.html#intro
2. Vim on the internet
   https://vimhelp.org/intro.txt.html#internet
3. Credits
   https://vimhelp.org/intro.txt.html#credits
4. Notation
   https://vimhelp.org/intro.txt.html#notation
5. [Modes, introduction](./intro-vim-modes.md)
   https://vimhelp.org/intro.txt.html#vim-modes-intro
6. [Switching from mode to mode](./intro-vim-modes.md)
   https://vimhelp.org/intro.txt.html#mode-switching
7. The window contents
   https://vimhelp.org/intro.txt.html#window-contents
8. Definitions
   https://vimhelp.org/intro.txt.html#definitions


## 1. Introduction

## 2. Vim on the internet

## 3. Credits

## 4. Notation


## 5. Modes, introduction
https://vimhelp.org/intro.txt.html#vim-modes

Depending on the mode, typed characters are interpreted either as sequences of commands or are inserted as text.

Vim has 14 editing modes, *7 basic modes* and *7 variants*.

Vim has 7 BASIC modes
1. NORMAL mode
2. INSERT mode
3. VISUAL mode
  - VISUAL-LINE mode
  - VISUAL-BLOCK mode
4. SELECT mode
5. Command-line mode
6. Ex mode
7. TERMINAL-JOB mode

Vim has 7 VARIANT modes
1. Operator-pending mode
2. REPLACE mode
3. VIRTUAL REPLACE mode (VREPLACE)
4. INSERT-NORMAL mode
5. TERMINAL-NORMAL mode
6. INSERT-VISUAL mode
7. INSERT-SELECT mode


### Basic modes

1. NORMAL mode 
   is used for editor commands. This is generally the default mode. ESC returns the editor to this mode.

2. INSERT mode 
   is used for typing text. In this mode, opened text in buffers can be modified with the text entered from the keyboard.

3. VISUAL mode 
   is used to select areas of text. Commands can be run on the selected area to move, edit, filter text via built-in or external command.

   VISUAL-LINE mode 
   is a subtype of visual mode which selects one or more whole lines

   VISUAL-BLOCK mode 
   is another subtype which selects a rectangular block of text across one or more lines

4. SELECT mode 
   is similar to VISUAL, but commands are not interpreted; instead, highlighted text is directly replaced by keyboard input (similar to the selection mode used in editors on Windows). (So, it is the REPLACE mode? Hmm, it's not replace since replace mode is a variant mode, described below).

5. Command-line mode 
   provides a single line input at the bottom of the Vim window. Commands and some other keys for specific actions (search and filter command) activate this mode. On completion of the command, Vim returns to the previous mode.
   - search forward
   - search backward
   - search and replace
   - sort ASC (:sort), DESC (:sort!)
   - filter

6. **Ex mode** 
  accepts a sequence of commands. Vim does not have a built-in REPL, but it has Ex mode that can be used like one. You can go to the Ex mode with `Q` or `gQ`. The Ex mode is like an *extended command-line mode* (you can type a command after a command non-stop). To quit the Ex mode, type `:visual`.

7. **Terminal-Job** mode 
  is for interacting with a job in a terminal window.


### Variant modes

There are 7 additional modes, variants of the basic modes:

1. **OPERATOR-PENDING** mode 
   is a situation in NORMAL mode that occurs after an *operator* command is issued and Vim is awaiting for a *motion* command that will indicate the *text object* the operator will be applied to. For example, pressing 'd' puts Vim in operator-pending mode - since 'd' alone does nothing unless followed by a motion. Users can define their own operators.

2. **REPLACE** mode 
   (i.e. overtype, overwrite or overstrike) is a special case of INSERT mode, where the new text is typed over the old - each new char entered deletes an existing char. This mode is very convenient when typing text in a comment box since the right side of the comment box remains in place.
   - If 'showmode' option is on `-- REPLACE --` is shown in the status bar.

3. **VIRTUAL REPLACE** mode 
   is similar to REPLACE mode, but instead of replacing chars you are replacing screen real estate, so that chars further on in the file never appear to move.
   - `c-T` and `c-D` behave weird, hiding and revealing text.
   - enter by `gR`
   - Enter this mode with `gR` issued in normal mode
     (unless Vim was compiled without the `+vreplace` feature)
   - If 'showmode' option is on `-- VREPLACE --` is shown in the status bar.
   - The INS key toggles between this mode and INSERT mode.
   - Airline plugin shows `V^REPLACE` is the status bar.
   - https://vimhelp.org/insert.txt.html#Virtual-Replace-mode

4. **INSERT-NORMAL** mode 
   is entered when CTRL-O is typed in INSERT mode (see i_CTRL-O). This is like NORMAL mode, but after executing one command Vim returns to INSERT mode.
   - If the 'showmode' option is on "-- (insert) --" is shown in status bar.

5. **TERMINAL-NORMAL** mode 
   Using NORMAL mode in a terminal window. Making changes is impossible. Use an insert command (a/i), to return to TERMINAL-JOB mode.

6. **INSERT-VISUAL** mode 
   is entered when starting a Visual selection from Insert mode, e.g. by using CTRL-O and then "v", "V" or CTRL-V. When the Visual selection ends, Vim returns to Insert mode.
   - If 'showmode' option is on "-- (insert) VISUAL --" is shown in status bar.

7. **INSERT-SELECT** mode 
   is entered when starting Select mode from Insert mode; e.g. by dragging the mouse or <S-Right>. When the Select mode ends, Vim returns to Insert mode.
   - If 'showmode' is on "-- (insert) SELECT --" is shown in status bar.


## 6. Switching from mode to mode
https://vimhelp.org/intro.txt.html#mode-switching

## 7. The window contents

## 8. Definitions
