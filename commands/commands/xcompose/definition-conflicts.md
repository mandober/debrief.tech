# xcompose :: Definition conflicts

>A compose sequence cannot be a prefix of another.

For example, if you have these two sequences
- <Multi_key> <period> <period>          : "·"
- <Multi_key> <period> <period> <period> : "…"

where the first is a prefix of the second, you will never ne able to get the second's production - you'll always get the first's.

When you type in `⎄ . .` the first production, `·`, is immediately output and the composition process ends.


nothing gets printed because it's anticipating you to finish the second sequence, it disregards the first.

Compose . .», X won't print anything because it's
waiting for «Compose . . .» (IMHO it should print · and then change it
to … should you type another period, but I digress).  That means you
probably don't want to make a Compose shortcut for U2A94 GREATER-THAN
ABOVE SLANTED EQUAL ABOVE LESS-THAN ABOVE SLANTED EQUAL (⪔).
❉
✼❉
