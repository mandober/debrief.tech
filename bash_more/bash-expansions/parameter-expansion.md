# Parameter Expansion


$parameter
* The $ character introduces parameter expansion, command substitution, or arithmetic expansion. 

${parameter}
* The parameter name or symbol to be expanded may be enclosed in braces, which are optional but serve to protect the variable 
  to be expanded from characters immediately following it which  could be interpreted as part of the name. Eg: ${tree}s
* When braces are used, the matching ending brace is the first closing brace that is:
  - not escaped by a backslash 
  - not within a quoted string
  - not within embedded: 
    * arithmetic expansion
    * command substitution
    * parameter expansion
* The braces are required:
  - when parameter is a positional parameter with more than one digit,  ${12}
  - when parameter is followed by a character which is not to be interpreted as part of its name.  ${tree}s
* The parameter is a shell parameter (as described previously in PARAMETERS) or an array reference (see Arrays).


Indirect expansion

${!parameter}
If the first character of parameter is an exclamation point (!), it introduces a level of variable indirection.
Bash uses the value of the variable formed from the rest of parameter as the name of the variable; 
this variable is then expanded and that value is used in the rest of the substitution, rather than the value of parameter itself.
This is known as indirect expansion.
* The exceptions to this are the expansions of ${!prefix*} and ${!name[@]} described below. 
* The exclamation point must immediately follow the left brace in order to introduce indirection.


Variable Substitution

In each of the cases below, word is subject to: tilde expansion, parameter expansion, command substitution, and arithmetic expansion.

When not performing substring expansion, using the forms documented below (e.g., :-), 
bash tests for a parameter that is unset or null (is set and not null). 	 ${par:-sub}
Omitting the colon results in a test only for a parameter that is unset. 	 ${par-sub}


Use default value  (parametar or default)
The value of parameter is substituted if parameter
${parameter:-word} is set (but can be null)
${parameter-word}  is (set and) not null
Otherwise, the expansion of word is substituted.


Assign default value (parametar or default with assignment)
If parameter is
${parameter:=word} unset or null
${parameter=word}  unset
the expansion of word is assigned to parameter.
The value of parameter is then substituted.
* Positional parameters and special parameters may not be assigned to in this way.


Display error  (parametar or error)
The value of parameter is substituted if parameter
${parameter:?word} is set and not null
${parameter?word}  is set
Otherwise, print word as error message to sterr and exit (if not interactive). 
If word isn't supplied, print the phrase: parameter null or not set.


Use alternate value  (alt or nothing)
The value of parameter is substituted if parameter
${parameter:+word} is set (but can be null)
${parameter+word}  is (set and) not null
Otherwise, the expansion of word is substituted.


 parameter
Set and not null
Set but null
Unset
${parameter:-word}
substitute parameter
substitute word
substitute word
${parameter-word}
substitute parameter
substitute parameter (null)
substitute word
${parameter:=word}
substitute parameter
assign word
assign word
${parameter=word}
substitute parameter
substitute parameter (null)
assign word
${parameter:?word}
substitute parameter
error, exit
error, exit
${parameter?word}
substitute parameter
substitute parameter (null)
error, exit
${parameter:+word}
substitute word
substitute parameter (null)
substitute parameter (null)
${parameter+word}
substitute word
substitute word
substitute parameter (null)
In all cases shown with "substitute", the expression is replaced with the value shown.
In all cases shown with "assign", parameter is assigned that value, which also replaces the expression.
http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_05


Use alternate value  (alt or nothing):

λ				λ p=				λ p=yes

λ echo ${p:+word}		λ echo ${p:+word}		λ echo ${p:+word}
<nothing>			<nothing>			word

λ echo ${p+word}		λ echo ${p+word}		λ echo ${p+word}
<nothing>			word				word




Substring expansion

${parameter:offset:length}

* Expands to up to length characters of the value of parameter, starting at the character specified by offset.
  str='abcdefghijk'; echo ${str:3:2}

