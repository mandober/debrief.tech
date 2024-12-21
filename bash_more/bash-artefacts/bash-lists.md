# Bash :: Lists

An easy way to get the list of various bash artefacts is using the bash builtin intended to facilitate completion, like the `compgen` builtin that can generate lists of various artefacts.

```bash
compgen [-abcdefgjksuv] [-o option] [-A action] [-G globpat] [-W wordlist] [-F function] [-C command] [-X filterpat] [-P prefix] [-S suffix] [word]

# Get the list of bash keywords
compgen -k

# Get the list of bash builtins
compgen -b
```

Bash lists
- builtins
- keywords
- reserved words
