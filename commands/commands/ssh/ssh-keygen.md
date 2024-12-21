# ssh-keygen

keys generated on 2022-02-04 using the cmd:

    ssh-keygen -t ed25519 -C "ilicivan@zoho.com"

which generates a new SSH key, using the provided email as a label.
Skipped setting the secure passphrase.

Then copy the contents of `github_ed25519.pub`
(ext `.pub` is for the public key)
to github at https://github.com/settings/keys
naming the key `github_ed25519`

firngerprint: SHA256:Q5Xy816W9aP6W97JSJdm60TlHVG+ORA7kDvha3Wnn+A

Check it all works:

    ssh -T git@github.com
    > Hi mandober! You've successfully authenticated...

https://docs.github.com/en/authentication

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

https://docs.github.com/en/github/getting-started-with-github/managing-remote-repositories

git@github.com:USERNAME/REPOSITORY.git
mandober@github.com/mandober/debrief.haskell.git


## Generating a new SSH key

Open Git Bash. Paste the text below, substituting in your GitHub email address.

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
ssh-keygen -t ed25519 -C "ilicivan@zoho.com"

# Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
ssh-keygen -t rsa -b 4096 -C "ilicivan@zoho.com"
```

...Generating public/private ed25519 key pair.

This creates a new ssh key, using the provided email as a label.
When you're prompted for a location in which to save the key, 
press Enter to accept the default file location
e.g. `/c/Users/ivan/.ssh/id_ed25519`

ssh-keygen -t ed25519 -C "ilicivan@zoho.com"
