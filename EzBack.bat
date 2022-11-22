title EzBack
color F0
cls

@echo off
echo    ____    ___           __     ____  ___ 
echo   / __/__ / _ )___ _____/ /__  /_  / / _ \
echo  / _//_ // _  / _ `/ __/  '_/ _/_ /_/ // /
echo /___//__/____/\_,_/\__/_/\_\ /____(_)___/                                                                                                                                                                   
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
echo y - system
echo n - nosystem
set /p D="-"

if %D% equ y (
cls
start cmd.exe /k %A%\adb backup -apk -shared -all -system -f %B%\system-%C%.ba
echo Backup is started with the condition system
echo.
echo EzBack - a free add-on for platform-tools
echo.
echo https://github.com/Qnezor/EzBack
echo.
pause
)

if %D% equ n (
cls
start cmd.exe /k %A%\adb backup -apk -shared -all -nosystem -f %B%\nosystem-%C%.ba
echo Backup is started with the condition nosystem
echo.
echo EzBack - a free add-on for platform-tools
echo.
echo https://github.com/Qnezor/EzBack
echo.
pause
)

if not %D% equ n and not %D% equ y (
cls
echo Error. Incorrect choice of system or nosystem.
echo Please restart the program.
echo.
echo EzBack - a free add-on for platform-tools
echo.
echo https://github.com/Qnezor/EzBack
echo.
pause
)