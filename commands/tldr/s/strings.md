# strings

Find printable strings in an object or binary file.

- Print all strings in a binary:

`strings {{file}}`

- Limit results to strings at least *length* characters long:

`strings -n {{length}} {{file}}`

- Prefix each result with its offset within the file (use decimal):

`strings -t d {{file}}`

- Prefix each result with its offset within the file (use hex):

`strings -t x {{file}}`



## Sample output

strings -t x a.out


dec offset   hex string
```
  792        318 /lib64/ld-linux-x86-64.so.2
  901        385 4|2i
 1345        541 __cxa_finalize
 1360        550 malloc
 1367        557 __assert_fail
 1381        565 __libc_start_main
 1399        577 puts
 1404        57c free
 1409        581 realloc
 1417        589 memcpy
 1424        590 putchar
 1432        598 __stack_chk_fail
 1449        5a9 printf
 1456        5b0 libc.so.6
 1466        5ba GLIBC_2.14
 1477        5c5 GLIBC_2.4
 1487        5cf GLIBC_2.34
 1498        5da GLIBC_2.2.5
 1510        5e6 _ITM_deregisterTMCloneTable
 1538        602 __gmon_start__
 1553        611 _ITM_registerTMCloneTable
 4465        1171 PTE1
 4619        120b u+UH
 7700        1e14 stacked
 8200    uf  2008 stack_new.c
 8212    c   2014 s != NULL
 8222    c   201e 1 <= size && size <= 128
 8247    c   2037 s->elems != NULL
 8264        2048 stack_print.c
 8278    c   2056 s->cbPrint != NULL
 8300    uf  206c stack_push.c
 8313    c   2079 s->cap == old_cap * 2
 8335    uf  208f stack_pop.c
 8347        209b stack_free.c
 8370    us  20b2 To create a new Stack:
 8400    us  20d0 - decide on the type of elements to store in the Stack. Impo
 8640    us  21c0 - For elements that allocate, like strings, define a functio
 8784    us  2250 - the first arg to StackNew is a Stack pointer
 8832    us  2280 - the second arg to StackNew is the size of an element
 8887    us  22b7 For example:
 8900        22c4   Stack stack;
 8920        22d8   StackNew(&stack, sizeof(long), NULL);
 8977    us  2311 ==== Stack<long> ======================================
 9033        2349 long
 9040    us  2350 To store %2$s%1$s%3$ss, create a new Stack by calling:
 9096        2388 %sStackNew(&stack, sizeof(long), NULL)%s
 9139    us  23b3 Then create some longs:
 9163        23cb long l0 = 100L
 9184    us  23e0 ===================== Stack<long> =====================
 9240        2418 *pl6
 9245        241d [%d] %s: %ld
 9264    us  2430 ===================== Stack<char*> =====================
 9321        2469 *ppc
 9326        246e [%d] %s: %s
 9339    us  247b stacked
 9347    us  2483 2.deffered
 9358    us  248e 3.allocated
 9370    us  249a 4. dynamically not
 9389    us  24ad 5. overflown
 9408    us  24c0 ================= Stack<char*> allocated =================
 9472    uf  2500 StackNew
 9488    uf  2510 StackPrint
 9504    uf  2520 StackEnlarge
 9520    uf  2530 StackPush
 9536    uf  2540 StackPop
 9552    uf  2550 StackFree
 9815        2657 :*3$"
12304        3010 GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
13913        3659 Scrt1.o
13921        3661 __abi_tag
13931        366b crtstuff.c
13942        3676 deregister_tm_clones
13963        368b __do_global_dtors_aux
13985        36a1 completed.0
13997        36ad __do_global_dtors_aux_fini_array_entry
14036        36d4 frame_dummy
14048        36e0 __frame_dummy_init_array_entry
14079    m   36ff main.c
14086        3706 __PRETTY_FUNCTION__.5
14108        371c __PRETTY_FUNCTION__.4
14130        3732 StackEnlarge
14143        373f __PRETTY_FUNCTION__.3
14165        3755 __PRETTY_FUNCTION__.2
14187        376b __PRETTY_FUNCTION__.1
14209        3781 __PRETTY_FUNCTION__.0
14231        3797 __FRAME_END__
14245        37a5 _DYNAMIC
14254        37ae __GNU_EH_FRAME_HDR
14273        37c1 _GLOBAL_OFFSET_TABLE_
14295        37d7 storeStrings
14308        37e4 free@GLIBC_2.2.5
14325        37f5 printLong
14335        37ff putchar@GLIBC_2.2.5
14355        3813 __libc_start_main@GLIBC_2.34
14384        3830 _ITM_deregisterTMCloneTable
14412        384c puts@GLIBC_2.2.5
14429        385d _edata
14436        3864 storeStringsAllocated
14458        387a freeString
14469        3885 _fini
14475        388b __stack_chk_fail@GLIBC_2.4
14502        38a6 printf@GLIBC_2.2.5
14521        38b9 __assert_fail@GLIBC_2.2.5
14547    uf  38d3 printString
14559    uf  38df StackFree
14569        38e9 __data_start
14582        38f6 __gmon_start__
14597        3905 __dso_handle
14610    uf  3912 StackPrint
14621        391d memcpy@GLIBC_2.14
14639        392f _IO_stdin_used
14654    uf  393e StackPop
14663    uf  3947 StackUsage
14674        3952 malloc@GLIBC_2.2.5
14693        3965 _end
14698        396a realloc@GLIBC_2.2.5
14718        397e __bss_start
14730    uf  398a printDouble
14742        3996 main
14747    uf  399b StackNew
14756    uf  39a4 StackUsagePrologue
14775        39b7 __TMC_END__
14787        39c3 _ITM_registerTMCloneTable
14813    uf  39dd storeLongs
14824    uf  39e8 StackPush
14834        39f2 __cxa_finalize@GLIBC_2.2.5
14861        3a0d _init
14868    lb  3a14 .symtab
14876    lb  3a1c .strtab
14884    lb  3a24 .shstrtab
14894    lb  3a2e .interp
14902    lb  3a36 .note.gnu.property
14921    lb  3a49 .note.gnu.build-id
14940    lb  3a5c .note.ABI-tag
14954    lb  3a6a .gnu.hash
14964    lb  3a74 .dynsym
14972    lb  3a7c .dynstr
14980    lb  3a84 .gnu.version
14993    lb  3a91 .gnu.version_r
15008    lb  3aa0 .rela.dyn
15018    lb  3aaa .rela.plt
15028    lb  3ab4 .init
15034    lb  3aba .plt.got
15043    lb  3ac3 .plt.sec
15052    ps  3acc .text
15058    ps  3ad2 .fini
15064    ps  3ad8 .rodata
15072    lb  3ae0 .eh_frame_hdr
15086    lb  3aee .eh_frame
15096    lb  3af8 .init_array
15108    lb  3b04 .fini_array
15120    lb  3b10 .dynamic
15129    ps  3b19 .data
15135    ps  3b1f .bss
15140    lb  3b24 .comment
```
