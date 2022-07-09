# Keywords

## Semantic groups

!
[[ ... ]]
{ ... }
case...esac
do...done
for...in
if...then...elif...else...fi
while, do...while
until, do...until
select
function, (), function ()
time
coproc


## words

There is a lot of context involved [in bash parser]. e.g. the same word for can be a *reserved word*, *an identifier*, *part of an assignment statement*, or *another word*, making this a valid syntax:

```bash
for for in for; do
  for=for
done
echo $for # for
```



## Alphabeical listing

!
[[
]]
{
}
case
coproc
do
done
elif
else
esac
fi
if
for
function
in
select
then
time
until
while
