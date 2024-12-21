# Vim :: Objects

character
  printable characters:
    letters: a-z, A-Z
    punctuations: ~!@#$%^&*[]-+_=|\:';",./<>?
    numbers: 0-9
    paired chars:
      parens ()
      braces {}
      brackets []
      angles <>
      comments: opening and closing
      quotes
        squotes
        dquotes
  control characters: ^I, ^M, …
  escape characters: \0, \b, \c, \v, \n, \t, \r
  unicode escape characters: \u{hex4}, \u{hex6}
  key characters: <ESC>, <TAB>, <CR>, <NL>, <BS>, …
  whitespace characters: <SPACE>, \n, \t, \r, …


- character
- word: separated by whitespace, comma, period, apostrophe, …
- WORD: separated by whitespace
- delimited word/WORD
  - in-word
  - around-word
  - out-word
- line
  - wrapped line
- sections
  - sentence (`s`, `(`)
  - paragraph (`p`, `{`)
- code (function, class, etc.)
- screen (visible portion of a window)
- buffer
  - new
  - backed up with a file
  - modified
  - written
  - RO
- file
