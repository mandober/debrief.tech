# UNIX philosophy

https://en.wikipedia.org/wiki/Unix_philosophy

The Unix philosophy, originated by Ken Thompson, is a set of cultural norms and philosophical approaches to minimalist, modular software development. It is based on the experience of leading developers of the Unix operating system.

Early Unix developers were important in bringing the concepts of *modularity* and *reusability* into software engineering practice, spawning a "software tools" movement.

Over time, the leading developers of Unix (and programs that ran on it) established a set of cultural norms for developing software; these norms became as important and influential as the technology of Unix itself, and have been termed the "Unix philosophy". Ken Thompson and Dennis Ritchie were the key proponents of the Unix philosophy.

The Unix philosophy emphasizes building simple, compact, clear, modular, and extensible code that can be easily maintained and repurposed. It favors composability to monolithic design.

The Unix philosophy:

- Make each program do one thing and do it well. For new tasks, build afresh rather than complicate existing programs with additional features.

- Expect output of a program to become input of another. Don't clutter output with extraneous information. Avoid rigid columnar or binary input formats. Don't insist on interactive input.

- Design and build software, even OSs, to be tried early, ideally within weeks. Don't hesitate to throw away the clumsy parts and rebuild them.
- Use tools in preference to unskilled help to lighten a programming task, even if you have to detour to build the tools and expect to throw some of them out after you've finished using them.

Summarized in 1994 by Peter H. Salus in A Quarter-Century of Unix:
- Write programs that do one thing and do it well.
- Write programs to work together.
- Write programs to handle text streams (it's the universal interface).

In their Unix paper of 1974, Ritchie and Thompson quote thse design considerations:
- Make it easy to write, test, and run programs
- Interactive use instead of batch processing
- Self-supporting system - all Unix software is maintained under Unix
- Economy and elegance of design due to size constraints ("salvation through suffering")

Key concepts
- do one thing and do it well (DOTADIW)

Eric Raymond's 17 Unix Rules
- Build modular programs
- Write readable programs
- Use composition
- Separate mechanisms from policy
- Write simple programs
- Write small programs
- Write transparent programs
- Write robust programs
- Make data complicated when required, not the program
- Build on potential users' expected knowledge
- Avoid unnecessary output
- Write programs which fail in a way that is easy to diagnose
- Value developer time over machine time
- Write abstract programs that generate code instead of writing code by hand
- Prototype software before polishing it
- Write flexible and open programs
- Make the program and protocols extensible.
