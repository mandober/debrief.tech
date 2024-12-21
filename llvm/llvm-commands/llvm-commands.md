## LLVM commands

Aliasing to existing GNU tools:
- llvm-ar,      alias of `ar`
- llvm-nm,      alias of `nm`
- llvm-objdump, alias of `objdump`
- llvm-strings, alias of `strings`

Other aliases:
- llvm-gcc,     alias of `clang`
- llvm-g++,     alias of `clang++`

Desc of end names:
- [ar](https://manned.org/ar) 
  Create, modify, and extract from archives (.a, .so, .o)
- nm
- strings
- objdump


- clang
- clang++
Own tools:
- llvm-as,         (assembler), LLVM IR (`.ll`) to Bitcode (`.bc`) assembler
- llvm-bcanalyzer, LLVM Bitcode (`.bc`) analyzer
- llvm-cat,        Concatenate LLVM Bitcode (`.bc`) files
- llvm-config,     Get conf needed to compile programs
- llvm-dis, (disassembler)
  Converts LLVM bitcode files into human-readable LLVM Intermediate Representation (IR)

## ar

Create, modify, and extract (files) from archives (`.a`, `.so`, `.o`).   
More information: https://manned.org/ar

- binary: .a (e.g. `out.a` is the default name for a compiled binary file)
- object file: .o   (dynamic? object file)
- object file: .so  (static? object file)

### Examples:

- Extract all members from an archive:
`ar -x {{path/to/file.a}}`

- List the members of an archive:
`ar -t {{path/to/file.a}}`

- Replace or add files to an archive:
`ar -r {{path/to/file.a}} {{path/to/file1.o}} {{path/to/file2.o}}`

- Insert an object file index (equivalent to using `ranlib`):
`ar -s {{path/to/file.a}}`

- Create an archive with files and an accompanying object file index:
`ar -rs {{path/to/file.a}} {{path/to/file1.o}} {{path/to/file2.o}}`


## nm

List *symbol names* in *object files*.

- List *g*lobal (extern) functions in a file (prefixed with `T`):
`nm -g {{file.o}}`

- List only *u*ndefined symbols in a file:
`nm -u {{file.o}}`

- List *a*ll symbols, even debugging symbols:
`nm -a {{file.o}}`

- Demangle C++ symbols (make them readable):
`nm --demangle {{file.o}}`

### Example and sample output

```
$ nm -g a.out

0000000000001695 T StackFree
0000000000001249 T StackNew
00000000000015f2 T StackPop
0000000000001367 T StackPrint
00000000000014f5 T StackPush
000000000000182d T StackUsage
00000000000018ba T StackUsagePrologue
0000000000002000 R _IO_stdin_used
                 w _ITM_deregisterTMCloneTable
                 w _ITM_registerTMCloneTable
0000000000004010 D __TMC_END__
                 U __assert_fail@GLIBC_2.2.5
0000000000004010 B __bss_start
                 w __cxa_finalize@GLIBC_2.2.5
0000000000004000 D __data_start
0000000000004008 D __dso_handle
                 w __gmon_start__
                 U __libc_start_main@GLIBC_2.34
                 U __stack_chk_fail@GLIBC_2.4
0000000000004010 D _edata
0000000000004018 B _end
0000000000001e90 T _fini
0000000000001000 T _init
0000000000001160 T _start
0000000000004000 W data_start
                 U free@GLIBC_2.2.5
0000000000001776 T freeString
0000000000001e63 T main
                 U malloc@GLIBC_2.2.5
                 U memcpy@GLIBC_2.14
00000000000017c9 T printDouble
0000000000001798 T printLong
00000000000017fc T printString
                 U printf@GLIBC_2.2.5
                 U putchar@GLIBC_2.2.5
                 U puts@GLIBC_2.2.5
                 U realloc@GLIBC_2.2.5
0000000000001961 T storeLongs
0000000000001b8b T storeStrings
0000000000001d61 T storeStringsAllocated
```


## objdump

View information about object files.

More information: <https://manned.org/objdump>.

- Display the file header information:

`objdump -f {{binary}}`

- Display the dis-assembled output of executable sections:

`objdump -d {{binary}}`

- Display a complete binary hex dump of all sections:

`objdump -s {{binary}}`

## strings

Find printable strings in an object or binary file.

- Print all strings in a binary:

`strings {{file}}`

- Limit results to strings at least *length* characters long:

`strings -n {{length}} {{file}}`

- Prefix each result with its offset within the file (use decimal):

`strings -t d {{file}}`

- Prefix each result with its offset within the file (use hex):

`strings -t x {{file}}`
