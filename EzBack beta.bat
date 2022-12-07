title EzBack 6.1.2 Beta
cls

@echo off
::Variables
set ezbi= Thanks for using EzBack
set link= https://qnezor.github.io/EzBack
set bbm=Back to main menu
set gb=Go Back
set nw=(not working)

::platform-tools search
echo.
if exist adb.exe (
cls
set adbfolder=
goto mm
)
if exist C:\platform-tools\adb.exe (
cls
set adbfolder=C:\platform-tools\
goto mm
) else (
echo  adb.exe not found
echo  Specify the path to the platform-tools folder
echo  Example: C:\platform-tools\
echo  The presence of \ at the end is MANDATORY!
set /p adbfolder="-"
goto mm
)


::Main Menu
:mm
cls
echo     ____    ___           __     ____   __  ____   ___      __
echo    / __/__ / _ )___ _____/ /__  / __/  / / /_  /  / _ )___ / /____ _
echo   / _//_ // _  / _ `/ __/  '_/ / _ \_ / / / __/  / _  / -_) __/ _ `/
echo  /___//__/____/\_,_/\__/_/\_\  \___(_)_(_)____/ /____/\__/\__/\_,_/                                                        
echo.
echo  1 - Backup/Restore apps
echo  2 - Delete system apps
echo.
echo  3 - Info %nw%
echo.
echo  I do not speak English, so I apologize for translation errors.
echo  If you want to help with the translation, email me at qnezoru@gmail.com
echo.
set /p mmchoice="-"

if %mmchoice% equ 1 goto br
if %mmchoice% equ 2 goto delm
if %mmchoice% equ 3 goto info
if %mmchoice% equ rickroll (
start "" https://www.youtube.com/watch?v=dQw4w9WgXcQ
goto secret
)
if not %mmchoice% equ 1 goto errormsg1

:br
cls
echo.
echo  1 - Backup apps
echo  2 - Restore apps
echo.
echo  0 - %bbm%
echo.
set /p brchoice="-"
if %brchoice% equ 1 goto backup1
if %brchoice% equ 2 goto restore1
if %brchoice% equ 0 goto mm


::deleteapps
:delm
cls
echo.
echo  1 - Delete MIUI apps
echo  2 - Delete Google Apps
echo.
echo  0 - %bbm%
echo.
set /p delchoice="-"
if %delchoice% equ 1 goto delmi
if %delchoice% equ 2 goto delgo
if %delchoice% equ 0 goto mm

:delmi
cls
echo.
echo  1 - MIUI analytics and advertising services
echo  2 - Facebook Services
echo  3 - Netflix Services
echo  4 - Amazon Services
echo  5 - Services Mi Pay India
echo  6 - App store GetApps
echo  7 - Xiaomi Games
echo  8 - Wallpaper carousel
echo  9 - Mi Browser
echo  10 - ShareMe
echo  11 - Gallery
echo  12 - Notes
echo  13 - Mi Video
echo  14 - Mi Calendar
echo  15 - SIM card menu
echo  16 - Reports
echo  17 - Weather
echo  18 - File Manager
echo.
echo  100 - %gb%
echo  200 - %bbm%
echo.
set /p delchoice="-"
if %delchoice% equ 1 goto miuiservices
if %delchoice% equ 2 goto facebook
if %delchoice% equ 3 goto netflix
if %delchoice% equ 4 goto amazon
if %delchoice% equ 5 goto mipay
if %delchoice% equ 6 goto getapps
if %delchoice% equ 7 goto games
if %delchoice% equ 8 goto wallpaper
if %delchoice% equ 9 goto mibrowser
if %delchoice% equ 10 goto shareme
if %delchoice% equ 11 goto gallery
if %delchoice% equ 12 goto notes
if %delchoice% equ 13 goto mivideo
if %delchoice% equ 14 goto micalendar
if %delchoice% equ 15 goto sim
if %delchoice% equ 16 goto bugreport
if %delchoice% equ 17 goto weather
if %delchoice% equ 18 goto fileexplorer
if %delchoice% equ 100 goto delm
if %delchoice% equ 200 goto mm

:miuiservices
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.miui.analytics
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.miui.msa.global
set appdel=MIUI analytics and advertising services
goto midelinfo

:facebook
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.facebook.services
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.facebook.system
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.facebook.appmanager 
set appdel=Facebook
goto midelinfo

:netflix
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.netflix.partner.activation
set appdel=Netflix
goto midelinfo

:amazon
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.amazon.mShop.android.shopping
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.amazon.appmanager
set appdel=Amazon
goto midelinfo

:mipay
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.mipay.wallet.in
set appdel=Mi Pay India
goto midelinfo

:getapps
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.xiaomi.mipicks
set appdel=GetApps
goto midelinfo

:games
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.xiaomi.glgm
set appdel=Xiaomi Games
goto midelinfo

:wallpaper
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.miui.android.fashiongallery
set appdel=Wallpaper Carousel
goto midelinfo

:mibrowser
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.mi.globalbrowser
set appdel=Mi Brwoser
goto midelinfo

:shareme
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.xiaomi.midrop
set appdel=ShareMe
goto midelinfo

:gallery
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.miui.gallery
set appdel=Gallery
goto midelinfo

