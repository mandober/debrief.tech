# mapfile/readarray

```
mapfile
  [-d delim]              DELIM instead of newline
  [-n count]              Num of lines to copy. n=0 copy all lines
  [-O origin]             Start index
  [-s count]              Discard first COUNT lines read
  [-t]                    Trim trailing DELIM (newline) from each line
  [-u fd]                 FD instead of stdin
  [-C callback]           Call callback with next index and read line
  [-c quantum]            Call callback every QUANTUM:-5000 lines
  ARRAY_NAME:-MAPFILE     Name of indexed array
```

- Read lines from *stdin* into an indexed array ARRAY:-MAPFILE
- supply name for indexed ARRAY or keep default *MAPFILE*
- if ORIGIN skipped, array is cleared before the assignment begins

CALLBACK function is given
- the index of the next array element
- the next line to be assigned

RETURN STATUS will be success unless 
- an invalid option or option argument is supplied
- array is invalid or unassignable
- if array is not an indexed array
