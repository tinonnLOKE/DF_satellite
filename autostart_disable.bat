@echo off
TITLE DF Satellite - Disable Windows Auto-Start
echo ======================================================================
echo           🛑 DF SATELLITE — DISABLE WINDOWS AUTO-START
echo ======================================================================
echo.

set "SHORTCUT_PATH=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\DF_Satellite.lnk"

if exist "%SHORTCUT_PATH%" (
    del "%SHORTCUT_PATH%"
    echo [SUCCESS] Auto-start shortcut removed from Windows Startup folder.
) else (
    echo [INFO] Auto-start shortcut was not found.
)

echo.
echo ======================================================================
pause
