# Command line editing

At the command line, users type in text via keyboard. 
Prior to commiting the line (e.g. by pressing RET), 
the text may be edited using the editing facilities. 
The available editing facilities are multi-layered: 
some rudementary aspects are controlled by lower-level entities 
at the terminal level, but most aspects, expecially the more advanced ones, 
are controlled by a high-level facilities particularly designated for that task. With bash, this is usually under the jurisdiction of the `readline` utility, which comes bundled with bash-the-shell.


rudementary line editing is provided by lower-level entities, 

some rudementary line editing is provided at the terminal level, 
and may be controlled using the `stty` utility.



layer is at the terminal level and some of 

At the command line, users type in the raw text, possibly making some edits. The command line editing facilities are multi-layered: 


and after commiting the current line buffer (e.g. by pressing RET), the shell (bash) must process the current line buffer
