# xcompose :: Key names

Compose   `⎄`  <Multi_key>  Alt  AltGr


leaders
- <Multi_key> <Up>                  superscript
- <Multi_key> <Down>                subscript
- <Multi_key> <Right>               small capitals


## xcompose key names


name          | k | sy
--------------|---|-----
ampersand     | & | <&>
apostrophe    | ' | <'>
asciicircum   | ^ | <^>
asciitilde    | ~ | <~>
asterisk      | * | <*>
at            | @ | <@>
backslash     | \ | N/A
bar           | \| | <\|>
colon         | : | <:>
comma         | , | <,>
dollar        | $ | <$>
equal         | = | <=>
exclam        | ! | <!>
grave         | \` | <\`>
greater       | > | N/A
less          | < | N/A
minus         | - | <->
numbersign    | # | <#>
percent       | % | <%>
period        | . | <.>
plus          | + | <+>
quotedbl      | " | <">
semicolon     | ; | <;>
slash         | / | </>
space         |   | < >
underscore    | _ | <_>
braceleft     | { | N/A
braceright    | } | N/A
bracketleft   | [ | N/A
bracketright  | ] | N/A
parenleft     | ( | N/A
parenright    | ) | N/A





- 52 (26 + 26) letters, case-sensitive
  - `a`, `z` small letters,   26
  - `A`, `Z` capital letters, 26
- 10 numbers
  - 1-9 0
- 4 arrows
  - ↑ `Up`
  - ↓ `Down`
  - ← `Left`
  - → `Right`
- [`/~]
  - <grave>         <`>
  - <asciitilde>    <~>
- [_/-]
  - <underscore>    <_>
  - <minus>         <->
- [=/+]
  - <equal>         <=>
  - <plus>          <+>
- [\/|\]
  - <slash>         </>
  - <bar>           <|>
- [:/;]
  - <colon>         <:>
  - <semicolon>     <;>
- ['/"]
  - <apostrophe>    <'>
  - <quotedbl>      <">
- [\/?]
  - <backslash>     <\>
  - (disallowed `?`)
- [,/<]
  - <comma>         <,>
  - <less>          N/A    disallowed >
- [./>]
  - <period>        <.>
  - <greater>       N/A    disallowed <


percent (%)   asterisk (*)     ampersand (&)   asciicircum (^)
minus   (-)   plus     (+)     quotedbl  (")   apostrophe  (')
grave   (`)   exclam   (!)     dollar    ($)   numbersign  (#)
slash   (/)   bar      (|)     at        (@)   backslash   (\)
comma   (,)   period   (.)     colon     (:)   semicolon   (;)
less    (<)   greater  (>)     equal     (=)   underscore  (_)
space   ( )                                    asciitilde  (~)


braceleft   {       braceright   }
bracketleft [       bracketright ]
parenleft   (       parenright   )


The keys can be single characters: <a>, <B>, <7>, <.>, <@>
even though e.g. B reguires holding shift.

---
# wincompose :: allowed keys

Wincompose sequence always begins with the compose key, `K` or `⎄`, which, in this 
setup is the *Right Alt* key (primary) and the *Left Alt* key (secondary) as 
well (the settings to treat them the same is enabled).

Wincompose > Options > Composing
* Compose key: Right Alt      try: Right Windows
               Left  Alt
* Reset timeout: 0.8 seconds
* Keyboard LED: Scroll Lock (rightmost led)

## Key names

- Keyboard keys are identified by special names assigned to them by wincompose.
- wincompose assigns descriptive and symbolic names to keys.
- wincompose does not support all the keys.
- the descriptive or symbolic names of the supported keys 
  are written in angle brackets, e.g. `<period>` or `<.>`
- Wincompose associates key sequences with the unicode symbols.
  where unicode symbol is a single glyph, but you can also put more than one.
- Wincompose sequence always starts with the compose key, followed by any number 
  of keys, and (if correct) produces the associated unicode symbol; otherwise,
  a sequence permutation is tried. Eventually, the characters typed as part of 
  the sequence are removed (optional) from the document.

- My notation: 
  - compose key, `K` or `⎄`
  - leader key: several leaders key, each for a different "mode"
  - arrow keys used as positionals, e.g. sub/superscipt, left/right arrows, etc.
  - generic key `{Key}`
    - as `{KEYNAME}`, e.g. `<period>`
    - as `{KEYSYMB}`,     e.g. `<.>`


* Allowed keys as the primary or secondary Compose key, `K` or `⎄`
  - Left Alt
  - Right Alt
  - Left Windows
  - Right Windows
  - Left Control
  - Right Control
  - VK.LSHIFT
  - VK.RSHIFT
  - MENU (apps key)
  - CAPS LOCK
  - TAB
  - Prt Scrn (PrintSceen)
  - ScrollLock
  - Pause
* Allowed keys for generic position: descriptive and symbol names
  - grave         `
  - asciitilde    ~ 
  - exclam        !
  - at            @
  - numbersign    #
  - dollar        $
  - percent       %
  - asciicircum   ^
  - ampersand     &
  - asterisk      *
  - bracketleft   [
  - bracketright  ]
  - equal          =
  - plus          +
  - underscore    _
  - minus         -
  - parenleft     (
  - parenright    )
  - braceleft     {
  - braceright    }
  - slash         /
  - backslash     \
  - bar           |
  - apostrophe    '
  - quotedbl      "
  - colon         :
  - semicolon     ;
  - period        .
  - comma         ,
  - less          <
  - greater       >
* Allowed (special) keys without symbolic name
  - space
  - Up
  - Down
  - Left
  - Right
* Disallowed keys
  - ?
  - F1-F12
  - Ins, DEL, Home, End, PageUp, PageDown
  - BCKSPC, Return, Shift, Alt, Control
  - AppKey, WinKey, CapsLock, TAB, ESC
  - PrintScreen/SysRq, ScrollLock, Pause/Break






```
#|-----------------------------------------------------------------------------
#| arrow-set
#|-----------------------------------------------------------------------------
# <Multi_key> <TRIGGER> <Up>           : ""
# <Multi_key> <TRIGGER> <Down>         : ""
# <Multi_key> <TRIGGER> <Left>         : ""
# <Multi_key> <TRIGGER> <Right>        : ""

#|-----------------------------------------------------------------------------
#| digit-set
#|-----------------------------------------------------------------------------
# <Multi_key> <TRIGGER> <1> : ""
# <Multi_key> <TRIGGER> <2> : ""
# <Multi_key> <TRIGGER> <3> : ""
# <Multi_key> <TRIGGER> <4> : ""
# <Multi_key> <TRIGGER> <5> : ""
# <Multi_key> <TRIGGER> <6> : ""
# <Multi_key> <TRIGGER> <7> : ""
# <Multi_key> <TRIGGER> <8> : ""
# <Multi_key> <TRIGGER> <9> : ""
# <Multi_key> <TRIGGER> <0> : ""

#|-----------------------------------------------------------------------------
#| uppercase-set
#|-----------------------------------------------------------------------------
# <Multi_key> <TRIGGER> <A> : ""
# <Multi_key> <TRIGGER> <B> : ""
# <Multi_key> <TRIGGER> <C> : ""
# <Multi_key> <TRIGGER> <D> : ""
# <Multi_key> <TRIGGER> <E> : ""
# <Multi_key> <TRIGGER> <F> : ""
# <Multi_key> <TRIGGER> <G> : ""
# <Multi_key> <TRIGGER> <H> : ""
# <Multi_key> <TRIGGER> <I> : ""
# <Multi_key> <TRIGGER> <J> : ""
# <Multi_key> <TRIGGER> <K> : ""
# <Multi_key> <TRIGGER> <L> : ""
# <Multi_key> <TRIGGER> <M> : ""
# <Multi_key> <TRIGGER> <N> : ""
# <Multi_key> <TRIGGER> <O> : ""
# <Multi_key> <TRIGGER> <P> : ""
# <Multi_key> <TRIGGER> <Q> : ""
# <Multi_key> <TRIGGER> <R> : ""
# <Multi_key> <TRIGGER> <S> : ""
# <Multi_key> <TRIGGER> <T> : ""
# <Multi_key> <TRIGGER> <U> : ""
# <Multi_key> <TRIGGER> <V> : ""
# <Multi_key> <TRIGGER> <W> : ""
# <Multi_key> <TRIGGER> <X> : ""
# <Multi_key> <TRIGGER> <Y> : ""
# <Multi_key> <TRIGGER> <Z> : ""

#|-----------------------------------------------------------------------------
#| lowercase-set
#|-----------------------------------------------------------------------------
# <Multi_key> <TRIGGER> <a> : ""
# <Multi_key> <TRIGGER> <b> : ""
# <Multi_key> <TRIGGER> <c> : ""
# <Multi_key> <TRIGGER> <d> : ""
# <Multi_key> <TRIGGER> <e> : ""
# <Multi_key> <TRIGGER> <f> : ""
# <Multi_key> <TRIGGER> <g> : ""
# <Multi_key> <TRIGGER> <h> : ""
# <Multi_key> <TRIGGER> <i> : ""
# <Multi_key> <TRIGGER> <j> : ""
# <Multi_key> <TRIGGER> <k> : ""
# <Multi_key> <TRIGGER> <l> : ""
# <Multi_key> <TRIGGER> <m> : ""
# <Multi_key> <TRIGGER> <n> : ""
# <Multi_key> <TRIGGER> <o> : ""
# <Multi_key> <TRIGGER> <p> : ""
# <Multi_key> <TRIGGER> <q> : ""
# <Multi_key> <TRIGGER> <r> : ""
# <Multi_key> <TRIGGER> <s> : ""
# <Multi_key> <TRIGGER> <t> : ""
# <Multi_key> <TRIGGER> <u> : ""
# <Multi_key> <TRIGGER> <v> : ""
# <Multi_key> <TRIGGER> <w> : ""
# <Multi_key> <TRIGGER> <x> : ""
# <Multi_key> <TRIGGER> <y> : ""
# <Multi_key> <TRIGGER> <z> : ""
```
