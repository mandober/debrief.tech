# hvpty

hvpty - Run a program in WSL using **AF_HYPERV** sockets (for WSL2)

- windows side component: `hvpty.exe`
- WSL side component: `hvpty-backend`

## Usage

hvpty [--] [options] [arguments]

## Options

-b, --backend BACKEND_PATH
Overrides the default path of `wslbridge2-backend`

-d, --distribution DISTRO_NAME
Run the specified distribution

-e VAR
Copies VAR into the WSL environment

-e VAR=VAL
Sets VAR to VAL in the WSL environment

-l, --login
Start a login shell

-L, --no-login
Do not start a login shell

-u, --user WSL USERNAME
Run as the specified user

-w, --windir DIR
Changes the working directory to Windows style path

-W, --wsldir DIR
Changes the working directory to Unix style path

-h, --help
Show this help
