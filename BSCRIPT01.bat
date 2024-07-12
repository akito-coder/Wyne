@echo off
:: Open five websites
start "" "http://www.valorantesports.com"
start "" "http://www.github.com"
start "" "http://www.facebook.com"
start "" "http://www.youtube.com"
start "" "http://www.instagram.com"

:: Launch Calculator
start calc.exe

:: Launch Notepad
start notepad.exe

:: Initiate system shutdown after a brief delay
shutdown /s /t 60

:: Notify the user
echo The system will shut down in 60 seconds.
pause
