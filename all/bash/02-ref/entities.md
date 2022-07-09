# Shell Entities

In the past, the ASCII encoding was used on the command line and for scripting. After the Unicode was established, the switch was gradually happening in the shell as well, which is rather surprising because the POSIX standard prescribes that shells should have a feature set locked to the 1959. The reason for allowing the progress to creep in, has got to do with the fact that the ASCII encoding is a proper subset of the UTF-8.




Physical layer
- *character*: a single atomic unit, any one of the ASCII charset members
- *character sequence*: two or more chars
  - pair: exactly 2 chars
  - triple: exactly 3 chars


positional parameters
parameters

Natural language semantics layer:
- control chars (CC): 32 chars, 0x00 - 0x1f
  - Special CCs
    - 0x00 `\0` NUL, <null>
    - 0x07 `\a` BEL, Bell, <bell>
    - 0x08 `\b` Backspace, BSP, <backspace>
    - `\c` Suppress further output *no ASCII repr*
    - `\e` Escape, ESC, <esc>
    - `\E` Escape, ESC, <esc>
    - `\f` Form Feed, FF, <ff>
    - `\n` New Line, NL, Line-feed, LF, <lf>, <enter>
    - `\r` Carriage Return, CR, <cr>, <return>
    - `\t` Tab, <tab>
    - `\v` Vertical tab, <vtab>
- letters
- numbers
- punctuation chars


English word ⊆ *shell name* (identifier) ⊆ *shell word*

list operators: `&&`, `||`



ASCII charset
- 128 characters: 0x00 - 0x7f
  - 32 control characters: 0x00 - 0x1f
  - Special characters (LF)
- metacharacters: TAB, NL, LF
UTF-8 charset

character
ASCII character


metacharacter
blanks
operator, shell operator
word, shell word
name, identifier

* Alias: <alias-key> = <alias-value> 

Parameters, <params>
- positional parameters, <params-positional>
- special parameters, <params-special>
- numeric parameters, <params-numeric>
- variables <vars>
- scalar vars, <var-scalar>
- array vars, <var-array>
- bash vars <var-bash>
- shell vars <var-shell>


A *command* is usually the first word on the command line, with other words being positional parameters.

*Blank* is a space or tab character.

*Control operator* is a token that performs a control function:
LF  ||  &&  &  ;  ;;  ;&  ;;&  |  |&  ( )

*Field* is a unit of text that is the result of one of the shell expansions. After expansion, when executing a command, the resulting fields are used as the command name and arguments.

*Filename* is a sequence of characters that identifies a file.

*Metacharactera* is a character that, when unquoted, separates words.
space, tab, newline, |, &, ;, (, ), <, >

A *name* or an *identifier* is a word that uniquely identifies and fully qualifies a shell variable or function. It consists of alphanumeric and underscore characters but it must not begin with a number.

Operators: control operators or redirection operators
Operators contain at least one unquoted metacharacter.

A *keyword* is a word reserved by bash and assigned some special meaning. Most reserved words are flow control constructs (for, while, until, if, case, etc.).

A *shell word*, or frequentlly just *word*, is a sequence of characters treated as a unit by the shell. It is a superset of characters allowed in *shell names*: English word ⊆ *shell name* (identifier) ⊆ *shell word*.

A *token* is a single unit of meaning. In terms of their length, tokens range from a single character to a sequance. Programming languages will often delagate the most frequently used language constructs to the smalles tokens. For example, a single, easily typed, character that is the dot (`.`) often gets promoted into a token that represents a very popular and frequently performed action in a language: sourcing a file (shell), member access (OO), functional composition (FP), etc. In shell, tokens stand for operators, special and meta characters, words, names, and all other shell entities.

On the command line, a *word* is a sequence of characters treated as a unit by the shell. Usually, shell words look alike the words in English, being assembled of letters, however, shell words may also include some special characters, including a dollar symbol, underscore and such.
