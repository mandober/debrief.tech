# Bash :: Terminology

Terminology used in and around the bash (as bash the shell, and bash the programming language). Whenever possible, the terminology, as used in this text, follows the "standard" and widely-accepted terminology. However, whenever the situation showed the lacking, the author kept failing to refrain from inventing and using new terms, especially when the existing ones were ambiguous, imprecise, unfocused. We are gathered here today to join the new and the old terms in the shell vocabulary.

## Words

Even in natural languages, the exact rules of what qualifies as a word is vague at times, and this includes the command language of the bash shell, despite it being a formal, and thus very precise and unambiguous, language. Well then.

A **character** is a single *printable glyph*. A character may belong to one of the several disjoint classes (and a to a several of overlapping ones), the most common of which are *alphabetic* (a char is a Unicode *letter*), numeric (a number), alphanumeric (letters and numbers), symbolic (a symbol).

Classes
- alphabetic
  Unicode letters
- numeric
  - number
- alphanumeric
  - letters and numbers
- symbolic
  - symbol



. A **string** is a contiguous sequence of characters.


how could it not be the same with shell (perhaps because it should be an unambiguous, formally defined, language)

A **shell word** is a character or a string of characters that has a meaning to the shell.
