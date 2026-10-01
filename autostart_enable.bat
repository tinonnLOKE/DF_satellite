@echo off
cd /d "%~dp0"
TITLE DF Satellite - Enable Windows Auto-Start
echo ======================================================================
echo           🚀 DF SATELLITE — ENABLE WINDOWS AUTO-START
echo ======================================================================
echo.

set "STARTUP_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "TARGET_SCRIPT=%~dp0start_background.vbs"
set "SHORTCUT_PATH=%STARTUP_DIR%\DF_Satellite.lnk"

echo Creating background autostart shortcut in:
echo   %STARTUP_DIR%
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$ws = New-Object -ComObject WScript.Shell;" ^
    "$s = $ws.CreateShortcut('%SHORTCUT_PATH%');" ^
    "$s.TargetPath = 'wscript.exe';" ^
    "$s.Arguments = '\"%TARGET_SCRIPT%\"';" ^
    "$s.WorkingDirectory = '%~dp0';" ^
    "$s.Description = 'DF Satellite Server Background Autostart';" ^
    "$s.Save();"

if exist "%SHORTCUT_PATH%" (
    echo [SUCCESS] DF Satellite is now configured to start automatically in the
    echo           background whenever this Windows user logs on!
    echo.
    echo To stop the server at any time, run 'stop.bat'.
    echo To disable autostart, run 'autostart_disable.bat'.
) else (
    echo [ERROR] Could not create shortcut in Startup folder.
)

echo.
echo ======================================================================
pause
