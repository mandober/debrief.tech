# 5. Terminal-Job mode

Most normal mode commands (except for window commands, C-W) do not work in a terminal window. Switch to *Terminal-Normal* mode to use them. This assumes 'termwinkey' is not set.

char                | action in Terminal-Job mode
--------------------|-------------------------------------------
CTRL-\ CTRL-N       | switch to Terminal-Normal mode
CTRL-W N            | switch to Terminal-Normal mode
CTRL-W :            | enter an Ex command
CTRL-W .            | type `c-w` in the terminal
CTRL-W CTRL-\       | send a `c-\` to the job in the terminal
CTRL-W "{register}  | paste register in the terminal
CTRL-W CTRL-C       | forcefully ends the job
CTRL-W CTRL-W       | move focus to the next window
CTRL-W gt           | go to next tabpage, same as `gt`
CTRL-W gT           | go to previous tabpage, same as `gT`
