# Bash :: Bash variables



$MAIL
If this parameter is set to a filename and the MAILPATH variable is not set, bash informs the user of the arrival of mail in the specified file.

$MAILCHECK
Specifies how often (in seconds) bash checks for mail. The default is 60 seconds. When it is time to check for mail, the shell does so before prompting. If this variable is unset, the shell disables mail checking.

$MAILPATH
A colon-separated list of pathnames to be checked for mail. The message to be printed may be specified by separating the pathname from the message with a `?'. $_ stands for the name of the current mailfile. Example: MAILPATH='/usr/spool/mail/bfox?"You have mail":~/shell-mail?"$_ has mail!"' Bash supplies a default value for this variable, but the location of the user mail files that it uses is system dependent (e.g., /usr/spool/mail/$USER).

$MAIL_WARNING
If set, and a file that bash is checking for mail has been accessed since the last time it was checked, the message ``The mail in mailfile has been read'' is printed.
