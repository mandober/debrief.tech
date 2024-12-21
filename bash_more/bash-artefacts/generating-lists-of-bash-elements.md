# bash :: shell words and names

* Reserved names
  - shell metacharacters (>, >>, |)
  - shell aliases
  - shell keywords
  - shell functions
  - shell builtins
  - available command names (wrt PATH)



```bash
comgen -A action
# where action is
alias      binding    command    disabled   export     function
helptopic  job        running    setopt     signal     user
arrayvar   builtin    directory  enabled    file       group
hostname   keyword    service    shopt      stopped    variable




comgen [-abcdefgjksuv]

# print defined aliases
compgen -a

# list bash builtins (61 names)
compgen -b

# print available commands (wrt PATH)
compgen -c

# print dirs in cwd
compgen -d

# print env vars (env vars only)
compgen -e

# print files in cwd
compgen -f

# print defined groups
compgen -g

# list bash keywords
compgen -k

# print available services
compgen -s

# print defined users
compgen -u

# print shell variables (user + env vars)
compgen -v



declare [-aAfFgilnrtux]

# dump all vars
declare

# dump all vars but show the attributes of each name
declare -p

# dump function names
declare -F

# dump function definitions (reusable format)
declare -f

# dump indexed arrays with definition (reusable format)
declare -a

# dump ass arrays with definition (reusable format)
declare -A

# dump vars with integer attribute
declare -i

# dump vars with readonly attribute
declare -r

# dump vars with EXPORT attribute
declare -x
```
