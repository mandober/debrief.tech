# Metacharacters

- *metacharacters*: chars with a special meaning in bash

**Special characters** or **metacharacters** are those characters to which bash has assigned special meaning that is different then their literal meaning. Along with the *bash builtins* and *bash keywords*, metachars form the third group of the fundamental bash tokens.

bash tokens:
- bash builtins
- bash keywords
- metacharacters


**Metacharacter** - a character that, when unquoted, separates words:
- SPACE, TAB, LF
- `;`  `&`
- `|`  `<`   `>`
- `(...)`


**Control operators** are tokens that performs a control function:
* stetement separators and terminators
  - LF
  - `;`
  - `&`
- lists:
  - `||`
  - `&&`
- case-esac
  - `;;`   (break from case)
  - `;&`   (execute next statement without trying the pattern)
  - `;;&`  (try next pattern and execute associated stmnt if matched)
- piping
  - `|`   (normal pipe operator)
  - `|&`  (pipe both stdout and stderr)
- subshell
  - `(...)`  Force a subshell to execute commands


**Redirection operators**:
- `<`
- `<<`
- `<<<`
- `>`
- `>|`        Overriding `noclobber` option
- `>>`
- `<>`
- `m<&n`
- `m<&-`
- `|`         Pipe LHS's stdout to RHS's stdin
- `&|`, `|&`  Pipe LHS's both stdout and stderr to RHS's stdin
