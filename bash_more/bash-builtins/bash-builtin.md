# Bash :: Glossary

# Builtin
A builtin is a compiled unit of code and made available as an internal bash command, which crucially means that it is executed *in the same shell* in which it was invoked - the most important consequence being that builtins can affect the current environment. A builtin encapsulates a particular functionality, but unlike, e.g. shell functions, they are usually pre-compiled and embedded into the main bash executable (so they run faster). However, users are allowed to create their own custom builtin commands, which after compilation appear as standalone files that can be managed by the `enable` and `disable` bash builtins.



usually embedded within the bash executable, but it may also appear as a separate binary file. The crucial difference between them and other binaries across the system is that the builtins are executed within the same shell environment. This is contrasted with other, external, binary files, which are commands that are always executed in a subshell (child shell).


in the form of a compiled binary file

even though it may take the form 
in the form of a compiled executable.
