# bash keywords: case

```
case WORD in [ [(] PAT [ | PAT ] ... ) LIST ;; ] ... esac

case WORD in
  ( PAT ) LIST ;&
    PAT ) LIST ;;&&
    PAT | PAT ) LIST ;;
esac
```

A case command first expands word, and tries to match it against each pattern in turn, using the same matching rules as for pathname expansion.

The word is expanded using tilde expansion, parameter and variable expansion, arithmetic substitution, command substitution, process substitution and quote removal.

Each pattern examined is expanded using tilde expansion, parameter and variable expansion, arithmetic substitution, command substitution, and process substitution.

If the shell option nocasematch is enabled, the match is performed without regard to the case of alphabetic characters. When a match is found, the corresponding list is executed.

* `;;`  The case statement ends
* `;&`  Executes the next case list, without performing the associated test
* `;;&` Tests the next pattern (if any), executing the list on match

Exit Status:
- 0: no pattern matches
- `$?`: otherwise, forwards the exit status of the last command


case

case: case WORD in [PATTERN [| PATTERN]...) COMMANDS ;;]... esac

Execute commands based on pattern matching.

Selectively execute COMMANDS based upon WORD matching PATTERN.

|    is used to separate multiple patterns
;;   terminator after each statement
;;&  terminator continues to the next pattern test
;&   terminator executes the next statement


- quoting var in pattern is not mandatory, since word splitting is skipped
- no need for break statement; in fact `;;` is a kind of break
- PATTERN permits char ranges or POSIX classes, e.g. `[![:upper:]]`

Exit Status: Returns the status of the last command executed.


Example:

case WORD in
	PATTERN)
		COMMANDS
		;;
	"Y*"|"yes")
		COMMAND;
		COMMAND;;
	 [a-zA-Z]*) command;;
	 [a-g]) 
		command
		;;
esac

case "$keypress" in
  [[:lower:]]   ) echo "Lowercase letter";;
  [[:upper:]]   ) echo "Uppercase letter";;
  [0-9]         ) echo "Digit";;
  *             ) echo "Other";;
esac


case $# in
	
	0)
	
	;;
	
	1)
	
	;;
	
	2)
	
	;;
	
	3)
	
	;;
	
	4)
	
	;;
	
	*)
	
	;;
esac
