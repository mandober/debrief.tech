false

No-op; No effect; the command does nothing beyond returning false, i.e. nonzero return status.
true, :, false, test builtins do not accept options and do not treat -- specially.

Some scripts tend to set 'exit on error' option at the beginning of the script: set -e
in which case anytime non-zero exit status is encountered, the script bails. In order
to let some commands return false, but not bail, use constructs with true or false.

set -e
[[ -z $SOMEVAR ]] || true
(( 0 == 3 )) || true


