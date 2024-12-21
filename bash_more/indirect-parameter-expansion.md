# Indirect parameter expansion in bash

If the first character of PARAM is an exclamation point, Bash uses the value of the variable formed from the rest of PARAM as the name of the variable; this variable is then expanded and that value is used in the rest of the substitution, rather than the value of PARAM itself. This is called *indirect expansion*.

Indirect parameter expansion only expands the names of variables, not their values.

```bash
my1=uno
my2=dos
my3=tres
echo ${!my*}
#› my1 my2 my3

echo ${!my@}
#› my1 my2 my3

# this only changes the last variable:
export ${!my*}="trois"
echo $my1 #› uno
echo $my2 #› dos
echo $my3 #› trois

my4=quattor
export ${!my@}="fire"
echo $my4 #› fire
```
