# Vim :: Folding

Introduction on folding: usr_28.txt

1. Fold methods
2. Fold commands
3. Fold options
4. Behavior of folds

Folding is not available when compiled without `+folding` feature

## Fold keys

- za      toggle fold
- zi      toggle all folds
- zA      toggle fold wrg zO and zC
- zN      toggle prev fold situation
- zn      open all folds
- zR      open all folds
- zo      open fold
- zO      open all nested folds
- zc      close fold
- zC      close nested folds recursively
- zM      close all folds
- zd      delete a fold (with cursor on the fold line)
- zE      eliminate (delete) all folds
- zf      create a fold from VISUAL selection
- zfa{    create a fold by folding within braces
- zm      fold level 1
- zM      fold all levels

- zj      go to next fold
- zk      go to prev fold
- [z      top line of current fold
- ]z      bottom line of current fold

- VG      select all
- VGzf    select all and apply fold (zf)

- :10,50 foldopen     Open folds on lines 10 and 50
- :10,50 foldclose    Close folds on lines 10 and 50
- :%foldclose         Close all folds


Folding options (`:set foldmethod=marker`)
- *manual*: folds defined manually using key bindings
- *marker*: folds defined by specific types of code comments
- *indent*: folds defined by indenting lines
- *expr*:   folds defined by pattern matching via VimL
- *syntax*: folds defined by rules within specific language syntax file
- *diff*:   folds defined by nonrelevant changes when dealing with `diff` files 
            (e.g. `vimdiff` and `diffthis` windows)

When used with different motions, `zf` can take the following multiple forms:
- `v{motion|text object}zf` Fold a selection
- `zf{motion|text object}`  Fold around a motion or text object (e.g. `zf3j`)
- `zf'a`                    Fold from current position up to the a mark
- `{count}zF`               Fold counted number of lines from current position

## 1. Fold methods

The folding method can be set with the 'foldmethod' option.

When setting 'foldmethod' to a value other than "manual", all folds are deleted and new ones created. Switching to the "manual" method doesn't remove the existing folds. This can be used to first define the folds automatically and then change them manually.

There are 6 folding methods
- manual    manually define folds
- indent    more indent means a higher fold level
- expr      specify an expression to define folds
- syntax    folds defined by syntax highlighting
- diff      folds for unchanged text
- marker    folds defined by markers in the text

### Manual

Use commands to manually define the fold regions. This can also be used by a script that parses text to find folds.

The level of a fold is only defined by its nesting. To increase the fold level of a fold for a range of lines, define a fold inside it that has the same lines.

The manual folds are lost when you abandon the file. To save the folds use the `:mkview` command. The view can be restored later with `:loadview`.

### Indent

Folds are automatically defined by the indent of the lines.

The `foldlevel` is computed from the indent of the line, divided by the `shiftwidth` (rounded down). A sequence of lines with the same or higher fold level form a fold, with the lines with a higher level forming a nested fold.

The nesting of folds is limited with `foldnestmax` option.

Some lines are ignored and get the fold level of the line above or below it, whichever is lower. These are empty or white lines and lines starting with a character in `foldignore`. White space is skipped before checking for chars in 'foldignore'. For C use "#" to ignore preprocessor lines.

When you want to ignore lines in another way, use the "expr" method. The
indent() function can be used in `foldexpr` to get the indent of a line.

### Expr

Folds are automatically defined by their `foldlevel`, like with the "indent" method. The value of the `foldexpr` option is evaluated to get the foldlevel of a line.

Examples:
- create a fold for all consecutive lines that start with a tab:
    :set foldexpr=getline(v:lnum)[0]==\"\\t\"
- make a fold out of paragraphs separated by blank lines:
    :set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
- this does the same:
    :set foldexpr=getline(v:lnum-1)=~'^\\s*$'&&getline(v:lnum)=~'\\S'?'>1':1

Note that backslashes must be used to escape characters that ":set" handles differently (space, backslash, double quote, etc.; see *option-backslash*).

The most efficient is to call a compiled function without arguments:
  :set foldexpr=MyFoldLevel()

The function must use `v:lnum`. See *expr-option-function*.

...

### Syntax

### Diff

### Marker

Markers in the text tell where folds start and end. This allows you to precisely specify the folds. This will allow deleting and putting a fold, without the risk of including the wrong lines. The `foldtext` option is normally set such that the text before the marker shows up in the folded line. This makes it possible to give a name to the fold.

Markers can have a level included, or can use matching pairs. Including a level is easier since you don't have to add end markers, and avoid problems with non-matching marker pairs. Examples:

    /* global variables {{{1 */
    int varA, varB;

    /* functions {{{1 */
    /* funcA() {{{2 */
    void funcA() {}

    /* funcB() {{{2 */
    void funcB() {}

A fold starts at a `{{{` marker. The following number specifies the fold level. What happens depends on the difference between the current fold level and the level given by the marker:
1. If a marker with the same fold level is encountered, 
   the previous fold ends and another fold with the same level starts.
2. If a marker with a higher fold level is found, a nested fold is started.
3. If a marker with a lower fold level is found, all folds up to and 
   including this level end and a fold with the specified level starts.

The number indicates the fold level. A zero cannot be used (a marker with level zero is ignored). You can use `}}}` with a digit to indicate the level of the fold that ends. The fold level of the following line will be one less than the indicated level. Note that Vim doesn't look back to the level of the matching marker (that would take too much time). Examples:

    {{{1
    fold level here is 1
    {{{3
    fold level here is 3
    }}}3
    fold level here is 2




## 2. Fold commands
## 3. Fold options
## 4. Behavior of folds
