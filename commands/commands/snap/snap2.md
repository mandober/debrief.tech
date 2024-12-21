# snap

`snap` is a GNU/Linux package installer that runs as a daemon and allows consistent updates and multiversioning of packages.

snap doesn't work in WSL2, the main problem being the lack of `systemd` suport. systemd and similar services do not work (by default) in WSL2. However it can be made to to work with some amount of tinkering.
