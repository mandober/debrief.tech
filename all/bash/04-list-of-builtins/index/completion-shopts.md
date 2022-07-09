# Shopt Options for Configuring Completion


progcomp
direxpand
dirspell
force_fignore
no_empty_cmd_completion
hostcomplete
complete_fullquote
completion_strip_exe

progcomp
If set, the programmable completion facilities are enabled. This option is enabled by default.

direxpand
If set, bash replaces directory names with the results of word expansion when performing filename completion. 
This changes the contents of the readline editing buffer. If not set, bash attempts to preserve what the user typed.
When enabled, vars that hold dir names, like HOME, will be expanded immediately there on the command line, upon pressing the TAB key

dirspell
If set, bash attempts spelling correction on directory names during 
word completion if the directory name initially supplied does not exist.

force_fignore
If set, the suffixes specified by the FIGNORE shell variable cause words to be ignored when performing word 
completion even if the ignored words are the only possible completions. This option is enabled by default.

no_empty_cmd_completion
If set, and readline is being used, bash will not attempt to search the PATH 
for possible completions when completion is attempted on an empty line.

hostcomplete
If set, and readline is being used, bash will attempt to perform hostname completion 
when a word containing a @ is being completed. This is enabled by default.

complete_fullquote
- If set, bash quotes all shell metacharacters in filenames and directory names when performing completion.
- If not set, bash removes metacharacters such as the dollar sign from the set of characters that will be 
  quoted in completed filenames when these metacharacters appear in shell variable references in words to be completed. 
  This means that dollar signs in variable names that expand to directories will not be quoted; 
  however, any dollar signs appearing in filenames will not be quoted, either.
- This is active only when bash is using backslashes to quote completed filenames. 
- This variable is set by default, which is the default bash behavior in versions through 4.2.

completion_strip_exe
Strip .exe when completing executables (Cygwin).
