Loops


if

if list; then list; [ elif list; then list; ] ... [ else list; ] fi

The if list is executed. If its exit status is zero, the then list is executed. Otherwise, each elif list is executed in turn, and if its exit
status is zero, the corresponding then list is executed and the command completes. Otherwise, the else list is executed, if present. The exit
status is the exit status of the last command executed, or zero if no condition tested true.


while | until

while list-1; do list-2; done
until list-1; do list-2; done

The while command continuously executes the list list-2 as long as the last command in the list list-1 returns an exit status of zero. 
The until command is identical to the while command, except that the test is negated; 
list-2 is executed as long as the last command in list-1 returns a non-zero exit status. 
EXIT STATUS of the while and until commands is the exit status of the last command executed in list-2, or zero if none was executed.


select

select name [ in word ] ; do list ; done

The list of words following in is expanded, generating a list of items. 
The set of expanded words is printed on the standard error, each preceded by a number. 
If the in word is omitted, the positional parameters are printed. 
The PS3 prompt is then displayed and a line read from the standard input. 

* If the line consists of a number corresponding to one of the displayed words, then the value of name is set to that word. 
* If the line is empty, the words and prompt are displayed again. 
* If EOF is read, the command completes. 
* Any other value read causes name to be set to null. 

The line read is saved in the variable REPLY. 
The list is executed after each selection until a break command is executed. 
EXIT STATUS of select is the exit status of the last command executed in list, or zero if no commands were executed.
