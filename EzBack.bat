title EzBack
color F0
cls

@echo off
echo    ____       ___               __          ___      ___ 
echo   / __/ ___  / _ ) ___ _ ____  / /__       /_  /    / _ \
echo  / _/  /_ / / _  // _ `// __/ /  '_/      / __/  _ / // /
echo /___/  /__//____/ \_,_/ \__/ /_/\_\      /____/ (_)\___/                                                                                                                                
echo.
echo.

echo Specify the path to the platform-tools folder
echo Sample: C:\platform-tools
set /p A="-"

cls
echo Specify a folder for saving
echo Sample: C:\Users\User\Desktop
set /p B="-"

cls
echo Give the file a name
set /p C="-"

cls
echo system or nosystem
set /p D="-"

cls
start cmd.exe /k %A%\adb backup -apk -shared -all -%D% -f %B%\%C%.ba

echo Backup is started with the condition %D%
echo.
echo EzBack - a free add-on for platform-tools
echo.
echo https://github.com/Qnezor/EzBack
pause