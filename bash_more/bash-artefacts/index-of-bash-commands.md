# Bash commands :: Index

* Bash commands (shell words)
  * bash keywords
  * bash builtins
  * bash aliases
  * bash functions
  * bash metachars
  * bash symbolic operators
  * bash names
    - bash variables
    - shell variables
    - sh variables
    - sh builtins
    - environment variables
      - sh envvars
      - bash envvars
      - inherited vars (from windows in wsl)
      - program envvars
        - langs envvars
        - tools envvars

## Aspects

History Interaction
Event Designators
Tilde Expansion
Filename Expansion
Brace Expansion
Shell Parameter Expansion
Shell Arithmetic
Process Substitution
Redirections

## Reserved Words

Reserved words are words that have special meaning to the shell. 
They are used to begin and end the shell's compound commands.

The following words are recognized as reserved when unquoted 
and the first word of a command (see below for exceptions):

```bash
if      then      elif        else      fi
{       }         for         in
[[      ]]        until       while     !
do      done      case        esac
time    coproc    select      function
```

`in` is recognized as a reserved word 
if it is the 3rd word of a `case` or `select` command.

`in` and `do` are recognized as reserved words 
if they are the 3rd word in a `for` command.

```bash
for for for
  for for
```
