# Status Codes

Exit or return status code is a way for a executable or runnable to indicate whether it finished successfully or not. Both codes represent the same thing, but executables (run in a subshell or a separate shell) have exit codes, while sourcables (run in the same shell) have return codes.

Executable scripts cannot even have a `return` statement anywhere in the top level (it's only allowed in a function). Sourcables, that is functions and sourced files have both, `return` code that if encountered early, before the EOF, causes the script/function to stop and return immediately.


- exit/return code range: 0-255
- codes > 128 reserved by bash



0       *SUCCESS*  (etched in stone)
1       ERROR      of the most general kind
2       Bash builtins use for misc usage errors
126     Command found but it's not executable
127     Command not found
128+N   Received signal number N has interrupted execution
