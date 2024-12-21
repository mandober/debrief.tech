# Bash as a programming language

Bash is a terrible programming language mainly because the principal organizational units, shell functions, have a very limiting mechanics of input and, especially, output.

A function cannot return anything but a single, usually 8-bit, integer, that indicates its return status code. Therefore, any meaningful output must be done indirectly - a common approach is to capture the appropriate file descriptor's stream. Perhaps this wouldn't even matter if the performance didn't suffer so fucking much.

This slowdown cannot be noticed, e.g. when calling a single function from the command line, that does something ordinary, and then returns immediately. However, the problem gets traction as soon as you start "weaving" a couple of functions - a chain of function calls, with functions calling each other, with the exchange of input and output functionly fluids full on, the slowdown becomes noticable, then unnerving, then unbearable.

This problem is known for a long time now, but perhaps because the development of bash is not so open, [seemingly] with Chat Remay calling the shots, and the bash code base by now [probably] resambling a late phase of spaghetti decay, for your shell here's a pretty flower.

And the slowdown doesn't affect every, even most, styles of shell scripting. It does its worse only in case of highly-structured, robust, comprehensive and tidy code, where the code base is split by functionality into self-contained and highly-decoupled modules, advancing the formation of the proper standard library of bash code, and sparking a small but nascent community that has already developed the pickett-fence surrounding tooling and a heartache (nothing but a heartache).
