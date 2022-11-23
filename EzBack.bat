title EzBack
color F0
cls

@echo off
set er=Error #1. Incorrect choice of system or nosystem.
set pr=Please restart the program

echo    ____    ___           __     ____  ___ 
echo   / __/__ / _ )___ _____/ /__  / / / / _ \
echo  / _//_ // _  / _ `/ __/  '_/ /_  _// // /
echo /___//__/____/\_,_/\__/_/\_\   /_/(_)___/                                                                                                                                                                                                          
echo.
echo.
echo Press ENTER to start
set /p enter=

echo.
if exist C:\platform-tools\adb.exe (
cls
set adbfolder=C:\platform-tools
goto a1
) else (
echo adb.exe not found
echo Specify the path to the platform-tools folder
echo Example: C:\platform-tools
set /p adbfolder="-"
)

:a1
cls
echo The backup will be saved to C:\EzBackups
echo.
echo y - Do you agree
echo n - Change path
set /p folderchoice="-"

if %folderchoice% equ y (
if exist C:\EzBackups (
set SaveFolder=C:\EzBackups
goto a2
) else (
mkdir C:\EzBackups
set SaveFolder=C:\EzBackups
goto a2
)

)
if %folderchoice% equ n (
echo.
echo Specify a folder for saving
echo Example: C:\Users\User\Desktop
set /p SaveFolder="-"
goto a2
)

if not %folderchoice% equ y (
echo.
echo %er%
echo.
echo %pr%
echo.
echo EzBack - a free add-on for platform-tools
echo.
echo https://github.com/Qnezor/EzBack
echo.
pause
)

:a2
cls
echo Give the file a name
set /p FlieName="-"

cls
echo y - system
echo n - nosystem
set /p D="-"

if %D% equ y (
cls
start cmd.exe color F0 /k %adbfolder%\adb backup -apk -shared -all -system -f %SaveFolder%\system-%FlieName%.ba
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
start cmd.exe color F0 /k %adbfolder%\adb backup -apk -shared -all -nosystem -f %SaveFolder%\nosystem-%FlieName%.ba
echo Backup is started with the condition nosystem
echo.
echo EzBack - a free add-on for platform-tools
echo.
echo https://github.com/Qnezor/EzBack
echo.
pause
)
if not %D% equ n or not %D% equ y (
cls
echo %er%
echo %pr%
echo.
echo EzBack - a free add-on for platform-tools
echo.
echo https://github.com/Qnezor/EzBack
echo.
pause
)