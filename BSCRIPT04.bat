@echo off
setlocal enabledelayedexpansion

:: Define paths
set sourceDir=C:\*.txt
set archiveDir=Z:\Archived

:: Create archive directory if it doesn't exist
if not exist "%archiveDir%" mkdir "%archiveDir%"

:: Archive older text files (older than 30 days) from Drive C: to Drive Z:
echo Archiving older text files from Drive C: to Drive Z:
forfiles /p C:\ /s /m *.txt /d -30 /c "cmd /c move @file %archiveDir%"

:: Sort archived files by size and display them
echo Sorting archived files by size:
dir "%archiveDir%\*.txt" /O-S /A-D > "%archiveDir%\sorted_files.txt"
type "%archiveDir%\sorted_files.txt"

:: Prompt user for permission to delete old, large files
echo.
set /p deleteOld=Do you want to delete the old, large files in %archiveDir% (y/n)?: 
if /i "%deleteOld%"=="y" (
    echo Deleting old, large files...
    for /F "tokens=*" %%i in ("%archiveDir%\sorted_files.txt") do (
        del "%%i"
    )
    echo Old, large files have been deleted.
) else (
    echo No files were deleted.
)

pause