- [arrays] If parameter is @, an indexed array subscripted by @ or *, or an associative array name, the results differ as described below. 
- Note that a negative offset must be separated from the colon by at least one space to avoid being confused with the :- expansion. *
- length and offset are arithmetic expressions.

* If length is omitted, expands to the substring of the value of parameter starting at the character specified 
  by offset and extending to the end of the value.
  str='abcdefghijk'; echo ${str:5}

* If offset evaluates to a negative number, the value is used as an offset
  in characters from the end of the value of parameter.
  str='abcdefghijk'; echo ${str: -5}
  str='abcdefghijk'; echo ${str: -5:2}

* If length evaluates to a negative number, it is interpreted as an offset in characters from the end of 
  the value of parameter rather than a number of characters, and the expansion is the characters between offset and that result.
  str='abcdefghijk'; echo ${str:5:-3}
  str='abcdefghijk'; echo ${str: -5:-3}

* [positionals] If parameter is @
    ${@:offset:length}
  - the result is length positional parameters beginning at offset
  - A negative offset is taken relative to one greater than the number of positionals (the greatest positional parameter), 
    so an offset of -1 evaluates to the last positional parameter.
  - It is an expansion error if length evaluates to a number less than zero.
  - If offset is 0 (and the positional parameters are used) $0 (script name usually) is prefixed to the list.
  - Substring indexing is zero-based unless the positional parameters are used, in which case the indexing starts at 1 by default. 

* [arrays] If parameter is an indexed array name subscripted by @ or *
  ${array[@]:offset:length}
  - the result is the length members of the array beginning with offset
  - A negative offset is taken relative to one greater than the maximum index of the specified array. 
  * It is an expansion error if length evaluates to a number less than zero.
  * Substring expansion applied to an associative array produces undefined results.
  fruit=( apple pear orange )
  echo ${array[@]:0:1} -> apple
  echo ${array[0]:0} -> apple
  echo ${array[0]} -> apple
  echo ${array:0} -> apple
  echo $array -> apple

** Substring indexing is zero-based unless the positional parameters are used, in which case the indexing starts at 1 by default. 



Names matching prefix


${!prefix*}
${!prefix@}

Expands to the names of variables whose names begin with prefix, 
separated by the first character of the IFS special variable.
echo ${!BASH*}
BASH BASHOPTS BASHPID BASH_ALIASES BASH_ARGC BASH_ARGV BASH_CMDS BASH_COMMAND BASH_COMPLETION...

[positionals]  
When @ is used and the expansion appears within double quotes, each variable name expands to a separate word.
echo "${!@}"



List of array keys

${!name[@]}
${!name[*]}
If name is an array variable, expands to the list of array indices (keys) assigned in name. 
If name is not an array, expands to 0 if name is set and null otherwise. 
When @ is used and the expansion appears within double quotes, each key expands to a separate word.


Parameter length

