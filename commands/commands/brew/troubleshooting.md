

`brew doctor`

Please note that these warnings are just used to help the Homebrew maintainers
with debugging if you file an issue. If everything you use Homebrew for is
working fine: please don't worry or file an issue; just ignore this. Thanks!

*Warning*: "config" scripts exist outside your system or Homebrew directories.
`./configure` scripts often look for `*-config` scripts to determine if
software packages are installed, and which additional flags to use when
compiling and linking.

Having additional scripts in your path can confuse software installed via
Homebrew if the config script overrides a system or Homebrew-provided
script of the same name. We found the following "config" scripts:
  /usr/local/php72/bin/php-config

*Warning*: An outdated version (1.7.1) of Git was detected in your PATH.
Git 2.7.0 or newer is required for Homebrew.
Please upgrade:
  brew install git

*Warning*: Your Homebrew's prefix is not /home/linuxbrew/.linuxbrew.
Some of Homebrew's bottles (binary packages) can only be used with the default
prefix (/home/linuxbrew/.linuxbrew).
You will encounter build failures with some formulae.
Please create pull requests instead of asking for help on Homebrew's GitHub,
Discourse, Twitter or IRC. You are responsible for resolving any issues you
experience while you are running this unsupported configuration.

*Error*
Error: undefined method `undent` for #<String:0x0000000002d62c00>
Please report this bug: https://docs.brew.sh/Troubleshooting

/storage/content/07/1010107/.linuxbrew/Homebrew/Library/Homebrew/extend/os/linux/diagnostic.rb:39:in `check_tmpdir_executable`
/storage/content/07/1010107/.linuxbrew/Homebrew/Library/Homebrew/cmd/doctor.rb:60:in `block in doctor`
/storage/content/07/1010107/.linuxbrew/Homebrew/Library/Homebrew/cmd/doctor.rb:52:in `each`
/storage/content/07/1010107/.linuxbrew/Homebrew/Library/Homebrew/cmd/doctor.rb:52:in `doctor`
/storage/content/07/1010107/.linuxbrew/Homebrew/Library/Homebrew/brew.rb:102:in `<main>`