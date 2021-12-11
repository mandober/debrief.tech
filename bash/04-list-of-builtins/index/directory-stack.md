Directory Stack

Directory Stack Builtins - Bash builtin commands to manipulate the directory stack.
The directory stack is a list of recently-visited directories. 
The pushd builtin adds directories to the stack as it changes the current directory, 
and the popd builtin removes specified directories from the stack and changes the 
current directory to the directory removed. The dirs builtin displays the contents of the directory stack.
The contents of the directory stack are also visible as the value of the DIRSTACK shell variable.

dirs [-clpv] [+N | -N]
Display the list of currently remembered directories.
-c	Clears the directory stack by deleting all of the elements. 
-l	Produces a listing using full pathnames; the default listing format uses a tilde to denote the home directory. 
-p	Causes dirs to print the directory stack with one entry per line. 
-v	Causes dirs to print the directory stack with one entry per line, prefixing each entry with its index in the stack. 
+N	Displays the Nth directory (counting from the left of the list printed by dirs when invoked without options), starting with zero. 
-N	Displays the Nth directory (counting from the right of the list printed by dirs when invoked without options), starting with zero. 

popd [-n] [+N | -N]
When no arguments are given, popd removes the top directory from the stack and performs a cd to the new top directory. 
The elements are numbered from 0 starting at the first directory listed with dirs; that is, popd is equivalent to popd +0.
-n	Suppresses the normal change of directory when removing directories from the stack, so that only the stack is manipulated. 
+N	Removes the Nth directory (counting from the left of the list printed by dirs), starting with zero. 
-N	Removes the Nth directory (counting from the right of the list printed by dirs), starting with zero. 

pushd [-n] [+N | -N | dir]
Save the current directory on the top of the directory stack and then cd to dir. With no arguments, pushd exchanges the top two directories.
-n	Suppresses the normal change of directory when adding directories to the stack, so that only the stack is manipulated. 
+N	Brings the Nth directory (counting from the left of the list printed by dirs, starting with zero) to the top of the list by rotating the stack. 
-N	Brings the Nth directory (counting from the right of the list printed by dirs, starting with zero) to the top of the list by rotating the stack. 
dir	Makes the current working directory be the top of the stack, making it the new current directory as if it had been supplied as an argument to the cd builtin. 

