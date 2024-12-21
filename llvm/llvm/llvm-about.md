# LLVM :: About

Compiler parts:
- Front end (`clang`)
- Middle end (`opt`)
- Back end (`llc`)

`clang` takes a `file.c` and pruduces a `file.ll` containing the LLVM IR code. `opt` optimizes the LLVM IR, taking in `file.ll` and producing `file.l`l, which the `llc` finally turns into machine code (or some other kind of code, like assembly), outputing `file.out`.

```
        file.c
      ↙
clang
      ↘
        file.ll
      ↙
opt
      ↘
        file.ll
      ↙
llc
      ↘
        file.out
```

## LLVM Intermediate Representation

The LLVM Intermediate Representation (LLVM IR), although mainly produced i nthe compiling process, is also a bona fide programming language we can use to write programs in. It is a low-level language similar to assembly. It is suitable to be analyzed and optimized by the tools in the LLVM suite.

```c
// callee.c

int callee(const int* X) {
  return *X + 1;
}

int main() {
  int T = 4;
  return callee(&T);
}
```

which can be compiled with `clang -S -emit-llvm callee.c -o callee.ll`.

The `-S` flag indicates we want assembly produced; otherwise we'd get a binary file. The `-emit-llvm` means we want to disassemble the llvm intermediate representation; otherwise it'd produce assembly of the target (current) architecture, like x86.

The contents of the produced file `callee.ll`:

```c ll
; ModuleID = 'callee.c'
source_filename = "callee.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @callee(i32* noundef %0) #0 {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  %4 = load i32, i32* %3, align 4
  %5 = add nsw i32 %4, 1
  ret i32 %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 4, i32* %2, align 4
  %3 = call i32 @callee(i32* noundef %2)
  ret i32 %3
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
```


To get the AST:
`clang -c -Xclang -ast-dump callee.c`
