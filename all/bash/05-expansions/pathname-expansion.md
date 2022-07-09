 bash | manual

Pathname Expansion


After word splitting, unless the set -f option has been set, 
bash scans each word for the characters *, ?, and [. 

If one of these characters appears, then the word is regarded as a pattern, 
and replaced with an alphabetically sorted list of filenames matching the pattern. 

* If no matching filenames are found, and the shell option nullglob is not enabled, the word is left unchanged. 
* If the nullglob option is set, and no matches are found, the word is removed. 
* If the failglob shell option is set, and no matches are found, an error message is printed and the command is not executed. 
* If the shell option nocaseglob is enabled, the match is performed without regard to the case of alphabetic characters. 
* When a pattern is used for pathname expansion, the character `.' at the start 
  of a name or immediately following a slash must be matched explicitly, unless the shell option dotglob is set. 
* When matching a pathname, the slash character must always be matched explicitly. 
  In other cases, the `.' character is not treated specially.  
  See the description of shopt for a description of the nocaseglob, nullglob, failglob, and dotglob shell options.
* If completion_strip_exe is set, whenever bash sees `foo.exe' during completion, 
  it checks if `foo' is the same file and strips the suffix.

The GLOBIGNORE shell variable may be used to restrict the set of filenames matching a pattern. 
If GLOBIGNORE is set, each matching filename that also matches one of the patterns in GLOBIGNORE 
is removed from the list of matches. 

The filenames `.' and `..' are always ignored when GLOBIGNORE is set and not null. 
However, setting GLOBIGNORE to a non-null value has the effect of enabling the dotglob shell option, 
so all other filenames beginning with a `.'  will match. 
To get the old behavior of ignoring filenames beginning with a `.', make `.*' one of the patterns in GLOBIGNORE. 
The dotglob option is disabled when GLOBIGNORE is unset.