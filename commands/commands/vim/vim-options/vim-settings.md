# Vim settings

## softtabstop

- `softtabstop`, `sts` number (default 0)
- local to buffer

Number of spaces that a <Tab> counts for while performing operations, like inserting a <Tab> or using <BS>.

It "feels" like <Tab>s are being inserted, while in fact a mix of spaces and <Tab>s is used. This is useful to keep the `ts` setting at its standard value of 8, while being able to edit like it is set to `sts`. However, commands like `x` still work on the actual characters.

- When `sts` is 0, this feature is off.
- When `sts` is negative, the value of `shiftwidth` is used.

`softtabstop` is set to 0 when the `paste` option is set and restored when `paste` is reset.

See also [ins-expandtab]. When `expandtab` is not set, the number of spaces is minimized by using <Tab>s.

The `L` flag in `cpoptions` changes how tabs are used when `list` is set.

NOTE: This option is set to 0 when `compatible` is set. If Vim is compiled with the [+vartabs] feature then the value of `softtabstop` will be ignored if [varsofttabstop] is set to anything other than ε.
