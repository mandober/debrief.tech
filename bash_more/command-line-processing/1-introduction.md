# Command line processing :: Introduction

Despite numerous descriptions of the stages the Bash shell undergoes when processing a command line, there are some inconsistencies and disagreements between the sources.

Command-line processing is definitely not a term that uniquely pinpoints its subject matter. The term is sometimes used to mean the process of parsing command line options, which falls under the jurisdiction of authors of programs and scripts (this is what the bash builtin `getopts`can help with).

*Command-line processing* is used here to mean the internal algorithm that bash follows when processing input. This input 


Like all CLI programs, Bash reads input from stdin. stdin may be connected to the terminal, such that the user 

- directly from the user as submitted command line
- form a script
- as a string to `-c` invocation option
