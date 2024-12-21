# Summarize man pages by section

Sections:
- 1, 1p, 1x, 1ssl, 
- 2, 
- 3, 3t, 3am, 3pm, 3perl, 3readline, 
- 4, 
- 5, 5ssl, 5edit, 
- 6, 
- 7, 7ssl, 7gcc, 7edit, 
- 8, 8postfix



```bash
summarize_man_pages_by_section () {
  find /usr/share/man/man* -type f -exec basename {} \; \
    | sed 's|.*\.\([^.]\+\)\.[^.]\+$|\1|g' \
    | sort | uniq -c | sort -n -r
}
```

- 996 1
- 594 3
- 535 8
- 267 2
- 242 5
- 188 7
- 123 7ssl
-  60 1ssl
-  49 3perl
-  35 3t
-  29 4
-  27 8postfix
-  15 3pm
-  11 3am
-   3 7gcc
-   3 5ssl
-   2 3readline
-   2 1p
-   1 7edit
-   1 6
-   1 5edit
-   1 1x

Sections:
- 1
- 1p
- 1x
- 1ssl
- 2
- 3
- 3t
- 3am
- 3pm
- 3perl
- 3readline
- 4
- 5
- 5ssl
- 5edit
- 6
- 7
- 7ssl
- 7gcc
- 7edit
- 8
- 8postfix
