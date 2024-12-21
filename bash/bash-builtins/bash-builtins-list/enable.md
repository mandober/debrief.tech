 bash | man | builtins

enable

enable [-a] [-dnps] [-f filename] [name ...]

Enable and disable builtin shell commands. 
Disabling a builtin allows a disk command which has the same name as a shell builtin to be executed 
without specifying a full pathname, even though the shell normally searches for builtins before disk commands.

-n each name is disabled; otherwise, names are enabled. 
   For example, to use the test binary found via the PATH instead of the shell builtin version, run `enable -n test'. 
-f option means to load the new builtin command name from shared object filename, on systems that support dynamic loading.
-d option will delete a builtin previously loaded with -f. 
-p or no arguments lists the shell builtins
   With no other option arguments, the list consists of all enabled shell builtins. 
   If -n is supplied, only disabled builtins are printed. 
-a option lists all builtins, with an indication of whether or not each is enabled. 
-s option means the output is restricted to the POSIX special builtins. 


RETURN VALUE
is 0 unless a name is not a shell builtin or there is an error loading a new builtin from a shared object.

http://www.drdobbs.com/shell-corner-bash-dynamically-loadable-b/199102950?pgno=1 

loadables
cd /home/ivan/bash-4.4-rc1/examples/loadables
export PATH="$PATH:$PWD"

enable -f ./basename basename
enable -f ./dirname dirname
enable -f ./finfo finfo
enable -f ./head head
enable -f ./id id
enable -f ./ln ln
enable -f ./logname logname
enable -f ./mkdir mkdir
enable -f ./pathchk pathchk
enable -f ./print print
enable -f ./printenv printenv
enable -f ./push push
enable -f ./realpath realpath
enable -f ./rmdir rmdir
enable -f ./setpgid setpgid
enable -f ./sleep sleep
enable -f ./strftime strftime
enable -f ./sync sync
enable -f ./tee tee
enable -f ./tty tty
enable -f ./uname uname
enable -f ./unlink unlink
enable -f ./whoami whoami

enable -f ./truefalse truefalse cannot find truefalse_struct in shared object
enable -f ./mypid mypid		./truefalse: ./truefalse: undefined symbol: truefalse_struct


basename		Return non-directory portion of pathname.
cat			cat(1) replacement with no options - the way cat was intended.
dirname		Return directory portion of pathname.
finfo			Print file info.
head			Copy first part of files.
id			POSIX.2 user identity.
ln			Make links.
loadables		Start at a file loadable builtins can include for shell definitions
logname		Print login name of current user.
mkdir			Make directories.
pathchk		Check pathnames for validity and portability.
print			Loadable ksh-93 style print builtin.
printenv		Minimal builtin clone of BSD printenv(1).
push			Anyone remember TOPS-20?
realpath		Canonicalize pathnames, resolving symlinks.
rmdir			Remove directory.
sleep			sleep for fractions of a second.
strftime		Loadable builtin interface to strftime(3).
sync			Sync the disks by forcing pending filesystem writes to complete.
tee			Duplicate standard input.
tty			Return terminal name.
uname			Print system information.
unlink		Remove a directory entry.
whoami		Print out username of current user.

template		Example template for loadable builtin.
truefalse		True and false builtins.
mypid			Add $MYPID variable, demonstrate use of unload hook function
necho			echo without options or argument interpretation.
hello			Obligatory "Hello World" / sample loadable.

