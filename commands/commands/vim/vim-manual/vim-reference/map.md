# Vim :: Maps

[map.txt](https://vimhelp.org/map.txt.html)

Key mapping, abbreviations and user-defined commands.

## TOC

1. Key mapping
   1.1 MAP COMMANDS
   1.2 Special arguments
   1.3 Mapping and modes
   1.4 Listing mappings
   1.5 Mapping special keys
   1.6 Special characters
   1.7 What keys to map
   1.8 Examples
   1.9 Using mappings
   1.10 Mapping alt-keys
   1.11 Mapping meta-keys
   1.12 Mapping in modifyOtherKeys mode
   1.13 Mapping with Kitty keyboard protocol
   1.14 Mapping an operator
2. Abbreviations
3. Local mappings and functions
4. User-defined commands


## 1. Key mapping

Key mapping is used to change the meaning of typed keys. The most common use
is to define a sequence of commands for a function key.

### 1.1 Map Commands

There are commands to enter new mappings, remove mappings and list mappings. All maping commands accept 2 args {lhs} and {rhs}.

{,n,v,x,s,o,l,i,c,t}        map [!]
{,n,v,x,s,o,l,i,c,t} [nore] map [!]
{,n,v,x,s,o,l,i,c,t}   [un] map [!]


:  map  :  nore map   :  unmap         | NVO Normal, Visual, Select, Operator
:  map! :  nore map!  :  unmap!        | IC  Insert, Command-line
:n map  :n nore map   :n unmap         | N   Normal
:v map  :v nore map   :v unmap         | V   Visual, Select
:x map  :x nore map   :x unmap         | X   Visual
:s map  :s nore map   :s unmap         | S   Select
:o map  :o nore map   :o unmap         | O   Operator
:l map  :i nore map   :i unmap         | L   Lang-Arg, Insert, Command-line
:i map  :l nore map   :l unmap         | I   Insert
:c map  :c nore map   :c unmap         | C   Command-line
:t map  :t nore map   :t unmap         | T   Terminal-Job

`-map  {lhs} {rhs}`
Map the key sequence {lhs} to {rhs} for the modes where the map command applies. The result, including {rhs}, is then further scanned for mappings. This allows for nested and recursive use of mappings. Trailing spaces are included in the {rhs}, because space is a valid Normal mode command.

`-nore-  {lhs} {rhs}`
Disallow mapping of {rhs}, to avoid nested and recursive mappings. When <Plug> appears in the {rhs} this part is always applied even if remapping is disallowed.

`-un-  {lhs}`
Remove the mapping of {lhs} for the modes where the map command applies. The mapping may remain defined for other modes where it applies. It also works when {lhs} matches the {rhs} of a mapping - this is for when an abbreviation applied. Trailing spaces are included in the {lhs}.

`-clear`
Remove ALL mappings for the modes where the map command applies. Use the <buffer> argument to remove buffer-local mappings `:map-<buffer>`. This also removes the mac-standard-mappings and the dos-standard-mappings.

`[?]map`
List all key mappings for the modes where the map command applies. `:map` and `:map!` are used most often, because they include the other modes.

`[?]map  {lhs}`
List the key mappings for the key sequences starting with {lhs} in the modes where the map command applies.

>`:mkexrc` to save and restore the current mappings.

#### Ambiguous mappings

>When mappings start with the same sequence of characters, they are ambiguous.

    :imap aa foo
    :imap aaa bar

When Vim has read "aa", it will need to get another character to be able to decide if "aa" or "aaa" should be mapped. This means that after typing "aa" that mapping won't get expanded yet, Vim is waiting for another character. If you type a space, then "foo" will get inserted, plus the space. If you type "a", then "bar" will get inserted.

#### Trailing whitespace 

These unmap commands do NOT work:

    :map @@ foo
    :unmap @@ | print

Because it tries to unmap "@@ ", including the white space before the command separator `|`. Other examples with trailing white space:

    :unmap @@ 
    :unmap @@     # Vim9 script comment
    :unmap @@     " legacy script comment

An error will be issued, which is very hard to identify, because the ending whitespace character in `unmap @@ ` is not visible.

A generic solution is to put the command separator "|" right after the mapped keys. After that white space and a comment may follow: 

    :unmap @@|    # Vim9 script comment
    :unmap @@|    " legacy script comment


### 1.2 Special arguments

The special arguments can be used in any order, but they must appear right after the command, before any other arguments.
- `<buffer>`
- `<nowait>`
- `<silent>`
- `<special>`
- `<script>`
- `<expr>`
- `<unique>`


Local buffer mappings are used before the global ones. Local mappings are also cleared when a buffer is deleted, but not when it is unloaded. Just like local option values.

```vim
" mapping is effective in current buffer only
:map <buffer>  ,w  /[.,;]<CR>
" you can map ",w" to something else in another buffer
:map <buffer>  ,w  /[#&!]<CR>
" <buffer> can also be used to clear mappings
:unmap <buffer> ,w
:mapclear <buffer>

" Vim does not wait for more characters to be typed
" global
:map <nowait> , dd
" buffer local
:map <nowait><buffer> , dd

" not echoed on command line
:map <silent> ,h /Header<CR>
" Messages from the executed command are still given though.
" To shut them up too, add ":silent" in the executed command:
:map <silent> ,h :exe ":silent normal /Header\r"<CR>

" Define mapping with <> notation for special keys,
" even though "<" flag is in 'cpoptions'. Useful if
" side effect of setting 'cpoptions' is not desired.
:map <special> <F12> /Header<CR>

" If first arg is <script>, mapping only remaps chars in {rhs}
" using mappings that were defined local to a script, starting
" with <SID>. To avoid that mappings from outside interfere.
:map <script> <c-v> p

" fails if the mapping or abbrev already exists
:map <unique> ,w  /[#&!]<CR>

" If first arg is "<expr>" the arg is an expr,
" which is evaluated to obtain the {rhs} to use.
" Use <SID> in {rhs} so the script (the mapping
" was defined in) can be found.
:inoremap <expr> . <SID>InsertDot()

" <Cmd> begins a "command mapping", it executes
" the command directly without changing modes.
noremap x <Cmd>echo mode(1)<CR>

" <ScriptCmd> is like <Cmd> but sets the context to the script
" the mapping was defined in, for the duration of the command execution.
nnoremap <F4> <ScriptCmd>impl.DoTheWork()<CR>
```

### 1.3 Mapping and modes

There are 7 sets of mappings. For
- Normal mode: when typing commands
- Visual mode: when typing commands while the Visual area is highlighted
- Select mode: like Visual mode but typing text replaces the selection
- Operator-pending mode: when an operator is pending (after "d", "y", "c")
- Insert mode: these are also used in Replace mode
- Command-line mode: when entering a ":" or "/" command
- Terminal mode: when typing in a :terminal buffer

*Special case*: While typing a count for a command in Normal mode, mapping zero is disabled. This makes it possible to map zero without making it impossible to type a count with a zero.

Overview of which map command works in which mode
- :map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
- :map!  :noremap! :unmap!    Insert, Command-line
- :nmap  :nnoremap :nunmap    Normal
- :vmap  :vnoremap :vunmap    Visual, Select
- :smap  :snoremap :sunmap    Select
- :xmap  :xnoremap :xunmap    Visual
- :omap  :onoremap :ounmap    Operator-pending
- :imap  :inoremap :iunmap    Insert
- :lmap  :lnoremap :lunmap    Lang-Arg, Insert, Command-line
- :cmap  :cnoremap :cunmap    Command-line
- :tmap  :tnoremap :tunmap    Terminal-Job



### 1.4 Listing mappings
### 1.5 Mapping special keys
### 1.6 Special characters
### 1.7 What keys to map
### 1.8 Examples
### 1.9 Using mappings
### 1.10 Mapping alt-keys
### 1.11 Mapping meta-keys
### 1.12 Mapping in modifyOtherKeys mode
### 1.13 Mapping with Kitty keyboard protocol
### 1.14 Mapping an operator
