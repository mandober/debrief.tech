# Vim :: Vim modes

s   | mode
----|-----------------------
N   | normal command mode
V   | visual mode
V-L | visual line mode
V-B | visual block mode
I   | insert mode
S   | select mode
O   | operator-pending mode
C   | command (Ex comand) mode
X   | Ex mode
T   | terminal-job mode
P   | paste mode
L   | 
R   | replace mode
    | VIRTUAL REPLACE mode (VREPLACE)
    | INSERT-NORMAL mode
    | TERMINAL-NORMAL mode
    | INSERT-VISUAL mode
    | INSERT-SELECT mode

Mode letters:
n: normal only
v: visual and select
o: operator-pending
x: visual only
s: select only
i: insert
c: command-line
l: insert, commandline, regex-search, … (collectively "Lang-Arg" peudo-mode)

└ ┴ ┘ ┌ ┬ ┐ ├ ┼ ┤ ─ │ ╌ ┄ ┈ ╎ ┆ ┊ ╴ ╵ ╶  ╷ ⟍ ⟋


- `map`   normal, visual, select, operator-pending (nvo)
- `map!`  insert, command-line (ic)

mode-specific commands
- nmap    normal
- imap    insert
- vmap    visual and select
  - xmap    visual only
  - smap    select only
- cmap    command-line
- omap    operator pending


Vim has (at least) 14 modes
- 7 basic modes
- 7 variant modes

Basic modes
1. NORMAL mode
2. INSERT mode
3. VISUAL mode
  - VISUAL-LINE mode
  - VISUAL-BLOCK mode
4. SELECT mode
5. Command-line mode
6. Ex mode
7. TERMINAL-JOB mode

Variant modes
1. Operator-pending mode
2. REPLACE mode
3. VIRTUAL REPLACE mode (VREPLACE)
4. INSERT-NORMAL mode
5. TERMINAL-NORMAL mode
6. INSERT-VISUAL mode
7. INSERT-SELECT mode
