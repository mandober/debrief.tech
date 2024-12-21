# Index :: Bash Control Operators

A **control operator** is a *token* that performs a *control function*:
- `NL` Command terminator or command delimiter
- `&`  Command terminator that runs the preceding command in background
- `;`  Command terminator for sequencing commands
- `;;`, `;&`, `;;&` The case statement terminators (each with diff semantics)
- `|`         Pipeline (only forwards stdout)
- `|&`        Pipeline that also forwards stderr
- `(` and `)` Parenthesis create subshells
- `||`, `&&`  Combining commands by creating dependencies based on exit status


sym | cat | desc
NL  | del | command delimiter
&   | del | command delimiter
;   | del | command delimiter for sequencing
||  | del | delimiter for combining commands
&&  | del | delimiter for combining commands
NL  | ter | command terminator
&   | op  | operator
(…) | op  | forcing a subshell
(…) | del | delimiter
