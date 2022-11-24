title EzBack 5.0 Beta
color F0
cls

@echo off
::Variables
set ezbi= EzBack - a free add-on for adb
set link= https://github.com/Qnezor/EzBack

::platform-tools search
echo.
if exist C:\platform-tools\adb.exe (
cls
set adbfolder=C:\platform-tools
goto mm
) else (
echo.
echo  adb.exe not found
echo  Specify the path to the platform-tools folder
echo  Example: C:\platform-tools
set /p adbfolder="-"
goto mm
)


::Main Menu
:mm
cls
echo    ____    ___           __     ____  ___    __  ___      __
echo   / __/__ / _ )___ _____/ /__  / __/ / _ \  / / / _ )___ / /____ _
echo  / _//_ // _  / _ `/ __/  '_/ /__ \_/ // / / / / _  / -_) __/ _ `/
echo /___//__/____/\_,_/\__/_/\_\ /____(_)___(_)_/ /____/\__/\__/\_,_/                                                                  
echo.
echo  Press 1 for Backup apps
echo.
echo  Press 2 to Restore apps
echo.
echo  Press 3 to install custom recovery (not working)
echo.
echo  I do not speak English, so I apologize for translation errors.
echo  If you want to help with the translation, email me at qnezoru@gmail.com
echo.
set /p mmchoice="-"

if %mmchoice% equ 1 (
goto backup1
)
if %mmchoice% equ 2 (
goto restore1
)
if %mmchoice% equ 3 (
goto errormsg1
)
if %mmchoice% equ rickroll (
start "" https://www.youtube.com/watch?v=dQw4w9WgXcQ
goto secret
)
if not %mmchoice% equ 1 (
goto errormsg1
)


::backup apps
:backup1
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
goto backup2
) else (
mkdir C:\EzBackups
set SaveFolder=C:\EzBackups
goto backup2
)

)
if %folderchoice% equ n (
echo.
echo  Specify a folder for saving
echo  Example: C:\Users\User\Desktop
set /p SaveFolder="-"
goto backup2
)

if not %folderchoice% equ y (
goto errormsg1
)

:backup2
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
start cmd.exe /k %adbfolder%\adb backup -apk -shared -all -system -f %SaveFolder%\system-%FlieName%.ba
set backupchoice=system
goto backupstart
)
if %D% equ n (
cls
start cmd.exe /k %adbfolder%\adb backup -apk -shared -all -system -f %SaveFolder%\nosystem-%FlieName%.ba
set backupchoice=nosystem
goto backupstart
)
if not %D% equ y (
goto errormsg1
)

:backupstart
cls
echo.
echo  Backup is started with the condition %backupchoice%
echo.
echo  Backup file name: %backupchoice%-%FlieName%.ba
echo.
echo  The backup will be saved in the path: %SaveFolder%
echo.
echo.
echo %ezbi%
echo.
echo %link%
echo.
echo  Press ENTER to exit
set /p exit1=
goto exit2

::restore
:restore1
cls
echo.
echo  Enter the path to the folder with the backup file
echo  Example: C:\Users\User\Desktop
echo.
set /p SaveFolder="-"
goto restore2

:restore2
cls
echo.
echo  Enter the file name
echo  Example: nosystem-backup
echo.
set /p folderwithbackup="-"
goto restorestart

:restorestart
cls
start cmd.exe /k %adbfolder%\adb restore %SaveFolder%\%FlieName%.ba
echo Application recovery started
echo.
echo.
echo %ezbi%
echo.
echo %link%
echo.
echo  Press ENTER to exit
set /p exit1=
goto exit2

::error
:errormsg1
cls
echo.
echo  Error #1. Incorrect choice.
echo  Please restart the program
echo.
echo.
echo %ezbi%
echo.
echo %link%
echo.
echo  Press ENTER to return to the main menu
set /p =
goto mm

::secret
:secret
cls
echo.
echo  You found the secret
echo.
echo  Press ENTER to return to the main menu
set /p =
goto mm

::exit
:exit2
exit