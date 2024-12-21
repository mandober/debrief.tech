true

: [arguments]
true [arguments]

No-op; No effect; the command does nothing beyond expanding arguments and performing any specified redirections. 
This utility shall only expand command arguments. It is used when a command is needed, as in then condition of an if command, but nothing is to be done by the command.
RETURN STATUS is always 0.

true, :, false, test builtins do not accept options and do not treat -- specially.


Examples:

assignment: 
: ${ORIGINAL_PATH=$PATH}
the same as: 
ORIGINAL_PATH=${ORIGINAL_PATH:-$PATH}

placeholder (empty functions throws in bash):
func() {
  :
}

a way to sneak comments, although be carefull:
: this is a comment


