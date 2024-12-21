# Alternate screen

Normally, the user interacts with a terminal in the main screen, called the **primary screen**, but most terminals also have the capability to temporarily switch to an additional virtual screen called the **alternative screen**.

The alternative screen is useful for presenting ephemeral information separate from the primary screen. Outputting the contents of a text file is far better done on the alternate screen than to pollute the primary one. Large output of some command may also be presented there so as to keep the primary screen tidy.

Many shell utilities (vim, less, …) completly switch to the alternative screen during execution not only in order to leave the primary screen perstine but also because the programs can exert more control over the alternative screen. The alternative screen lacks many features available to the primary screen (e.g. buffering and scrolling), but each programs is free to implement the features it needs.

When a command using the AS exits, the contents of the primary screen are restored along with the terminal's state. This keeps the primary screen and the associated history buffer tidy.

`tput` provides access to the alternate screen:
- `smcup` - switch to the AS
- `rmcup` - discontinue using the AS, restoring the primary screen's state

```bash
# To make sure you exit the alt screen when your
# command is done, set up an exit (code 0) trap:
trap 'tput rmcup' 0

# switch to the alternate screen:
tput smcup

# exit the AS and restore original terminal state:
tput rmcup
```


## Refs

https://stackoverflow.com/questions/1002008/how-does-a-process-know-when-its-been-backgrounded/1002067#1002067

https://stackoverflow.com/questions/10777087/prompt-user-for-input-again-after-background-process-return

https://stackoverflow.com/questions/11023929/using-the-alternate-screen-in-a-bash-script

https://stackoverflow.com/questions/1844232/sending-a-signal-to-a-background-process/1844440#1844440

https://stackoverflow.com/questions/19330488/terminal-access-control-issues/19330855#19330855

https://stackoverflow.com/questions/33929816/save-and-restore-terminal-content?noredirect=1&lq=1

https://stackoverflow.com/questions/36814595/how-does-launching-less-differ-from-launching-cat-in-zsh-with-regards-to-the

https://stackoverflow.com/questions/39473817/linux-reasons-for-sigstop-and-how-to-deal-with-it/44828611#44828611

https://stackoverflow.com/questions/39477145/check-if-trap-is-set-in-bash/39477217#39477217

https://stackoverflow.com/questions/46061694/bash-why-cant-i-set-a-trap-for-sigint-in-a-background-shell/69985268#69985268

https://stackoverflow.com/questions/47708808/tab-competion-in-bash-hangs-at-select

https://stackoverflow.com/questions/47920541/why-trap-does-not-work-to-interrupt-nohup-command/47921993#47921993

https://stackoverflow.com/questions/64639759/executing-bash-shell-script-accepting-argument-and-running-in-background/64640008#64640008

https://stackoverflow.com/questions/66627808/using-setpgid-in-a-mini-shell-breaks-interactive-commands/66629998#66629998

https://stackoverflow.com/questions/8777602/why-must-detach-from-tty-when-writing-a-linux-daemon/8777697#8777697

https://stackoverflow.com/questions/8864973/my-server-wont-accept-connections-while-running-as-a-background-process/8865157#8865157

https://stackoverflow.com/questions/9306100/how-can-i-tell-if-a-child-is-asking-for-stdin-how-do-i-tell-it-to-stop-that/9306189#9306189

https://stackoverflow.com/questions/9385913/what-are-the-historical-reasons-for-processes-receiving-sigttyin-ttou-instead-of

https://stackoverflow.com/questions/tagged/bash-trap

https://stackoverflow.com/search?q=SIGTTIN+++SIGTTOU
