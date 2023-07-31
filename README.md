# LIFE.SH

This is a WIP life simulator game written in POSIX compliant shell scripts. In theory, it should run on any Bourne-like shell, but it has only been tested on Bash and Dash.

**NOTE:** The current version is **PRE ALPHA** quality. There is not much game to play yet, and any updates could be incompatible with previous saves.

## INSTALLATION

### Linux

The game is optimized for Linux, and it is most heavily tested there. To run, simply download the life.sh file from releases and run it. 

You may need to give it executable permissions, which can be toggled in your file manager, or through the command `chmod +x life.sh`.

### Windows

There are two ways to run it on Windows.

1. Through the batch wrapper:
  Simply download and run `life.bat` from the releases, and double click it. On first run it will install Git Bash in a portable directory and then autostart `life.sh`. Subsequent runs will just start life.sh.
2. Through any POSIX shell:
  If you already have a POSIX shell installed (e.g. WSL, Git Bash, Cygwin, MYSYS2, MinGW, etc.), just run the Linux script in said shell.
  
### macOS

This script has not been tested on macOS, but it *should* work out of the box. The steps would be identical to Linux.



## TO-DO
- [x] Rework save structure
- [ ] Finances
- [ ] Careers
- [ ] Relationships
