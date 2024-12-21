# index :: shell commands

name      | object   | desc
----------|----------|---------
fg        | process  | builtin
bg        | process  | builtin
sleep     | process  | 
jobs      | process  | builtin
disown    | process  | builtin
kill      | process  | builtin; send signals to processes
cd        | dir      | builtin
pwd       | dir      | builtin
ps        | process  | display running processes
popd      | dir      | builtin
pushd     | dir      | builtin
dirs      | dir      | builtin; show dir stack
realpath  | fs items | resolve symlinks to pathnames
basename  | fs items | strip directory and suffix from filenames
touch     | fs items | update the modified date of a fs item
mkdir     | dir      | create a directory
rmdir     | dir      | remove a directory
cp        | fs items | copy fs items
mv        | fs items | move fs items
rm        | fs items | delete fs items
mktmp     | fs items | create a temp file
mkfifo    | fs items | create a FIFO file (named pipe)
sudo      | perm     |
chmod     | perm     |
chown     | perm     |
id        | perm     | print real and effective user and group IDs
sg        | perm     | execute command as different group ID
group     | perm     | 
whoami    | perm     | 
grep      | search   | 
find      | search   | 
plocate   | search   | 
man       | help     |
apropos   | help     |
info      | help     |
tty       | terminal |
tput      | terminal |
stty      | terminal |
declare   | vars     | builtin
unset     | vars     | builtin
readonly  | vars     | builtin
export    | vars     | builtin
printenv  | vars     | print environment variables
env       | vars     | run a program in a modified environment
base32    | stream   | encode/decode data
base64    | stream   | encode/decode data
basenc    | stream   | encode/decode data
cat       | stream   |
tee       | stream   |
sort      | stream   |
uniq      | stream   |
tr        | stream   |
sed       | stream   |
awk       | stream   |
cut       | stream   | remove sections from each line of files
csplit    | stream   | split a file into sections determined by context lines
col       | stream   | filter reverse line feeds from input
fold      | stream   | wrap each input line to fit in specified width
column    | stream   | columnate lists
colrm     | stream   | removes columns from a file
colordiff | stream   | colorize diff output

env
find
nice
nohup
time
xargs

basename
Return non-directory portion of pathname.
cat
Concatenate and print files.
cd
Change working directory.
chgrp
Change file group ownership.
chmod
Change file modes.
chown
Change file ownership.
cksum
Write file checksums and sizes.
cmp
Compare two files.
cp
Copy files.
dd
Convert and copy a file.
df
Report free disk space.
dirname
Return directory portion of pathname.
du
Estimate file space usage.
find
Find files.
ln
Link files.
ls
List directory contents.
mkdir
Make directories.
mv
Move files.
pathchk
Check pathnames.
pwd
Return working directory name.
rm
Remove directory entries.
rmdir
Remove directories.
sh
Shell, the standard command language interpreter.
test
Evaluate expression.
touch
Change file access and modification times.
ulimit
Set or report file size limit.

pathchk (1)          - check whether file names are valid or portable

envsubst (1)         - substitutes environment variables in shell format strings
update-alternatives (1) - maintain symbolic links determining default commands
su (1)               - run a command with substitute user and group ID
dircolors (1)        - color setup for ls
localedef (1)        - compile locale definition files
whoami (1)           - print effective userid
bc (1)               - An arbitrary precision calculator language
column (1)           - columnate lists
col (1)              - filter reverse line feeds from input
colrm (1)            - remove columns from a file
date (1)             - print or set the system date and time
dd (1)               - convert and copy a file
dirname (1)          - strip last component from file name
du (1)               - estimate file space usage
egrep (1)            - print lines that match patterns
echo (1)             - display a line of text
