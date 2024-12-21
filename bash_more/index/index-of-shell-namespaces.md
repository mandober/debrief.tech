# Index :: Command aliases

Command aliases (synonyms) exists within and across command namespaces.

Within the bash builtins namespace, several builtins are available under two different names:
- `source`  and `.`
- `true`    and `:`
- `declare` and `typeset`
- `mapfile` and `readarray`
- `test`    and `[`

The following names are the same across command namespaces. In this situation, the name resolution process searches the namespaces in the order of precedence: aliases, keywords, functions, builtins, programs. The precedence can be overriden using the `command` and `builtin` builtins.




Within the bash builtins namespace, several builtins are available under two different names:




Command synonyms (aliases)



- builtins and programs synonyms
  - test   (bultin), `/bin/test`    (program)
  - `[`    (bultin), `/bin/[`       (program)
  - echo   (bultin), `/bin/echo`    (program)
  - printf (bultin), `/bin/printf`  (program)
  - true   (bultin), `/bin/true`    (program)
  - false  (bultin), `/bin/false`   (program)
  - kill   (bultin), `/bin/kill `   (program)