Packages


# concise list

```bash
sudo dpkg-query -f '${binary:Package}\n' -W
```




# PKG LISTING

list installed packages (version, arch, desc)

```bash
sudo dpkg-query -f '${binary:Package}\n' -W
sudo dpkg -l | grep ^ii
sudo dpkg --get-selections
apt list --installed
```

*dpkg-query -f* sample:
```
zlib1g-dev:amd64
zsh
zsh-common
```

*dpkg --get-selections* sample:
```
accountsservice                                 install
acl                                             install
xserver-xorg-video-intel                        deinstall
```

*dpkg -l* sample:
```
ii  xserver-xorg-legacy          2:1.19.6-1ubuntu4.3 amd64               setuid root Xorg server wrapper
rc  xserver-xorg-video-intel     2:2.99.917+git20171 amd64               X.Org X server -- Intel i8xx, i9xx display driver
```

*apt list --installed* sample:
zyne/bionic 0.1.2-2 all
zziplib-bin/bionic-updates,bionic-security 0.13.62-3.1ubuntu0.18.04.1 amd64
zzuf/bionic 0.15-1 amd64



# CREATE LIST 

create list of installed packages
```
sudo dpkg-query -f '${binary:Package}\n' -W > completePackage.txt
# or
sudo dpkg --get-selections > completePackage.txt
```
install packages listed in a file
`sudo xargs -a completePackage.txt apt install`


ALTERNATIVE
get all installed packages
`sudo apt list --installed | awk -F/ -v ORS=" " 'NR>1 {print $1}' > completePackage.txt`
install packages listed in a file
`sudo apt-get install < completePackage.txt`



# Show Installed Package Size using dpkg-query







