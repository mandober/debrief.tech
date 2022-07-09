

As interactive login shell, or as a non-interactive shell with the --login option, 
   1) it first reads and executes commands from the file /etc/profile, if that file exists.
   2) After reading that file, it looks for ~/.bash_profile, ~/.bash_login, and ~/.profile, in that order, 
      and reads and executes commands from the first one that exists and is readable.
      The --noprofile option may be used when the shell is started to inhibit this behavior.
   3) When a login shell exits, bash reads and executes commands from the file ~/.bash_logout, if it exists.

• As interactive non-login shell, bash reads and executes commands from ~/.bashrc, if that file exists. 
   This may be inhibited by using the --norc option. 
   The --rcfile file option will force bash to read and execute commands from file instead of ~/.bashrc.

• As non-interactive (for example, to run a shell script) it looks for the variable BASH_ENV in the environment, 
   expands its value if it appears there, and uses the expanded value as the name of a file to read and execute. 
   Bash behaves as if the following command were executed:
	if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi
   but the value of the PATH variable is not used to search for the filename.



INVOCATION

login shell 
is one whose first character of argument zero is a -, or one started with the --login option. 

interactive shell 
is one started without non-option arguments and without the -c option 
whose standard input and error are both connected to terminals (as determined by isatty),
or one started with the -i option. PS1 is set and $- includes i if bash is interactive, 
allowing a shell script or a startup file to test this state.



Bash sources from a different file based on what kind of shell it thinks it is in. 

as interactive non-login shell it reads 
	/etc/bash.bashrc
	~/.bashrc
as interactive login shell it reads only
	~/.bash_profile OR
	~/.bash_login   OR
	~/.profile
as a script interpreter it reads only
	BASH_ENV


bash - order of reading files:
reads A, then B, then C. B1, B2, B3 means it reads only the first file found
+----------------+-----------+-----------+------+
|                |  int.act. | int.act.  |script|
|                |   login   | non-login |      |
+----------------+-----------+-----------+------+
|/etc/profile    |   A       |           |      |
+----------------+-----------+-----------+------+
|/etc/bash.bashrc|           |    A      |      |
+----------------+-----------+-----------+------+
|~/.bashrc       |           |    B      |      |
+----------------+-----------+-----------+------+
|~/.bash_profile |   B1      |           |      |
+----------------+-----------+-----------+------+
|~/.bash_login   |   B2      |           |      |
+----------------+-----------+-----------+------+
|~/.profile      |   B3      |           |      |
+----------------+-----------+-----------+------+
| BASH_ENV       |           |           |  A   |
+----------------+-----------+-----------+------+
|~/.bash_logout  |    C      |           |      |
+----------------+-----------+-----------+------+


Bash Initialisation Files:


switches:
--login
--rcfile <filename>
--noprofile
--norc

files:
~/.bash_profile
~/.bash_login
~/.profile
/etc/profile
/etc/bash.bashrc
~/.bashrc




