# LIFE.SH


This is a WIP life simulator game written in POSIX compliant shell scripts. In theory, it should run on any Bourne-like shell, but it has only been tested on Bash and Dash.

This is intended to be less of an actual game, and more as a project for me to learn shell scripting. Any feedback will be greatly appreciated!

**NOTE:** The current version is **PRE ALPHA** quality. There is not much game to play yet, and any updates could be incompatible with previous saves.

## INSTALLATION

### Linux

The game is optimized for Linux, and it is most heavily tested there.
To run, simply clone the repo and run `life.sh`. That can be done through a GUI easily, by downloading this repo as a zip, extracting it, and running the file. You can use these commands.

```bash
git clone https://github.com/dajix350/lifesh.git
cd lifesh
./life.sh
```
**NOTE**: Using these commands requires `git` to be installed. You can use the GUI method without Git

### Windows

There are two ways to run it on Windows.

1. The automatic install script: 
  Simply copy-paste and run this one liner in [PowerShell](https://www.howtogeek.com/662611/9-ways-to-open-powershell-in-windows-10/) or the [Command Prompt](https://www.howtogeek.com/235101/10-ways-to-open-the-command-prompt-in-windows-10/). It is tested on Windows 10+, but should still work all the way back to 7.
```
powershell -C "iwr https://raw.githubusercontent.com/dajix350/lifesh/master/win/install.bat -O install.bat; .\install.bat"
```
2. Through WSL:
  The Linux install instructions will work fine through WSL if you already have it installed. If you don't, just use the one liner above.
  
### macOS

This script has not been tested on macOS, but it *should* work out of the box. The steps would be identical to Linux.



## TO-DO
- 
