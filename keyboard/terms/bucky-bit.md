# Bucky bit

https://en.wikipedia.org/wiki/Bucky_bit

A **bucky bit** is a bit in a binary representation of a character that is set by pressing on a keyboard modifier key other than the SHIFT key.

Setting a bucky bit changes the output character. A bucky bit allows the user to type a wider variety of characters and commands while maintaining a reasonable number of keys on a keyboard. Some of the keys corresponding to bucky bits on modern keyboards are Alt (Meta), Control, Super.

In ASCII, the bucky bit is usually the 8th bit (also known as *meta bit*). In older character representations wider than 8 bits, higher bits can be used as bucky bits. Also, in the modern X Window system, bucky bits are bits 18-23 of an event code.

The term was invented at Stanford and is based on Niklaus Wirth's nickname "Bucky". Niklaus Wirth was first to suggest an EDIT key to set the 8th bit of a 7-bit ASCII character sometime in 1964 or 1965.

Bucky bits were used heavily on keyboards designed by Tom Knight at MIT, including space-cadet keyboards used on LISP machines. These could contain as many as 7 modifier keys: SHIFT, CTRL, META, HYPER, SUPER, TOP, GREEK (or FRONT).

## From Jargon File

### Bucky bit

http://catb.org/jargon/html/B/bucky-bits.html

1. [obs.] The bits produced by the CONTROL and META shift keys on a SAIL keyboard (octal 200 and 400 respectively), resulting in a 9-bit keyboard character set. The MIT AI TV (Knight) keyboards extended this with TOP and separate left and right CONTROL and META keys, resulting in a 12-bit character set; later, LISP Machines added such keys as SUPER, HYPER, and GREEK (see space-cadet keyboard).

2. By extension, bits associated with 'extra' shift keys on any keyboard, e.g. the ALT on an IBM PC or command and option keys on a Macintosh.

It has long been rumored that bucky bits were named for Buckminster Fuller during a period when he was consulting at Stanford. Actually, bucky bits were invented by Niklaus Wirth when he was at Stanford in 1964-1965; he first suggested the idea of an EDIT key to set the 8th bit (of an otherwise 7-bit ASCII character). It seems that, unknown to Wirth, certain Stanford hackers had privately nicknamed him 'Bucky' after a prominent portion of his dental anatomy, and this nickname transferred to the bit. Bucky-bit commands were used in a number of editors written at Stanford, including most notably TV-EDIT and NLS. The term spread to MIT and CMU early and is now in general use. Ironically, Wirth himself remained unaware of its derivation for nearly 30 years, until GLS dug up this history in early 1993! See double bucky, quadruple bucky.

### Double bucky

Using both the CTRL and META keys, e.g. "The command to burn all LEDs is double bucky F".

This term originated on the Stanford extended-ASCII keyboard, and was later taken up by users of the space-cadet keyboard at MIT. A typical MIT comment was that the Stanford bucky bits (CONTROL and META shifting keys) were nice, but there weren't enough of them; you could type only 512 different characters on a Stanford keyboard. An obvious way to address this was simply to add more shifting keys, and this was eventually done; but a keyboard with that many shifting keys is hard on touch-typists, who don't like to move their hands away from the home position on the keyboard. It was half-seriously suggested that the extra shifting keys be implemented as pedals; typing on such a keyboard would be very much like playing a full pipe organ.

### Quadruple bucky

1. [obs.] On an MIT space-cadet keyboard, use of all 4 of the shifting keys (CONTROL, META, HYPER, and SUPER) while typing a character key.

2. [obs.] On a Stanford or MIT keyboard in *raw mode*, use of 4 shift keys while typing a 5th character, where the 4 shift keys are the CONTROL and META keys on both sides of the keyboard. This was very difficult to do! One accepted technique was to press the left-CONTROL and left-META keys with your left hand, the right-CONTROL and right-META keys with your right hand, and the 5th key with your nose.

Quadruple-bucky combinations were very seldom used in practice, because when one invented a new command one usually assigned it to some character that was easier to type. If you want to imply that a program has ridiculously many commands or features, you can say something like: "Oh, the command that makes it spin the tapes while whistling Beethoven's Fifth Symphony is quadruple-bucky-cokebottle".

### meta bit

(or alt bit) The top bit of an 8-bit character, which is on in character values 128-255. Also called high bit, alt bit. Some terminals and consoles (see space-cadet keyboard) have a META shift key. Others (including, mirabile dictu, keyboards on IBM PC-class machines) have an ALT key.

Historical note: although in modern usage shaped by a universe of 8-bit bytes the meta bit is invariably hex 80 (octal 0200), things were different on earlier machines with 36-bit words and 9-bit bytes. The MIT and Stanford keyboards (see space-cadet keyboard) generated hex 100 (octal 400) from their meta keys.

### high bit

from high-order bit

1. The most significant bit in a byte.

2. [common] By extension, the most significant part of something other than a data byte: "Spare me the whole saga, just give me the high bit". See also meta bit, dread high-bit disease, and compare the mainstream slang "bottom line".

### dread high-bit disease

A condition endemic to some now-obsolete computers and peripherals (including ASR-33 teletypes and PRIME minicomputers) that results in all characters having their high (0x80) bit forced on. This of course makes transporting files to other systems much more difficult, not to mention the problems these machines have talking with true 8-bit devices.

This term was originally used specifically of PRIME (a.k.a. PR1ME) minicomputers. Folklore has it that PRIME adopted the reversed-8-bit convention in order to save 25 cents per serial line per machine; PRIME old-timers, on the other hand, claim they inherited the disease from Honeywell via customer NASA's compatibility requirements and struggled heroically to cure it. Whoever was responsible, this probably qualifies as one of the most cretinous design tradeoffs ever made.


http://catb.org/jargon/html/B/bit-paired-keyboard.html
