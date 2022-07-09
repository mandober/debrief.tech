glob

EXECIGNORE
GLOBIGNORE



EXECIGNORE
A colon-separated list of extended glob patterns. Files with full paths matching one of these patterns are not considered 
executable for the purposes of completion and PATH searching, but the [, [[, and test builtins are not affected. 
Use this variable to deal with systems that set the executable bit on files that are not actually executable.


GLOBIGNORE
A colon-separated list of patterns defining the set of filenames to be ignored by pathname expansion. 
If a filename matched by a pathname expansion pattern also matches one 
of the patterns in GLOBIGNORE, it is removed from the list of matches.


