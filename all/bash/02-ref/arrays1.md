# Arrays

## Indexed Arrays: Initialization

```bash
# explicit array init: declare an indexed array (option -a)
# (always good to tell bash that a var is to be trated as array)
declare -a linux

# later, or on the same line, assign to the array
linux=(ubuntu arch alpine)

# implicit array init: kidnap almost any var and trat it as an array
age=42
age=(66 76 83)


# compound assigment:
linux=()


# with automatic index assignment:
linux=("Mint Linux" "Ubuntu" "Arch")

# with explicit index assignment:
linux=([0]="Mint" [1]="Ubuntu" [2]="Arch")

escapes=( "\\a" "\\b" "\\c" "\\e" "\\E" "\\f" "\\n" "\\r" "\\t" "\\v")
num=(9 9 5 8 9 2 7 1 4 7 3 1 6 1)
abc=( a A aA AA Aa AaA aaA aAa )

# Automatically when a variable gets assigned to using array syntax:
linux[0]="SuSe"

# read builtin:
read -a linux <<< Mint Ubuntu ArchLinux

# mapfile/readarray builtin:
mapfile -O 5 linux <<< Mint Ubuntu ArchLinux

# where assignment starts from index 5 (-O origin)
```

### Associative Arrays: Initialization

Explicitly: declare -A unix
with immediate assignment: declare -A unix=([mint]="MintLinux" [ubu]="Ubuntu" [arch]="ArchLinux")



REFERENCING

indexed arrays

single element - index subscripts: echo ${linux[0]} -> Mint
referencing an array itself is like referencing element with index 0 if it exists: echo $linux -> Mint (or nothing if no index 0)
multiple elements - referenced using substring expansion: ${parameter:offset:length}
echo ${lin[@]:0:1}  -> Mint
echo ${lin[@]:0:2}  -> Mint Ubuntu
* but when referencing an index substring expansion is done on that element's value:
  echo ${lin[0]:0} same as ${lin:0}  -> Mint
  echo ${lin[0]:0:2}  -> Mi
whole array - with subscripts @ or *: echo ${linux[@]} -> Mint Ubuntu ArchLinux


ASSOCIATIVE ARRAYS

single elements by key: echo ${unix[mint]} -> MintLinux
whole array with @ or *: echo ${unix[@]} -> MintLinux Ubuntu ArchLinux



assignment

indexed arrays

assigning to explicit index: linux[4]="PuppyLinux"
will work unless that index is already occupied in which case the new value will replace the old
using only array name: linux="SuSe"
the value will always be assigned to index 0
usign += syntax: linux+=(Mandriva)
with compound asignment will assign the value to the biggest index plus one
without compund statement: linux+=Mandriva
will just append the value to index 0
${linux[0]}=SuSe; linux+=Mandriva; echo ${linux[0]} -> SuSeMandriva


ASSOCIATIVE ARRAYS
When assigning to an associative array, the subscript is required
unix[mand]=Mandriva




http://mywiki.wooledge.org/BashGuide/Arrays 

indexed arrayS
* Explicitly: declare -a ARRAY
* Compound assigment: ARRAY=("Bob" "Peter" "$USER" "Big Bad John")
  Compound assigment by specifiying explicit indexes: ARRAY=([0]="Bob" [1]="Peter" [2]="$USER")
* Automatically if any variable gets assigned to using array syntax: var[0]="val"

- array with unordered indexes is sparse array: ARRAY=([0]="Bob" [5]="Peter")
- dump an array: printf "%s\n" "${ARRAY[@]}"
- dump its indexes only: printf "%s\n" "${!ARRAY[@]}"
- array of filenames is simply created using 1st char of IFS
  FilesArray=(*); FilesArray=(*.jpg)

REFRENCE THE ELEMENTS
unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux')
echo ${unix[2]} -> 'Ubuntu'
echo $unix	-> 'Debian'   echo $unix[illigal] -> 'Debian'   echo $unix[0] -> 'Debian'

ADD ELEMENTS
Unix[]='Mint'
Unix=("${Unix[@]}" "AIX" "HP-UX")


ASSOCIATIVE ARRAYS
declare -A ARRAY
declare -A robert=( ["name"]="Bob" ["username"]="$USER" ["job"]="Plumer" )
declare -A boy=( ["name"]="robert" ["nick"]="boy" ["boy"]="banker" ["sex"]="male" )


number of elements
${#ARRAY[@]}

Copying an Array
# with eval
eval "arrcopy=( \"\${$arr[@]}\" )"
# or
unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux')
linux=("${unix[@]}")

offset and length
${ARRAY[@]:n:m}
extract 2 elements starting from the position 3 from an array called Unix.
unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux')
echo ${Unix[@]:3:2}
-> Suse Fedora


Search and Replace
${ARRAY[@]/PATTERN/REPLACEMENT}
The following example, searches for Ubuntu in an array elements, 
and replace the same with the word `SCO Unix'.
unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux')
echo ${unix[@]/Ubuntu/SCO Unix}  will not touch actual array

NULL an Element from an Array
✗ unset is used to remove an element from an array.
✗ unset will have the same effect as assigning null to an element, but the element will still exist
✗ unset unix[3]; echo unix[3] -> null
✔ assigning null to an element only works (for me at least on bash4.3@cygwin)
✔ unix[3]=; echo unix[3] -> null


REMOVE an Element from an Array
with help of offset
unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux')
pos=3
unix=(${unix[@]:0:$pos} ${unix[@]:$(($pos + 1))})
${Unix[@]:0:$pos} will give you 3 elements starting from 0th index (i.e 0,1,2) and 
${Unix[@]:4} 	  will give the elements from 4th index to the last index. 
Than both are merged, in subcommand (in a subshell)
echo ${Unix[@]}  -> Debian Red hat Ubuntu Fedora UTS OpenLinux
OR via pattern
declare -a Unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora')
declare -a Linux=( ${Unix[@]/Red*/} )
echo ${Linux[@]} -> Debian Ubuntu Suse Fedora

ITERATE
Unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux')
for index in "${!Unix[@]}"; do printf "%4d: %s\n" $index "${Unix[$index]}"; done
