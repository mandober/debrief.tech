hash [-lr] [-p filepath] [-dt] [name]

Each time hash is invoked, the full pathname of the command name is determined by searching
the directories in $PATH and remembered. Any previously remembered pathname is discarded. 

--	If no args info about remembered commands is printed. 
-l 	display output in reusable format.
-p	no path search is performed, and filepath is used as the path of command.
-r 	causes the shell to forget all remembered locations.
-d 	causes the shell to forget the remembered location of each name. 
-t 	prints full pathname to which each name corresponds. If multi name args given, name is printed before the hashed full pathname. 

RETURN STATUS
is true unless a name is not found or an invalid option is supplied.

$ hash
hits    	command
5    	   	/bin/fortune
2  		/usr/local/bin/cowsay

$ hash -l
builtin hash -p /bin/fortune fortune
builtin hash -p /usr/local/bin/cowsay cowsay

$ hash -t curl
/usr/bin/curl
$ hash -t curl git
curl    /usr/bin/curl
git     /usr/bin/git

$ hash -p /usr/bin/which boink
$ boink useradd
/usr/sbin/useradd

$ typeof $BASH_CMDS
1. [which]: /usr/bin/which
2.   [git]: /usr/bin/git
3. [boink]: /usr/bin/which
4.  [wget]: /usr/bin/wget
5.  [curl]: /usr/bin/curl