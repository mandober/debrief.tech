# Managing CLI options

- options
- non-options (args)
- short options
- long options
- flags (boolean options)
- short vs long relation
  - paired up (corresponding) short and long option
  - unique short
  - unique long
- clustered short options
  - with optional/required arg
- specifying optional/required arg
  - space separated
  - equals separated
  - glued on
- options with optional arg/operand
- options with required arg/operand
- abbreviated long options
- subcommands
- positional args


```yaml
name: command-name
description: desc of the utility
options:
  - option:
    - opt-title: output file
    - opt-desc: Specify the output file for dumping the configured style.
    - opt-long: --output-file
    - opt-short: -o
  - option:
    - opt-title: output file
    - opt-desc: Extract data from the ambient. It takes a required arg whic hmust end in 2 shakes of a lamb's tail.
    - opt-long: --ambient
    - opt-short: -a
    - opt-arg-req: lamb tail shake
  - option:
      - -v
      - --verbose
version: cmd 1.00
```


An entry has following key-values:
- name (string)
- description (string)
- options (list)
  - names (list of strings)
  - argument (string)
  - description (string)
- [optional] positional arguments
  - name (string)
  - description (string)
- [optional] subcommands
  - (a list of the entire structure)
- [optional] inherited options (same type as options)
- [optional] usage (string)
- [optional] version (string)
- [optional] tldr (string)

---

