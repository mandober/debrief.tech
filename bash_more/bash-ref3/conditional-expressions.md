# Conditional Expression


## files
-e file	does file exists
-f file	regular file
-d file	directory
-h file	symlink
-L file	symLink
-p file	named pipe (FIFO)
-b file	block special file
-c file	character special file
-S file	Socket
-t FD	  FD is open and refers to a terminal



## variables
-R variable		True if the variable is name Reference
                  Test w/o $
-v variable		True if the variable is set
                  (but can be null). Test w/o $
                  [[ -v BING_FLAGS ]] && echo 0

## strings
-z string		True if the length of string is zero
-n string		True if the length of string is not zero
                  (this is default test operation)
                  [[ -n MSYSTEM ]] && echo 1


## files
-g file	file with its set-group-id set
-k file	its sticky bit is set
-u file	its set-user-id bit is set

-r file	file is readable
-w file	file is writable
-x file	file is executable
-s file	file size is not 0

-N file	file has been modified since it was last read
-G file	file is owned by the effective GROUP ID
-O file	file is owned by the effective USER ID (OWNER)


file1 -ef file2		True if file1 is equal to file2
				(if they refer to the same device and inode numbers)

file1 -nt file2		True if file1 is newer than file2 (modify date)
				or if file1 exists and file2 does not

file1 -ot file2		True if file1 is older than file2
				or if file2 exists and file1 does not

## shopt

-o OPTION 	shell option OPTION is enabled. These are set (not shopt) options


## strings
str1 == str2	True if the strings are equal. (= should be used instead of == with the test command for POSIX conformance)
str1 = str2	      When used with the [[ command, this performs pattern matching.
str1 != str2	True if the strings are not equal.
str1 < str2 	True if str1 sorts before str2 lexicographically.
str1 > str2	      True if str1 sorts after str2 lexicographically.


## numbers
arg1 OPERATOR arg2   
where OPERATOR is one of -eq, -ne, -lt, -le, -gt, or -ge

num1 -eq num2     equal to
num1 -ne num2     not equal to
num1 -lt num2     less than
num1 -le num2     less than or equal to
num1 -gt num2     greater than
num1 -ge num2     greater than or equal to

These arithmetic binary operators return true if arg1 is equal to, not equal to, less than, 
less than or equal to, greater than, or greater than or equal to arg2, respectively. 
arg1 and arg2 may be positive or negative integers.


## conditional expression

[[ expression ]]

Return a status of 0 or 1 depending on the evaluation of the conditional expression. Expressions are composed of the primaries.

* Word splitting and pathname expansion are not performed on the words between the [[ and ]]
  Tilde expansion, parameter and variable expansion, arithmetic expansion, command substitution, 
  process substitution, and quote removal are all performed.
* Conditional operators such as -f must be unquoted to be recognized as primaries.
* When used with [[, the < and > operators sort lexicographically using the current locale.

* When the == and != operators are used, the string to the right of the operator is considered a pattern and
  matched according to the rules described below under Pattern Matching, as if the extglob shell option were enabled.
  
  The = operator is equivalent to ==. If the shell option nocasematch is enabled, 
  the match is performed without regard to the case of alphabetic characters. 

  The return value is 0 if the string matches (==) or does not match (!=) the pattern, and 1 otherwise. 
  Any part of the pattern may be quoted to force the quoted portion to be matched as a string.


Conditional expressions are used by the [[ compound command and the test and [ builtin 
commands to test file attributes and perform string and arithmetic comparisons.
Expressions are formed from the following unary or binary primaries:
* If any file argument to one of the primaries is of the form /dev/fd/n, then file descriptor n is checked. 
* If the file argument to one of the primaries is one of /dev/stdin, /dev/stdout, or /dev/stderr,
  file descriptor 0, 1, or 2, respectively, is checked.
* Unless otherwise specified, primaries that operate on files follow symbolic links and 
  operate on the target of the link, rather than the link itself.
* When used with [[, the < and > operators sort lexicographically using the current locale. 
  The test command sorts using ASCII ordering.
