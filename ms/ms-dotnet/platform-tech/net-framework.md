# .NET Framework

Initially, the name of the software product that provided tooling for developing Windows-only apps was ".NET Framework". 


**.NET Framework** is Microsoft's original Windows-only framework that includes *FCL* and provides interoperability across supported programming languages.

**.NET Core** is open-sourced, cross-platform version of .NET Framework. It is a subset of .Net Framework, free of Windows components. **CoreCLR** is .NET Core's complete runtime implementation of *CLR* that includes **CoreFX**, that is a partial fork of FCL, and **RyuJIT**, a just-in-time compiler.

**.NET Standard** is the .NET specs that standardizes the API common to all implementations.

**.NET Micro Framework** (NETMF) is a bare-bones .NET Framework's essence that includes a stripped down version of CLR, intended for resource-constrained devices (with at least 256 KB of flash and 64 KB of RAM).

**.NET Compiler Platform**, better known as **Roslyn**, is a set of open-source compilers and code analysis API for .NET languages.




**Framework Class Library** (FCL) is a library of classes included in .NET Framework and .NET Core.

**Common Language Runtime** (CLR) is the VM that manages the execution of programs. It also provides language services such as memory management, type safety, exception handling, garbage collection, security, thread management. CLR implements *VES* as defined by *CLI* public standard. Strictly, *CLR* refers to .NET Framework's VM, while *CLRCore* refers to the VM from .Net Core's.

**Virtual Execution System** (VES) is a run-time system of the *CLI* which provides an environment for executing managed code. It provides direct support for a set of built-in data types, defines a hypothetical machine with an associated machine model and state, a set of control flow constructs and an exception handling model. To a large extent, the purpose of the VES is to provide the support required to execute CIL instruction set.

**Common Intermediate Language** (CIL), formerly Microsoft Intermediate Language (`MSIL`), is the lowest-level human-readable language defined by the CLI specification, used by the .NET Framework, .NET Core, and Mono. PLs that target CLR compile to CIL, which is assembled into an object code that has a bytecode-style format. CIL is OO assembly that is entirely stack-based. Its bytecode is translated into native code or executed by VM.
