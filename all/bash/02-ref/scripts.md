# Script

scripts
sourceables
- sourceable file
executables
- executable file
- program, executable program
- external command
- binaries, binary files


The first associations to the term "script" is a file with some kind of source code, which applies to shell scripts as well. **Shell scripts** are plain text files that contain commands and are interpreted by the shell. A script may be executed or sourced.

The main difference between **executing** and **sourcing** is that the execution is done in a subshell, which although seemingly identical is a completely separate (child) environment, spawned by the parent's bash shell mitosis.

The execution happens in a subshell, while sourcing happens in the current shell. The child process in the subshell has its own execution environment and it is impossible for a child to influence its parent (inheritance being a one way street).


Binaries are the utilies and tools, compiled programs that commonly live in suitably named `bin` folders in various directories. Binaries can only be executed, they cannot be sourced.



The **executables** (scripts, programs, builtins) are executed, meaning they are run in a different environment then the one from which they were called. The interactive bash shell in which we type commands is the main bash process. To execute a script, the main bash process (shell level 1 or enwar $SHLVL) creates an almost identical copy of itself, a subshell, a



Execution


an executable script, despite the fact that a script may be sourced as well. Considering only the common attributes between the two, we find that a **script** is a plain text file containing shell commands that may be sourced, executed or even both.

Scripts are usually UTF-8 encoded without the BOM (byte-order mark). Scripts that use heredocs with tab-eating option (e.g. `cat << -EOF`) will probably go with the tab indentation; space-based indents are not unseen.


that contains valid shell code. Having the "read" attribute is the only requirement for being able to source a file.


**Executables** are then programs and executable user scripts.


**Sourceables** are files intended to be sourced, not executed.


**External commands**


Since we're focued on the bash and scripting in bash, utilities and other binaries are called 

**Programs (also called 


- having the shebang `#!/usr/bin/env bash`
- having the "execute" attribute (chmodded to u+x)

but since scripts may be executable or sourceable or even both, 
