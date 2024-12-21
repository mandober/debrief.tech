# Ghost in the shell

Shell is a lot like a document in the browser - there is the main document pane in the center that presents varoius content, there's a scroll bar to the left, and the mouse is almost always supported as well. This means there is a set of events with strong correspondence. 

## Shell events

The natural kind of event in the shell environment are *signals*, triggered by the user (or the system, i.e. operating system et al.). The user can send a particula signal to the shell using the `kill` command (or similar) or via a keyboard binding. There are a few elementary bindings that are predefined in the Linux environment:
- C-z suspend
- C-c int
- C-d EOL

The first type of event that almost all environments with eventing support is the *timer* that usually offers two modes of use: as a *timeout*, where an event fires after the set number of time units expires, and *interval*, which fires every x units of time.
