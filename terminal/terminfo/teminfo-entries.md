# teminfo entries

## TERM options in mintty

mintty terminal offers setting the TERM to
- xterm
- xterm-256color
- xterm-direct
- xterm-vt220
- vt100
- vt220
- vt340
- vt420
- vt525
- mintty
- mintty-direct

*mintty-direct* and *xterm-direct* have `colors#0x1000000`, i.e. 24-bit color, unlike *xterm-256color* which has `colors#0x10000`, i.e. 16-bit color.


## infocmp mintty-direct

```bash
# Reconstructed via infocmp from file: /usr/share/terminfo/m/mintty-direct
mintty-direct|Cygwin Terminal direct-color,
  am, bce, mc5i, mir, msgr, npc, xenl,
  colors#0x1000000, cols#80, it#8, lines#24, pairs#0x10000,
  # ...
```

## infocmp xterm-direct

```bash
# Reconstructed via infocmp from file: /usr/share/terminfo/x/xterm-direct
xterm-direct|xterm with direct-color indexing,
  am, bce, km, mc5i, mir, msgr, npc, xenl,
  colors#0x1000000, cols#80, it#8, lines#24, pairs#0x10000,
  # ...
```


## infocmp xterm-256color

```bash
# CSI=$'\x1b['
# CSI=$'\033['
ESC=$'\e'
CSI=$'\e['

infocmp xterm-256color
# Reconstructed via infocmp from file: /lib/terminfo/x/xterm-256color
xterm-256color|xterm with 256 colors
  , am    # auto margins
  , xenl  # 
  , bce   # bg color erase
  , ccc   # 
  , km    # 
  , mc5i  # 
  , mir   # 
  , msgr  # 
  , npc   # 

  , it#8  # 
  , cols#80
  , lines#24
  # TRUE COLOR is 24 bits, 2^24 = 16_777_216, 24-bit color
  # able to display 256 colors at a time:
  , colors#0x100  #   0x100 = 2^8  = 256,     8-bit color
  , pairs#0x10000 # 0x10000 = 2^16 = 65_536, 16-bit color

  , acsc=``aaffggiijjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||}}~~

  , bel   = ^G
  , blink = ${CSI} 5m
  , bold  = ${CSI} 1m
  , cbt   = ${CSI} Z              # 
  , clear = ${CSI} H ${CSI} 2 J
  , cr    = \r

  , cuu1  = ${CSI} A               # cursor up 1
  , cud1  = \n                    # cursor down 1
  , cuf1  = ${CSI} C               # cursor forward 1
  , cub1  = ^H                    # cursor back 1
  , cuu   = ${CSI} %p1 %d A          # cursor up
  , cud   = ${CSI} %p1 %d B          # cursor down
  , cuf   = ${CSI} %p1 %d C          # cursor forward
  , cub   = ${CSI} %p1 %d D          # cursor back
  , csr   = ${CSI} %i %p1 %d ; %p2 % d r  # cursor
  , cup   = ${CSI} %i %p1 %d ; %p2 % d H  # cursor absolute position

# tput cup 
# %p1 %d ; %p2 % d H

  , civis = ${CSI} ? 25l            # 
  , cvvis = ${CSI} ? 12 ; 25h         # 
  , cnorm = ${CSI} ? 12l ${CSI} ? 25h  # 

  , dch   = ${CSI} %p1 %dP
  , dch1  = ${CSI} P
  , dim   = ${CSI} 2m
  , dl    = ${CSI} %p1 %dM
  , dl1   = ${CSI} M
  , ech   = ${CSI} %p1 %dX
  , ed    = ${CSI} J
  , el    = ${CSI} K
  , el1   = ${CSI} 1K
  , flash = ${CSI} ? 5h $<100/> ${CSI} ? 5l # uses mandatory padding of 100 ms
  , home  = ${CSI} H
  , hpa   = ${CSI} %i %p1 %dG
  , ht    = ^I
  , hts   = ${ESC} H
  , ich   = ${CSI} %p1 %d@
  , il    = ${CSI} %p1 %dL
  , il1   = ${CSI} L
  , ind   = \n
  , indn  = ${CSI} %p1 %dS
  , invis = ${CSI} 8 m
  , is2   = ${CSI} !p ${CSI} ? 3 ; 4l ${CSI} 4l \E >

  , initc = ${ESC} ] 4 ; %p1 %d ; rgb : 
                         %p2 %{255} %* %{1000} %/ %2.2X / 
                         %p3 %{255} %* %{1000} %/ %2.2X / 
                         %p4 %{255} %* %{1000} %/ %2.2X \E \\

  , kDC   = ${CSI}3;2~
  , kEND  = ${CSI}1;2F
  , kHOM  = ${CSI}1;2H
  , kIC   = ${CSI}2;2~
  , kLFT  = ${CSI}1;2D
  , kNXT  = ${CSI}6;2~
  , kPRV  = ${CSI}5;2~
  , kRIT  = ${CSI}1;2C

  , ka1   = ${ESC}Ow  # upper left of keypad
  , kb2   = ${ESC}Ou  # center of keypad
  , ka3   = ${ESC}Oy  # upper right of keypad

  , kbs   = ^?
  , kbeg  = ${ESC}OE  # 1
  , kc1   = ${ESC}Oq
  , kc3   = ${ESC}Os
  , kcbt  = ${CSI}Z

  , kcuu1 = ${ESC}OA
  , kcud1 = ${ESC}OB
  , kcuf1 = ${ESC}OC
  , kcub1 = ${ESC}OD

  , kri   = ${CSI}1;2A
  , kind  = ${CSI}1;2B
  , kich1 = ${CSI}2~
  , kdch1 = ${CSI}3~
  , kpp   = ${CSI}5~
  , knp   = ${CSI}6~
  , kend  = ${ESC}OF
  , khome = ${ESC}OH
  , kent  = ${ESC}OM
  , kmous = ${CSI}<

  , kf1   = ${ESC}OP
  , kf2   = ${ESC}OQ
  , kf3   = ${ESC}OR
  , kf4   = ${ESC}OS

  , kf5   = ${CSI}15~
  , kf6   = ${CSI}17~
  , kf7   = ${CSI}18~
  , kf8   = ${CSI}19~
  , kf9   = ${CSI}20~
  , kf10  = ${CSI}21~
  , kf11  = ${CSI}23~
  , kf12  = ${CSI}24~

  , kf13  = ${CSI}1;2P
  , kf14  = ${CSI}1;2Q
  , kf15  = ${CSI}1;2R
  , kf16  = ${CSI}1;2S

  , kf17  = ${CSI}15;2~
  , kf18  = ${CSI}17;2~
  , kf19  = ${CSI}18;2~
  , kf20  = ${CSI}19;2~
  , kf21  = ${CSI}20;2~
  , kf22  = ${CSI}21;2~
  , kf23  = ${CSI}23;2~
  , kf24  = ${CSI}24;2~

  , kf25  = ${CSI}1;5P
  , kf26  = ${CSI}1;5Q
  , kf27  = ${CSI}1;5R
  , kf28  = ${CSI}1;5S

  , kf29  = ${CSI}15;5~
  , kf30  = ${CSI}17;5~
  , kf31  = ${CSI}18;5~
  , kf32  = ${CSI}19;5~
  , kf33  = ${CSI}20;5~
  , kf34  = ${CSI}21;5~
  , kf35  = ${CSI}23;5~
  , kf36  = ${CSI}24;5~

  , kf37  = ${CSI}1;6P
  , kf38  = ${CSI}1;6Q
  , kf39  = ${CSI}1;6R
  , kf40  = ${CSI}1;6S

  , kf41  = ${CSI}15;6~
  , kf42  = ${CSI}17;6~
  , kf43  = ${CSI}18;6~
  , kf44  = ${CSI}19;6~
  , kf45  = ${CSI}20;6~
  , kf46  = ${CSI}21;6~
  , kf47  = ${CSI}23;6~
  , kf48  = ${CSI}24;6~

  , kf49  = ${CSI}1;3P
  , kf50  = ${CSI}1;3Q
  , kf51  = ${CSI}1;3R
  , kf52  = ${CSI}1;3S

  , kf53  = ${CSI}15;3~
  , kf54  = ${CSI}17;3~
  , kf55  = ${CSI}18;3~
  , kf56  = ${CSI}19;3~
  , kf57  = ${CSI}20;3~
  , kf58  = ${CSI}21;3~
  , kf59  = ${CSI}23;3~
  , kf60  = ${CSI}24;3~

  , kf61  = ${CSI} 1 ; 4 P
  , kf62  = ${CSI} 1 ; 4 Q
  , kf63  = ${CSI} 1 ; 4 R


  , mc0   = ${CSI} i
  , mc4   = ${CSI} 4 i
  , mc5   = ${CSI} 5 i

  , meml  = ${ESC} l
  , memu  = ${ESC} m

  , mgc   = ${CSI} ? 69 l

  , nel   = ${ESC} E

  , oc    = ${ESC} ] 104 \0 07
  , op    = ${CSI} 39 ; 49 m

  , rep   = %p1 %c ${CSI} %p2 %{1} %- %db
  , rc    = ${ESC} 8
  , rev   = ${CSI} 7 m
  , ri    = ${ESC} M
  , rin   = ${CSI} %p1 %dT
  , ritm  = ${CSI} 23 m
  , rmacs = ${ESC} ( B
  , rmam  = ${CSI} ? 7l
  , rmcup = ${CSI} ? 1049l ${CSI} 23 ; 0 ; 0 t
  , rmir  = ${CSI} 4l
  , rmkx  = ${CSI} ? 1l ${ESC} >
  , rmm   = ${CSI} ? 1034l

  , rmso  = ${CSI} 27 m

  , rmul  = ${CSI} 24 m
  , rs1   = ${ESC} c ${ESC} ] 104 \0 07
  , rs2   = ${CSI} ! p ${CSI} ? 3; 4l ${CSI} 4l ${ESC} >

  , sc    = ${ESC}7

  # 16-bit color entries
  , setaf = ${CSI} %? %p1 %{8} %< %t3 
                      %p1 %d %e 
                      %p1 %{16} %< %t9 
                      %p1 %{8}% - %d %e 38; 5;
                      %p1 %d %; m

  , setab = ${CSI} %? %p1 %{8} %< %t4 
                      %p1 %d %e 
                      %p1 %{16} %< %t10 
                      %p1 %{8} %- %d %e 48; 5; 
                      %p1 %d %; m

  # 24-bit color (truecolor) entries; truecolor format ${CSI}2;38;R;G;B
  , setaf = ${CSI} %? %p1 %{8} %< %t3 %p1 %d %e38 \: 2 \: \: %p1 %{65536} %/ %d \: %p1 %{256} %/ %{255} %& %d \: %p1 %{255} %& %d %; m
  , setab = ${CSI} %? %p1 %{8} %< %t4 %p1 %d %e48 \: 2 \: \: %p1 %{65536} %/ %d \: %p1 %{256} %/ %{255} %& %d \: %p1 %{255} %& %d %; m

  , sgr   = %? 
            %p9 %t ${ESC} ( 0 %e \E ( B %; ${CSI} 0 %? 
            %p6 %t;1 %; %? 
            %p5 %t;2 %; %? 
            %p2 %t;4 %; %? 
            %p1 
            %p3 %| %t;7 %; %? 
            %p4 %t;5 %; %? 
            %p7 %t;8 %; m

  , sgr0  = ${ESC} (B ${CSI} m

  , sitm  = ${CSI} 3m
  , smacs = ${ESC} (0
  , smam  = ${CSI} ?7h

  , smcup = ${CSI} ?1049h ${CSI} 22; 0; 0t

  , smglp = ${CSI} ?69h ${CSI} %i %p1 %ds
  , smglr = ${CSI} ?69h ${CSI} %i %p1 %d; %p2 %ds
  , smgrp = ${CSI} ?69h ${CSI} %i; %p1 %ds

  , smir  = ${CSI} 4h
  , smkx  = ${CSI} ?1h ${ESC} = 
  , smm   = ${CSI} ?1034h

  , smso  = ${CSI} 7m
  , smul  = ${CSI} 4m

  , tbc   = ${CSI} 3g

  , u6    = ${CSI} %i %d; %dR
  , u7    = ${CSI} 6n
  , u8    = ${CSI} ?%[; 0123456789]c
  , u9    = ${CSI} c

  , vpa   = ${CSI} %i %p1 %dd
```
