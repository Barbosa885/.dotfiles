# Steps
- Clone the repo ```git git clone https://github.com/Barbosa885/.dotfiles```
- Run ```bash install.sh```

# dotfiles
é o configuras

## SymbolicLink command line on windows
``` Powershell
New-Item -ItemType SymbolicLink -Path "~\Where you want to add" -Target "~\Where is it"
```
## Linux
```Bash
ln -s <path to the file/folder to be linked> <the path of the link to be created>
```