```json
{
  "name": "apt-get",
  "description": "apt-get",
  "options": [
    {
      "names": ["--no-install-recommends"],
      "argument": "",
      "description": "Do not consider recommended packages as a dependency for installing. Configuration Item: APT::Install-Recommends."
    },
    {
      "names": ["--install-suggests"],
      "argument": "",
      "description": "Consider suggested packages as a dependency for installing. Configuration Item: APT::Install-Suggests."
    },
    {
      "names": ["-d", "--download-only"],
      "argument": "",
      "description": "Download only; package files are only retrieved, not unpacked or installed. Configuration Item: APT::Get::Download-Only."
    },
    {
      "names": ["-f", "--fix-broken"],
      "argument": "",
      "description": "Fix; attempt to correct a system with broken dependencies in place. This option, when used with install/remove, can omit any packages to permit APT to deduce a likely solution. If packages are specified, these have to completely correct the problem. The option is sometimes necessary when running APT for the first time; APT itself does not allow broken package dependencies to exist on a system. It is possible that a system's dependency structure can be so corrupt as to require manual intervention (which usually means using dpkg --remove to eliminate some of the offending packages). Use of this option together with -m may produce an error in some situations. Configuration Item: APT::Get::Fix-Broken."
    },
    {
      "names": ["-m", "--ignore-missing", "--fix-missing"],
      "argument": "",
      "description": "Ignore missing packages; if packages cannot be retrieved or fail the integrity check after retrieval (corrupted package files), hold back those packages and handle the result. Use of this option together with -f may produce an error in some situations. If a package is selected for installation (particularly if it is mentioned on the command line) and it could not be downloaded then it will be silently held back. Configuration Item: APT::Get::Fix-Missing."
    },
    {
      "names": ["--no-download"],
      "argument": "",
      "description": "Disables downloading of packages. This is best used with --ignore-missing to force APT to use only the .debs it has already downloaded. Configuration Item: APT::Get::Download."
    },
    {
      "names": ["-q", "--quiet"],
      "argument": "",
      "description": "Quiet; produces output suitable for logging, omitting progress indicators. More q's will produce more quiet up to a maximum of 2. You can also use -q=# to set the quiet level, overriding the configuration file. Note that quiet level 2 implies -y; you should never use -qq without a no-action modifier such as -d, --print-uris or -s as APT may decide to do something you did not expect. Configuration Item: quiet."
    },
    {
      "names": [
        "-s",
        "--simulate",
        "--just-print",
        "--dry-run",
        "--recon",
        "--no-act"
      ],
      "argument": "",
      "description": "No action; perform a simulation of events that would occur based on the current system state but do not actually change the system. Locking will be disabled (Debug::NoLocking) so the system state could change while apt-get is running. Simulations can also be executed by non-root users which might not have read access to all apt configuration distorting the simulation. A notice expressing this warning is also shown by default for non-root users (APT::Get::Show-User-Simulation-Note). Configuration Item: APT::Get::Simulate."
    },
    {
      "names": ["-y", "--yes", "--assume-yes"],
      "argument": "",
      "description": "Automatic yes to prompts; assume \"yes\" as answer to all prompts and run non-interactively. If an undesirable situation, such as changing a held package, trying to install an unauthenticated package or removing an essential package occurs then apt-get will abort. Configuration Item: APT::Get::Assume-Yes."
    },
    {
      "names": ["--assume-no"],
      "argument": "",
      "description": "Automatic \"no\" to all prompts. Configuration Item: APT::Get::Assume-No."
    },
    {
      "names": ["--no-show-upgraded"],
      "argument": "",
      "description": "Do not show a list of all packages that are to be upgraded. Configuration Item: APT::Get::Show-Upgraded."
    },
    {
      "names": ["-V", "--verbose-versions"],
      "argument": "",
      "description": "Show full versions for upgraded and installed packages. Configuration Item: APT::Get::Show-Versions."
    },
    {
      "names": ["-a", "--host-architecture"],
      "argument": "",
      "description": "This option controls the architecture packages are built for by apt-get source --compile and how cross-builddependencies are satisfied. By default is it not set which means that the host architecture is the same as the build architecture (which is defined by APT::Architecture). Configuration Item: APT::Get::Host-Architecture."
    },
    {
      "names": ["-P", "--build-profiles"],
      "argument": "",
      "description": "This option controls the activated build profiles for which a source package is built by apt-get source --compile and how build dependencies are satisfied. By default no build profile is active. More than one build profile can be activated at a time by concatenating them with a comma. Configuration Item: APT::Build-Profiles."
    },
    {
      "names": ["-b", "--compile", "--build"],
      "argument": "",
      "description": "Compile source packages after downloading them. Configuration Item: APT::Get::Compile."
    },
    {
      "names": ["--ignore-hold"],
      "argument": "",
      "description": "Ignore package holds; this causes apt-get to ignore a hold placed on a package. This may be useful in conjunction with dist-upgrade to override a large number of undesired holds. Configuration Item: APT::Ignore-Hold."
    },
    {
      "names": ["--with-new-pkgs"],
      "argument": "",
      "description": "Allow installing new packages when used in conjunction with upgrade. This is useful if the update of an installed package requires new dependencies to be installed. Instead of holding the package back upgrade will upgrade the package and install the new dependencies. Note that upgrade with this option will never remove packages, only allow adding new ones. Configuration Item: APT::Get::Upgrade-Allow-New."
    },
    {
      "names": ["--no-upgrade"],
      "argument": "",
      "description": "Do not upgrade packages; when used in conjunction with install, no-upgrade will prevent packages on the command line from being upgraded if they are already installed. Configuration Item: APT::Get::Upgrade."
    },
    {
      "names": ["--only-upgrade"],
      "argument": "",
      "description": "Do not install new packages; when used in conjunction with install, only-upgrade will install upgrades for already installed packages only and ignore requests to install new packages. Configuration Item: APT::Get::Only-Upgrade."
    },
    {
      "names": ["--allow-downgrades"],
      "argument": "",
      "description": "This is a dangerous option that will cause apt to continue without prompting if it is doing downgrades. It should not be used except in very special situations. Using it can potentially destroy your system! Configuration Item: APT::Get::allow-downgrades. Introduced in APT 1.1."
    },
    {
      "names": ["--allow-remove-essential"],
      "argument": "",
      "description": "Force yes; this is a dangerous option that will cause apt to continue without prompting if it is removing essentials. It should not be used except in very special situations. Using it can potentially destroy your system! Configuration Item: APT::Get::allow-remove-essential. Introduced in APT 1.1."
    },
    {
      "names": ["--allow-change-held-packages"],
      "argument": "",
      "description": "Force yes; this is a dangerous option that will cause apt to continue without prompting if it is changing held packages. It should not be used except in very special situations. Using it can potentially destroy your system! Configuration Item: APT::Get::allow-change-held-packages. Introduced in APT 1.1."
    },
    {
      "names": ["--force-yes"],
      "argument": "",
      "description": "Force yes; this is a dangerous option that will cause apt to continue without prompting if it is doing something potentially harmful. It should not be used except in very special situations. Using force-yes can potentially destroy your system! Configuration Item: APT::Get::force-yes. This is deprecated and replaced by --allow-unauthenticated , --allow-downgrades , --allow-remove-essential , --allow-change-held-packages in 1.1."
    },
    {
      "names": ["--print-uris"],
      "argument": "",
      "description": "Instead of fetching the files to install their URIs are printed. Each URI will have the path, the destination file name, the size and the expected MD5 hash. Note that the file name to write to will not always match the file name on the remote site! This also works with the source and update commands. When used with the update command the MD5 and size are not included, and it is up to the user to decompress any compressed files. Configuration Item: APT::Get::Print-URIs."
    },
    {
      "names": ["--purge"],
      "argument": "",
      "description": "Use purge instead of remove for anything that would be removed. An asterisk (\"*\") will be displayed next to packages which are scheduled to be purged. remove --purge is equivalent to the purge command. Configuration Item: APT::Get::Purge."
    },
    {
      "names": ["--reinstall"],
      "argument": "",
      "description": "Re-install packages that are already installed and at the newest version. Configuration Item: APT::Get::ReInstall."
    },
    {
      "names": ["--list-cleanup"],
      "argument": "",
      "description": "This option is on by default; use --no-list-cleanup to turn it off. When it is on, apt-get will automatically manage the contents of /var/lib/apt/lists to ensure that obsolete files are erased. The only reason to turn it off is if you frequently change your sources list. Configuration Item: APT::Get::List-Cleanup."
    },
    {
      "names": ["-t", "--target-release", "--default-release"],
      "argument": "",
      "description": "This option controls the default input to the policy engine; it creates a default pin at priority 990 using the specified release string. This overrides the general settings in /etc/apt/preferences. Specifically pinned packages are not affected by the value of this option. In short, this option lets you have simple control over which distribution packages will be retrieved from. Some common examples might be -t '2.1*', -t unstable or -t sid. Configuration Item: APT::Default-Release; see also the apt_preferences(5) manual page."
    },
    {
      "names": ["--trivial-only"],
      "argument": "",
      "description": "Only perform operations that are 'trivial'. Logically this can be considered related to --assume-yes; where --assume-yes will answer yes to any prompt, --trivial-only will answer no. Configuration Item: APT::Get::Trivial-Only."
    },
    {
      "names": ["--no-remove"],
      "argument": "",
      "description": "If any packages are to be removed apt-get immediately aborts without prompting. Configuration Item: APT::Get::Remove."
    },
    {
      "names": ["--auto-remove", "--autoremove"],
      "argument": "",
      "description": "If the command is either install or remove, then this option acts like running the autoremove command, removing unused dependency packages. Configuration Item: APT::Get::AutomaticRemove."
    },
    {
      "names": ["--only-source"],
      "argument": "",
      "description": "Only has meaning for the source and build-dep commands. Indicates that the given source names are not to be mapped through the binary table. This means that if this option is specified, these commands will only accept source package names as arguments, rather than accepting binary package names and looking up the corresponding source package. Configuration Item: APT::Get::Only-Source."
    },
    {
      "names": ["--diff-only", "--dsc-only", "--tar-only"],
      "argument": "",
      "description": "Download only the diff, dsc, or tar file of a source archive. Configuration Item: APT::Get::Diff-Only, APT::Get::Dsc-Only, and APT::Get::Tar-Only."
    },
    {
      "names": ["--arch-only"],
      "argument": "",
      "description": "Only process architecture-dependent build-dependencies. Configuration Item: APT::Get::Arch-Only."
    },
    {
      "names": ["--indep-only"],
      "argument": "",
      "description": "Only process architecture-independent build-dependencies. Configuration Item: APT::Get::Indep-Only."
    },
    {
      "names": ["--allow-unauthenticated"],
      "argument": "",
      "description": "Ignore if packages can't be authenticated and don't prompt about it. This can be useful while working with local repositories, but is a huge security risk if data authenticity isn't ensured in another way by the user itself. The usage of the Trusted option for sources.list(5) entries should usually be preferred over this global override. Configuration Item: APT::Get::AllowUnauthenticated."
    },
    {
      "names": ["--no-allow-insecure-repositories"],
      "argument": "",
      "description": "Forbid the update command to acquire unverifiable data from configured sources. APT will fail at the update command for repositories without valid cryptographically signatures. See also apt-secure(8) for details on the concept and the implications. Configuration Item: Acquire::AllowInsecureRepositories."
    },
    {
      "names": ["--allow-releaseinfo-change"],
      "argument": "",
      "description": "Allow the update command to continue downloading data from a repository which changed its information of the release contained in the repository indicating e.g a new major release. APT will fail at the update command for such repositories until the change is confirmed to ensure the user is prepared for the change. See also apt-secure(8) for details on the concept and configuration."
    },
    {
      "names": ["--show-progress"],
      "argument": "",
      "description": "Show user friendly progress information in the terminal window when packages are installed, upgraded or removed. For a machine parsable version of this data see README.progress-reporting in the apt doc directory. Configuration Items: Dpkg::Progress and Dpkg::Progress-Fancy."
    },
    {
      "names": ["--with-source"],
      "argument": "filename",
      "description": "Adds the given file as a source for metadata. Can be repeated to add multiple files. See --with-source description in apt-cache(8) for further details."
    },
    {
      "names": ["-e", "--error-on"],
      "argument": "any",
      "description": "Fail the update command if any error occured, even a transient one."
    },
    {
      "names": ["-h", "--help"],
      "argument": "",
      "description": "Show a short usage summary."
    },
    {
      "names": ["-v", "--version"],
      "argument": "",
      "description": "Show the program version."
    },
    {
      "names": ["-c", "--config-file"],
      "argument": "",
      "description": "Configuration File; Specify a configuration file to use. The program will read the default configuration file and then this configuration file. If configuration settings need to be set before the default configuration files are parsed specify a file with the APT_CONFIG environment variable. See apt.conf(5) for syntax information."
    },
    {
      "names": ["-o", "--option"],
      "argument": "",
      "description": "Set a Configuration Option; This will set an arbitrary configuration option. The syntax is -o Foo::Bar=bar. -o and --option can be used multiple times to set different options."
    }
  ],
  "subcommands": [
    {
      "name": "update",
      "description": "Retrieve new lists of packages",
      "options": []
    },
    { "name": "upgrade", "description": "Perform an upgrade", "options": [] },
    {
      "name": "install",
      "description": "Install new packages (pkg is libc6 not libc6.deb)",
      "options": []
    },
    {
      "name": "reinstall",
      "description": "Reinstall packages (pkg is libc6 not libc6.deb)",
      "options": []
    },
    { "name": "remove", "description": "Remove packages", "options": [] },
    {
      "name": "purge",
      "description": "Remove packages and config files",
      "options": []
    },
    {
      "name": "autoremove",
      "description": "Remove automatically all unused packages",
      "options": []
    },
    {
      "name": "dist-upgrade",
      "description": "Distribution upgrade, see apt-get(8)",
      "options": []
    },
    {
      "name": "dselect-upgrade",
      "description": "Follow dselect selections",
      "options": []
    },
    {
      "name": "build-dep",
      "description": "Configure build-dependencies for source packages",
      "options": []
    },
    {
      "name": "satisfy",
      "description": "Satisfy dependency strings",
      "options": []
    },
    {
      "name": "clean",
      "description": "Erase downloaded archive files",
      "options": []
    },
    {
      "name": "autoclean",
      "description": "Erase old downloaded archive files",
      "options": []
    },
    {
      "name": "check",
      "description": "Verify that there are no broken dependencies",
      "options": []
    },
    {
      "name": "source",
      "description": "Download source archives",
      "options": []
    },
    {
      "name": "download",
      "description": "Download the binary package into the current directory",
      "options": []
    },
    {
      "name": "changelog",
      "description": "Download and display the changelog for the given package",
      "options": []
    }
  ],
  "tldr": "> Debian and Ubuntu package management utility.\n> Search for packages using `apt-cache`.\n> More information: <https://manpages.debian.org/latest/apt/apt-get.8.html>.\n\n- Update the list of available packages and versions (it's recommended to run this before other `apt-get` commands):\n\n`apt-get update`\n\n- Install a package, or update it to the latest available version:\n\n`apt-get install {{package}}`\n\n- Remove a package:\n\n`apt-get remove {{package}}`\n\n- Remove a package and its configuration files:\n\n`apt-get purge {{package}}`\n\n- Upgrade all installed packages to their newest available versions:\n\n`apt-get upgrade`\n\n- Clean the local repository - removing package files (`.deb`) from interrupted downloads that can no longer be downloaded:\n\n`apt-get autoclean`\n\n- Remove all packages that are no longer needed:\n\n`apt-get autoremove`\n\n- Upgrade installed packages (like `upgrade`), but remove obsolete packages and install additional packages to meet new dependencies:\n\n`apt-get dist-upgrade`\n"
}
```
