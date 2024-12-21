# Shell :: Concepts :: Globbing

https://code.visualstudio.com/docs/editor/glob-patterns

Shell globbing syntax is similar to the syntax of regular expressions.

Globbing is a *generative operation* that produces a list of file system items (files, dirs).

A canonical example of globbing is listing all files in the current directory that have the suffix ".txt": `ls *.txt`. Importantly, this shows that the globbing pattern (here the star, `*`), must appear unquoted to be interpreted as a glob (a part of the globbing syntax).

Globbing is a simpler version of regular expression pattern matching. Everything that globbing can do, can also be done using regexes.

Globbing is mainly used on the command line with its primary purpose being the production of lists of file system items that match some pattern. 

The file system is logically a hierarchy of directories since directories may be nested in other directories. The root node of this hierarchy is designated as `/`. A directory named `a` located in the root has the path name `/a` or `/a/`, where the trailing slash helps to make it clear that it is a directory (and not a regular, or some other, kind of file). So, the absolute path of any non-root dir begins with a slash and ends with a slash. This is what makes `/` strange because it neither denotes the begining nor the ending slash; or maybe it denotes both.



This may be interpreted as the start of an absolute path since the *absolute paths* always begin with `/`, 



the components of a path are directories, which are separated by a symbol when a path is presented as a pathname.





## Glob pattern syntax

- `/` path segment separator
- `*` matches zero or more characters in a path segment
- `?` to match on one character in a path segment
- `**` to match any number of path segments, including none
- `{}` to group conditions (for example {**/*.html,**/*.txt} matches all HTML and text files)
- `[]` to declare a range of characters to match (example.[0-9] to match on example.0, example.1, …)
- `[!...]` to negate a range of characters to match (example.[!0-9] to match on example.a, example.b, but not example.0)
