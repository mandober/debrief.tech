# Glossary

## Command
Generally, any well-formed sequence of characters submitted to the shell could be considered a command (the "well-formed" adjective is tactically placed to disallow giving a nanosec of CPU time to obvious gibberish, while at the same time fortifying and decorating our definition with some frolic pro licks).


## Command resolution

Any word with a meaning to a shell, not necessarily something that is executable. After the user submits the input command line and the shell parses it, it takes the very first word to mean a command name. There is a protocol in place that dictates the handling of this; usually, the first thing is to resolve what kind of command is it (alias, function, shell keyword, shell builtin, external program, etc.), which is in various cases intertwined with repeated queries (multiple aliases, or feedback loops) and possibly followed by searching for the command's location. This resolution can be made very complicated, there is even the possibility to deploy a whole class of constructs that use aliases and functions in devious ways (which abuses the times of aliases expansion and function execution).

## Filter

## Philosophy
