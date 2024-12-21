# vim start

vim +{cmd}  Start vim and execute {cmd}

Pass `-c {cmd}` instead of `+ {cmd}`.

Substitution - within vim:
:%s/needle/replacement/g

```bash
# Substitution
vim +%s/needle/replacement/g haystack.vim
# Substitutions (commands) can be stacked
vim +%s/pancake/bagel/g +%s/bagel/egg/g +%s/egg/donut/g hello.txt

# Open Vim with two vertical windows
vim -O2 file1.txt file2.txt
# open Vim with two horizontal windows
vim -o2 file1.txt file2.txt
```

Suspend vim: c-z, :stop, :suspend
