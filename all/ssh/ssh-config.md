# SSH defaults, config, and priorities

https://therootcompany.com/blog/ssh-defaults-config-and-priorities/

Over the years I've collected a rather messy `~/.ssh/config` which resulted in some undesired behavior as a result of me misunderstanding how the config file prioritizes its options. Today I investigated and found:
- Priority goes from top to bottom
- Defaults MUST come last
- Host specificity is NOT a factor of priority
- Host sections can be specified multiple times
- Multiple hostnames (and aliases) may be specified per section
- Host sections apply to the name you use (not what it resolves to)

## Lean and prioritized .ssh/config

Here's an example config that represents all of the options I commonly use:

~/.ssh/config:

```conf
#
# First, the Hostname aliases
#

Host prod
    Hostname example.com

Host dev
    Hostname dev.example.com


#
# Next, host-specific config
#

Host prod dev *.example.com example.com 203.0.113.*
    Port 2222

Host mac mac.local mac.dyndns.org
    User me
    LocalForward 5900 localhost:5900    # MacOS built-in VNC
    DynamicForward 6789                 # Socks5 Proxy

Host mac.dyndns.org
    ProxyCommand sclient %h             # SSH-over-HTTPS (TLS)


#
# Finally, the defaults MUST come last
# and MUST have * as the Host
#

Host *
    User app
    ServerAliveInterval 3600
```

If I run `ssh dev`, the following configuration will be resolved in this order:

```conf
Hostname dev.example.com
Port 2222
User app
ServerAliveInterval 3600
```

## Keeping it Clean

Now that I've actually done the research to understand how ssh config works, this is the layout that I recommend:

```
hostname aliases
host-specific config
defaults
```

## Gotchas

### Indentation is for Readability

You should always indent - because it helps you read the config file - however, the config file is ONLY split by `Host` sections.

```conf
Host example.com
    Port 2222

# Typo: Looks like a new section, but it's still part of example.com
User app
```

### NEVER Put Generic Config Up Top

Both of these have the same WRONG result:

```conf
Host *
    IdentityFile ~/.ssh/id_rsa

Host example.com
    IdentityFile ~/.ssh/special_id_rsa
```

and this

```conf
IdentityFile ~/.ssh/id_rsa

Host example.com
    IdentityFile ~/.ssh/special_id_rsa
```

They both define `IdentityFile` as an unchangeable constant, which will only lead to confusion and sorrow.

### Default SSH username for various hosts

In the past it was common to have multiple users per system. As such, the SSH default username is the user of your current system (usually in your shell prompt, and can be checked with `whoami`).

In the modern era of VPSes, Docker, etc, the common convention is to use the username `app` as the single non-root user for web apps.

If you want to set per-host defaults (rather that typing `user@`, such as `ssh app@example.com`) you can do so like this:

```conf
Host dev
    Hostname dev.example.com

Host dev dev.example.com
    User root
```


## Refs

* Upvote on Reddit: https://www.reddit.com/r/linux/comments/j9oba1/ssh_config_priorities_aka_how_to_clean_up_your/

* Unix StackExchange: https://unix.stackexchange.com/a/614100/45554

* SuperUser: https://superuser.com/a/1592648/73857
