# 3.2.1 Reserved words

https://www.gnu.org/software/bash/manual/html_node/Reserved-Words.html

**Reserved words** are *shell words* that have special meaning to the shell.



They are used to begin and end the shell's compound commands.

The following words are recognized as reserved when unquoted and the first word of a command (see below for exceptions):

if
then
elif
else
fi
time
for
in
until
while
do
done
case
esac
coproc
select
function
{
}
[[
]]
!

in is recognized as a reserved word if it is the third word of a case or select command. in and do are recognized as reserved words if they are the third word in a for command.
