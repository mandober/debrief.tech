# KornShell



## Incident

At some time in 2021, a group of peopple has hijacked the AT&T's KornShell repository on GitHub and released a buggy `ksh2020` version built on the `ksh93v-`. However, no one is supporting, maintaining or developing that 2020 version. Some distros like Ubuntu (focal) jumped to include the unofficial `ksh2020` package.

```bash
ksh/focal 2020.0.0-5 amd64         2020 version of the AT&T Korn Shell
ksh93/focal 93u+20120801-7 amd64   Real, AT&T version of the Korn shell
# note the "real" in the description
```

Eventually, AT&T took back control over their repository, reseting the head to the `ksh93u+` version. Catching on, many distros have moved the ksh package back to the latest good version `ksh93u+`. Alas, the official version is not maintained or developed either. There's a promising fork of `ksh93u+` that is being developed at https://github.com/ksh93/ksh ("KornShell lives!"), recently releasing the version `ksh 93u+m`.



* `ksh 93u+m`: KornShell lives!
https://github.com/ksh93/ksh
Latest release: https://github.com/ksh93/ksh/releases
Twitter: https://twitter.com/ksh93um
