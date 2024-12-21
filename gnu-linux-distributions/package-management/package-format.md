# Package format

**Package format** is a type of *file container* containing a program intended for distribution along with the associated *metadata* consumed by *package managers*. An instance of this type of archiving container is called a *package*.

While the *archive file format* itself may be unchanged, package formats carry additional metadata, such as a *manifest file* or certain *directory layouts*.

Packages contain either source code or compiled files, or both.

## Conversion between package formats

Packages may be converted from one type to another with software such as `Alien`. Alien supports conversion between Linux Standard Base (LSB), LSB-compliant `.rpm` packages, `.deb`, Stampede (`.slp`), Solaris (`.pkg`) and Slackware (`.tgz, .txz, .tbz, .tlz`) packages. It is also capable of automatically installing the generated packages, and can try to convert the installation scripts included in the archive as well.

https://en.wikipedia.org/wiki/Alien_(file_converter)
https://sourceforge.net/projects/alien-pkg-convert/
