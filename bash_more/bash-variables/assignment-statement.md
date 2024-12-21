# Assignment statement

Assignment statement has the form `name=value`, although value may not be given.

When a value is not given, as in `VAR=`, VAR is assigned *null or empty string*.

Such variables are said to be *unset*, i.e. they are declared but undefined.

In some contexts, unset variables have a default interpretation; e.g. when `IFS` variable is unset, with `IFS=`, it is treated as if it contains a SPACE, TAB and LF, i.e. `IFS=$' \t\n'`. Some (environment) variables have special features - if they are unset, they loose their special feature (e.g. `RANDOM`).
