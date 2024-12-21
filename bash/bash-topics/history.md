# History

Commands
history	Show history
shopt -s histverify	Don't execute expanded result immediately

Expansions
!$	Expand last parameter of most recent command
!*	Expand all parameters of most recent command
!-n	Expand nth most recent command
!n	Expand nth command in history
!<command>	Expand most recent invocation of command <command>

Operations

!!	Execute last command again
!!:s/<FROM>/<TO>/	Replace first occurrence of <FROM> to <TO> in most recent command
!!:gs/<FROM>/<TO>/	Replace all occurrences of <FROM> to <TO> in most recent command
!$:t	Expand only basename from last parameter of most recent command
!$:h	Expand only directory from last parameter of most recent command
!! and !$ can be replaced with any valid expansion.

Slices
!!:n	Expand only nth token from most recent command (command is 0; first argument is 1)
!^	Expand first argument from most recent command
!$	Expand last token from most recent command
!!:n-m	Expand range of tokens from most recent command
!!:n-$	Expand nth token to last from most recent command
!! can be replaced with any valid expansion i.e. !cat, !-2, !42, etc.
