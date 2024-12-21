# Standard streams

The problem with the standard streams is the asymmetry between the input and output - there is one input but two output streams, which makes composition difficult. A pipeline of commands is composed by connecting the stdout of the previous to the stdin of the next command, with the stderr streams left to point where they usually do, i.e. to terminal screen.

```
    stdin┌────────┐stdout    stdin┌────────┐stdout    stdin┌────────┐stdout
┌→──────→┤        ├→─────────────→┤        ├→─────────────→┤        ├→──────┐
│        │cmd1    │               │cmd2    │               │cmd3    │       │
│        └───────┬┘               └───────┬┘               └───────┬┘       │
│         stderr │                 stderr │                 stderr │        │
↑                ↓                        ↓                        ↓        ↓
keboard        monitor                 monitor               monitor   monitor
```
