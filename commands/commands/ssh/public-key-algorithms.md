# Public key algorithms

In Ubuntu 24.04, APT will require repositories to be signed using one of the following public key algorithms:
- RSA but with at least 2048-bit keys
- Ed25519
- Ed448

Previous releases trusted all algorithms trusted by GnuPG.

*1024-bit RSA* keys are widely considered unsafe, with government institutions such as NIST requiring the use of at least 2048 bits for at least 5 years now, but GnuPG and by extension APT was still trusting them.

This assertion also affects various additional eliptic curves such as the *Brainpool family*, *secp256k1*, and the *NIST ECC family*.

These are already considered "unsafe" by the https://safecurves.cr.yp.to/ project, and we believe that *RSA* and the *Ed* family provides plenty of choices to repository owners, including being able to comply with *FIPS* requirements.

PPAs are currently in the process of being upgraded to a *4096-bit RSA key* and we expect that upgrade to be complete by release time.

## Elliptic-Curve Cryptography

ECC     Elliptic-curve cryptography
ECDLP   Elliptic-curve discrete-logarithm problem


Several different standards cover the selection of curves for ECC
- 1999 ANSI X9.62
- 2000 IEEE P1363
- 2000 SEC 2
- 2000 NIST FIPS 186-2
- 2001 ANSI X9.63
- 2005 Brainpool
- 2005 NSA Suite B
- 2011 ANSSI FRP256V1

Each of these standards tries to ensure that the ECDLP is difficult. ECDLP is the problem of finding an ECC user's secret key, given the user's public key.

https://ed25519.cr.yp.to/
https://ed25519.cr.yp.to/ed25519-20110926.pdf

https://safecurves.cr.yp.to/refs.html#2005/brainpool
https://safecurves.cr.yp.to/refs.html#2000/certicom-sec2
https://safecurves.cr.yp.to/refs.html#2011/anssi-courbe
https://safecurves.cr.yp.to/refs.html#2000/nist-fips1862


Cryptographic algorithms keywords
- RSA
  - rsa1024 (considered weak)
  - rsa2048 (min recommended)
  - rsa3072
  - rsa4096
- NIST ECC family
  - nistp256
  - nistp384
  - nistp512
- Edwards curves family
  - ed448
  - ed25519
- Brainpool family
  - brainpoolP256r1
  - brainpoolP320r1
  - brainpoolP384r1
  - brainpoolP512r1

- secp256k1

## New PPA requirements

https://discourse.ubuntu.com/t/new-requirements-for-apt-repository-signing-in-24-04/42854/18

Effectively, we will restore all elliptic curve keys of 256 or more bit to trusted:

  rsa2048,ed25519,ed448,nistp256,nistp384,nistp512,brainpoolP256r1,brainpoolP320r1,brainpoolP384r1,brainpoolP512r1,secp256k1";

At the same time we will also introduce a more nuanced approach to revocations by introducing a 'next' level that issues a warning if the key is not allowed in it and a 'future' level that will issue an audit message with the --audit option. For the next level, we will set it to:

  ">=rsa2048,ed25519,ed448,nistp256,nistp384,nistp512";

This means we restrict warnings to Brainpool curves and the secp256k1 key, which we have not received any feedback about them being used yet. For the future level, we will take a strong approach to best practices as it is only seen when explictly running with --audit and the intention is to highlight best practices. It will be set to

  ">=rsa3072,ed25519,ed448";

which corresponds to the NIST recommendations for year 2031 (and as little curves as possible).
