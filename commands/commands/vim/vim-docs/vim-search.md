# vim search

- `:edit {file}`        Edit file
- accepts wildcards arguments (`*`)
- accepts <Tab> completion
- `:edit *.yml<Tab>`    List of Yaml files in cwd to choose from
- `:edit **/*.md<Tab>`  List of MD files in cwd, recursively
- `:edit .`             Browse fs tree with cwd as root (in netrw or NERDTree)

The difference is that `:find` finds file in path, `:edit` doesn't.
To check paths use `:set path?`. By default, it is `path=.,/usr/include,,`.
- `,` means to search in cwd
- `.` means to search in dir of currently opened file

:\c{term}  search for term case-insensitive
:\C{term}  search for term case-sensitive
:\/\*\*    search for pattern `/**`
:\<term\>  search for term (as a single word, not as part of a bigger word)

:set hlsearch     search highlight
:set nohlsearch   search no highlight
:noh[l]           search no highlight
:noincsearch      search no incremental search hl

q/                list and edit search forward history
q?                list and edit search backward history
q:                list and edit command history

:1,7/needle                search in range
:1,7s/needle/replace       search and replace (`s`) in range
:%s/needle/replace         search and replace in entire buffer (`%`)
:%s/needle/replace/g       search and replace in entire buffer, `g` flag
:%s/needle/replace/gi      search and replace, case-insensitive, `i` flag
:%s/needle/replace/gI      search and replace, case-sensitive, `I` flag

flags
  g    all occurrences
  i    case-insensitive
  I    case-sensitive
  c    confirm each replacement (y/n/a/q/l/^E/^Y)
       y - yes for this occurrence (continues)
       n - no for this occurrence (continues)
       a - yes to all from here on out
       q - quit
       l - last change, i.e. shortcut for 'yes' then 'quit'
      ^E - scroll by line up
      ^Y - scroll by line down
