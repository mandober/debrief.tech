# Bash functions vs variables

>There may be a variable with the same name as a shell function.

```bash
fn="echo shell variable"
fn() { echo "shell function"; }

fn
#: "shell function"

$fn
#: "shell variable"

declare -p fn
#: declare -- fn="echo shell variable"
declare -f fn
#: fn() { echo "shell function"; }
```
