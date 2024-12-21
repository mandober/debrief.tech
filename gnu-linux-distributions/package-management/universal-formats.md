# Universal formats

- Snap
- Flatpak
- AppImage


Distros use different packaging systems for their applications (dnf, apt, eopkg). These rely on linking to shared libraries known to be present on that specific distro (OS version). 

For developers of small utilities this is a major problem. First, it is often complicated to make a package from the application, and then they have to maintain it for each version of their utility and for each version of the distro.

If you want your app to work it must be available in the package ecosystem and getting it there can be onerous. 

If they can get the app into the official repositories, then it gets maintained by professionals. This can be enormously off putting and not worth the effort.

(Rant) off-putting damn right! Failing to be come across as off-putting gets you into Barney. Those maintainers loose enough time as it is to make sure the crucial software from offical repositories doesn't act weird. They need to keep making sure of this with each new version of a myriad of software and then with each new distro release. Last they wanna hear is one man army developers nagging to be let inside the holiest of the holies. But for popular tools this goes way smoother. Basically, if the app the user installed from an offical repo shits the bed, then it is their fault, and then these maintainers get yelled by managers above for destorying the little reputation and UX they had. But if the user, acting against offical recommendations, installs dubious shit from elsewhere - then they have no problem telling that user to fuck off if they dare complain.

## Snap, Flatpak and AppImage

The 3 main such universal formats are Snaps, Flatpak and AppImage. The general idea is that the app runs in a container with limited access to the host system (a 'sandbox'). AppImage is the oldest and most straightforward solution in some ways. All the dependencies are bundled together using a build recipe and the file (.AppImage) is shared as a single binary which is simply downloaded and run. They have limited security features so could be potentially risky to use. Though the files can be signed. The packages work on a large number of systems. There is a website, AppImageHub for hosting them though you can download them from anywhere.
