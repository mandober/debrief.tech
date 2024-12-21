# Index :: Bash commands

- command
  - simple-command
  - command-list
  - compund-command
  - compund-group
  - pipeline


Bash command types:
- external command
  alias
  function
  builtin
- internal command
  program



simple-command := name | name io


command ; command
command & command
command | command
command && command
command || command


if [ command ]; then
  command-list
fi

while command; do
  command-list
done
