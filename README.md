# Steps

- Clone the repo ```git clone https://github.com/Barbosa885/.dotfiles```
- Go to `2022` branch
- Run ```install.sh```

## SymbolicLink command line on windows
``` Powershell
New-Item -ItemType SymbolicLink -Path "~\Where you want to add" -Target "~\Where is it"
```
## Linux
```Bash
ln -s <path to the file/folder to be linked> <the path of the link to be created>
```
