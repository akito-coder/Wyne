@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Select a Windows utility to execute:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
set /p choice=Enter your choice (1-8): 

if "%choice%"=="1" goto ipconfig
if "%choice%"=="2" goto tasklist
if "%choice%"=="3" goto taskkill
if "%choice%"=="4" goto chkdsk
if "%choice%"=="5" goto format
if "%choice%"=="6" goto defrag
if "%choice%"=="7" goto find
if "%choice%"=="8" goto attrib
goto menu

:ipconfig
echo Running ipconfig...
ipconfig
pause
goto menu

:tasklist
echo Running tasklist...
tasklist
pause
goto menu

:taskkill
set /p pid=Enter the PID of the process to kill: 
if "%pid%"=="" (
    echo No PID entered. Returning to menu.
    pause
    goto menu
)
taskkill /PID %pid%
if errorlevel 1 (
    echo Failed to kill process. Please check the PID and try again.
) else (
    echo Process with PID %pid% has been terminated.
)
pause
goto menu

:chkdsk
set /p drive=Enter the drive letter (e.g., C:): 
if "%drive%"=="" (
    echo No drive letter entered. Returning to menu.
    pause
    goto menu
)
echo Running chkdsk on %drive%...
chkdsk %drive%
pause
goto menu

:format
set /p drive=Enter the drive letter to format (e.g., D:): 
if "%drive%"=="" (
    echo No drive letter entered. Returning to menu.
    pause
    goto menu
)
echo WARNING: Formatting will erase all data on the drive.
set /p confirm=Are you sure you want to format %drive%? (y/n): 
if /i not "%confirm%"=="y" (
    echo Format cancelled.
    pause
    goto menu
)
format %drive%
pause
goto menu

:defrag
set /p drive=Enter the drive letter to defrag (e.g., C:): 
if "%drive%"=="" (
    echo No drive letter entered. Returning to menu.
    pause
    goto menu
)
echo Running defrag on %drive%...
defrag %drive%
pause
goto menu

:find
set /p search=Enter the text to find: 
if "%search%"=="" (
    echo No text entered. Returning to menu.
    pause
    goto menu
)
set /p file=Enter the file to search in: 
if "%file%"=="" (
    echo No file entered. Returning to menu.
    pause
    goto menu
)
echo Searching for "%search%" in %file%...
find "%search%" %file%
pause
goto menu

:attrib
set /p file=Enter the file to change attributes: 
if "%file%"=="" (
    echo No file entered. Returning to menu.
    pause
    goto menu
)
set /p attributes=Enter the attributes (+r, -r, +a, -a, +s, -s, +h, -h): 
if "%attributes%"=="" (
    echo No attributes entered. Returning to menu.
    pause
    goto menu
)
echo Changing attributes for %file%...
attrib %attributes% %file%
pause
goto menu
