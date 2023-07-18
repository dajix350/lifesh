@ECHO OFF
rmdir lifesh-win /s /q
mkdir lifesh-win
cd lifesh-win
cls

title life.sh for Windows installation tool
echo Welcome to the life.sh for Windows installer
echo This script will download a portable version of Git, and use it to clone the games repository and then run it through Git Bash.
echo The games files and Git are all stored within the "lifesh-win" folder. When you are done with the game, you can remove the folder manually, and no reminents should be left.
echo:
echo ### Downloading Git ###
powershell -C "$progressPreference = 'silentlyContinue'; iwr https://github.com/git-for-windows/git/releases/download/v2.41.0.windows.1/PortableGit-2.41.0-64-bit.7z.exe -OutFile .\git-installer.exe"
echo Done
echo:
echo ### Installing Git ###
.\git-installer.exe -o ".\git" -y
move .\git-installer.exe .\git\ /s /q
echo Done
echo:
echo ### Cloning Game ###
.\git\bin\git.exe clone https://github.com/dajix350/lifesh.git
echo Done
echo:
copy .\lifesh\win\start.bat .\start.bat
echo ### Start the game with "start.bat". It can be found in %cd%
echo An Explorer window is now being opened in that directory
explorer %cd% 
PAUSE
