# parameter substitution

${parameter#word}
${parameter##word}

Remove  matching  prefix  pattern.   
The  word  is  expanded to produce a pattern just as in pathname expansion.  
If the pattern matches the beginning of the value of parameter, then the result of the expansion is the expanded value of  parameter  with  the shortest  matching  pattern (the ``#'' case) or the longest matching pattern (the ``##'' case) deleted.

If parameter is @ or *, the pattern removal operation is applied to each positional parameter in turn, and the expansion  is  the  resultant  list.   

If parameter  is an array variable subscripted with @ or *, the pattern removal operation is applied to each member of the array in
turn, and the expansion is the resultant list.

echo ${out[@]##/mnt*}



${parameter%word}
${parameter%%word}
Remove matching suffix pattern.  The word is expanded to produce a pattern just  as  in  pathname  expansion.   If  the  pattern
matches a trailing portion of the expanded value of parameter, then the result of the expansion is the expanded value of parame‐
ter with the shortest matching pattern (the ``%'' case) or the longest matching pattern (the ``%%'' case) deleted.  If parameter
is  @  or  *,  the pattern removal operation is applied to each positional parameter in turn, and the expansion is the resultant
list.  If parameter is an array variable subscripted with @ or *, the pattern removal operation is applied to each member of the
array in turn, and the expansion is the resultant list.

${parameter/pattern/string}
Pattern  substitution.

The  pattern is expanded to produce a pattern just as in pathname expansion.  Parameter is expanded and the longest match of pattern against its value is replaced with string.

If pattern begins with /, all matches  of  pattern  are replaced  with  string.  Normally only the first match is replaced.


If pattern begins with #, it must match at the beginning of
the expanded value of parameter.  

If pattern begins with %, it must match at the end of the expanded  value  of  parameter.   


If string  is  null, matches of pattern are deleted and the / following pattern may be omitted.  

If the nocasematch shell option is enabled, the match is performed without regard to the case of alphabetic characters.  

If parameter is @ or *,  the  substitution operation  is  applied  to each positional parameter in turn, and the expansion is the resultant list. 

If parameter is an array variable subscripted with @ or *, the substitution operation is applied to each member of the array in turn, and  the  expansion
is the resultant list.

echo ${out[@]//mnt*}



${parameter^pattern}
${parameter^^pattern}
${parameter,pattern}
${parameter,,pattern}
Case  modification.  This expansion modifies the case of alphabetic characters in parameter.  The pattern is expanded to produce
a pattern just as in pathname expansion.  Each character in the expanded value of parameter is tested against pattern,  and,  if
it matches the pattern, its case is converted.  The pattern should not attempt to match more than one character.  The ^ operator
converts lowercase letters matching pattern to uppercase; the , operator converts matching uppercase letters to lowercase.   The
^^  and  ,,  expansions  convert each matched character in the expanded value; the ^ and , expansions match and convert only the
first character in the expanded value.  If pattern is omitted, it is treated like a ?, which matches every character.  If param‐
eter is @ or *, the case modification operation is applied to each positional parameter in turn, and the expansion is the resul‐
tant list.  If parameter is an array variable subscripted with @ or *, the case modification operation is applied to each member
of the array in turn, and the expansion is the resultant list.

${parameter@operator}
Parameter  transformation.   The  expansion  is either a transformation of the value of parameter or information about parameter
itself, depending on the value of operator.  Each operator is a single letter:

Q      The expansion is a string that is the value of parameter quoted in a format that can be reused as input.
E      The expansion is a string that is the value of parameter with backslash escape sequences  expanded  as  with  the  $'...'
quoting mechansim.
P      The  expansion  is  a  string  that  is the result of expanding the value of parameter as if it were a prompt string (see
PROMPTING below).
A      The expansion is a string in the form of an assignment statement or declare command that,  if  evaluated,  will  recreate
parameter with its attributes and value.
a      The expansion is a string consisting of flag values representing parameter's attributes.

If  parameter is @ or *, the operation is applied to each positional parameter in turn, and the expansion is the resultant list.
If parameter is an array variable subscripted with @ or *, the case modification operation is applied  to  each  member  of  the
array in turn, and the expansion is the resultant list.

The result of the expansion is subject to word splitting and pathname expansion as described below.

