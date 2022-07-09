```bash
#!/usr/bin/env bash

#| script to update the pandoc binary (on Linux 64 bit) to its latest version
#| https://github.com/jgm/pandoc/wiki/update-script

#| debug output and exit on error or use of undeclared variable or pipe error:
set -o xtrace -o errtrace -o errexit -o nounset -o pipefail

repo="$HOME/bin/repos/pandoc"
mkdir --parents "$repo"

#| Base URL to the github repo
remote="https://github.com/jgm/pandoc/releases/"

#| URL to the latest version info (workaround, needs digging)
latest=${remote}latest

#$ curl --location --head $latest
#: ...
#: location: https://github.com/jgm/pandoc/releases/tag/2.14.0.1
#: ...

#| loc=$(curl --location --head $latest | grep -i location)
#| 

latest_tag="$(curl --location --head $latest | grep -i 'location:' | sed 's/^.*\/tag\/\([^\/]*\)\r$/\1/')"

filename=pandoc-${latest_tag}-linux-amd64.tar.gz

uri_to_download="https://github.com/jgm/pandoc/releases/download/${latest_tag}/${filename}"

(
cd "$(mktemp --directory "${TMPDIR:-/tmp}/tmp.XXXXXXXXXX")"
    curl --fail --show-error --remote-name --location "$uri_to_download"
    env XZ_OPT=-T0 tar --gzip -xvf "$filename"
    chmod a+x pandoc-${latest_tag}/bin/pandoc
    cp        pandoc-${latest_tag}/bin/pandoc "$repo"/
    cp        pandoc-${latest_tag}/share/man/man1/pandoc.1.gz "$repo"/
)

if [ ! -x "${repo}/pandoc" ]; then
  echo '"pandoc" was not successfully installed!' >&2
  exit 2
fi
```
