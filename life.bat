@ECHO OFF
setlocal
title life.sh for Windows
if exist %UserProfile%\lifesh (
  cd %UserProfile%\lifesh
) else (
  mkdir %UserProfile%\lifesh
  cd %UserProfile%\lifesh
  echo Welcome to life.sh for Windows! 
  echo Git For Windows is about to be installed to the "lifesh" folder in your user directory. Everything is completely portable, so you can safely remove that directory to completely uninstall life.sh
  powershell -C "$progressPreference = 'silentlyContinue'; iwr https://github.com/git-for-windows/git/releases/download/v2.41.0.windows.1/PortableGit-2.41.0-64-bit.7z.exe -OutFile %temp%\git-installer.exe"
  %temp%\git-installer.exe -o "git\" -y
)
echo ## DOWNLOADING/UPDATING LIFE.SH ##
git\mingw64\bin\curl.exe -LO https://github.com/dajix350/lifesh/releases/download/0.0.1-ALPHA/life.sh 
git\bin\bash.exe -c "port=1 ./life.sh"  
endlocal