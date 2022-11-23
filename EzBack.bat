title EzBack
color F0
cls

@echo off
set er= Error #1. Incorrect choice.
set pr= Please restart the program
set ezbi= EzBack - a free add-on for adb
set link= https://github.com/Qnezor/EzBack
set exit= Press ENTER to exit

echo     ____    ___           __     ____   __
echo    / __/__ / _ )___ _____/ /__  / / /  / /
echo   / _//_ // _  / _ `/ __/  '_/ /_  _/ / / 
echo  /___//__/____/\_,_/\__/_/\_\   /_/(_)_/  
echo.
echo  Press ENTER to start
set /p enter=

echo.
if exist C:\platform-tools\adb.exe (
cls
set adbfolder=C:\platform-tools
goto a1
) else (
echo.
echo  adb.exe not found
echo  Specify the path to the platform-tools folder
echo  Example: C:\platform-tools
set /p adbfolder="-"
)

:a1
cls
echo.
echo  The backup will be saved to C:\EzBackups
echo.
echo  y - Do you agree
echo  n - Change path
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
echo  Specify a folder for saving
echo  Example: C:\Users\User\Desktop
set /p SaveFolder="-"
goto a2
)

if not %folderchoice% equ y (
echo.
echo %er%
echo %pr%
echo.
echo.
echo %ezbi%
echo.
echo %link%
echo.
echo %exit%
set /p exit1=
goto exit2
)

:a2
cls
echo.
echo  Give the file a name
set /p FlieName="-"

cls
echo.
echo  y - system
echo  n - nosystem
set /p D="-"

if %D% equ y (
cls
start cmd.exe color F0 /k %adbfolder%\adb backup -apk -shared -all -system -f %SaveFolder%\system-%FlieName%.ba
echo.
echo  Backup is started with the condition system
echo.
echo.
echo %ezbi%
echo.
echo %link%
echo.
echo %exit%
set /p exit1=
goto exit2
)
if %D% equ n (
cls
start cmd.exe color F0 /k %adbfolder%\adb backup -apk -shared -all -nosystem -f %SaveFolder%\nosystem-%FlieName%.ba
echo.
echo  Backup is started with the condition nosystem
echo.
echo.
echo %ezbi%
echo.
echo %link%
echo.
echo %exit%
set /p exit1=
goto exit2
)
if not %D% equ y (
echo.
echo %er%
echo %pr%
echo.
echo.
echo %ezbi%
echo.
echo %link%
echo.
echo %exit%
set /p exit1=
goto exit2
)

:exit2
exit