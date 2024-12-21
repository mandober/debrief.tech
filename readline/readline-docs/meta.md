meta

convert-meta (On)
If set to On, readline will convert characters with the eighth bit set to an ASCII key 
sequence by stripping the eighth bit and prefixing an
escape character (in effect, using escape as the meta prefix).
    
input-meta (Off)
If set to On, readline will enable eight-bit input (that is, it will not strip the 
high bit from the characters it reads), regardless of what the
terminal claims it can support. The name meta-flag is a synonym for this variable.

output-meta (Off)
If set to On, readline will display characters with the eighth 
bit set directly rather than as a meta-prefixed escape sequence.

enable-meta-key (On)
When set to On, readline will try to enable any meta modifier 
key the terminal claims to support when it is called. 
On many terminals, the meta key is used to send eight-bit characters.

