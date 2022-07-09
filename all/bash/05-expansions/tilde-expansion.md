 bash | expansions

Tilde Expansion


If a word begins with an unquoted tilde character (`~'), all of the characters preceding the 
first unquoted slash (or all characters, if there is nounquoted slash) are considered a tilde-prefix. 
~fred/foo

If none of the characters in the tilde-prefix are quoted, the characters 
in the tilde-prefix following the tilde are treated as a possible login name. 
~fred 

If this login name is the null string, the tilde is replaced with the value of the shell parameter HOME. 
If HOME is unset, the home directory of the user executing the shell is substituted instead. 
Otherwise, the tilde-prefix is replaced with the home directory associated with the specified login name.
~/foo = $HOME/foo 
~fred/foo

If the tilde-prefix is ~+ the value of the shell variable PWD replaces the tilde-prefix. 
~+/foo  =	$PWD/foo

If the tilde-prefix is ~- the value of the shell variable OLDPWD, if it is set, is substituted. 
~-/foo  =	${OLDPWD-'~-'}/foo

If the characters following the tilde in the tilde-prefix consist of a number N, 
optionally prefixed by a `+' or a `-', the tilde-prefix is replaced with the corresponding 
element from the directory stack, as it would be displayed by the dirs builtin invoked with the tilde-prefix as an argument. 
If the characters following the tilde in the tilde-prefix consist of a number without a leading `+' or `-', `+' is assumed.

* If the login name is invalid, or the tilde expansion fails, the word is unchanged.
* Each variable assignment is checked for unquoted tilde-prefixes immediately following a : or the first = 
  PATH=/bin:~/bin  var=~/git
In these cases, tilde expansion is also performed.
Consequently, one may use filenames with tildes in assignments to 
PATH, MAILPATH, and CDPATH, and the shell assigns the expanded value.



~		The value of $HOME 
~/foo		$HOME/foo
~fred/foo	The subdirectory foo of the home directory of the user fred

~+/foo	$PWD/foo
~-/foo	${OLDPWD-'~-'}/foo

~N		The string that would be displayed by `dirs +N'
~+N		The string that would be displayed by `dirs +N'
~-N		The string that would be displayed by `dirs -N'