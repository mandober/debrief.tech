# stty

Readline provides the rich set of command-line editing capabilities that go far beyond a few primitives provided by the terminal itself or the low-level and early loaded utilities (like `getty`, `login`).

These primitives set the way some important keys on the keyboard work, like the `DEL` key that should delete one character before the cursor, and the `BS` key which should delete oen character after the cursor.


The `stty` utility can be used to configure many details regarding the low-level behavior of the terminal, along with the definition of these key sequences that are always valid - in all applications and environments.

Table of the `stty -a` output regarading keyseq:

sttykeys | stty     | desc
---------|----------|------------------------
^\       | quit     | 
^?       | erase    | 
^C       | intr     | 
^D       | eof      | 
^O       | discard  | 
^Q       | start    | 
^R       | rprnt    | 
^S       | stop     | 
^U       | kill     | 
^V       | lnext    | 
^W       | werase   | 
^Z       | susp     | 
<undef>  | eol      | 
<undef>  | eol2     | 
<undef>  | swtch    | 


- *lnext*, `c-v`
This command means *l*iteral *next*, and by default the keyseq `c-v` is assigned to it. Thus, pressing `Ctrl+V` instructs the terminal that the next typed key or keysequance is to be interpreted literally. This has no effect with letter keys, but makes a difference with special keys and key combos. For example, pressing the `Enter` key on the command-line submits the line, but if we first type `c-v` and then press `Enter`, the output is shown as `^M`, which is the caret encoding of that key. Similarly, presing `TAB` on the command line usually shows completions, but pressing the TAB key after `c-v` shows `^I`.
