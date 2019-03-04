# Types

using i32 = System.Int32;
using u32 = System.UInt32;


| C# Type |  System | Suf | Size |       from | to      | prec | ? | ? |
|---------|--------:|-----|-----:|-----------:|---------|------|---|---|
| sbyte   |   SByte |     |    8 |       -2^7 | 2^7 –1  |      |   |   |
| short   |   Int16 |     |   16 |      –2^15 | 2^15–1  |      |   |   |
| int     |   Int32 |     |   32 |      –2^31 | 2^31–1  |      |   |   |
| long    |   Int64 | L   |   64 |      –2^63 | 2^63–1  |      |   |   |
| byte    |    Byte |     |    8 |          0 | 2^8 –1  |      |   |   |
| ushort  |  UInt16 |     |   16 |          0 | 2^16–1  |      |   |   |
| uint    |  UInt32 | U   |   32 |          0 | 2^32–1  |      |   |   |
| ulong   |  UInt64 | UL  |   64 |          0 | 2^64–1  |      |   |   |
| Reals   |         |     |      |            |         |      |   |   |
| float   |  Single | F   |   32 | ± ~ 10^-45 | ~10^38  |      |   |   |
| double  |  Double | D   |   64 | ± ~10^–324 | ~10^308 |      |   |   |
| decimal | Decimal | M   |  128 | ± ~ 10^–28 | ~10^28  |      |   |   |
| bool    |    Bool |     |   16 |            |         |      |   |   |
| T*      |  IntPtr |     |   64 |            |         |      |   |   |