:notes
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.miui.notes
set appdel=Notes
goto midelinfo

:mivideo
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.miui.video
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.miui.videoplayer
set appdel=Mi Video
goto midelinfo

:micalendar
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.xiaomi.calendar
set appdel=Mi Calendar
goto midelinfo

:sim
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.android.stk
set appdel=SIM Card Menu
goto midelinfo

:bugreport
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.miui.bugreport
set appdel=Reports
goto midelinfo

:weather
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.miui.weather2
set appdel=Weather
goto midelinfo

:fileexplorer
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.mi.android.globalFileexplorer
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.android.fileexplorer
set appdel=Weather
goto midelinfo


:midelinfo
cls
echo.
echo  %appdel% deletion has started
echo.
echo %ezbi%
echo %link%
echo.
echo  1 - %gb%
echo  2 - %bbm%
echo  3 - Exit
echo.
set /p miend="-"
if %miend% equ 1 goto delmi
if %miend% equ 2 goto mm
if %miend% equ 3 goto exit1

:delgo
cls
echo.
echo  1 - Google Duo
echo  2 - Google One
echo  3 - Google Assistant
echo  4 - Google Calendar
echo  5 - Google Maps
echo  6 - Google Music
echo  7 - Google Lens %nw%
echo  8 - Google %nw%
echo  9 - Google Movies %nw%
echo  10 - Google Photos %nw%
echo  11 - Google Device Health Services %nw%
echo  12 - Android Auto %nw%
echo  13 - Chrome %nw%
echo  14 - Gmail %nw%
echo  15 - YouTube %nw%
echo.
echo  100 - %gb%
echo  200 - %bbm%
echo.
set /p delchoice="-"
if %delchoice% equ 1 goto duo
if %delchoice% equ 2 goto one
if %delchoice% equ 3 goto assistant
if %delchoice% equ 4 goto calendar
if %delchoice% equ 5 goto maps
if %delchoice% equ 6 goto music
if %delchoice% equ 7 goto lens
if %delchoice% equ 8 goto google
if %delchoice% equ 9 goto movies
if %delchoice% equ 10 goto photo
if %delchoice% equ 11 goto health
if %delchoice% equ 12 goto auto
if %delchoice% equ 13 goto chrome
if %delchoice% equ 14 goto gmail
if %delchoice% equ 15 goto youtube
if %delchoice% equ 100 goto delm
if %delchoice% equ 200 goto mm

:duo
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.google.android.apps.tachyon
set appdel=Google Duo
goto godelinfo

:one
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.google.android.apps.subscriptions.red 
set appdel=Google One
goto godelinfo

:assistant
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.google.android.apps.googleassistant
set appdel=Google Assistant
goto godelinfo

:calendar
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.google.android.calendar
set appdel=Google Calendar
goto godelinfo

:maps
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.google.android.apps.maps
set appdel=Google Maps
goto godelinfo

:music
start cmd.exe /k %adbfolder%adb shell pm uninstall --user 0 com.google.android.music
set appdel=Google Music
goto godelinfo

:godelinfo
cls
echo.
echo  %appdel% deletion has started
echo.
echo %ezbi%
echo %link%
echo.
echo  1 - %gb%
echo  2 - %bbm%
echo  3 - Exit
echo.
set /p miend="-"
if %miend% equ 1 goto delgo
if %miend% equ 2 goto mm
if %miend% equ 3 goto exit1

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

if not %folderchoice% equ y goto errormsg1


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
start cmd.exe /k %adbfolder%adb backup -apk -shared -all -system -f %SaveFolder%\system-%FlieName%.ba
set backupchoice=system
goto backupstart
)
if %D% equ n (
cls
start cmd.exe /k %adbfolder%adb backup -apk -shared -all -system -f %SaveFolder%\nosystem-%FlieName%.ba
set backupchoice=nosystem
goto backupstart
)
if not %D% equ y goto errormsg1

:backupstart
cls
echo.
echo  Backup is started with the condition %backupchoice%
echo  Backup file name: %backupchoice%-%FlieName%.ba
echo  The backup will be saved in the path: %SaveFolder%
echo.
echo %ezbi%
echo %link%
echo.
echo  Press ENTER to return to the main menu
set /p =
goto mm

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
set /p FileName="-"
goto restorestart

:restorestart
cls
start cmd.exe /k %adbfolder%adb restore %SaveFolder%\%FileName%.ba
echo  Application recovery started
echo.
echo %ezbi%
echo %link%
echo.
echo  Press ENTER to return to the main menu
set /p =
goto mm

::error
:errormsg1
cls
echo.
echo  Error #1. Incorrect choice.
echo.
echo.
echo %ezbi%
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
:exit1
exit

::info
:info
cls
echo.
echo     ____    ___           __     ____   __  __  ___      __
echo    / __/__ / _ )___ _____/ /__  / __/  / / / / / _ )___ / /____ _
echo   / _//_ // _  / _ `/ __/  '_/ / _ \_ / / / / / _  / -_) __/ _ `/
echo  /___//__/____/\_,_/\__/_/\_\  \___(_)_(_)_/ /____/\__/\__/\_,_/
echo.
echo EzBack is a free addon for adb that makes working with backups and applications easier.
echo.
echo.