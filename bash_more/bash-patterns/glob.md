shopt: glob

dotglob
extglob
failglob
nullglob
nocaseglob
globstar
globasciiranges


dotglob
If set, bash includes hidden files in the results of pathname expansion.

extglob
If set, the extended pattern matching features are enabled.

failglob
If set, patterns which fail to match filenames during pathname expansion result in an expansion error.

nullglob
If set, patterns which fail to match filenames during pathname expansion result in a null string, rather than themselves.
If set, bash allows patterns which match no files to expand to a null string, rather than themselves.

nocaseglob
If set, bash matches filenames in a case-insensitive fashion when performing pathname expansion.

globstar
If set, the pattern ** used in a pathname expansion context will match all files and zero or more 
directories and subdirectories. If the pattern is followed by a /, only directories and subdirectories match.

globasciiranges
If set, range expressions used in pattern matching bracket expressions behave as if in the traditional 
C locale when performing comparisons. That is, current locale's collating sequence (LC_COLLATE, LC_CTYPE) is not taken into account,
so b will not collate between A and B, and upper-case and lower-case ASCII characters will collate together.

