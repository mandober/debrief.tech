# Arrays

```bash
# =============================================================================
# Indexed (-a) arrays
# =============================================================================
# explicit declaration: always a good idea (but not required)
declare -a indexed

# initialization
indexed=('ubuntu 18.04' suse archLinux)

# implicit declaration by initialization
nix=('ubuntu 18.04' suse archLinux)

# any var, free of a few special attributes, may be turned
age=42 age=(1 2 3)

# assignment: compound-assigment
arr=("Bob" "Peter" "$USER" "Big Bad John")

# assignment: compound-assigment with explicit (sparse) indices
arr=([0]="Bob" [1]="Peter" [5]="$USER")

# assignment: one-by-one
declare -a unix
unix+=(mint)
unix+=(ubu)
unix+=(arch)
# unix=([0]="mint" [1]="ubu" [2]="arch")


# assigning new elements one-by-one, alternative init
nix=cent
nix+=(suse)
# nix=([0]="cent" [1]="suse")

# forgetting the parens means appending to THE FIRST ELEMENT
nix+=os
# nix=([0]="centos" [1]="suse")
# because no subscript is the same as 0th subscript
echo "$nix === ${nix[0]}"


# assignment: one-by-one (no dollar sigil)
nums[0]=zero
nums[1]=one
nums[2]=two
nums[3]=three



# =============================================================================
# Associative (-A) arrays
# =============================================================================
# explicit declaration: always required
declare -A associative


## Indexed Arrays

Creation

# explicit indexed (-a) array declaration
    declare -a ARRAY

# Compound assigment:
    ARRAY=("Bob" "Peter" "$USER" "Big Bad John")

# Compound assigment with explicit indexes: 
    ARRAY=([0]="Bob" [1]="Peter" [5]="$USER")

# Automatically if any variable gets assigned to using array syntax:
    var[index]="val"

# Referenced using integers (including arithmetic expressions)
    echo $ARR[(7+4)]

# dump array values
    printf "%s\n" "${ARRAY[@]}"

# dump array keys
    printf "%s\n" "${!ARRAY[@]}"

# array of filenames is simply created using globs:
    FilesArray=(*)
    FilesArray=(*.jpg)


## Associative Arrays

# Creating

# must be explicitly declared using the declare builtin: 
    declare -A name

# The subscript context within brackets is an arithmetic context that must 
# evaluate to a number; VARS ARE EXPANDED EVEN WITHOUT THE DOLLAR SIGIL.

    idx=2 echo ${arr[idx]}
# or
    idx=2; echo ${arr[idx]}
# or
    idx=2 && echo ${arr[idx]}


# Unless otherwise noted, indexed array indices must be non-negative integers.

# ASSOCIATIVE ARRAYS are referenced using arbitrary strings.
    declare -A ASS=( ["Bob"]="Bob Billemont" ["cat"]="Kitty Catty" )

# Attributes may be specified for an array variable using `declare` and `readonly` builtins; each attribute applies to all members of an array.

# Arrays are assigned to using compound assignments of the form:
    arr=(value1 ... valuen)

# where each value is of the form [subscript]=string


# Indexed array assignments do not require anything but string *wrong*
# When assigning to indexed arrays, if the optional brackets and subscript are supplied, that index is assigned to; otherwise the index of the element assigned is the last index assigned to by the statement plus one.
    Unix=(Debian Ubuntu)
    Unix[]=Mint            # NO!

# Unix is now
    Unix=(Mint Ubuntu)
# not
    Unix=(Debian Ubuntu Mint)


# New element won't be assigned to next available index, but to 0th. When assigning to indexed arrays, if brackets and subscript are not supplied, it is the same as assigning to first element at index 0.

# Expicit:
    declare -a unix
    unix+=(mint)
    unix+=(ubu)
    unix+=(arch)
    #:: unix=([0]="mint" [1]="ubu" [2]="arch")

# Alternative:
    nix=suse
    nix+=(cent)
    #:: nix=([0]="suse" [1]="cent")



# The `-n` attribute of `declare` cannot be applied to array-vars:
    # declare -an ARR  # ERROR!

# nameref-vars may be used to reference array-vars:
    fx()
    {
        declare -n arr="$1"
        echo "${arr[1]}"
        #: charlie
    }
    alpha=(bravo charlie delta)
    fx alpha
```



- When assigning to an ASSOCIATIVE ARRAY, the subscript is required
- This syntax is also accepted by the declare builtin
- Individual elements may be assigned to using `name[subscript]=value`
- When assigning to an INDEXED ARRAY, if name is subscripted by a negative number, that number is interpreted as relative to one greater than the largest index of name, so negative indices count back from the end of the array, and an index of -1 references the last element.

- Any element of an array may be referenced using `${name[subscript]}`
- The braces are required to avoid conflicts with pathname expansion.
- If subscript is `@` or `*`, the word expands to all members of name
- These subscripts differ only within double quotes:
  - `"${name[@]}"` expands to each element of array as a separate word
  - `"${name[*]}"` expands to a single word with IFS separated elements


- When there are no array members, `${name[@]}` expands to nothing
- If the double-quoted expansion occurs within a word, the expansion of the first parameter is joined with the beginning part of the original word, and the expansion of the last parameter is joined with the last part of the original word. This is analogous to expansion of the special parameters `*` and `@`
- Referencing an array variable without a subscript is equivalent to referencing the array with a subscript of 0.
- If the subscript used to reference an element of an INDEXED ARRAY evaluates to a number less than zero, it is interpreted as relative to one greater than the maximum index of the array
- so negative indices count back from the end of the array
- an index of -1 references the last element
- array variable is considered set if a subscript has been assigned a value
- The null string is a valid value.


### Length

- The `${#name[2]}` expands to the length of characters of the 3rd element
- If subscript is `*` or `@`, expansion is the number of elements in the array


### Keys

to obtain the keys (indices) of an array:
    ${!name[@]}
or
    ${!name[*]}

The treatment when in double quotes is similar to the expansion of the special parameters `@` and `*` within double quotes.


## Unset

destroys the array element at index subscript
    unset name[subscript]

The unset builtin is used to destroy arrays
* Negative subscripts to INDEXED ARRAYS are interpreted as described above. 
* Care must be taken to avoid unwanted side effects caused by pathname expansion. unset NAME, where NAME is an ARRAY, or `unset name[subscript]`, where subscript is `*` or `@`, removes the entire array.


Builtins
* The declare, local, and readonly builtins each accept -a option to specify an INDEXED ARRAY
  and -A option to specify an ASSOCIATIVE ARRAY. If both options are supplied, -A takes precedence. 
* The read builtin accepts -a option to assign a list of words read from the standard input to an array. 
* The set and declare builtins display array values in a way that allows them to be reused as assignments.
* The mapfile/readarray builtin can read lines from the standard input into the INDEXED ARRAY variable array. 
