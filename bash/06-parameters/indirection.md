# Indirection

In bash scripting, indirection can be achived in 2 ways: implicitly and explicitly (these are my arbitrary terms to distinguish between them).

*Implicit indirection* requires no syntactically special step in the initiation phase, but it is required that there is a variable whose value equals another variabe's name. However, the variable expansion phase does require the presence of a variable expansion modifier aka the "bang" character, `!`.

*Explicit indirection* requires an explicit initiation step in declaring a variable with the indirection attribute, `-n`, attached. However, the variable expansion phase demands no additional syntax to retrieve the indirected value. In fact, using the indirection syntax (bang operator) will retrieve the variable's direct value instead.


```bash
key=value

# implicit indirection
# var whose value equals another var's name
ref=key
# on expansion, the ! operator gives its indirect value
echo "${!ref}"
#: value

# explicit indirection
# has an explicit setup step
# the attr -n marks this var as a ref
declare -n ptr=key
# expansion requires no special syntax to access inderect value
echo "$ptr"
#: value

# the special "bang" operator may be used
# to retrieve the ref var's direct value
echo "${!ptr}"
```