${#parameter}
The length in characters of the value of parameter is substituted.
* If parameter is * or @, the value substituted is the number of positional parameters.
* If parameter is an array name subscripted by * or @, the value substituted is the number of elements in the array.
* If parameter is an indexed array name subscripted by a negative number, that number is interpreted 
  as relative to one greater than the maximum index of parameter, so negative indices count back from 
  the end of the array, and an index of -1 references the last element.


Remove matching prefix pattern

${parameter#word}
${parameter##word}
The word is expanded to produce a pattern just as in pathname expansion. 
* If the pattern matches the beginning of the value of parameter, then the result of the 
  expansion is the expanded value of parameter with the shortest matching pattern (the # case) 
  or the longest matching pattern (the ## case) deleted.
* If parameter is @ or *, the pattern removal operation is applied to 
  each positional parameter in turn, and the expansion is the resultant list. 
* If parameter is an array variable subscripted with @ or *, the pattern removal operation is 
  applied to each member of the array in turn, and the expansion is the resultant list.


Remove matching suffix pattern

${parameter%word}
${parameter%%word}
The word is expanded to produce a pattern just as in pathname expansion.
* If the pattern matches a trailing portion of the expanded value of parameter, then the result 
  of the expansion is the expanded value of parameter with the shortest matching pattern (the % case) 
  or the longest matching pattern (the %% case) deleted. 
* If parameter is @ or *, the pattern removal operation is applied to each 
  positional parameter in turn, and the expansion is the resultant list. 
* If parameter is an array variable subscripted with @ or *, the pattern removal operation is applied
  to each member of the array in turn, and the expansion is the resultant list.



Pattern substitution

${parameter/pattern/string}
    The pattern is expanded to produce a pattern just as in pathname expansion. 

${haystack/needle/string}
    Normally only the first match is replaced.

${haystack//needle/string}
    If pattern begins with /, all matches of pattern are replaced with string. Eg: printf '%s' "${PATH//:/$'\n'}"

${haystack/#needle/string}
    If pattern begins with #, it must match at the beginning of the expanded value of parameter. Anchored at the beginning.
  
${haystack/%needle/string}
    If pattern begins with %, it must match at the end of the expanded value of parameter. Anchored at the end.

${haystack/needle}
    If string is null, matches of pattern are deleted and the / following pattern may be omitted.


positionals
  ${@/pattern/string}
  ${*/pattern/string}
  If parameter is @ or *, the substitution operation is applied to each
  positional parameter in turn, and the expansion is the resultant list.


array
  ${array[@]/pattern/string}
  ${array[*]/pattern/string}
  If parameter is an array variable subscripted with @ or *, the substitution operation
  is applied to each member of the array in turn, and the expansion is the resultant list.



Case modification

${parameter^pattern}
${parameter,pattern}
This expansion modifies the case of alphabetic characters in parameter.
The pattern is expanded to produce a pattern just as in pathname expansion.
Each character in the expanded value of parameter is tested against pattern,
and, if it matches the pattern, its case is converted. 
The pattern should not attempt to match more than one character.

${parameter^pattern}
^  operator converts lowercase letters matching pattern to upper‐case;

${parameter,pattern}
,  operator converts matching uppercase letters to lowercase.

   ^  and , expansions match and convert only the first character in the expanded value.

${parameter^^pattern}
${parameter,,pattern}
^^ and ,, expansions convert each matched character in the expanded value;


* If pattern is omitted, it is treated like a ?, which matches every character. 
* If parameter is @ or *, the case modification operation is applied to each positional parameter 
  in turn, and the expansion is the resultant list. 
* If parameter is an array variable subscripted with @ or *, the case modification operation is 
  applied to each member of the array in turn, and the expansion is the resultant list.






bash4.4+

Parameter transformation

${parameter@operator}

The expansion is either a transformation of the value of parameter or information about 
parameter itself, depending on the value of operator. Each operator is a single letter:

Q  The expansion is a string that is the value of parameter quoted in a format that can be reused as input.
   john=lennon; echo ${john@Q}; 			#=> 'lennon'

E  The expansion is a string that is the value of parameter with backslash escape sequences expanded as with the $'...' quoting mechansim.
   john="lennon\tringo"; echo ${john@E}; 		#=> lennon    ringo

P  The expansion is a string that is the result of expanding the value of parameter as if it were a prompt string.
   john="\u \h"; $ echo ${john@P}; 			#=> ivan DRIVAN

A  The expansion is a string in the form of an assignment statement or declare command that, 
   if evaluated, will recreate parameter with its attributes and value.
   declare -l str="RINGO starr"; echo ${str@A}; #=> declare -l str='RINGO starr'

a  The expansion is a string consisting of flag values representing parameter’s attributes.
   declare -ixr int=2001; echo ${int@a}; 		#=> ixr


* If parameter is @ or *, the operation is applied to each positional parameter in turn, and the expansion is the resultant list. 

* If parameter is an array variable subscripted with @ or *, the case modification operation 
  is applied to each member of the array in turn, and the expansion is the resultant list.

* The result of the expansion is subject to word splitting and pathname expansion as described.


