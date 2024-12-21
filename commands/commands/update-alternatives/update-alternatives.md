# update-alternatives

`update-alternatives` - maintain symbolic links determining default commands

## TL/DR


## The problem of software with a common name

When multiple utilities intended for the same thing (like text editors, pagers, browsers) are available on the system, as well as when a common name is shared by multiple versions (e.g. python, pip), *the alternatives system* tries to manage and makes sense of things by establishing associations between commands and paths, and employing a priority schema for the eponymous commands.

The canonical example is the complication that comes with the Python. First, there are still two, to some extent incompatible, Python versions, namely Python 2 and Python 3. Although Python 3 is the recommended version, still some things require Python 2. Both of these major Python versions have several minor versions that may be installed on the system, *Python 2.xx* and *Python 3.xx*, with the latest of each one of these representing the Python binary that should run when the user requests `python2` or `python3`. So that, e.g. typing `python3` actually runs *Python 3.11*, which can also run by issuing its exact version, `python311`. And what should run when the user types only `python` is something best resolved by users themselves.

So, it may be desirable (for some period, perhaps until a new Python version becomes available) to have *Python 3.11* run when the user types any of these:
- python
- python3
- python311
- python3x
- python3xx

Moreover, since Python comes with its package manager *pip*, the Python binary should be associatied with the proper *pip* binary. So that, if the "default" Python version is Python 3, started by typing just `python`, the corresponding pip version should be *pip 3*, started by typing just `pip`. And similarly for the other accompanying tooling that dependes on a particular major version of the main Python binary.

So with the focus on Python, the Alternatives System should manage
- installed versions of the *main binary* (python3, python310, python2)
- installed versions of the *associated tooling* (pip, pip3, pip2)
- aliases (symlinks, hardlinks) to expose all these binaries
- binaries the canonical name points to (`python` -> /usr/bin/…/python311)

## Names

In this context, a **name** is the name of the command typed on the command line, that refers to the binary file of a particular utility.

Utilities, especially the compilers and interpreters of programming languages, have a **canonical name** - that is, the default or bare name, like `python` and `pip`, which is almost always ambiguous.

The versioning schemas help maintain an order between different releases of a software product, so there is at least the **major version number** and the **minor version number**, although additional sets of numbers (e.g. patch version numbers) are also common. Thus, we may have *Python 3.11*, which is sluggified to `python311` before it is used as a file name.

- Canonical name (python, pip)
- Name + major version (python3, pip3, python3x)
- Name + major + minor version (python3.11, python3xx)

## update-alternatives

The command `update-alternatives` is used to manage names.

If you have several versions of a utility, use `update-alternatives` to configure the associations between names and utility's versions. Set which name should be used by default (canonical name). Re-configure the associations.


## Examples

There are several packages which provide a vi-compatible text editor, e.g. `vi`, `vim`, `view`, `evim`, `ex`, `nvi`, `nvim`

Which one is used is controlled by the **link group** `vi`, which includes *links for the program itself and the associated man page*.

To display the available packages which provide 'vi' and the current setting for it, use the `--display` action:

    update-alternatives --display vi


To choose a particular 'vi' implementation, use this command, then select a number from the list:

    sudo update-alternatives --config vi

To go back to having the 'vi' implementation chosen automatically:

    sudo update-alternatives --auto vi


```bash
$update-alternatives --display vi

vi - auto mode
  link best version is      /usr/bin/vim.basic
  link currently points to  /usr/bin/vim.basic
  link vi is                /usr/bin/vi
  slave vi.1.gz    is /usr/share/man/man1/vi.1.gz
  slave vi.da.1.gz is /usr/share/man/da/man1/vi.1.gz
  slave vi.de.1.gz is /usr/share/man/de/man1/vi.1.gz
  slave vi.fr.1.gz is /usr/share/man/fr/man1/vi.1.gz
  slave vi.it.1.gz is /usr/share/man/it/man1/vi.1.gz
  slave vi.ja.1.gz is /usr/share/man/ja/man1/vi.1.gz
  slave vi.pl.1.gz is /usr/share/man/pl/man1/vi.1.gz
  slave vi.ru.1.gz is /usr/share/man/ru/man1/vi.1.gz

/usr/bin/vim.basic - priority 30
  slave vi.1.gz:    /usr/share/man/man1/vim.1.gz
  slave vi.da.1.gz: /usr/share/man/da/man1/vim.1.gz
  slave vi.de.1.gz: /usr/share/man/de/man1/vim.1.gz
  slave vi.fr.1.gz: /usr/share/man/fr/man1/vim.1.gz
  slave vi.it.1.gz: /usr/share/man/it/man1/vim.1.gz
  slave vi.ja.1.gz: /usr/share/man/ja/man1/vim.1.gz
  slave vi.pl.1.gz: /usr/share/man/pl/man1/vim.1.gz
  slave vi.ru.1.gz: /usr/share/man/ru/man1/vim.1.gz

/usr/bin/vim.tiny - priority 15
  slave vi.1.gz:    /usr/share/man/man1/vim.1.gz
  slave vi.da.1.gz: /usr/share/man/da/man1/vim.1.gz
  slave vi.de.1.gz: /usr/share/man/de/man1/vim.1.gz
  slave vi.fr.1.gz: /usr/share/man/fr/man1/vim.1.gz
  slave vi.it.1.gz: /usr/share/man/it/man1/vim.1.gz
  slave vi.ja.1.gz: /usr/share/man/ja/man1/vim.1.gz
  slave vi.pl.1.gz: /usr/share/man/pl/man1/vim.1.gz
  slave vi.ru.1.gz: /usr/share/man/ru/man1/vim.1.gz


$update-alternatives --display sh
# update-alternatives: error: no alternatives for sh


```


## Refs

* Alternatives system (homepage)
http://alternatives.sourceforge.net/

* update-alternatives (focal)
https://manpages.ubuntu.com/manpages/focal/man1/update-alternatives.1.html



* update-alternatives(8) - Linux man page
https://linux.die.net/man/8/update-alternatives

* How to Use update-alternatives Command on Ubuntu
https://linuxhint.com/update_alternatives_ubuntu/

* update-alternatives: Managing Multiple Versions of Commands and Files | Administration Guide | SUSE Linux Enterprise Server 15 SP1
https://documentation.suse.com/es-es/sles/15-SP1/html/SLES-all/cha-update-alternative.html
