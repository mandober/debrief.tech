# Builtins

## read

```
read
  [-r]            raw input
  [-e]            interactive readline interface                           I
  [-s]            disable echo                                             I
  [-p <PMP>]      issue prompt before reading                              I
  [-i <DEF>]      default text (depends on -e)                             I
  [-t <OUT>]      input timeout                                            I
  [-u <FDN>]      use FD number in arg for data input
  [-a <ANAME>]    assign each read word to the array named in arg
  [-n <CHARS>]    quit after arg number of chars read
  [-N <CHARS>]    quit after arg number of chars read (ignore delimiters)
  [-d <DELIM>]    read data delimiter (instead of \n)
  [<VARNAME...>]  variable name(s) to receive read lines
```

- Input mode may be interactive or piped (file, cmd output, string, etc.)
- Options that commonly go along with a particular mode:
* *Interactive* mode (I)
  - for accepting direct user input
  - to issue prompt, `-p 'Project name? '`
  - to set default text (as if just read): `-i '[proj42]'`
  - set input timeout (avoid AFK problem): `-t 5`
* *Piped* mode
  - for feeding in the contents of file, string, command output, etc.
  - may set input FD instead of stdin


- Reads chars into variable(s)
- Since bash 4.3-alpha, skips `NUL` (0) in input.

If <NAME…> is given, the line is word-split using IFS variable, and every word is assigned to one <VNAME>. The remaining words are all assigned to the last <VNAME> if more words than variable names are present.
