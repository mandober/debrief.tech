# Bash :: Features

The `bash-features` section host the nominal set of Bash features available OOTB. [bash_vanilla]

The `bash-concepts` section collects the things that go beyond the normative set of features, describing user-created artefacts (scripts, functions, add-ons, tools, approaches, etc.) that add new or augment existing functionality on top of vanilla bash. [bash_untamed]

The `bash-hacks` section tries to gather useful hacks that set the Bash on the least taken path. [bash_berserk]

Although the boundaries between these sections are arbitrarily artificial (but not artificially arbitrary), the split was made to improve organization and discoverability of topics.

improve : disprove : prove : misimprove : disimprove


- bash-features
  - bash-builtins
  - bash-functions
  - bash-aliases
  - bash-traps
  - bash-reserved-words
    - words
      - tokens
      - punct
      - active words
      - inactive words
      - head word (usually command)
      - prefix word
        - sudo CMD
        - \aliasName (skip alias-search)
    - command-line word resolution
      - well-formed input cmd-line
      - is it active-word or utter gibberish
      - main word resolution
      - command resolution
      - command args
    - bash-tokens
    - bash-keywords
    - bash-metachars
    - bash-escape-chars
  - bash-vars
  - bash-env-vars
  - bash-startup
  - bash-startup-files
  - bash-expansions
    - word-splitting
    - brace-expansion
    - alias-expansion
    - variable-expansion
    - tilde-expansion
    - wildcard-expansion
    - parameter-substitution
    - command-substitution
